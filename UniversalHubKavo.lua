-- Universal Hub V1.10

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("RezHub Universal Script V1.10", colors)

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

PlayerSection:NewSlider("Speed", "Changes your speed (Default is 16)", 250, 1, function(s)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PlayerSection:NewSlider("Jump Height", "Changes your jump height (Default is 50)", 500, 1, function(s)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

PlayerSection:NewSlider("FOV", "Changes your field of view (Default is 70)", 120, 30, function(s)
	game.Players.LocalPlayer.Character.Parent.Camera.FieldOfView = s
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

PlayerSection:NewButton("Respawn", "Respawns your character", function()
	character.Humanoid.Health = 0
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
	if currentOption == "Day" then
		if lighting.ClockTime == 0 then
			for i = 1, 96 do
				game:GetService("Lighting").ClockTime -= 0.125
				wait(0.0125)
			end
			
			while(currentOption == "Day") do
				wait(0.1)
				lighting.ClockTime = 12
			end
		end
	else
		if lighting.ClockTime == 12 then
			for i = 1, 96 do
				game:GetService("Lighting").ClockTime += 0.125
				wait(0.0125)
			end
			
			while(currentOption == "Night") do
				wait(0.1)
				lighting.ClockTime = 0
			end
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
	until Server TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
end)

MiscSection:NewButton("Rejoin", "Rejoins into the same server", function()	
	game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)


MiscSection:NewToggle("Chat Spam", "Spams chat with a message", function(state)
	--if state then
	while wait(0.1) do
		local A_1=chatMesage
		local A_2="All"
		local Event=game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
		while wait(chatInerval / 10) do
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
		chatMesage = txt
	end
end)

MiscSection:NewSlider("Chat Spam Interval", "How long it takes between each chat spam message", 40, 1, function(s)
	chatInerval = s
end)

MiscSection:NewButton("Chaos", "Slowly destroys your game", function()
	for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
		v:Destroy()
		wait(15)
	end
end)

MiscSection:NewToggle("Fake Lag", "Causes fake lag", function(state)
	if state then
		while wait(0.1) do
			if state then
				game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
				game.Players.LocalPlayer.Character.Humanoid.Jump = true
				wait(0.1)
				game.Players.LocalPlayer.Character.LowerTorso.Anchored = false
				game.Players.LocalPlayer.Character.Humanoid.Sit = true
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

OtherScripts:NewButton("Ultimate Trolling Gui	", "The BEST UTG", function()
	loadstring(game:HttpGet("https://raw.githubusercontent.com/PhoenixAceVFX/Roblox-Scripts/master/Admin%20Troll%20(2).lua",true))()
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
