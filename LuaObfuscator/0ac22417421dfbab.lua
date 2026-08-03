--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local v0=loadstring(game:HttpGet("https://raw.githubusercontent.com/BlizTBr/scripts/refs/heads/main/Orion%20X"))();local v1="Systemoverride";local v2="https://raw.githubusercontent.com/Davidparaschivhackers/cdvfgf/refs/heads/main/GCBASW";local v3=v0:MakeWindow({Name="Tactical | Verification System",HidePremium=true,SaveConfig=false,IntroText="davidsbro9v6 Security"});local v4=v3:MakeTab({Name="Verify",Icon="rbxassetid://4483345998"});v4:AddSection({Name="Key Hint: Systemoverride"});v4:AddTextbox({Name="Enter Key",Default="",TextDisappear=true,Callback=function(v5) if (v5==v1) then v0:MakeNotification({Name="Success",Content="Access Granted! Loading main script...",Time=3});v0:Destroy();task.wait(0.3);local v6,v7=pcall(function() return game:HttpGet(v2);end);if v6 then local v8,v9=loadstring(v7);if v8 then v8();else warn("Syntax error in your main script: "   .. tostring(v9) );end else warn("Failed to reach GCBASW. Check the GitHub link.");end else v0:MakeNotification({Name="Denied",Content="Incorrect Key. Please try again.",Time=3});end end});v0:Init();
