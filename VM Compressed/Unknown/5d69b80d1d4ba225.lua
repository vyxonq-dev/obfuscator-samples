                                                                                 local Rayfield=       
                                                                        loadstring(game:HttpGet(                        
                                                                    "https://sirius.menu/rayfield"))();local UserInputService=    
                                                                game:GetService("UserInputService");local RunService=game:GetService(   
                                                            "RunService");local Players=game:GetService("Players");local LocalPlayer=     
                                                          Players.LocalPlayer;local Camera=workspace.CurrentCamera;_G.aimActive=false;_G.   
                                                        lockedTarget=nil;_G.rightMouseDown=false;_G.fovEnabled=false;_G.fovSize=100;_G.       
                                                      fovCircleColor=Color3.fromRGB(255,0,0);_G.aimSmoothness=0.2;_G.crosshairOffsetY= -0.3;_G. 
                                                    espEnabled=false;_G.ESPObjects={};local Window=Rayfield:CreateWindow({Name="TrueHub",Icon=0,  
                                                  LoadingTitle="TrueHub Loading",LoadingSubtitle="by TrueHubDEV",Theme="Amethyst",                  
                                                  ConfigurationSaving={Enabled=true,FolderName=nil,FileName="TrueHub"},Discord={Enabled=true,Invite=  
                                                "ufNv6TAtbd",RememberJoins=false},KeySystem=false});local AimTab=Window:CreateTab("Aim",1234567890);    
                                                local function enableFOVCircle() if Drawing then _G.fovCircle=Drawing.new("Circle");_G.fovCircle.Color=_G 
                                              .fovCircleColor;_G.fovCircle.Thickness=2;_G.fovCircle.Transparency=1;_G.fovCircle.NumSides=64;_G.fovCircle.   
                                              Visible=true;_G.fovCircle.Radius=_G.fovSize or 100 ;spawn(function() while _G.fovEnabled and _G.fovCircle  do 
                                             local viewportSize=Camera.ViewportSize;_G.fovCircle.Position=Vector2.new(viewportSize.X/2 ,viewportSize.Y/2 );   
                                            RunService.RenderStepped:Wait();end end);end end local function disableFOVCircle() if _G.fovCircle then _G.         
                                          fovCircle:Remove();_G.fovCircle=nil;end end local FOVToggle=AimTab:CreateToggle({Name="FOV",CurrentValue=false,Flag=    
                                          "FOVToggle",Callback=function(Value) _G.fovEnabled=Value;if Value then enableFOVCircle();else disableFOVCircle();end end} 
                                          );local FOVSlider=AimTab:CreateSlider({Name="FOV:",Range={10,240},Increment=10,Suffix="",CurrentValue=_G.fovSize,Flag=      
                                          "FOVSlider",Callback=function(Value) _G.fovSize=Value;if _G.fovCircle then _G.fovCircle.Radius=Value;end end});local        
                                        SmoothnessSlider=AimTab:CreateSlider({Name="Smoothness",Range={0.05,1},Increment=0.05,Suffix="",CurrentValue=_G.aimSmoothness,  
                                        Flag="SmoothnessSlider",Callback=function(Value) _G.aimSmoothness=    --[[==============================]]Value;end});local       
                                        ColorPicker=AimTab:CreateColorPicker({Name="FOVColor",Color --[[============================================]]=_G.fovCircleColor, 
                                        Flag="ColorPicker1",Callback=function(Value) _G.        --[[======================================================]]fovCircleColor= 
                                      Value;if _G.fovCircle then _G.fovCircle.Color=Value;  --[[==========================================================]]end end});local   
                                      function createHighlight(targetCharacter) if        --[[==============================================================]]targetCharacter 
                                       then local highlight=Instance.new("Highlight");    --[[================================================================]]highlight.Name= 
                                      "AimLockHighlight";highlight.FillColor=Color3.new(1 --[[==================================================================]],0,0);        
                                      highlight.FillTransparency=0.7;highlight.           --[[==================================================================]]OutlineColor=     
                                    Color3.new(1,1,1);highlight.OutlineTransparency=0;    --[[====================================================================]]highlight.    
                    Adornee=targetCharacter;highlight.Parent=targetCharacter;_G.          --[[====================================================================]]                
              currentHighlight=highlight;end end local function removeHighlight() if _G.  --[[======================================================================]]              
            currentHighlight then _G.currentHighlight:Destroy();_G.currentHighlight=nil;  --[[======================================================================]]end end local 
           function releaseLock() _G.lockedTarget=nil;removeHighlight();end               --[[======================================================================]]              
        UserInputService.InputBegan:Connect(function(input,gameProcessed) if ( not        --[[======================================================================]]gameProcessed 
         and (input.KeyCode==Enum.KeyCode.B)) then _G.aimActive= not _G.aimActive;if  not --[[======================================================================]] _G.aimActive 
       then releaseLock();end end end);local AimToggle=AimTab:CreateToggle({Name="Aim",   --[[======================================================================]]CurrentValue= 
      false,Flag="AimToggle",Callback=function(Value) _G.aimActive=Value;if Value then      --[[==================================================================]]spawn(function( 
      ) local rightDownConn=UserInputService.InputBegan:Connect(function(input,             --[[================================================================]]gameProcessed) if 
     ( not gameProcessed and (input.UserInputType==Enum.UserInputType.MouseButton2)) then   --[[==============================================================]]_G.rightMouseDown 
    =true;end end);local rightUpConn=UserInputService.InputEnded:Connect(function(input,      --[[==========================================================]]gameProcessed) if ( 
     not gameProcessed and (input.UserInputType==Enum.UserInputType.MouseButton2)) then _G.     --[[====================================================]]rightMouseDown=false;   
    releaseLock();end end);while _G.aimActive do if _G.rightMouseDown then if  not _G.            --[[==============================================]]lockedTarget then local   
    targetPart=nil;local shortestDistance=math.huge;for _,player in ipairs(Players:GetPlayers()) do   --[[====================================]]if ((player~=LocalPlayer) and 
     player.Character and player.Character:FindFirstChild("Humanoid")) then local aimPart=player.         --[[========================]]Character:FindFirstChild("Torso") or  
    player.Character:FindFirstChild("UpperTorso") or player.Character:FindFirstChild("HumanoidRootPart") ;if aimPart then local pos,onScreen=Camera:WorldToViewportPoint(   
  aimPart.Position);if onScreen then local screenPoint=Vector2.new(pos.X,pos.Y);local mousePos=UserInputService:GetMouseLocation();local dist=(screenPoint-mousePos).     
  Magnitude;if _G.fovEnabled then if ((dist<=(_G.fovSize or 100)) and (dist<shortestDistance)) then targetPart=aimPart;shortestDistance=dist;end elseif (dist<          
  shortestDistance) then targetPart=aimPart;shortestDistance=dist;end end end end end if targetPart then _G.lockedTarget=targetPart;createHighlight(targetPart.Parent);   
  end elseif (_G.lockedTarget and _G.lockedTarget.Parent) then local targetPos=_G.lockedTarget.Position;local aimOffset=Vector3.new(0,0,0);if (_G.lockedTarget.Name==     
  "Torso") then aimOffset=Vector3.new(0, -0.5,0);elseif (_G.lockedTarget.Name=="UpperTorso") then aimOffset=Vector3.new(0, -1,0);elseif (_G.lockedTarget.Name==           
  "HumanoidRootPart") then aimOffset=Vector3.new(0, -1.5,0);end targetPos=targetPos + aimOffset ;local enemyRoot=_G.lockedTarget.Parent:FindFirstChild("HumanoidRootPart" 
  ) or _G.lockedTarget ;local enemyVelocity=enemyRoot.Velocity;local distance=(Camera.CFrame.Position-targetPos).Magnitude;local bulletSpeed=300;local timeToReach=       
  distance/bulletSpeed ;local prediction=enemyVelocity * timeToReach ;local dropFactor=0.01;local dropOffset=Vector3.new(0, -distance * dropFactor ,0);local finalTarget= 
  targetPos + prediction + dropOffset + Vector3.new(0,_G.crosshairOffsetY,0) ;local currentCF=Camera.CFrame;local targetCF=CFrame.new(Camera.CFrame.Position,finalTarget) 
  ;Camera.CFrame=currentCF:Lerp(targetCF,1 -_G.aimSmoothness );end end RunService.RenderStepped:Wait();end rightDownConn:Disconnect();rightUpConn:Disconnect();           
  releaseLock();end);end end});local ESPScript=Window:CreateTab("ESP",9876543210);local ESPToggle=ESPScript:CreateToggle({Name="ESP On/Off",CurrentValue=false,Flag=      
  "ESPToggle",Callback=function(Value) _G.espEnabled=Value;if  not Value then for player,esp in pairs(_G.ESPObjects) do if (esp and esp.Parent) then esp:Destroy();end end  
  _G.ESPObjects={};end end});local function updatePlayerESP(player) if (player==LocalPlayer) then return;end local character=player.Character;if character then local       
  highlight=_G.ESPObjects[player];if  not highlight then highlight=Instance.new("Highlight");highlight.Name="ESPHighlight";highlight.FillColor=Color3.fromRGB(0,255,0);     
  highlight.OutlineColor=Color3.fromRGB(0,0,0);highlight.FillTransparency=0.5;highlight.OutlineTransparency=0;highlight.Adornee=character;highlight.Parent=character;_G.    
  ESPObjects[player]=highlight;end end end spawn(function() while true do if _G.espEnabled then for _,player in ipairs(Players:GetPlayers()) do updatePlayerESP(player);end 
   end RunService.RenderStepped:Wait();end end);Players.PlayerRemoving:Connect(function(player) if _G.ESPObjects[player] then _G.ESPObjects[player]:Destroy();_G.ESPObjects 
  [player]=nil;end end);LocalPlayer.CharacterAdded:Connect(function(character) if _G.ESPObjects[LocalPlayer] then _G.ESPObjects[LocalPlayer]:Destroy();_G.ESPObjects[       
  LocalPlayer]=nil;end end);
