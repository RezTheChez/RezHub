-- Universal Hub V1.10

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
	Name = "Rezhub Universal V1.10",
	LoadingTitle = "Rayfield Interface Suite",
	LoadingSubtitle = "by ReztheChez",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = nil,
		FileName = "Rez Hub"
	},
	Discord = {
		Enabled = true,
		Invite = "UGVxEQNWaW",
		RememberJoins = true
	},
	KeySystem = false
})
local player = game:GetService'Players'.LocalPlayer
local character = game:GetService("Workspace"):WaitForChild(player.Name)
local UIS = game:GetService'UserInputService'
local lighting = game:GetService("Lighting")
local cam = game:GetService("Workspace").Camera

local mouse = player:GetMouse()
local chatMesage = "RezHub on top"
local chatInerval = 1
local ESPColor = Color3.new(211, 255, 211)
local fly = false
local flySpeed = 60

lighting.ClockTime = 12

local LocalPlayer = Window:CreateTab("LocalPlayer", 11684390723)
local PlayerSection = LocalPlayer:CreateSection("LocalPlayer")


local SpeedSlider = LocalPlayer:CreateSlider({
	Name = "Change Speed",
	Range = {0, 500},
	Increment = 2,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "SpeedSlider",
	Callback = function(Value)
		character.Humanoid.WalkSpeed = Value
	end,
})

local JumpSlider = LocalPlayer:CreateSlider({
	Name = "Change Jump Power",
	Range = {0, 500},
	Increment = 4,
	Suffix = "Jump Power",
	CurrentValue = 50,
	Flag = "JumpSlider",
	Callback = function(Value)
		character.Humanoid.JumpPower = Value
	end,
})

local FOVSlider = LocalPlayer:CreateSlider({
	Name = "Change FOV",
	Range = {50, 120},
	Increment = 1,
	Suffix = "FOV",
	CurrentValue = 70,
	Flag = "FOVSlider",
	Callback = function(Value)
		character.Parent.Camera.FieldOfView = Value
	end,
})

local FlyButton = LocalPlayer:CreateButton({
	Name = "E to Fly",
	Callback = function()
		loadstring(game:HttpGet("https://pastebin.com/raw/yLtrqnk5"))
	end,
})

local FOVSlider = LocalPlayer:CreateSlider({
	Name = "Change Fly Speed",
	Range = {1, 250},
	Increment = 5,
	Suffix = "Fly Speed",
	CurrentValue = 70,
	Flag = "FlySpeedSlider",
	Callback = function(Value)
		flySpeed = Value
	end,
})

local NoClip = LocalPlayer:CreateToggle({
	Name = "NoClip",
	CurrentValue = false,
	Flag = "NoClip",
	Calback = function(Value)
		if Value then
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
	end,
})

local InfJump = LocalPlayer:CreateButton({
	Name = "Infinite Jump",
	Callback = function()
		game:GetService("UserInputService").JumpRequest:connect(function()
			game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
		end)
	end,
})

local Repsawn = LocalPlayer:CreateButton({
	Name = "Respawn",
	Callback = function()
		character.Humanoid.Health = 0
	end,
})

-- Combat

local Combat = Window:CreateTab("Combat", 11684393513)
local CombatSection = Combat:CreateSection("Combat")

local Aimbot = Combat:CreateButton({
	Name = "Aimbot",
	Callback = function(Value)
	end,
})
-- Render
local Render = Window:CreateTab("Render", 11684389037)
local RenderSection = LocalPlayer:CreateSection("Render")

local TimeOfDay = Render:CreateDropdown({
	Name = "Change Time of Day",
	Options = {"Day","Night"},
	CurrentOption = "Day",
	Flag = "TimeOfDay",
	Callback = function(Option)
		if Option == "Day" then
			if lighting.ClockTime == 0 then
				for i = 1, 96 do
					game:GetService("Lighting").ClockTime -= 0.125
					wait(0.0125)
				end
			end
		else
			if lighting.ClockTime == 12 then
				for i = 1, 96 do
					game:GetService("Lighting").ClockTime += 0.125
					wait(0.0125)
				end
			end
		end
	end,
})

local ESP = Render:CreateToggle({
	Name = "ESP",
	CurrentValue = false,
	Flag = "ESP",
	Callback = function(Value)
		if Value then
			
		end
	end,
})

local ESPColor = Render:CreateToggle({
	Name = "ESP Color",
	CurrentValue = false,
	Flag = "ESPColor",
	Callback = function(Value)
		if Value then
			while true do
				wait(0.1)
				--ESPColor = color3
			end
		end
	end,
})

-- World
local World = Window:CreateTab("World", nil) -- Will add when I get home
local WorldSection = Window:CreateSection("World")

