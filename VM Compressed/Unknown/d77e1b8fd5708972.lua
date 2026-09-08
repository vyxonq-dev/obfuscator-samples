   -- Removed logging
   -- Added personal tab

   repeat wait() until game:IsLoaded()

   local SolarisLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/SolarisLib"))()

   local win = SolarisLib:New({
     Name = "simplity",
     FolderToSave = "SolarisLibStuff"
   })

   local main = win:Tab("Local")

   local sec = main:Section("Player")

   local slider = sec:Slider("Walkspeed", 1,500,16,1,"Slider", function(v)
     game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
   end)
   local slider = sec:Slider("Jumppower", 1,1000,50,1,"Slider", function(v)
     game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
   end)
   local slider = sec:Slider("Gravity", 1,1000,196.2,1,"Slider", function(v)
     game.Workspace.Gravity = v
   end)
   local slider = sec:Slider("Time", 1,24,12,1,"Slider", function(v)
     game.Lighting.TimeOfDay = v
   end)
   sec:Button("Respawn", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/respawn"))()
   end)
   sec:Button("Rejoin", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/rejoin"))()
   end)
   sec:Button("Spoof Walkspeed&Jp", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/spoofwsjp"))()
   end)



   local scripts = main:Section("Utility")

   scripts:Button("Ctrl for Object Name", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/danistydxplorer"))()
   end)
   scripts:Button("X-Ray", function()
      SolarisLib:Notification("Enabled", "Press E to active/disable")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/xray"))()
   end)
   scripts:Button("AntiAFK", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/antiafk"))()
   end)
   scripts:Button("Anti Fling", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/antiflingnoalerts"))()
   end)
   scripts:Button("Explorer", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/dex"))()
   end)
   scripts:Button("ClickTP", function()
      SolarisLib:Notification("Enabled", "Hold CTRL and click anywhere to teleport")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/clicktp"))()
   end)
   scripts:Button("Remote Spy", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/simplespy"))()
   end)
   scripts:Button("Hitbox Expander", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/hitboxexpand"))()
   end)
   scripts:Button("Infinite Jump", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/infjump"))()
   end)
   scripts:Button("Unlock Camera Rotation", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/camerarotation"))()
   end)
   scripts:Button("Airswim", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/airswim"))()
   end)
   scripts:Button("Invisibility", function()
      SolarisLib:Notification("Enabled", "Press E to go visible/invisible")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/invi"))()
   end)
   scripts:Button("Godmode", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/godmode"))()
   end)
   scripts:Button("Chat Translator", function()
      loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/chattranslator"))()
   end)
   scripts:Button("Chat Logger", function()
       SolarisLib:Notification("Enabled", "Press F4 to view the messages")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/chatlogger"))()
   end)
   scripts:Button("Audio Logger", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/audiologger"))()
   end)
   scripts:Button("BTools", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/btools"))()
   end)





   local fps = main:Section("Graphics")
   fps:Button("FPS Booster", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/fpsbooster"))()
   end)
   fps:Button("Graphics Enhancer", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/enhancer"))()
   end)





   local fe = win:Tab("Filtering Enabled")
   local utility = fe:Section("Utility")

   if game.Workspace.FilteringEnabled then
      feenabled = "FE: True (Good)"
   else
      feenabled = "FE: False (Bad)"
   end

   if game:GetService("SoundService").RespectFilteringEnabled then
      respectfe = "RespectFE: True (Bad)"
   else
      respectfe = "RespectFE: False (Good)"
   end

   utility:Label(feenabled)
   utility:Label(respectfe)

   utility:Button("Winged Master", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/fewingled"))()
   end)
   utility:Button("Spiderman", function()
      SolarisLib:Notification("Loaded", "E/Q to webswing")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/spiderman"))()
   end)
   utility:Button("Human Car", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/humancar"))()
   end)
   utility:Button("Telekiness", function()
      SolarisLib:Notification("Enabled", "Works only with unachored objects")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/telekiness"))()
   end)
   utility:Button("Walk on Walls", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/walk"))()
   end)
   utility:Button("Joy", function()
   SolarisLib:Notification("Loaded", "This script has so many keybinds that I couldn't fit here, have fun")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/joy"))()
   end)
   utility:Button("Da Feet", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/dafeet"))()
   end)
   utility:Button("Parkour Man", function()
   SolarisLib:Notification("Loaded", "C to crouch and slide, X to do a complete 360, Double Jump to wallclimb")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/parkour"))()
   end)
   utility:Button("Creepy Crawler", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/crawler"))()
   end)
   utility:Button("Jerk Off", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/jerkoff"))()
   end)
   utility:Button("Human Dick", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/pens"))()
   end)
   utility:Button("Human Chair", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/chair"))()
   end)
   utility:Button("Human Table", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/table"))()
   end)
   utility:Button("Human Helicopter", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/humanhelicopter"))()
   end)
   utility:Button("Human Cube", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/cube"))()
   end)
   utility:Button("Blockhead", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/blockhead"))()
   end)
   utility:Button("Penis", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/penis"))()
   end)
   utility:Button("Calamity", function()
   SolarisLib:Notification("Loaded", "Press F,L,Z,Y,X,C,V,N for modes, click to attack")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/calamity"))()
   end)
   utility:Button("Flipper", function()
     SolarisLib:Notification("Loaded", "Press Z to frontflip, X to backflip, C to airjump")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/flipper"))()
   end)
   utility:Button("Long Legs", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/longlegs"))()
   end)
   utility:Button("Star Glitcher", function()
   SolarisLib:Notification("Loaded", "This script has so many keybinds that I couldn't fit them in here, have fun")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/star"))()
   end)
   utility:Button("Earrape", function()
   SolarisLib:Notification("Loaded", "Doesn't work if RespectFilteringEnabled is true, press F4")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/earrape"))()
   end)
   utility:Button("Spam Oof", function()
      SolarisLib:Notification("Loaded", "Doesn't work if RespectFilteringEnabled is true, press F4")
      for _,v in pairs(game.Players:GetChildren()) do
      v.Character.HumanoidRootPart.Died:Play()
      end
   end)
   utility:Button("Fake VR", function()
   SolarisLib:Notification("Loaded", "Recommended to use a netless")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/fefakevr"))()
   end)
   utility:Button("Pyramid", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/pyramid"))()
   end)
   utility:Button("Critical Mass", function()
   SolarisLib:Notification("Loaded", "Q for Total Outburst, H for Barrage, Z to throw, C to pickup, M for supernova")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/critical"))()
   end)
   utility:Button("Memeus", function()
   SolarisLib:Notification("Loaded", "This script has so many keybinds that I couldn't fit them in here, have fun")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/memeus"))()
   end)
   utility:Button("Helicopter", function()
   SolarisLib:Notification("Loaded", "Q/E to fly down/up")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/helicopter"))()
   end)
   utility:Button("Sans Curse", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/sanscurse"))()
   end)
   utility:Button("Nameless", function()
   SolarisLib:Notification("Loaded", "This script has so many keybinds that I couldn't fit them in here, have fun")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/nameless"))()
   end)
   utility:Button("Ragdoll Suicide", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/ragdollsuicide"))()
   end)
   utility:Button("Hats Orbital", function()
   SolarisLib:Notification("Loaded", "Type .mode (1-11) for cool hat animations")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/hatsv2"))()
   end)
   utility:Button("Holy Spirit", function()
   SolarisLib:Notification("Loaded", "This script has so many keybinds that I couldn't fit them in here, have fun")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/ang"))()
   end)
   utility:Button("Hold Hats", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/holdhats"))()
   end)
   utility:Button("Ball Spin", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/ball"))()
   end)
   utility:Button("Xester", function()
   SolarisLib:Notification("Loaded", "This script has so many keybinds that I couldn't fit them in here, have fun")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/xester"))()
   end)
   utility:Button("Chips", function()
   SolarisLib:Notification("Loaded", "Click to attack, X to suicide, C to laugh, T to taunt, V,B,M,F to change the bag")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/chips"))()
   end)
   utility:Button("Neck Snap", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/necksnap"))()
   end)
   utility:Button("Sad", function()
   SolarisLib:Notification("Loaded", "Press F to fly")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/sad"))()
   end)
   utility:Button("Chill", function()
   SolarisLib:Notification("Loaded", "Hold Shift to move faster")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/chill"))()
   end)
   utility:Button("Scout", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/scout"))()
   end)
   utility:Button("Remove Chairs", function()
       SolarisLib:Notification("Loaded", "Press F on a chair to remove it")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/removechairs"))()
   end)
   utility:Button("Ravager", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/ravager"))()
   end)
   utility:Button("Spidey", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/spidey"))()
   end)
   utility:Button("Titanlify", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/febigpeople"))()
   end)
   utility:Button("Smallify", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/fesmallpeople"))()
   end)
   utility:Button("Nightmare Sans", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/nightmare"))()
   end)
   utility:Button("Thor", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/thor"))()
   end)
   utility:Button("Classic Animations", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/classicanimations"))()
   end)
   utility:Button("Neko Maid", function()
   SolarisLib:Notification("Loaded", "Click to attack, R to lay, Z to flip, T to Taunt")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/nekomaid/main/home"))()
   end)
   utility:Button("Sunpower", function()
   SolarisLib:Notification("Loaded", "Press K to get sun's power, click to attack")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/sunpower"))()
   end)
   utility:Button("Crimson Sonata", function()
   SolarisLib:Notification("Loaded", "Click to attack, E to slash, Q to slash-spin")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/crimson"))()
   end)
   utility:Button("Fake Lag", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/fakelag"))()
   end)
   utility:Button("Rainbow King", function()
   SolarisLib:Notification("Loaded", "T/R/E to Shoot, G for Idle, Y for Chaos, H to go Insane, J to go on your Knee, Q to Teleport")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/rainbow"))()
   end)
   utility:Button("San Goku", function()
   SolarisLib:Notification("Loaded", "R for Holy Light, Y for Lighting of Absolution, U for Holy Wrath, E for Blades of Judgement, T to Taunt")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/goku"))()
   end)
   utility:Button("Pandora", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/pandora"))()
   end)
   utility:Button("Cursed Spider", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/cursedspider"))()
   end)
   utility:Button("Pacifist", function()
   SolarisLib:Notification("Loaded", "Z for the first pose, X for the second pose, C for the last pose")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/pacifist"))()
   end)
   utility:Button("Sonic", function()
      SolarisLib:Notification("Loaded", "Q/E to lean over, Shift to go faster, CTRL to go way faster")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/sonic"))()
   end)
   utility:Button("Imposter", function()
      SolarisLib:Notification("Loaded", "Press C to sit, Click to lean backwards, F to fly, Q to look dead")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/amogus"))()
   end)






   local fling = fe:Section("Flinging Utility")
   fling:Button("Deathnote", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/deathnote"))()
   end)
   fling:Button("Meditator", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/meditation"))()
   end)
   fling:Button("Magician", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/levitator"))()
   end)
   fling:Button("Human Stick", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/humanstick"))()
   end)
   fling:Button("Long Neck", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/longneck"))()
   end)
   fling:Button("Yoga Master", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/yogamaster"))()
   end)
   fling:Button("Moon Monster", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/moonmonster"))()
   end)
   fling:Button("Leg Fighter", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/ae"))()
   end)
   fling:Button("Batman", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/bat"))()
   end)
   fling:Button("Winged Human", function()
   SolarisLib:Notification("Loaded", "Click to fling")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/wingedhuman"))()
   end)
   fling:Button("Exotic Lighting", function()
   SolarisLib:Notification("Loaded", "This script has so many keybinds that I couldn't fit them in here, have fun")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/Exotic"))()
   end)
   fling:Button("Idiot", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/idiote"))()
   end)
   fling:Button("Fearful", function()
   SolarisLib:Notification("Loaded", "Press 1, 2, 3 for modes")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/fearful"))()
   end)
   fling:Button("Freddy", function()
   SolarisLib:Notification("Loaded", "Press 1 to show up and 2 to become invisible")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/fred"))()
   end)
   fling:Button("Gale Fighter", function()
   SolarisLib:Notification("Loaded", "Click to attack, X for ultimate, R for kick barrage")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/galefigher"))()
   end)
   fling:Button("Saitama", function()
   SolarisLib:Notification("Loaded", "Click to punch, R for main idle")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/work"))()
   end)
   fling:Button("Head Dancer", function()
   SolarisLib:Notification("Reanimating...", "Please wait 6 seconds")
   wait(8)
   SolarisLib:Notification("Loaded", "Press T to dance on your head, R to stop dancing")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/headdancer/main/head"))()
   end)
   fling:Button("Mouse Fling", function()
   SolarisLib:Notification("Loaded", "Press E to use")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/fling"))()
   end)






   local dance = fe:Section("Dances")
   dance:Button("Ultimate Meme Dance", function()
     SolarisLib:Notification("Loaded", "Press T for ultimate dance, F to slap, B to shoot, jump to stop the slap")
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/ultimatememedance"))()
   end)
   dance:Button("Smug Dancer", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/smug"))()
   end)
   dance:Button("Goopie Dance", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/goopiedance"))()
   end)
   dance:Button("Rickroll Dance", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/rickroll"))()
   end)
   dance:Button("Retard Dance", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/retarddance"))()
   end)
   dance:Button("Take the L", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/takethel"))()
   end)
   dance:Button("Default Dance", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/erefgew"))()
   end)
   dance:Button("Pog Dance", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/pogdance"))()
   end)







   local aimbot = win:Tab("Combat")

   local aim = aimbot:Section("Aimbot")
   local FOV = aimbot:Section("FOVRing")

   aim:Button("Aimbot", function()
   SolarisLib:Notification("Loaded", "Press P to destroy the aimbot") 
       --draw fov ring
       _G.FOVring = Drawing.new("Circle")
       --loop fov ring properties
       game:GetService"RunService".RenderStepped:Connect(function()
       _G.FOVring.Visible = true
       _G.FOVring.Thickness = 2
       _G.FOVring.Radius = _G.fovringslider
       _G.FOVring.Transparency = 1
       _G.FOVring.Color = _G.fovColorPicker
       _G.FOVring.Position = workspace.CurrentCamera.ViewportSize/2
   end)
       
       local RunService = game:GetService("RunService")
       
       local function getClosest(cframe)
          local ray = Ray.new(cframe.Position, cframe.LookVector).Unit
          
          local target = nil
          local mag = math.huge
          
          for i,v in pairs(game.Players:GetPlayers()) do
              if v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character:FindFirstChild("HumanoidRootPart") and v ~= game.Players.LocalPlayer and (v.Team ~= game.Players.LocalPlayer.Team or (not _G.tcToggle)) then
                  local magBuf = (v.Character.Head.Position - ray:ClosestPoint(v.Character.Head.Position)).Magnitude
                  
                  if magBuf < mag then
                      mag = magBuf
                      target = v
                  end
              end
          end
          
          return target
       end
       
       loop = RunService.RenderStepped:Connect(function()
          local UserInputService = game:GetService("UserInputService")
          local pressed = --[[UserInputService:IsKeyDown(Enum.KeyCode.E)]] UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
          local localPlay = game.Players.localPlayer.Character
          local cam = workspace.CurrentCamera
          local zz = workspace.CurrentCamera.ViewportSize/2
          
          if pressed then
              local Line = Drawing.new("Line")
              local curTar = getClosest(cam.CFrame)
              local ssHeadPoint = cam:WorldToScreenPoint(curTar.Character.Head.Position)
              ssHeadPoint = Vector2.new(ssHeadPoint.X, ssHeadPoint.Y)
              if (ssHeadPoint - zz).Magnitude < _G.fovringslider then
                  workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame:Lerp(CFrame.new(cam.CFrame.Position, curTar.Character.Head.Position), _G.smoothingslider)
              end
          end
          
          if UserInputService:IsKeyDown(Enum.KeyCode.P) then
              loop:Disconnect()
              _G.FOVring:Remove()
          end
       end)
   end)

   local toggle = aim:Toggle("Team Check", false,"tcToggle", function(t)
      _G.tcToggle = t
   end)


   local aimsmooth = aim:Slider("Smoothing", 0.1,1,0.5,0.1,"aimSlider", function(smoothingslider)
       _G.smoothingslider = smoothingslider
   end)

   local fovslider = FOV:Slider("FOV Ring", 10,1000,150,1,"fovSlider", function(fovringslider)
       _G.fovringslider = fovringslider
   end)

   --sec:Colorpicker(title <string>, default <color3>, flag <string>, callback <function>)
   FOV:Colorpicker("FOVring Color", Color3.fromRGB(255, 128, 128),"fovColorpicker", function(t)
      _G.fovColorPicker = t
   end)





   local visuals = win:Tab("Visuals")

   local espsec = visuals:Section("Utility")
   local team = visuals:Section("Team Color")

   _G.Reantheajfdfjdgse = nil

   function esp()
       _G.FriendColor = Color3.fromRGB(0, 0, 255)
       
       local coregui = game:GetService("CoreGui")
       local players = game:GetService("Players")
       local plr = players.LocalPlayer
       
       local highlights = {}
       
       function esp(target, color)
           pcall(function()
               if target.Character then
                   if not highlights[target] then
                       local highlight = Instance.new("Highlight", coregui)
                       highlight.Name = target.Name
                       highlight.Adornee = target.Character
                       highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                       highlight.FillColor = color
                       highlights[target] = highlight
                   else
                       highlights[target].FillColor = color
                   end
               end
           end)
       end
       
       players.PlayerAdded:Connect(function(v)
           v.CharacterAdded:Connect(function()
               esp(v, _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor))
           end)
       end)

       players.PlayerRemoving:Connect(function(v)
           if highlights[v] then
               highlights[v]:Destroy()
               highlights[v] = nil
           end
       end)
       
       for i, v in pairs(players:GetPlayers()) do
           if v ~= plr then
               local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
                   v.CharacterAdded:Connect(function()
                       local color = _G.UseTeamColor and v.TeamColor.Color or ((plr.TeamColor == v.TeamColor) and _G.FriendColor or _G.EnemyColor)
                   esp(v, color)
               end)
               esp(v, color)
           end
       end

       while task.wait() do
           for i, v in pairs(highlights) do
               local color = _G.UseTeamColor and i.TeamColor.Color or ((plr.TeamColor == i.TeamColor) and _G.FriendColor or _G.EnemyColor)
               v.FillColor = color
           end
       end
   end

   local toggle = espsec:Toggle("ESP", false,"espToggle", function(togglebool)
       if togglebool then
           esp()
           for i,v in pairs(game.CoreGui:GetChildren()) do
               if v.ClassName == "Highlight" then
                   v.Enabled = true
               end
           end
       end
       
       if togglebool == false then
           for i,v in pairs(game.CoreGui:GetChildren()) do
               if v.ClassName == "Highlight" then
                   v.Enabled = false
               end
           end
       end
   end)



   local toggle = team:Toggle("Use Current Team Colors", false,"esptcToggle", function(togglebool)
       _G.UseTeamColor = togglebool
   end)

   local enemyColorpicker = team:Colorpicker("Enemy Color", Color3.fromRGB(255, 0, 0),"enemyColorPicker", function(v)
       _G.EnemyColor = v
   end)


   espsec:Button("Highlight ESP", function()
      loadstring(game:HttpGet("https://fluxteam.net/scripts/NewESP.lua", true))()
   end)






   local proc = win:Tab("Protection")
   local protect = proc:Section("Utility")
   protect:Button("Remove Face", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/noface"))()
   end)
   protect:Button("Remove Clothes", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/noclothes"))()
   end)
   protect:Button("Remove Accessories", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/noaccessories"))()
   end)
   protect:Button("Remove EVERYTHING", function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/noface"))()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/noclothes"))()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/noaccessories"))()
   end)






   local universal = win:Tab("Universal")
   local util = universal:Section("Utility")

   util:Button("VG Hub", function()
   loadstring(game:HttpGet("loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/V.G-Hub/main/V.Ghub'))()"))()
   end)
   util:Button("Domain X", function()
   loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/DomainX/main/source',true))()
   end)
   util:Button("Infinite Yield", function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'),true))()
   end)
   util:Button("Universal FE Hub", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/Dvrknvss/UniversalFEScriptHub/main/Script"))()
   end)
   util:Button("Proxima Hub", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))()
   end)
   util:Button("xxHub", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/xxhub"))()
   end)
   util:Button("Darkware", function()
   loadstring(game:HttpGet(("https://raw.githubusercontent.com/Yarik312/DarkWare/main/MainLoader"), true))()
   end)
   util:Button("OP Finality", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/finality"))()
   end)
   util:Button("ParvusHUB (FPS games)", function()
   loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AlexR32/Parvus/main/Loader.lua"))()
   end)


   local whatiuse = win:Tab("Personal")
   local personalfps = whatiuse:Section("FPS")

   personalfps:Button("AimAssistant (PF?)", function()
   loadstring(game:HttpGet'https://raw.githubusercontent.com/Paygammy/RBXAimAssistant/release/aim-assistant.lua')()
   end)
   personalfps:Button("ParvusHUB", function()
   loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/AlexR32/Parvus/main/Loader.lua"))()
   end)
   personalfps:Button("Arsenal Silent", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/kinhey/scripts/main/arsenal_silent_aim.lua"))()
   end)




   local survival = whatiuse:Section("Survival")
   survival:Button("NicoBots ESP", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/nico-bots"))()
   end)
   survival:Button("NicoBots Immortal", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/roburox/s1mple/main/scripts/nicoimmortal"))()
   end)
   survival:Button("Apeirophobia", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/kinhey/scripts/main/apeirophobia.lua"))()
   end)
