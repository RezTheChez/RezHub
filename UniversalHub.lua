-- Universal Hub V1.07

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RezHub Universal Script V1.07", colors)

local colors = {
	SchemeColor = Color3.fromRGB(0,255,255),
	Background = Color3.fromRGB(0, 0, 0),
	Header = Color3.fromRGB(0, 0, 0),
	TextColor = Color3.fromRGB(255,255,255),
	ElementColor = Color3.fromRGB(20, 20, 20)
}

local LocalPlayer = Window:NewTab("LocalPlayer")
local PlayerSection = LocalPlayer:NewSection("LocalPlayer")
local player = game:GetService'Players'.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local UIS = game:GetService'UserInputService'

local mouse = player:GetMouse()
local chatMesage = "RezHub on top"
local chatInerval = 1
local ESPColor = Color3.new(211, 255, 211)

--loadstring(game:HttpGet("https://pastebin.com/raw/RkUtdYb0"))()

PlayerSection:NewSlider("Speed", "Changes your speed (Default is 16)", 250, 1, function(s)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("Jump Height", "Changes your jump height (Default is 50)", 500, 1, function(s)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewSlider("FOV", "Changes your field of view (Default is 70)", 120, 30, function(s)
	game.Players.LocalPlayer.Character.Parent.Camera.FieldOfView = s
end)

PlayerSection:NewButton("Respawn", "Respawns your character", function()
	game.Players.LocalPlayer:LoadCharacter()
end)

PlayerSection:NewButton("Bypassed Fly", "Allows you to fly", function()
	loadstring(game:HttpGet("https://pastebin.com/raw/XSqCPDbx"))
end)

PlayerSection:NewToggle("NoClip", "Lets you walk through walls", function(state)
	if state then
		while true do
			player = game.Players.LocalPlayer
			character = player.Character
			for _, v in pairs(character:GetDescendants()) do
				pcall(function()
					if v:IsA("BasePart") then
						v.CanCollide = false
					end
				end)
			end

			game:GetService("RunService").Stepped:wait()
		end
	else
		while true do
			player = game.Players.LocalPlayer
			character = player.Character

			for _, v in pairs(character:GetDescendants()) do
				pcall(function()
					if v:IsA("BasePart") then
						v.CanCollide = true
					end
				end)
			end

			game:GetService("RunService").Stepped:wait()
		end
	end
end)

PlayerSection:NewButton("InfJump", "Allows you to jump midair", function()
	game:GetService("UserInputService").JumpRequest:connect(function()
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end)
end)

-- Combat

local Combat = Window:NewTab("Combat")
local CombatSection = Combat:NewSection("Combat")

CombatSection:NewButton("Aimbot", "Hold down RMB to lock onto closest player", function()

end)

-- Render

local Render = Window:NewTab("Render")
local RenderSection = Render:NewSection("Render")

RenderSection:NewDropdown("Time Of Day", "Changes the time of day", {"Day", "Night"}, function(currentOption)
	if currentOption == "Night" then
		for i = 1, 96 do
			game:GetService("Lighting").ClockTime -= 0.125
			wait(0.0125)
		end
	else
		for i = 1, 96 do
			game:GetService("Lighting").ClockTime += 0.125
			wait(0.0125)
		end
	end
end)

RenderSection:NewToggle("ESP", "Toggles player esp", function(state)
	if state then
		local esp_settings = { ---- table for esp settings 
			textsize = 8,
			colour = ESPColor
		}

		local gui = Instance.new("BillboardGui")
		local esp = Instance.new("TextLabel",gui) ---- new instances to make the billboard gui and the textlabel



		gui.Name = "Cracked esp"; ---- properties of the esp
		gui.ResetOnSpawn = false
		gui.AlwaysOnTop = true;
		gui.LightInfluence = 0;
		gui.Size = UDim2.new(1.75, 0, 1.75, 0);
		esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
		esp.Text = ""
		esp.Size = UDim2.new(0.0001, 0.00001, 0.0001, 0.00001);
		esp.BorderSizePixel = 4;
		esp.BorderColor3 = Color3.new(esp_settings.colour)
		esp.BorderSizePixel = 0
		esp.Font = "GothamSemibold"
		esp.TextSize = esp_settings.textsize
		esp.TextColor3 = Color3.fromRGB(esp_settings.colour) -- text colour

		game:GetService("RunService").RenderStepped:Connect(function() ---- loops faster than a while loop :)
			for i,v in pairs (game:GetService("Players"):GetPlayers()) do
				if v ~= game:GetService("Players").LocalPlayer and v.Character.Head:FindFirstChild("Cracked esp")==nil and v.TeamColor ~= game:GetService("Players").LocalPlayer.TeamColor then -- craeting checks for team check, local player etc
					esp.Text = "{"..v.Name.."}"
					gui:Clone().Parent = v.Character.Head
				end
			end
		end)
	end
end)

RenderSection:NewColorPicker("ESP Color", "Changes the color of the ESP", Color3.fromRGB(0,0,0), function(color3)
	while true do
		wait(0.1)
		ESPColor = color3
	end
end)

-- Misc
local Misc = Window:NewTab("Misc")
local MiscSection = Misc:NewSection("Misc")


MiscSection:NewButton("Chat Spam", "Spams chat with a message", function()
	--if state then
	while wait(0.1) do
		local A_1=chatMesage
		local A_2="All"
		local Event=game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
		while true do
			wait (chatInerval / 10)
			--if state == true then
			Event:FireServer (A_1, A_2)
			--end
		end
	end
	--else

	--end
end)

MiscSection:NewTextBox("Chat Spam Message", "The message you want chat to be spammed with", function(txt)
	while wait(0.1) do
		chatMesage = txt
	end
end)

MiscSection:NewSlider("Chat Spam Interval", "How long it takes between each chat spam message", 20, 1, function(s)
	chatInerval = s
end)

MiscSection:NewButton("Chaos", "Slowly destroys your game", function()
	for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
		v:Destroy()
		wait(15)
	end
end)

MiscSection:NewToggle("Fake Lag", "Causes fake lag", function(state)
	while true do
		game.Players.LocalPlayer.Character.Torso.Anchored = true
		game.Players.LocalPlayer.Character.Humanoid.Jump = true
		wait(0.1)
		game.Players.LocalPlayer.Character.Torso.Anchored = false
		game.Players.LocalPlayer.Character.Humanoid.Sit = true
		wait(0.1)
	end
end)

-- Other Scripts

local OtherScriptsSection = Window:NewTab("Other Scripts")
local OtherScripts = OtherScriptsSection:NewSection("Other Scripts")

OtherScripts:NewButton("Infinite Yield", "Tons of fun commands", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)

OtherScripts:NewButton("CMD-X", "Like infinite Yield but smoother and more commands", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
end)

-- UI
local UI = Window:NewTab("UI")
local UISection = UI:NewSection("Customize UI")

UISection:NewKeybind("Toggle UI", "Toggles the GUI on/off", Enum.KeyCode.LeftShift, function()
	Library:ToggleUI()
end)

for theme, color in pairs(colors) do
	UISection:NewColorPicker(theme, "Change your "..theme, color, function(color3)
		Library:ChangeColor(theme, color3)
	end)
end

local Credits = Window:NewTab("Credits")
local CreditSection = Credits:NewSection("Credits")

CreditSection:NewLabel("Scripting: !Bop#8928")
CreditSection:NewLabel("Testing: !Bop#8928")
CreditSection:NewLabel("Skidding: !Bop#8928")
