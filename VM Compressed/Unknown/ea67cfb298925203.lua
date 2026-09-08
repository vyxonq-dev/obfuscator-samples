-- Message

loadstring(game:HttpGet('https://raw.githubusercontent.com/Bac0nh1ck/Scripts/main/System%20%5BEng%5D'))()

-- Bundles

loadstring(game:HttpGet('https://raw.githubusercontent.com/Bac0nh1ck/Scripts/main/Bundles'))()

-- death bug

game:GetService'Players'.LocalPlayer.CharacterAdded:Connect(function(Character)
loadstring(game:HttpGet('https://raw.githubusercontent.com/Bac0nh1ck/Scripts/main/Bundles'))()
end);
