local Main = Instance.new("ScreenGui")
local notification = Instance.new("Frame")
local top = Instance.new("Frame")
local close = Instance.new("TextButton")
local rayfield = Instance.new("TextButton")
local kavo = Instance.new("TextButton")
local discord = Instance.new("TextButton")
local text = Instance.new("TextLabel")
local title = Instance.new("TextLabel")
local rc = Instance.new("UICorner")
local kc = Instance.new("UICorner")
local dc = Instance.new("UICorner")

local closeC = 150
local closeH = false
local rayfieldC = 150
local rayfieldH = false
local kavoC = 150
local kavoH = false
local discordC = 150
local discordH = false

Main.Name = "ChooseUI"
Main.Parent = game.Players.LocalPlayer.PlayerGui
Main.Enabled = true
Main.IgnoreGuiInset = true

-- Main Frame
notification.Name = "notification"
notification.Parent = Main
notification.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
notification.BorderSizePixel = 0
notification.AnchorPoint = Vector2.new(0.5, 0.5)
notification.Position = UDim2.new(0.5, 0, 0.5, 0)
notification.Size = UDim2.new(0, 400, 0, 200)
notification.Draggable = true
notification.Active = true
notification.Selectable = true

-- Topbar
top.Name = "top"
top.Parent = notification
top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
top.BorderSizePixel = 0
top.Size = UDim2.new(1, 0, 0, 30)

-- Title

title.Name = "Title"
title.Parent = notification
title.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
title.BorderSizePixel = 0
title.Position = UDim2.new(0, 10, 0, 0)
title.Size = UDim2.new(0.9, 0, 0, 30)
title.TextScaled = true
title.ZIndex = 2
title.Font = Enum.Font.GothamSemibold
title.TextColor3 = Color3.fromRGB(150, 150, 150)
title.Text = "🎄 RezHub Universal"
title.TextXAlignment = "Left"

-- Close Button
close.Name = "close"
close.Parent = notification
close.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
close.BackgroundTransparency = 1.000
close.Position = UDim2.new(0.94, 0, 0.04, 0)
close.Size = UDim2.new(0, 15, 0, 15)
close.ZIndex = 2
close.Font = Enum.Font.Ubuntu
close.Text = "X"
close.TextColor3 = Color3.fromRGB(204, 204, 204)
close.TextScaled = true
close.TextSize = 14.000
close.TextWrapped = true

-- "Choose UI"
text.Name = "text"
text.Parent = notification
text.BackgroundColor3 = Color3.fromRGB(34, 87, 168)
text.BackgroundTransparency = 1.000
text.BorderSizePixel = 0
text.Position = UDim2.new(0, 0, 0, 30)
text.Size = UDim2.new(0, 400, 0, 60)
text.ZIndex = 2
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextSize = 50
text.Font = Enum.Font.Ubuntu
text.Text = "  Choose Script UI  "

-- Rayfield Button

rayfield.Name = "Rayfield"
rayfield.Parent = notification
rayfield.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
rayfield.BorderSizePixel = 0
rayfield.Position = UDim2.new(0.075, 0, 0, 110)
rayfield.Size = UDim2.new(0.25, 0, 0, 60)
rayfield.TextScaled = true
rayfield.ZIndex = 2
rayfield.Font = Enum.Font.Ubuntu
rayfield.TextColor3 = Color3.fromRGB(150, 150, 150)
rayfield.Text = "Rayfield\nUI"

-- Kavo Button

kavo.Name = "Kavo"
kavo.Parent = notification
kavo.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
kavo.BorderSizePixel = 0
kavo.Position = UDim2.new(0.375, 0, 0, 110)
kavo.Size = UDim2.new(0.25, 0, 0, 60)
kavo.TextScaled = true
kavo.ZIndex = 2
kavo.Font = Enum.Font.Ubuntu
kavo.TextColor3 = Color3.fromRGB(150, 150, 150)
kavo.Text = "Kavo\nUI"

-- Discord Button

discord.Name = "Discord"
discord.Parent = notification
discord.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
discord.BorderSizePixel = 0
discord.Position = UDim2.new(0.675, 0, 0, 110)
discord.Size = UDim2.new(0.25, 0, 0, 60)
discord.TextScaled = true
discord.ZIndex = 2
discord.Font = Enum.Font.Ubuntu
discord.TextColor3 = Color3.fromRGB(150, 150, 150)
discord.Text = "Discord\nUI"

