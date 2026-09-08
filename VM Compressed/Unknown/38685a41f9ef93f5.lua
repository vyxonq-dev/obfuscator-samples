                                                                                 if getgenv().         
                                                                        SyndicateHubWindow then pcall(function()        
                                                                    getgenv().SyndicateHubWindow:Destroy();end);getgenv().        
                                                                SyndicateHubWindow=nil;end local WindUI=loadstring(game:HttpGet(        
                                                            "https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))(); 
                                                          local Window=WindUI:CreateWindow({Title="Lunar hubb",Subtitle=                    
                                                        "by daviiGGS_ | Universal",Icon="shield-alert",Author="daviiGGS_",Folder=             
                                                      "SyndicateHubConfig",Size=UDim2.fromOffset(560,360),Transparent=true,Theme="Dark"});      
                                                    getgenv().SyndicateHubWindow=Window;local LocalPlayerTab=Window:Tab({Title="Local Player",    
                                                  Icon="user"});local PlayersTab=Window:Tab({Title="Players",Icon="users"});local ServerTab=Window: 
                                                  Tab({Title="Servidor",Icon="server"});local CreditsTab=Window:Tab({Title="CrÃ©ditos",Icon="info"});  
                                                LocalPlayerTab:Section({Title="Atributos do Personagem"});LocalPlayerTab:Slider({Title=                 
                                                "Velocidade (WalkSpeed)",Value={Min=16,Max=250,Default=16},Step=1,Callback=function(Value) local char=    
                                              game.Players.LocalPlayer.Character;if (char and char:FindFirstChildOfClass("Humanoid")) then char:            
                                              FindFirstChildOfClass("Humanoid").WalkSpeed=Value;end end});LocalPlayerTab:Slider({Title="Pulo (JumpPower)",  
                                            Value={Min=50,Max=300,Default=50},Step=1,Callback=function(Value) local char=game.Players.LocalPlayer.Character;  
                                            if (char and char:FindFirstChildOfClass("Humanoid")) then local hum=char:FindFirstChildOfClass("Humanoid");hum.     
                                          UseJumpPower=true;hum.JumpPower=Value;end end});LocalPlayerTab:Slider({Title="Gravidade (Gravity)",Value={Min=0,Max=196 
                                          ,Default=196},Step=1,Callback=function(Value) workspace.Gravity=Value;end});LocalPlayerTab:Section({Title=                
                                          "Habilidades e ColisÃ£o"});local NoclipEnabled=false;local NoclipConnection=nil;LocalPlayerTab:Toggle({Title=                
                                          "Noclip (Atravessar Paredes)",Value=false,Callback=function(State) NoclipEnabled=State;if NoclipEnabled then                
                                        NoclipConnection=game:GetService("RunService").Stepped:Connect(function() local char=game.Players.LocalPlayer.Character;if (    
                                        char and NoclipEnabled) then for _,part in ipairs(char:GetDescendants --[[==============================]]()) do if part:IsA(     
                                        "BasePart") then part.CanCollide=false;end end end end);    --[[============================================]]elseif              
                                        NoclipConnection then NoclipConnection:Disconnect();    --[[======================================================]]                
                                      NoclipConnection=nil;end end});local                  --[[==========================================================]]                  
                                      InfiniteJumpEnabled=false;local                     --[[==============================================================]]                
                                      InfiniteJumpConnection=nil;LocalPlayerTab:Toggle({  --[[================================================================]]Title=          
                                      "Pulo Infinito (Inf Jump)",Value=false,Callback=    --[[==================================================================]]function(     
                                      State) InfiniteJumpEnabled=State;if                 --[[==================================================================]]                  
                                    InfiniteJumpEnabled then InfiniteJumpConnection=game: --[[====================================================================]]GetService(   
                    "UserInputService").JumpRequest:Connect(function() if                 --[[====================================================================]]                
              InfiniteJumpEnabled then local char=game.Players.LocalPlayer.Character;if ( --[[======================================================================]]char and char 
            :FindFirstChildOfClass("Humanoid")) then char:FindFirstChildOfClass(          --[[======================================================================]]"Humanoid"):  
          ChangeState(Enum.HumanoidStateType.Jumping);end end end);elseif                 --[[======================================================================]]              
        InfiniteJumpConnection then InfiniteJumpConnection:Disconnect();                  --[[======================================================================]]              
        InfiniteJumpConnection=nil;end end});PlayersTab:Section({Title=                   --[[======================================================================]]              
      "InteraÃ§Ã£o com Jogadores"});local SelectedPlayerName=nil;local function             --[[======================================================================]]GetPlayerList 
      () local list={};for _,player in ipairs(game.Players:GetPlayers()) do if (player~=    --[[==================================================================]]game.Players.   
      LocalPlayer) then table.insert(list,player.Name);end end if ( #list==0) then table.   --[[================================================================]]insert(list,      
    "Nenhum jogador");end return list;end local PlayerDropdown=PlayersTab:Dropdown({Title=  --[[==============================================================]]                  
    "Selecionar Jogador",Values=GetPlayerList(),Value=GetPlayerList()[1] or "Nenhum jogador"  --[[==========================================================]],Callback=function( 
    Option) SelectedPlayerName=Option;end});task.spawn(function() while task.wait(1) do local   --[[====================================================]]newList=GetPlayerList() 
    ;if PlayerDropdown then PlayerDropdown:SetValues(newList);if  not table.find(newList,         --[[==============================================]]SelectedPlayerName) then  
    SelectedPlayerName=newList[1];PlayerDropdown:SetValue(newList[1]);end end end end);PlayersTab:    --[[====================================]]Button({Title=                
    "Teleportar atÃ© o Jogador",Callback=function() if (SelectedPlayerName and (SelectedPlayerName~=       --[[========================]]"Nenhum jogador")) then local         
    targetPlayer=game.Players:FindFirstChild(SelectedPlayerName);if (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) 
   then local localChar=game.Players.LocalPlayer.Character;if (localChar and localChar:FindFirstChild("HumanoidRootPart")) then localChar.HumanoidRootPart.CFrame=        
  targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,0, -3) ;end end end end});PlayersTab:Section({Title="View"});local ViewingPlayer=false;local            
  ViewConnection=nil;PlayersTab:Toggle({Title="Assistir Jogador (View)",Value=false,Callback=function(State) ViewingPlayer=State;local cam=workspace.CurrentCamera;if     
  ViewingPlayer then ViewConnection=game:GetService("RunService").RenderStepped:Connect(function() if (ViewingPlayer and SelectedPlayerName and (SelectedPlayerName~=     
  "Nenhum jogador")) then local targetPlayer=game.Players:FindFirstChild(SelectedPlayerName);if (targetPlayer and targetPlayer.Character and targetPlayer.Character:      
  FindFirstChildOfClass("Humanoid")) then cam.CameraSubject=targetPlayer.Character:FindFirstChildOfClass("Humanoid");else local myChar=game.Players.LocalPlayer.Character 
  ;if (myChar and myChar:FindFirstChildOfClass("Humanoid")) then cam.CameraSubject=myChar:FindFirstChildOfClass("Humanoid");end end end end);else if ViewConnection then  
  ViewConnection:Disconnect();ViewConnection=nil;end local myChar=game.Players.LocalPlayer.Character;if (myChar and myChar:FindFirstChildOfClass("Humanoid")) then cam.   
  CameraSubject=myChar:FindFirstChildOfClass("Humanoid");end end end});ServerTab:Section({Title="ConexÃ£o e Servidores"});ServerTab:Button({Title="Reconectar (Rejoin)",   
  Callback=function() WindUI:Notify({Title="Servidor",Content="Reconectando ao servidor...",Duration=2});task.wait(1);local TeleportService=game:GetService(              
  "TeleportService");TeleportService:TeleportToPlaceInstance(game.PlaceId,game.JobId,game.Players.LocalPlayer);end});ServerTab:Button({Title=                             
  "Trocar de Servidor (Server Hop)",Callback=function() WindUI:Notify({Title="Servidor",Content="Procurando outro servidor...",Duration=2});local HttpService=game:         
  GetService("HttpService");local TeleportService=game:GetService("TeleportService");local PlaceId=game.PlaceId;pcall(function() local servers=HttpService:JSONDecode(game: 
  HttpGet("https://games.roblox.com/v1/games/"   .. PlaceId   .. "/servers/Public?sortOrder=Asc&limit=100" ));if (servers and servers.data) then for _,server in ipairs(    
  servers.data) do if ((server.id~=game.JobId) and (server.playing<server.maxPlayers)) then TeleportService:TeleportToPlaceInstance(PlaceId,server.id,game.Players.         
  LocalPlayer);return;end end end WindUI:Notify({Title="Servidor",Content="Nenhum outro servidor encontrado no momento.",Duration=3});end);end});ServerTab:Button({Title=   
  "Servidor com Pouca Gente",Callback=function() WindUI:Notify({Title="Servidor",Content="Procurando servidor com pouca gente...",Duration=2});local HttpService=game:      
  GetService("HttpService");local TeleportService=game:GetService("TeleportService");local PlaceId=game.PlaceId;pcall(function() local servers=HttpService:JSONDecode(game: 
  HttpGet("https://games.roblox.com/v1/games/"   .. PlaceId   .. "/servers/Public?sortOrder=Asc&limit=100" ));if (servers and servers.data) then table.sort(servers.data,   
  function(a,b) return a.playing<b.playing ;end);for _,server in ipairs(servers.data) do if ((server.id~=game.JobId) and (server.playing>0) and (server.playing<server.     
  maxPlayers)) then TeleportService:TeleportToPlaceInstance(PlaceId,server.id,game.Players.LocalPlayer);return;end end end WindUI:Notify({Title="Servidor",Content=         
  "NÃ£o foi possÃ­vel encontrar um servidor vazio.",Duration=3});end);end});ServerTab:Button({Title="Servidor Lotado",Callback=function() WindUI:Notify({Title="Servidor",    
  Content="Procurando servidor cheio...",Duration=2});local HttpService=game:GetService("HttpService");local TeleportService=game:GetService("TeleportService");local       
  PlaceId=game.PlaceId;pcall(function() local servers=HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"   .. PlaceId   ..                            
  "/servers/Public?sortOrder=Desc&limit=100" ));if (servers and servers.data) then table.sort(servers.data,function(a,b) return a.playing>b.playing ;end);for _,server in 
   ipairs(servers.data) do if ((server.id~=game.JobId) and (server.playing<server.maxPlayers)) then TeleportService:TeleportToPlaceInstance(PlaceId,server.id,game.       
  Players.LocalPlayer);return;end end end WindUI:Notify({Title="Servidor",Content="NÃ£o foi possÃ­vel encontrar um servidor lotado disponÃ­vel.",Duration=3});end);end});    
    CreditsTab:Section({Title="Comunidade"});CreditsTab:Button({Title="Copiar Discord do Server",Callback=function() local discordLink="https://discord.gg/SEULINK";      
    setclipboard(discordLink);WindUI:Notify({Title="Discord",Content="Link do servidor copiado para a Ã¡rea de transferÃªncia!",Duration=3});end});WindUI:Notify({Title=    
    "Lunar hubb",Content="Hub inicializado com sucesso!",Duration=3});