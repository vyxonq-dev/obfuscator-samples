local ws = cloneref(game:GetService("Workspace"))

if ws:FindFirstChild("Gayze") then
cloneref(game:GetService("StarterGui")):SetCore("SendNotification", {
    Title = "Notification";
    Text = "Script alr executed";
    Duration = 5;
})
return end

local part = Instance.new("Part")
part.Parent = ws
part.Name = "Gayze"
part.Size = Vector3.new(5, 5, 5)
part.Position = Vector3.new(0, 5, 0)
part.Transparency = 1
part.CanCollide = false
part.Anchored = true




function Load(url)
    coroutine.wrap(function()
        local success, scriptFunction = pcall(function()
            return loadstring(game:HttpGet(url, true))
        end)

        if success and scriptFunction then
            coroutine.wrap(scriptFunction)() 
        else
            warn("Failed to load script:", scriptFunction)
        end
    end)()
end




Load("https://raw.githubusercontent.com/Gazer-Ha/Forsakontol/refs/heads/main/Do%20generator")
Load("https://raw.githubusercontent.com/Gazer-Ha/Forsakontol/refs/heads/main/Stawmina")
Load("https://raw.githubusercontent.com/Gazer-Ha/Forsakontol/refs/heads/main/PlayerEsp")
Load("https://raw.githubusercontent.com/Gazer-Ha/Forsakontol/refs/heads/main/GenEsp")
Load("https://raw.githubusercontent.com/Gazer-Ha/Forsakontol/refs/heads/main/yeah_better")
Load("https://raw.githubusercontent.com/Gazer-Ha/Forsakontol/refs/heads/main/Tool%20Esp")
Load("https://raw.githubusercontent.com/Gazer-Ha/Forsakontol/refs/heads/main/Anti%20Moderator")
