local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- --- 1. STARTUP MESSAGE ---
Rayfield:Notify({
   Title = "⭐ Jordans Shaders ⭐",
   Content = "Thank you for using Jordans Shaders script. All Elite Shaders are now UNLOCKED.",
   Duration = 5,
   Image = 4483362458,
})

task.wait(0.5)

local Window = Rayfield:CreateWindow({
   Name = "Jordans Shaders",
   LoadingTitle = "Unlocking All Presets...",
   LoadingSubtitle = "Master Collection - No Code Required",
   ConfigurationSaving = { Enabled = true, FolderName = "JordansShaders" },
   KeySystem = false
})

local Lighting = game:GetService("Lighting")
local LocalPlayer = game:GetService("Players").LocalPlayer

local function CleanFX()
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("PostEffect") then v.Enabled = false end
    end
    Lighting.Brightness = 2
    Lighting.GlobalShadows = true
    Lighting.ExposureCompensation = 0
end

local MainTab = Window:CreateTab("All Shaders", 4483362458)
local FPSTab = Window:CreateTab("FPS Boost", 4483362458)
local ToolTab = Window:CreateTab("Tools", 4483362458)

-- --- ULTIMATE SHADER LIST ---
MainTab:CreateSection("Reflective & Neon Presets")

MainTab:CreateButton({
   Name = "Glossy Mirror (Map Only)",
   Callback = function()
      for _, v in pairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") then
            local isCharacter = v:FindFirstAncestorOfClass("Model") and v:FindFirstAncestorOfClass("Model"):FindFirstChild("Humanoid")
            local isGun = v:FindFirstAncestorWhichIsA("Tool")
            if not isCharacter and not isGun then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0.4
            end
         end
      end
   end,
})

MainTab:CreateButton({
   Name = "Midnight Neon (Classic Blue)",
   Callback = function()
      CleanFX()
      local CC = Instance.new("ColorCorrectionEffect", Lighting)
      CC.TintColor = Color3.fromRGB(180, 200, 255); CC.Saturation = 0.5
      local Bloom = Instance.new("BloomEffect", Lighting)
      Bloom.Intensity = 2; Bloom.Size = 30
   end,
})

MainTab:CreateButton({
   Name = "Synthwave (Pink/Purple Overdrive)",
   Callback = function()
      CleanFX()
      local CC = Instance.new("ColorCorrectionEffect", Lighting)
      CC.TintColor = Color3.fromRGB(255, 50, 255); CC.Contrast = 0.5
      local Bloom = Instance.new("BloomEffect", Lighting)
      Bloom.Intensity = 4; Bloom.Size = 56
   end,
})

MainTab:CreateButton({
   Name = "Electric Emerald (Neon Green)",
   Callback = function()
      CleanFX()
      local CC = Instance.new("ColorCorrectionEffect", Lighting)
      CC.TintColor = Color3.fromRGB(0, 255, 120); CC.Saturation = 0.8
      local Bloom = Instance.new("BloomEffect", Lighting)
      Bloom.Intensity = 2.5
   end,
})

MainTab:CreateSection("New Elite Additions")

MainTab:CreateButton({
   Name = "Arctic Frost (Hyper-Realistic Blue)",
   Callback = function()
      CleanFX()
      local CC = Instance.new("ColorCorrectionEffect", Lighting)
      CC.TintColor = Color3.fromRGB(200, 240, 255); CC.Contrast = 0.3; CC.Brightness = 0.1
      local Bloom = Instance.new("BloomEffect", Lighting)
      Bloom.Intensity = 1; Bloom.Threshold = 0.8
   end,
})

MainTab:CreateButton({
   Name = "Volcanic Ash (Red/Grey Gritty)",
   Callback = function()
      CleanFX()
      local CC = Instance.new("ColorCorrectionEffect", Lighting)
      CC.TintColor = Color3.fromRGB(255, 150, 150); CC.Saturation = -0.3; CC.Contrast = 0.4
      local Blur = Instance.new("BlurEffect", Lighting)
      Blur.Size = 2
   end,
})

MainTab:CreateButton({
   Name = "Sun-Kissed (Ultra Realistic 4K)",
   Callback = function()
      CleanFX()
      local CC = Instance.new("ColorCorrectionEffect", Lighting)
      CC.Contrast = 0.1; CC.Saturation = 0.2
      local Rays = Instance.new("SunRaysEffect", Lighting)
      Rays.Intensity = 0.12
      local Bloom = Instance.new("BloomEffect", Lighting)
      Bloom.Intensity = 0.5
   end,
})

MainTab:CreateButton({
   Name = "Deep Void (Black & White Neon)",
   Callback = function()
      CleanFX()
      local CC = Instance.new("ColorCorrectionEffect", Lighting)
      CC.Saturation = -1; CC.Contrast = 0.5
      local Bloom = Instance.new("BloomEffect", Lighting)
      Bloom.Intensity = 5; Bloom.Threshold = 0
   end,
})

-- --- FPS BOOST TAB ---
FPSTab:CreateSection("Performance")

FPSTab:CreateButton({
   Name = "Potato Graphics (Max FPS)",
   Callback = function()
      for _, v in pairs(game:GetDescendants()) do
         if v:IsA("BasePart") or v:IsA("MeshPart") then
            v.Material = Enum.Material.SmoothPlastic
            v.CastShadow = false
         elseif v:IsA("Decal") or v:IsA("Texture") then
            v.Transparency = 1
         end
      end
      Lighting.GlobalShadows = false
   end,
})

-- --- TOOLS ---
ToolTab:CreateSection("Controls")
ToolTab:CreateButton({
   Name = "CLEAN ALL EFFECTS",
   Callback = function() 
      CleanFX() 
      for _, v in pairs(workspace:GetDescendants()) do
         if v:IsA("BasePart") and v.Reflectance > 0 then
            v.Reflectance = 0; v.Material = Enum.Material.Plastic
         end
      end
   end,
})