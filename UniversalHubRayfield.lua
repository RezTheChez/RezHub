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

function getClosestPlayer()
	local closestPlayer = nil
	local closestDistance = math.huge

	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= player and v.TeamColor ~= player.TeamColor then
			local distance = (character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.position).magnitude
			if distance < closestDistance then
				closestDistance = distance
				closestPlayer = v
			end
		end
	end
	return closestPlayer
end

game:GetService("Players").LocalPlayer.Character.Humanoid.Died:Connect(function()
	wait(4)
	player = game:GetService("Players").LocalPlayer
	character = player.Character
end)

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
	_G.aim = false
	UIS.InputBegan:Connect(function(input)
		if input == Enum.UserInputType.MouseButton2 then
			_G.aim = true
			game:GetService("RunService").RenderStepped:Connect(function()
				game:GetService("Workspace").Camera.CFrame = CFrame.new(game:GetService("Workspace").Camera.CFrame.Position, getClosestPlayer().Character.Head.Position)
				if _G.aim == false then return end
			end)
		end
	end)

	UIS.InputEnded:Connect(function(input)
		if input == Enum.UserInputType.MouseButton2 then
			_G.aim = false
		end
	end)
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
			game:GetService("Lighting").ClockTime -= 0
		else
			game:GetService("Lighting").ClockTime -= 12
		end
	end,
})

local ESP = Render:CreateToggle({
	Name = "ESP",
	CurrentValue = false,
	Flag = "ESP",
	Callback = function(Value)
		if Value then
			local color = BrickColor.new(200, 100, 200)
	local transparency = 0.8

	local Players = game:GetService("Players")

	local function _ESP(c)
		repeat wait() until c.PrimaryPart ~= nil
		for i,p in pairs(c:GetChildren()) do
			if p.ClassName == "Part" or p.ClassName == "MeshPart" then
				if p:FindFirstChild("esp") then p.shit:Destroy() end
				local a = Instance.new("BoxHandleAdornment",p)
				a.Name = "esp"
				a.Size = p.Size
				a.Color = color
				a.Transparency = transparency
				a.AlwaysOnTop = true    
				a.Visible = true    
				a.Adornee = p
				a.ZIndex = true    
			end
		end
	end
	
	local function ESP()
		for i,v in pairs(Players:GetChildren()) do
			if v ~= game.Players.LocalPlayer then
				if v.Character then
					_ESP(v.Character)
				end
				v.CharacterAdded:Connect(function(chr)
					_ESP(chr)
				end)
			end
		end
		Players.PlayerAdded:Connect(function(player)
			player.CharacterAdded:Connect(function(chr)
				_ESP(chr)
			end)  
		end)
	end
	ESP()
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
				
local MoonWalk = Misc:CreateToggle({
	Name = "Moonwalk",
	CurrentValue = false,
	Flag = "Moonwalk"
	Callback = function(Value)
		repeat
			local part = Instance.new("Part", Workspace)
			part.Position = character.LeftFoot
			part.size = Vector3.new(10, 10, 10)
			part.Transparency = 1
			part.Anchored = true
			part.CanCollide = true
			wait(2)
			part:Destroy
		until state == false
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
