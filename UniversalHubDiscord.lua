-- Universal Hub V1.11

local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))()
local Window = DiscordLib:Window("RezHub Universal V1.11")
local Server = Window:Server("RezHub", "http://www.roblox.com/asset/?id=11713222578")

local player = game:GetService("Players").LocalPlayer
local character = game:GetService("Workspace"):WaitForChild(player.Name)
local UIS = game:GetService("UserInputService")
local lighting = game:GetService("Lighting")

local mouse = player:GetMouse()
local chatMessage = "RezHub on top"
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
	wait(6)
	player = game:GetService("Players").LocalPlayer
	character = player.Character
end)

local LocalPlayer = Server:Channel("LocalPlayer")

LocalPlayer:Slider(
    "Change your speed",
    0,
    250,
    16,
    function(s)
        character.Humanoid.WalkSpeed = s
    end
)

LocalPlayer:Slider(
    "Change your jump power",
    0,
    250,
    50,
    function(s)
        character.Humanoid.JumpPower = s
    end
)

LocalPlayer:Slider(
    "Change your FOV",
    30,
    120,
    70,
    function(s)
        character.Parent.Camera.FieldOfView = s
    end
)

LocalPlayer:Slider(
  "Fly Speed",
  1,
  250,
  100,
  function(s)
    flySpeed = s
  end
)

LocalPlayer:Button(
    "E to Fly",
    function()
    DiscordLib:Notification("Notification", "Press E to Toggle Flight!", "Okay!")
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
    end
)

LocalPlayer:Button(
  "Infinite Jump",
  function()
    DiscordLib:Notification("Notification", "Jump In Midair!", "Okay!")
    	game:GetService("UserInputService").JumpRequest:connect(function()
		    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	    end)
  end
)

LocalPlayer:Button(
  "Respawn",
  function()
    DiscordLib:Notification("Notification", "Respawning!", "Okay!")
    character.Humanoid.Health = 0
  end
)

LocalPlayer:Toggle(
  "NoClip",
  false,
  function(state)
    if state then
     DiscordLib:Notification("Notification", "Turned Noclip On!", "Okay!")
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
          DiscordLib:Notification("Notification", "Turned NoClip Off!", "Okay!")
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
  end
)

-- Combat

local Combat = Server:Channel("Combat")

Combat:Button(
  "Aimbot",
  function()
        DiscordLib:Notification("Notification", "Hold RMB To Lock Onto Closest Player!", "Okay!")
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
  end
)

-- Render

local Render = Server:Channel("Render")

Render:Dropdown(
  "Time Of Day",
  {"Day", "Night"},
  function(currentOption)
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

Render:Button(
  "ESP",
  function()
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
)

-- World
local World = Server:Channel("World")

World:Button(
  "Delete Workspace",
  function()
  	for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
  		v:Destroy()
  	end
  end
)

World:Button("Delete In Game UI",
  function()
    for i, v in pairs(player.PlayerGui:GetChildren()) do
  		v:Destroy()
  	end
  end
)

World:Toggle("Toggle In Game UI"
  false,
  function(state)
    if state then
      for i, v in pairs(player.PlayerGui:GetChildren()) do
        v.enabled = not v.enabled
      end
    else
      for i, v in pairs(player.PlayerGui:GetChildren()) do
        v.enabled = not v.enabled
      end
    end
  end
)

World:Button("Dex",
  function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
  end
)

-- Misc
local Misc = Server:Channel:("Misc")

Misc:Button(
  "ServerHop", 
  function()
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

Misc:Button(
  "Rejoin",
  function()	
	  game:GetService("TeleportService"):Teleport(game.PlaceId, player)
  end
)


Misc:Toggle(
  "Chat Spam",
  function(state)
    while wait(0.1) do
      local A_1=chatMessage
      local A_2="All"
      local Event=game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
      while wait(chatInterval) do
        if state then
          Event:FireServer (A_1, A_2)
        end
      end
    end
  end
)

Misc:Textbox(
  "Chat Spam Message"
  "RezHub On Top",
  true
  function(txt)
	  while wait(0.5) do
	  	chatMessage = txt
	  end
  end
)

Misc:Slider(
  "Chat Spam Interval",
  1,
  5,
  3,
  function(s)
	  chatInterval = s
  end
)

Misc:Button(
  "Spawn a Truss for trolling",
  function()
	  local truss = Instance.new("TrussPart", game:GetService("Workspace"))
	  truss.Position = character.LeftFoot.Position
  	truss.Size = Vector3.new(2, 64, 2)
  	truss.Orientation = Vector3.new(0, 0, 0)
  	truss.Anchored = true
  end
)

Misc:Toggle(
  "Fake Lag",
  false,
  function(state)
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
  end
)

Misc:Toggle(
  "Anti-Afk",
  false,
  function(state)
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
  end
)

Misc:Toggle(
  "Moonwalk",
  false,
  function(state)
    if state then
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
    end
  end
)

-- Other Scripts

local OtherScripts = Server:Channel("Other Scripts")

OtherScripts:Button(
  "Infinite Yield",
  function()
  	loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
  end
)

OtherScripts:Button(
  "CMD-X",
  function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source", true))()
  end
)

OtherScripts:Button(
  "Chat Bypasser",
  function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/daddysyn/synergy/additional/betterbypasser",true))()
  end
)

OtherScripts:Button(
  "Ultimate Trolling Gui",
  function()
	  loadstring(game:HttpGet("https://raw.githubusercontent.com/PhoenixAceVFX/Roblox-Scripts/master/Admin%20Troll%20(2).lua",true))()
  end
)

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

local CreditServer Window:Server("Credits")

local Credits = CreditServer:Channel("Credits")

Credits:Label("Scripting: !Bop#8928")
Credits:Label("Testing: !Bop#8928")
Credits:Label("Skidding: !Bop#8928")
