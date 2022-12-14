-- Universal Hub V1.12

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RezHub Universal Script V1.12", colors)

local colors = {
	SchemeColor = Color3.fromRGB(0,255,255),
	Background = Color3.fromRGB(0, 0, 0),
	Header = Color3.fromRGB(0, 0, 0),
	TextColor = Color3.fromRGB(255,255,255),
	ElementColor = Color3.fromRGB(20, 20, 20)
}

local player = game:GetService("Players").LocalPlayer
local character = game:GetService("Workspace"):WaitForChild(player.Name)
local UIS = game:GetService("UserInputService")
local lighting = game:GetService("Lighting")

local mouse = player:GetMouse()
local chatMessage = "RezHub On Top"
local chatInterval = 1
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
	wait(10)
	player = game:GetService("Players").LocalPlayer
	character = player.Character
end)


local LocalPlayer = Window:NewTab("LocalPlayer")
local PlayerSection = LocalPlayer:NewSection("LocalPlayer")

PlayerSection:NewSlider("Speed", "Changes your speed (Default is 16)", 250, 1, function(s)
	character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("Jump Height", "Changes your jump height (Default is 50)", 500, 1, function(s)
	character.Humanoid.JumpPower = s
end)

PlayerSection:NewSlider("FOV", "Changes your field of view (Default is 70)", 120, 30, function(s)
	character.Parent.Camera.FieldOfView = s
end)

PlayerSection:NewButton("E to Fly", "Allows you to fly", function()
	local wPressed = false
	local sPressed = false
	local aPressed = false
	local dPressed = false

	local flying = false
	UIS.InputBegan:Connect(function(key, chat)
		if chat then return end
		if key.KeyCode == Enum.KeyCode.E then
			if flying then --Stop Flying
				flying = false
				character.Animate.Disabled = false

			else --Start Flying
				flying = true

				character.Animate.Disabled = true

				local bv = Instance.new("BodyVelocity", character.PrimaryPart)
				bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
				bv.Velocity = Vector3.new(0,0,0)
				bv.Name = "FlightForce"

				repeat wait(0.1) until flying == false
				bv:Destroy()
			end
		end

		if key.KeyCode == Enum.KeyCode.W then
			wPressed = true
		elseif key.KeyCode == Enum.KeyCode.S then
			sPressed = true
		elseif key.KeyCode == Enum.KeyCode.A then
			aPressed = true
		elseif key.KeyCode == Enum.KeyCode.D then
			dPressed = true
		end
	end)

	UIS.InputEnded:Connect(function(key)	
		if key.KeyCode == Enum.KeyCode.W then
			wPressed = false
		elseif key.KeyCode == Enum.KeyCode.S then
			sPressed = false
		elseif key.KeyCode == Enum.KeyCode.A then
			aPressed = false
		elseif key.KeyCode == Enum.KeyCode.D then
			dPressed = false
		end
	end)

	while wait() do
		if flying then
			character.PrimaryPart:FindFirstChild("FlightForce").Velocity = Vector3.new(0,0,0)

			if wPressed then
				character.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * flySpeed
			end
			if sPressed then
				character.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * -flySpeed
			end
			if aPressed then
				character.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.RightVector * -flySpeed
			end
			if dPressed then
				character.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.RightVector * flySpeed
			end
		else
			wait(1)
		end
	end
end)

PlayerSection:NewSlider("Fly Speed", "Toggle your fly speed", 250, 1, function(s)
	flySpeed = s
end)

PlayerSection:NewToggle("NoClip", "Lets you walk through walls", function(state)
	if state then
		while true do
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

PlayerSection:NewButton("Respawn", "Respawns your character", function()
	character.Humanoid.Health = 0
end)

-- Combat

local Combat = Window:NewTab("Combat")
local CombatSection = Combat:NewSection("Combat")

CombatSection:NewButton("Aimbot", "Hold down RMB to lock onto closest player", function()
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
end)

-- Render

local Render = Window:NewTab("Render")
local RenderSection = Render:NewSection("Render")

RenderSection:NewDropdown("Time Of Day", "Changes the time of day", {"Day", "Night"}, function(currentOption)
	if currentOption == "Day" then
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
end)

RenderSection:NewButton("ESP", "Gives you ESP", function()
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
end)

-- World
local World = Window:NewTab("World")
local WorldSection = World:NewSection("WorldSection")

WorldSection:NewButton("Delete Workspace", "Deletes the entire workspace", function()
	for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
		v:Destroy()
	end
end)

WorldSection:NewButton("Delete In Game UI", "Deletes every screengui in playergui", function()
	for i, v in pairs(player.PlayerGui:GetChildren()) do
		v:Destroy()
	end
end)

WorldSection:NewToggle("Toggle In Game UI", "Toggles every screengui in playergui", function(state)
	if state then
		for i, v in pairs(player.PlayerGui:GetChildren()) do
			v.enabled = not v.enabled
		end
	else
		for i, v in pairs(player.PlayerGui:GetChildren()) do
			v.enabled = not v.enabled
		end
	end
end)

WorldSection:NewButton("Dex", "Edit the world (Non FE)", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
end)

-- Misc
local Misc = Window:NewTab("Misc")
local MiscSection = Misc:NewSection("Misc")

MiscSection:NewButton("ServerHop", "Switches to a less crowded server", function()
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
	until Server TPS:TeleportToPlaceInstance(_place,Server.id,player)
end)

MiscSection:NewButton("Rejoin", "Rejoins into the same server", function()	
	game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)


MiscSection:NewToggle("Chat Spam", "Spams chat with a message", function(state)
	--if state then
	while wait(0.1) do
		local A_1=chatMessage
		local A_2="All"
		local Event=game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
		while wait(chatInterval) do
			if state then
				--if state == true then
				Event:FireServer (A_1, A_2)
			end
			--end
		end
	end
	--else

	--end
end)

MiscSection:NewTextBox("Chat Spam Message", "The message you want chat to be spammed with", function(txt)
	while wait(0.1) do
		chatMessage = txt
	end
end)

MiscSection:NewSlider("Chat Spam Interval", "How long it takes between each chat spam message", 5, 1, function(s)
	chatInterval = s
end)

MiscSection:NewButton("Truss", "Spawns a truss for trolling", function()
	local truss = Instance.new("TrussPart", game:GetService("Workspace"))
	truss.Position = character.LeftFoot.Position
	truss.Size = Vector3.new(2, 64, 2)
	truss.Orientation = Vector3.new(0, 0, 0)
	truss.Anchored = true
end)

MiscSection:NewToggle("Fake Lag", "Causes fake lag", function(state)
	if state then
		while wait(0.1) do
			if state then
				character.LowerTorso.Anchored = true
				character.Humanoid.Jump = true
				wait(0.1)
				character.LowerTorso.Anchored = false
				character.Humanoid.Sit = true
			end
		end
	end
end)

MiscSection:NewToggle("Anti-Afk", "Cancels roblox afk kick", function(state)
	while wait(math.random(1, 11)) do
		if state then
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
end)

MiscSection:NewToggle("Moonwalk", "Do the moonwalk :)", function(state)
	if state then
		repeat
			local part = Instance.new("Part", Workspace)
			part.Position = character.LeftFoot
			part.size = Vector3.new(10, 10, 10)
			part.Transparency = 1
			part.Anchored = true
			part.CanCollide = true
			wait(2)
			part:Destroy()
		until state == false
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

OtherScripts:NewButton("Chat Bypasser", "Allows you to say banned words in chat", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/daddysyn/synergy/additional/betterbypasser",true))()
end)

OtherScripts:NewButton("Ultimate Trolling Gui", "The BEST UTG", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PhoenixAceVFX/Roblox-Scripts/master/Admin%20Troll%20(2).lua",true))()
end)

OtherScripts:NewButton("Hamster Ball", "Put yourself into a Hamster Ball", function()
	-- From https://www.youtube.com/watch?v=nqdjgXX8vZs&ab_channel=MastersMZ. Could Not Find Loadstring so :D
	local UserInputService = game:GetService("UserInputService")
	local RunService = game:GetService("RunService")
	local Camera = workspace.CurrentCamera

	local SPEED_MULTIPLIER = 30
	local JUMP_POWER = 60
	local JUMP_GAP = 0.3

	local character = game.Players.LocalPlayer.Character

	for i,v in ipairs(character:GetDescendants()) do
	   if v:IsA("BasePart") then
	       v.CanCollide = false
	   end
	end

	local ball = character.HumanoidRootPart
	ball.Shape = Enum.PartType.Ball
	ball.Size = Vector3.new(5,5,5)
	local humanoid = character:WaitForChild("Humanoid")
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Blacklist
	params.FilterDescendantsInstances = {character}

	local tc = RunService.RenderStepped:Connect(function(delta)
	   ball.CanCollide = true
	   humanoid.PlatformStand = true
	if UserInputService:GetFocusedTextBox() then return end
	if UserInputService:IsKeyDown("W") then
	ball.RotVelocity -= Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
	end
	if UserInputService:IsKeyDown("A") then
	ball.RotVelocity -= Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
	end
	if UserInputService:IsKeyDown("S") then
	ball.RotVelocity += Camera.CFrame.RightVector * delta * SPEED_MULTIPLIER
	end
	if UserInputService:IsKeyDown("D") then
	ball.RotVelocity += Camera.CFrame.LookVector * delta * SPEED_MULTIPLIER
	end
	--ball.RotVelocity = ball.RotVelocity - Vector3.new(0,ball.RotVelocity.Y/50,0)
	end)

	UserInputService.JumpRequest:Connect(function()
	local result = workspace:Raycast(
	ball.Position,
	Vector3.new(
	0,
	-((ball.Size.Y/2)+JUMP_GAP),
	0
	),
	params
	)
	if result then
	ball.Velocity = ball.Velocity + Vector3.new(0,JUMP_POWER,0)
	end
	end)

	Camera.CameraSubject = ball
	humanoid.Died:Connect(function() tc:Disconnect() end)
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
