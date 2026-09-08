--!nocheck

local Licence = { }
Licence.Key = Licence.Key or script_key or [[KEY-HERE]]

local cloneref:(<T>(T) -> T) | (<a>(a) -> a) = cloneref or function(Reference: any) return Reference end
local isfile: (string) -> boolean = isfile or function(File: string): boolean
    local Success: boolean, Result = pcall(function()
        return readfile(File)
    end)

    return Success and Result
end

local HttpService: HttpService = cloneref(game:GetService("HttpService"))
local EncodingService: EncodingService = cloneref(game:GetService("EncodingService"))

type ContentData = {
    sha: string,
    content: string,
    encoding: string,
    path: string
}

type Contents = {files: {ContentData}}
type GotContents = {Success: boolean, Data: Contents}

local CryptHash: (Content: string, Algorithm: string) -> string = (crypt and crypt.hash)
if not CryptHash then
    local HashLibrary = loadstring(game:HttpGet('https://api.catvape.dev/download/src/libraries/hash.lua'))()
    CryptHash = HashLibrary.sha1
end

local function GetGithubContents(Path: string): GotContents
    local Success: boolean, Result: string = pcall(function()
        return game:HttpGet("https://api.catvape.dev/contents/src")
    end)

    if Success then
        local SuccessfulJSONDecode, JSON = pcall(HttpService.JSONDecode, HttpService, Result)
        return {
            Success = SuccessfulJSONDecode,
            Data = JSON
        }
    end

    return {
        Success = false,
        Data = Result
    }
end

local function DownloadAsset(FileData: ContentData): ()
    if FileData.encoding == "base64" then
        FileData.content = buffer.tostring(EncodingService:Base64Decode(buffer.fromstring(FileData.content)))
    end

    writefile(`catsix/{FileData.path:gsub("src/", "")}`, FileData.content)
end

local function GetCurrentSHA(Path: string): string
    local FilePath: string = `catsix/{Path:gsub("src/", "")}`
    local FileContents = (isfile(FilePath) and readfile(FilePath))
    if FileContents then
        return CryptHash(`blob {#FileContents}\0{FileContents}`, "sha1")
    end

    return ""
end

local function DownloadAssets(Contents: GotContents): boolean
    if Contents.Success then
        for i: number, v: {content: string, path: string?, sha: string} in Contents.Data.files do
            if v.path:find("/profiles/") then
                continue
            end

            local CurrentSHA: string = GetCurrentSHA(v.path)
            if CurrentSHA ~= v.sha then
                DownloadAsset(v)
            end
        end
    end

    return Contents.Success
end

for _, Folder: string in {'catsix', 'catsix/games', 'catsix/profiles', 'catsix/assets', 'catsix/libraries', 'catsix/guis'} do
    if not isfolder(Folder) then
        makefolder(Folder)
    end
end

if not shared.VapeDeveloper then
    local Commit: string? = Licence.Commit
    if not Commit then
        local Success: boolean, Result: string = pcall(function() 
            return game:HttpGet('https://api.catvape.dev/commit') 
        end)

        if Success then
            local SuccessJSON, JSON = pcall(HttpService.JSONDecode, HttpService, Result)
            if SuccessJSON then
                Commit = JSON.sha
            end
        end
    end

    if not isfile('catsix/profiles/commit.txt') or readfile('catsix/profiles/commit.txt') ~= Commit then
        local Success: boolean = DownloadAssets(GetGithubContents())
        if not Success then
            warn(`Failed to update to {Commit}`)
        end

        warn(`Successfully updated to {Commit}`)
        writefile('catsix/profiles/commit.txt', Commit)
    end
end

return loadstring(readfile('catsix/main.lua'), 'main')(Licence)
