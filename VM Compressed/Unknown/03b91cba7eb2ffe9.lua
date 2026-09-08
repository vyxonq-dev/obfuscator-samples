_G.HideCharacter = true
_G.FlingEnabled = true
_G.TransparentRig = true
_G.ToolFling = false -- false = holding, true = fling
_G.AntiFling = false
_G.CustomHats = true-- Enable or disable custom rig feature (basically old oxide when false)
_G.Scale = 4.2
_G.CH = {
Torso = {
Name= "Accessory (Torso)",
TextureId = "83269599235494",
Orientation= CFrame.new(0,0,0) * CFrame.Angles(math.rad(0),math.rad(0),math.rad(0))
},
RightArm = {
Name= "Accessory (BIGGEST RIGHT ARMAccessory)",
TextureId = "117484156735788",
Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
},
LeftArm = {
Name= "Accessory (BIGGEST LEFT ARMAccessory)",
TextureId = "117484156735788",
Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
},
RightLeg = {
Name= "Accessory (RLeg)",
TextureId = "83269599235494",
Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
},
LeftLeg = {
Name= "Accessory (LLeg)",
TextureId = "83269599235494",
Orientation= CFrame.Angles(math.rad(0),math.rad(90),math.rad(90))
},
Head = {
Name = "Accessory (big head)", -- CHANGE THIS TO WHATEVER BIG HEAD U USE
Orientation = CFrame.new(),
}
}
loadstring(game:HttpGet("https://raw.githubusercontent.com/Nitro-GT/Oxide/refs/heads/main/LoadstringPerma"))()
task.wait(.5) -- we give it time to load properly
