-- Universal Hub V1.02

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RezHub Universal Script V1.02", colors)

local colors = {
	SchemeColor = Color3.fromRGB(0,255,255),
	Background = Color3.fromRGB(0, 0, 0),
	Header = Color3.fromRGB(0, 0, 0),
	TextColor = Color3.fromRGB(255,255,255),
	ElementColor = Color3.fromRGB(20, 20, 20)
}

local LocalPlayer = Window:NewTab("LocalPlayer")
local PlayerSection = LocalPlayer:NewSection("LocalPlayer")
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local UIS = game:GetService("UserInputService");

local mouse = player:GetMouse()
local chatMesage = "RezHub on top"
local chatInerval = 20

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

    --[[PlayerSection:NewToggle("Bypassed Fly", "Allows you to fly", function(state)
        if state then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/BypassedFly.lua"))()
            Fly(true)
        else
            Fly(false)
        end
    end)--]]

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

MiscSection:NewSlider("Spam Interval", "How long it takes between each chat spam message", 40, 1, function(s)
	while wait(0.1) do
		chatInerval = s
	end
end)

-- Combat

local Combat = Window:NewTab("Combat")
local CombatSection = Combat:NewSection("Combat")



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