-- Rayfield Corner

rc.Name = "UICorner"
rc.CornerRadius = UDim.new(0.1)
rc.Parent = rayfield

kc.Name = "UICorner"
kc.CornerRadius = UDim.new(0.1)
kc.Parent = kavo

dc.Name = "UICorner"
dc.CornerRadius = UDim.new(0.1)
dc.Parent = discord


discord.MouseEnter:Connect(function()
    discordH = true
    if discordC < 255 then
      repeat 
        wait(0.01)
        discordC += 5
        discord.TextColor3 = Color3.fromRGB(discordC, discordC, discordC)
      until discordC == 255 or discordH == false
    end
end)

discord.MouseLeave:Connect(function()
    discordH = false
    if discordC > 150 then
      repeat 
        wait(0.01)
        discordC -= 5
        discord.TextColor3 = Color3.fromRGB(discordC, discordC, discordC)
      until discordC == 150 or discordH == true
    end
end)

kavo.MouseEnter:Connect(function()
    kavoH = true
    if kavoC < 255 then
      repeat 
        wait(0.01)
        kavoC += 5
        kavo.TextColor3 = Color3.fromRGB(kavoC, kavoC, kavoC)
      until kavoC == 255 or kavoH == false
    end
end)

kavo.MouseLeave:Connect(function()
    kavoH = false
    if kavoC > 150 then
      repeat 
        wait(0.01)
        kavoC -= 5
        kavo.TextColor3 = Color3.fromRGB(kavoC, kavoC, kavoC)
      until kavoC == 150 or kavoH == true
    end
end)

rayfield.MouseEnter:Connect(function()
    rayfieldH = true
    if rayfieldC < 255 then
      repeat 
        wait(0.01)
        rayfieldC += 5
        rayfield.TextColor3 = Color3.fromRGB(rayfieldC, rayfieldC, rayfieldC)
      until rayfieldC == 255 or rayfieldH == false
    end
end)

rayfield.MouseLeave:Connect(function()
    rayfieldH = false
    if rayfieldC > 150 then
      repeat 
        wait(0.01)
        rayfieldC -= 5
        rayfield.TextColor3 = Color3.fromRGB(rayfieldC, rayfieldC, rayfieldC)
      until rayfieldC == 150 or rayfieldH == true
    end
end)

close.MouseEnter:Connect(function()
    closeH = true
    if closeC < 255 then
      repeat 
        wait(0.01)
        closeC += 5
        close.TextColor3 = Color3.fromRGB(closeC, closeC, closeC)
      until closeC == 255 or closeH == false
    end
end)

close.MouseLeave:Connect(function()
    closeH = false
    if closeC > 150 then
      repeat 
        wait(0.01)
        closeC -= 5
        close.TextColor3 = Color3.fromRGB(closeC, closeC, closeC)
      until closeC == 150 or closeH == true
    end
end)

close.MouseButton1Click:Connect(function()
    Main:Destroy()
end)

rayfield.MouseButton1Click:Connect(function()
    do
		-- Universal Hub V1.12

	local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

	local Window = Rayfield:CreateWindow({
		Name = "Rezhub Universal V1.12",
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
	})

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
	})

	local Dex = World:CreateButton({
		Name = "Dex",
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
		end,
	})

	local ToggleUI = World:CreateButton({
		Name = "Toggle In Game UI",
		Callback = function()
			for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
				v:Destroy()
			end
		end,
	})

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
		Flag = "Moonwalk",
		Callback = function(Value)
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
		end
		Main:Destroy()
end)

kavo.MouseButton1Click:Connect(function()
	do
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
	end
    Main:Destroy()
end)

discord.MouseButton1Click:Connect(function()
    do
								-- Universal Hub V1.12

						local DiscordLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord"))()
						local Window = DiscordLib:Window("RezHub Universal V1.12")
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

						World:Toggle(
						"Toggle In Game UI",
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
						local Misc = Server:Channel("Misc")

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
						"Chat Spam Message",
						"RezHub On Top",
						true,
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
								part:Destroy()
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
	end
    Main:Destroy()
end)
