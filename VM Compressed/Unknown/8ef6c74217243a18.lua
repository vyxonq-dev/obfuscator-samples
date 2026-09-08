local _0x1a2b=loadstring(game:HttpGet("https://pastebin.com/raw/kbfatKNg"))()
local _0x3c4d=_0x1a2b.CreateTab("Make A Army","By Starshot","MakeAArmyV1",false,"Dark")
local _0x5e6f=_0x1a2b.CreateSection("Main")
local _0x7g8h=game:GetService("RunService")
local _0x9i0j=game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
local _0xkl1m=_0x9i0j:WaitForChild("DistanceWalked")
local _0xno2p={200,99999999999999}
local _0xqr3s

_0x1a2b.CreateToggle(_0x5e6f,"Enable Inf Cash",false,function(_0xtu4v)
    if _0xtu4v then
        if _0xqr3s then _0xqr3s:Disconnect() _0xqr3s=nil end
        _0xqr3s=_0x7g8h.Heartbeat:Connect(function()
            local _0xok,_0xerr=pcall(function()
                _0xkl1m:FireServer(unpack(_0xno2p))
            end)
            if not _0xok then warn("FS error:",_0xerr) end
        end)
    else
        if _0xqr3s then _0xqr3s:Disconnect() _0xqr3s=nil end
    end
end)

_0x1a2b.CreateDivider(_0x5e6f)
setclipboard("https://discord.gg/kZKJFRxB")
_0x1a2b.CreateParagraph(_0x5e6f,"You have copied a Discord link to your clipboard. Paste into a browser to join our Discord to get exclusive content.")