local DeleteWorkspace = World:CreateButton({
	Name = "Delete Workspace",
	Callback = function()
		for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			v:Destroy()
		end
	end,
end

local DeleteUI = World:CreateToggle({
	Name = "Toggle In Game UI",
	CurrentValue = false,
	Flag = "ToggleUI",
	Callback = function(Value)
		if Value then
			for i, v in pairs(player.PlayerGui:GetChildren()) do
				v.enabled = not v.enabled
			end
		else
			for i, v in pairs(player.PlayerGui:GetChildren()) do
				v.enabled = not v.enabled
			end
		end
	end,
end

local Dex = World:CreateButton({
	Name = "Dex",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
	end,
end

local ToggleUI = World:CreateButton({
	Name = "Toggle In Game UI",
	Callback = function()
		for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			v:Destroy()
		end
	end,
end

-- Misc
local Misc = Window:CreateTab("Misc", 11684391939)
local MiscSection = Misc:CreateSection("Misc")

local Serverhop = Misc:CreateButton({
	Name = "ServerHop",
	Callback = function()
		local Http = game:GetService("HttpService")
		local TPS = game:GetService("TeleportService")
		local Api = "https://games.roblox.com/v1/games/"
		local _place = game.PlaceId
		local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
		function ListServers(cursor)
			local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
			return Http:JSONDecode(Raw) 
		end
		local Server, Next;
		repeat
			local Servers = ListServers(Next)
			Server = Servers.data[1] Next = Servers.nextPageCursor
		until Server TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
	end,
})

local Rejoin = Misc:CreateButton({
	Name = "Rejoin",
	Callback = function()
		game:GetService("TeleportService"):Teleport(game.PlaceId, player)
	end,
})

local ChatSpam = Misc:CreateToggle({
	Name = "Chat Spam",
	CurrentValue = false,
	Flag = "ChatSpam",
	Callback = function(Value)
		while wait(0.1) do
			local A_1=chatMesage
			local A_2=chatMesage
			local Event=game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
			while wait(chatInerval) do
				Event:FireServer (A_1, A_2)
			end
		end
	end,
})

local ChatSpamMessage = Misc:CreateInput({
	Name = "Chat Spam Message",
	PlaceholderText = "RezHub on top",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		while wait(0.1) do
			chatMesage = Text
		end
	end,
})

local ChatSpamInterval = Misc:CreateSlider({
	Name = "Chat Spam Interval",
	Range = {1, 5},
	Increment = 1,
	Suffix = "seconds",
	CurrentValue = 3,
	Flag = "ChatSpamInterval",
	Callback = function(Value)
		chatInerval = Value
	end,
})

local Truss = Misc:CreateButton({
	Name = "Truss Trolling",
	Callback = function()
		local truss = Instance.new("TrussPart", game:GetService("Workspace"))
		truss.Position = character.LeftFoot.Position
		truss.Size = Vector3.new(2, 64, 2)
		truss.Orientation = Vector3.new(0, 0, 0)
		truss.Anchored = true
	end,
})

local FakeLag = Misc:CreateToggle({
	Name = "Fake Lag",
	CurrentValue = false,
	Flag = "FakeLag",
	Callback = function(Value)
		while wait(0.1) do
			if Value then
				game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
				game.Players.LocalPlayer.Character.Humanoid.Jump = true
				wait(0.1)
				game.Players.LocalPlayer.Character.LowerTorso.Anchored = false
				game.Players.LocalPlayer.Character.Humanoid.Sit = true
			end
		end
	end,
})

local AntiAfk = Misc:CreateToggle({
	Name = "Anti-Afk",
	CurrentValue = false,
	Flag = "AntiAfk",
	Callback = function(Value)
		while wait(5) do
			if Value then
				local BodyVelocity = Instance.new("BodyVelocity")
				BodyVelocity.MaxForce = Vector3.new(10, 0, 10)
				BodyVelocity.Velocity = character.HumanoidRootPart.CFrame.LookVector * 24
				BodyVelocity.Parent = character.HumanoidRootPart

				local originalOrientation = character.HumanoidRootPart.Orientation

				local connection = nil
				connection = game:GetService("RunService").Stepped:Connect(function()
					local newOrientation = character.HumanoidRootPart.Orientation

					if newOrientation ~= originalOrientation then
						originalOrientation = newOrientation

						BodyVelocity.Velocity = character.HumanoidRootPart.CFrame.LookVector * 24
					end
				end)

				BodyVelocity.Destroying:Connect(function()
					connection:Disconnect()
				end)
			end
		end
	end,
})

-- Other Scripts

local OtherScripts = Window:CreateTab("Other Scripts", 11684983643)
local OtherScriptsSection = OtherScripts:CreateSection("Other Scripts")

local InfYield = OtherScripts:CreateButton({
	Name = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end,
})

local CMDX = OtherScripts:CreateButton({
	Name = "CMD-X",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
	end,
})

local ChatBypasser = OtherScripts:CreateButton({
	Name = "Chat Bypasser",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/daddysyn/synergy/additional/betterbypasser",true))()
	end,
})

local TrollingGui = OtherScripts:CreateButton({
	Name = "Ultimate Trolling Gui",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/PhoenixAceVFX/Roblox-Scripts/master/Admin%20Troll%20(2).lua",true))()
	end,
})

-- UI
local UI = Window:CreateTab("UI", 11684387187)
local UISection = UI:CreateSection("Customize UI")

local Destroy = UI:CreateButton({
	Name = "Destroy the UI",
	Callback = function()
		Rayfield:Destroy()
	end,
})

local Credits = Window:CreateTab("Credits", 11685037732)
local CreditSection = Credits:CreateSection("Credits")

local Scripting = Credits:CreateLabel("Scripting: !Bop#8928")
local Testing = Credits:CreateLabel("Testing: !Bop#8928")
local Skidding = Credits:CreateLabel("Skidding: !Bop#8928")
local FlyScript = Credits:CreateLabel("Fly Script: Hoainhat")
local ServerHop = Credits:CreateLabel("ServerHop Script: Coldster")
local Rejoin = Credits:CreateLabel("Rejoin script: whathappened")
local FakeLag = Credits:CreateLabel("Fake lag script: Eccentric")
