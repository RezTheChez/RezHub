for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.Name == "soldier_model" then
        if v:FindFirstChild("fpv_humanoid") then
            game:GetService("Players").LocalPlayer.Character = v
        end
    end
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
    Name = "Roblox Frontlines Script",
    LoadingTitle = "Roblox Frontlines Script",
    LoadingSubtitle = "by !Bop#8928",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "Roblox Frontlines Script"
    },
    Discord = {
       Enabled = true,
       Invite = "sirius",
       RememberJoins = true
    },
    KeySystem = false,
 })

function addCham(color, fillTransparency, borderTransparency, parent)
   local cham = Instance.new("Highlight", parent)
   cham.FillColor = color
   cham.FillTransparency = fillTransparency
   cham.OutlineTransparency = borderTransparency
end

function clearAllChams()
   for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
       if v.Name == "soldier_model" then
           if v:FindFirstChild("Highlight") then
               v.Highlight:Destroy()
           end
       end
   end
end

function getWalkspeed(player)
    if player.Character:FindFirstChild("fpv_humanoid") then
        return math.floor(player.Character:FindFirstChildOfClass("Humanoid").WalkSpeed)
    else
        return 16
    end
end

function getJumpPower(player)
    if player.Character:FindFirstChild("fpv_humanoid") then
        return math.floor(player.Character:FindFirstChildOfClass("Humanoid").JumpPower)
    else
        return 16
    end
end

function serverHop(player)
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    local File = pcall(function()
        AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
    end)
    if not File then
        table.insert(AllIDs, actualHour)
        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
    end
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                delfile("NotSameServers.json")
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, player)
                    end)
                    wait(4)
                end
            end
        end
    end


    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

function getClosestPlayer(player)
	local maximumDistance = math.huge
	local target = nil
  
  	--coroutine.wrap(function()
    		--wait(20)
           -- maximumDistance = math.huge
  	--end)()

	for i, v in pairs(game:GetService("Players"):GetPlayers()) do
		if v ~= player then
			if v.Character then
				if v.Character.fpv_humanoid.Health ~= 0 then
					local screenPoint = game:GetService("Workspace").CurrentCamera:WorldToScreenPoint(v.Character.HumanoidRootPart, math.huge).Position
					local vectorDistance = (Vector2.new(game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y) - Vector2.new(screenPoint.X, screenPoint.Y)).Magnitude
							
					if vectorDistance < maximumDistance then
						target = v
               			maximumDistance = vectorDistance
					end
				end
			end
		end
	end

	return target
end

function Lerp(a, b, t)
    return a + (b - a) * t
end

-- Chams
local chamsColor = Color3.fromRGB(255, 0, 0)
local chamsFillTransparency = 0.5
local chamsOutlineTransparency = 0

-- Hitbox Extender
local hitboxSize = Vector3.new(10, 10, 10)
local hitboxTransparency = 0.5

-- Mods/Admins
local mods = {"cbmaximillian", "AsphaltAssassin", "101airsoft", "1231551", "Doc_021", "sidnad10", "Empyror", "FrancklinDay", "Falosaur"}

-- Fly
local flySpeed = 5

-- Silent Aim
local silentAimSize = 50
local fovSize = 50
local drawingCreated = false
local fovColor = Color3.fromRGB(0, 255, 0)
local prevCircle = nil

-- Notifications
local rayfieldNotificationsEnabled = true

-- Session
local sessionTime = 0

-- Normal Variables
local ws = game:GetService("Workspace")
local runService = game:GetService("RunService")
local player = game:GetService("Players").LocalPlayer
local character = player.Character

local playerTab = Window:CreateTab("Player", 4483362458)
local movementSection = playerTab:CreateSection("Movement")

local visualsTab = Window:CreateTab("Visuals", 4483362458)
local chamsSection = visualsTab:CreateSection("Chams")

local combatTab = Window:CreateTab("Combat", 4483362458)
local silentAimSection = combatTab:CreateSection("Silent Aim - SYNAPSE X ONLY")

local miscTab = Window:CreateTab("Misc", 4483362458)
local serverhopSection = miscTab:CreateSection("Serverhop/Rejoin")

local settingsTab = Window:CreateTab("Settings/Credits", 4483362458)
local chatSection = settingsTab:CreateSection("Settings")

local statsTab = Window:CreateTab("Game Stats", 4483362458)
local performanceSection = statsTab:CreateSection("Performance")

local note = playerTab:CreateLabel("Note: You must have spawned into the game for most of these modules to work.")

local walkSpeed = playerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 100},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = getWalkspeed(player),
    Flag = "Walk Speed",
    Callback = function(Value)
        while task.wait() do
            if character:FindFirstChild("fpv_humanoid") then
                character.fpv_humanoid.WalkSpeed = Value
            end
        end
    end,
})

local fly = playerTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Flag = "Fly",
    Callback = function(Value)
        -- It's not pretty, but it works

        local Screen = Instance.new("ScreenGui",game.CoreGui)
        local Distance = Instance.new("TextLabel",Screen)
        Distance.BackgroundTransparency = 1 
        Distance.Size = UDim2.new(0,10,0,10)
        Distance.ZIndex = 2
        Distance.Text = "0"
        Distance.TextStrokeTransparency = .5
        Distance.TextSize = 20
        Distance.TextStrokeColor3 = Color3.fromRGB(33, 33, 33)
        Distance.Font = Enum.Font.Gotham
        Distance.TextColor3 = Color3.new(1,1,1)
        Distance.TextXAlignment = Enum.TextXAlignment.Left
        Distance.TextYAlignment = Enum.TextYAlignment.Top

        local Mouse = player:GetMouse()
        local Direction = Vector3.new(0,0,0)
        local InterpolatedDir = Direction
        local Tilt = 0
        local InterpolatedTilt = Tilt
        local RunService = game:GetService("RunService")
        local Toggled = false
        local CameraPos = ws.CurrentCamera.CFrame.Position

        pcall(function()
            player.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam	
        end)

        local LastPos = nil

        function keyHandler(actionName, userInputState)
            if true and character and character:FindFirstChild("HumanoidRootPart") then
                if actionName == "Toggle" and userInputState == Enum.UserInputState.Begin then
                    if Value then
                        LastPos = character.HumanoidRootPart.Position
                        character.fpv_humanoid.PlatformStand = true 
                    else
                        LastPos = nil
                        character.fpv_humanoid.PlatformStand = false
                    end
                elseif actionName == "Forward" then
                    Tilt = userInputState == Enum.UserInputState.Begin and -20 or 0
                    Direction = Vector3.new(Direction.x, Direction.y, userInputState == Enum.UserInputState.Begin and -1 or 0)
                elseif actionName == "Left" then
                    Direction = Vector3.new(userInputState == Enum.UserInputState.Begin and -1 or 0,Direction.y,Direction.z)
                elseif actionName == "Backward" then
                    Tilt = userInputState == Enum.UserInputState.Begin and 20 or 0
                    Direction = Vector3.new(Direction.x, Direction.y ,userInputState == Enum.UserInputState.Begin and 1 or 0)
                elseif actionName == "Right" then
                    Direction = Vector3.new(userInputState == Enum.UserInputState.Begin and 1 or 0, Direction.y, Direction.z)
                elseif actionName == "Up" then
                    Direction = Vector3.new(Direction.x, userInputState == Enum.UserInputState.Begin and 1 or 0, Direction.z)
                elseif actionName == "Down" then
                    Direction = Vector3.new(Direction.x, userInputState == Enum.UserInputState.Begin and -1 or 0, Direction.z)
                end
            end
        end
        
        game:GetService("UserInputService").InputBegan:Connect(function(inputObject, gameProcessedEvent)
            if inputObject.KeyCode == Enum.KeyCode.P then
                keyHandler("Toggle", Enum.UserInputState.Begin, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.W then
                keyHandler("Forward", Enum.UserInputState.Begin, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.A then
                keyHandler("Left", Enum.UserInputState.Begin, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.S then
                keyHandler("Backward", Enum.UserInputState.Begin, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.D then
                keyHandler("Right", Enum.UserInputState.Begin, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.E then	
                keyHandler("Up", Enum.UserInputState.Begin, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.Q then
                keyHandler("Down", Enum.UserInputState.Begin, inputObject)
            end
        end)

        game:GetService("UserInputService").InputEnded:Connect(function(inputObject, gameProcessedEvent)
            if inputObject.KeyCode == Enum.KeyCode.P then
                keyHandler("Toggle", Enum.UserInputState.End, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.W then
                keyHandler("Forward", Enum.UserInputState.End, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.A then
                keyHandler("Left", Enum.UserInputState.End, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.S then
                keyHandler("Backward", Enum.UserInputState.End, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.D then
                keyHandler("Right", Enum.UserInputState.End, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.E then	
                keyHandler("Up", Enum.UserInputState.Begin, inputObject)
            elseif inputObject.KeyCode == Enum.KeyCode.Q then
                keyHandler("Down", Enum.UserInputState.End, inputObject)
            end
        end)

        RunService.RenderStepped:Connect(function()
            if Value and character and character:FindFirstChild("HumanoidRootPart")  then
                for i,v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Velocity = Vector3.new(0,0,0)
                    end
                end

                local RootPart = character.HumanoidRootPart

                if LastPos then
                    Distance.Text = math.floor((LastPos-RootPart.Position).Magnitude+.5)
                    if (LastPos-RootPart.Position).Magnitude >= 350 then
                        Distance.TextColor3 = Color3.new(1,0,0)
                    else
                        Distance.TextColor3 = Color3.new(1,1,1)	
                    end
                else
                    Distance.TextColor3 = Color3.new(1,1,1)
                    Distance.Text = 0
                end
                InterpolatedDir = InterpolatedDir:Lerp((Direction *  flySpeed), 0.2)
                InterpolatedTilt = Lerp(InterpolatedTilt, Tilt * 1, Tilt == 0 and 0.2 or 0.1)
                RootPart.CFrame = RootPart.CFrame:Lerp(CFrame.new(RootPart.Position, RootPart.Position + Mouse.UnitRay.Direction) * CFrame.Angles(0, math.rad(00), 0) * CFrame.new(InterpolatedDir)  * CFrame.Angles(math.rad(InterpolatedTilt), 0, 0), 0.2)
            else
                Distance.TextColor3 = Color3.new(1,1,1)
                Distance.Text = 0
            end	
        end)
    end,
})

local flySpeedSlider = playerTab:CreateSlider({
    Name = "Fly Speed",
    Range = {1, 10},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 5,
    Flag = "Fly Speed",
    Callback = function(Value)
        flySpeed = Value
    end,
})

local noClip = playerTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        while task.wait() do
            if Value then
                for i, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = false
                    end
                end
            else
                for i, v in pairs(character:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.CanCollide = true
                    end
                end
            end
    	end
    end
})

-- I dont fully understand what bhopping is

--[[local bHop = playerTab:CreateToggle({
    Name = "BHop",
    CurrentValue = false,
    Flag = "BHop",
    Callback = function(Value)
        while task.wait() do
            if not Value then break end

            if Value then -- Ok, You Dont Have To Do this
                if character:FindFirstChild("fpv_humanoid") then
                    if Value then -- WHY???
                        if character.fpv_humanoid.FloorMaterial ~= "Air" then
                            character.fpv_humanoid:ChangeState("Jumping")
                        end
                    end
                end
            end
        end
    end,
})-]]

local infJumpSection = playerTab:CreateSection("Infinite Jump")

local infJump = playerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Infinite Jump",
    Callback = function(Value)
        game:GetService("UserInputService").InputBegan:Connect(function(input)
            if not Value then return end
			if input.KeyCode == Enum.KeyCode.Space then
				if character:FindFirstChild("fpv_humanoid") then
					character.fpv_humanoid:ChangeState("Jumping")
				end
			end
        end)
    end,
})

local infJumpHeight = playerTab:CreateSlider({
	Name = "Infinite Jump Height",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Jump Height",
    CurrentValue = getJumpPower(player),
    Flag = "Infinite Jump Height",
    Callback = function(Value)
        while task.wait() do
            if character:FindFirstChild("fpv_humanoid") then
                character.fpv_humanoid.JumpHeight = Value
            end
        end
    end,
})

local chams = visualsTab:CreateToggle({
    Name = "Chams",
    CurrentValue = false,
    Flag = "Chams",
    Callback = function(Value)
		if Value then
			while task.wait() do
                clearAllChams()

				for i, v in pairs(ws:GetChildren()) do
					if v.Name == "soldier_model" then
                        if v ~= character then
                            addCham(chamsColor, chamsFillTransparency, chamsBorderTransparency, v)
                        end
					end
				end
			end else clearAllChams() end
    end,
})

local chamsEnemyColor = visualsTab:CreateColorPicker({
    Name = "Chams Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "Enemy Color",
    Callback = function(Value)
        chamsColor = Value
    end,
})

local chamsFillTransparency = visualsTab:CreateSlider({
    Name = "Chams Fill Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "Fill Transparency",
    CurrentValue = 0.5,
    Flag = "Chams Fill Transparency",
    Callback = function(Value)
        chamsFillTransparency = Value
    end,
})

local chamsBorderTransparency = visualsTab:CreateSlider({
    Name = "Chams Border Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "Border Transparency",
    CurrentValue = 0.5,
    Flag = "Chams Border Transparency",
    Callback = function(Value)
        chamsBorderTransparency = Value
    end,
})

local miscSection = visualsTab:CreateSection("Misc")

--[[local thirdPerson = visualsTab:CreateToggle({
    Name = "Third Person View",
    CurrentValue = false,
    Flag = "Third Person View",
    Callback = function(Value)
        while task.wait() do
            if not Value then break end
            local thirdPersonPart
            
            if not character:FindFirstChild("ThirdPersonView") then
                thirdPersonPart = Instance.new("Part", character)
                thirdPersonPart.Name = "ThirdPersonView"
                thirdPersonPart.Size = Vector3.new(1, 1, 1)
                thirdPersonPart.Transparency = 1
                thirdPersonPart.Anchored = true
                thirdPersonPart.Position = character.HumanoidRootPart.Position * Vector3.new(5, 5, 5)
            else
                thirdPersonPart = character.ThirdPersonView
            end

            ws.Camera.CameraSubject = thirdPersonPart
        end
    end,
})--]]

local dayAndNight = visualsTab:CreateToggle({
    Name = "Toggle Day/Night",
    CurrentValue = false,
    Flag = "Toggle Day/Night",
    Callback = function(Value)
        if Value then
            game:GetService("Lighting").ClockTime = 20
        else
            game:GetService("Lighting").ClockTime = 16.5
        end
    end,
})

--[[local aimbot = combatTab:CreateToggle({
    Name = "Aimbot",
    CurrentValue = false,
    Flag = "Aimbot",
    Callback = function(Value)
        print("Toggled")
        local aimbotTween = nil

        game:GetService("UserInputService").InputBegan:Connect(function(input)
            print("InputBegan")
            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                print("Right Click")
                if Value then
                    print("Toggle On Check")
                    aimbotTween = game:GetService("TweenService"):Create(
                        ws.CurrentCamera,
                        TweenInfo.new(0, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
                        {CFrame = CFrame.new(
                            ws.CurrentCamera.CFrame.Position,
                            GetClosestPlayer().Character.HumanoidRootPart.Position
                        )}
                    )
                    print("Tween Created")

                    aimbotTween:Play()
                    print("Tween Played")
                end
            end
        end)

        game:GetService("UserInputService").InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                if Value then
                    if aimbotTween ~= nil then
                        tween:Stop()
                    end
                end
            end
        end)
    end,
})--]]

local silentAim = combatTab:CreateToggle({
    Name = "Silent Aim",
    CurrentValue = false,
    Flag = "Silent Aim",
    Callback = function(Value)
        if Value then
            for i, v in pairs(ws:GetChildren()) do
                if v.Name == "soldier_model" and not v:FindFirstChild("fpv_humanoid") then
                    v.HumanoidRootPart.Size = Vector3.new(silentAimSize / 20, silentAimSize / 20, silentAimSize / 20)
                end
            end
        end
    end,
})

local silentAimSizeSlider = combatTab:CreateSlider({
    Name = "Silent Aim Size",
    Range = {0, 500},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 50,
    Flag = "Silent Aim Size",
    Callback = function(Value)
        silentAimSize = Value
    end,
})

local fovEnabled = combatTab:CreateToggle({
    Name = "Fov Enabled",
    CurrentValue = false,
    Flag = "Fov Enabled",
    Callback = function(Value)
        if Drawing then
            if not drawingCreated then
                while task.wait() do
                    if Value then
                        if prevCircle ~= nil then
                            prevCircle:Remove()
                        end
    
                        prevCircle = Drawing.new("Circle")
                        prevCircle.Transparency = 1
                        prevCircle.Visible = true
                        prevCircle.Thickness = 2
                        prevCircle.Color = fovColor
                        prevCircle.NumSides = 20
                        prevCircle.Radius = silentAimSize
                        prevCircle.Filled = false
                        prevCircle.Position = Vector2.new(ws.CurrentCamera.ViewportSize.X / 2, ws.CurrentCamera.ViewportSize.Y / 2)
                    else
                        if prevCircle ~= nil then
                            prevCircle:Remove()
                        end
                    end
                end
            end
        else
            if rayfieldNotificationsEnabled then
                Rayfield:Notify({
                    Title = "Not using Synapse",
                    Content = "You must be using Synapse X.",
                    Duration = 6.5,
                    Image = 4483362458,
                    Actions = {
                       Accept = {
                          Name = "Okay!",
                          Callback = function() return end
                        },
                    },
                })
            end
        end
    end,
})

local fovColorpicker = combatTab:CreateColorPicker({
    Name = "FOV Color Picker",
    Color = Color3.fromRGB(0, 255, 0),
    Flag = "FOV Color Picker",
    Callback = function(Value)
        fovColor = Value
    end,
})

local hitboxSection = combatTab:CreateSection("Hitbox")

local hitboxExpander = combatTab:CreateToggle({
    Name = "Hitbox Expander",
    CurrentValue = false,
    Flag = "Hitbox Expander",
    Callback = function(Value)
        while task.wait() do
            if not Value then break end

            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:IsA("BasePart") and v.Color == Color3.new(1,0,0) then
                    v.Transparency = hitboxTransparency
                    v.Size = hitboxSize
                end
            end
        end
    end,
})

local hitboxSizeSlider = combatTab:CreateSlider({
    Name = "Hitbox Size",
    Range = {0, 20},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = 10,
    Flag = "Hitbox Size",
    Callback = function(Value)
        hitboxSize = Value
    end
})

local hitboxTransparencySlider = combatTab:CreateSlider({
    Name = "Hitbox Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "Transparency",
    CurrentValue = 0.5,
    Flag = "Hitbox Transparency",
    Callback = function(Value)
        hitboxTransparency = Value
    end
})

miscTab:CreateToggle({
    Name = "ServerHop on Mod Join",
    CurrentValue = false,
    Flag = "ServerHop on Mod Join",
    Callback = function(Value)
        game:GetService("Players").PlayerAdded:Connect(function(newPlayer)
            if table.find(mods, newPlayer.Name) ~= nil then
                if Value then
                    serverHop(player)
                end
            end
        end)
    end,
})

miscTab:CreateButton({
    Name = "ServerHop",
    Callback = function(Value)
        if rayfieldNotificationsEnabled then
            Rayfield:Notify({
                Title = "Confirm",
                Content = "Are you sure you want to serverhop?",
                Duration = 100000000,
                Image = nil,
                Actions = {
                    ServerHop = {
                        Name = "Confirm",
                        Callback = function()
                            serverHop(player)
                        end
                    },

                    Cancel = {
                        Name = "Cancel",
                        Callback = function() return end
                    }
                }
            })
        else
            serverHop(player)
        end
    end,
})

miscTab:CreateButton({
    Name = "Rejoin",
    Callback = function(Value)
        if rayfieldNotificationsEnabled then
            Rayfield:Notify({
                Title = "Confirm",
                Content = "Are you sure you want to rejoin?",
                Duration = 100000000,
                Image = nil,
                Actions = {
                    ServerHop = {
                        Name = "Confirm",
                        Callback = function()
                            game:GetService("TeleportService"):Teleport(game.PlaceId, player)
                        end
                    },

                    Cancel = {
                        Name = "Cancel",
                        Callback = function() return end
                    }
                }
            })
        else
            game:GetService("TeleportService"):Teleport(game.PlaceId, player)
        end
    end,
})

--[[local chatSpamSection = miscTab:CreateSection("Chat Spam", nil)

local chatSpam = miscTab:CreateToggle({
    Name = "Chat Spam",
    CurrentValue = false,
    Flag = "Chat Spam",
    Callback = function(Value)
    end,
})-]]

local miscSection = miscTab:CreateSection("Misc")

local removeMapBoundaries = miscTab:CreateButton({
    Name = "Remove Map Boundaries",
    Callback = function()
        ws.workspace.boundary:Destroy()
    end,
})

local toggleNotifications = settingsTab:CreateToggle({
    Name = "Toggle Notifications",
    CurrentValue = true,
    Flag = "Toggle Notifications",
    Callback = function(Value)
        rayfieldNotificationsEnabled = Value
    end,
})

local credits = settingsTab:CreateParagraph({
    Title = "Credits",
    Content = "Scripting: !Bop#8929"
})

local copyDiscordLink = settingsTab:CreateButton({
    Name = "Copy Discord Link",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/sirius")
        else
            if rayfieldNotificationsEnabled then
                Rayfield:Notify({
                    Title = "Using bad executor",
                    Content = "You must be using a better executor (such as synapse or krnl) to copy discord link (discord.gg/sirius)",
                    Duration = 6.5,
                    Image = 4483362458,
                    Actions = {
                       Accept = {
                          Name = "Okay!",
                          Callback = function() return end
                        },
                    },
                 })
            end
        end
    end,
})

local FPS = statsTab:CreateLabel("FPS: "..ws:GetRealPhysicsFPS())

local start = tick()
game:GetService("ReplicatedStorage").frontlines_assets.r15_rig.RemoteEvent:FireServer()
local Ping = statsTab:CreateLabel("Ping: "..(math.floor(((tick() - start) + 1) * 1000000)) - 1000000)

local sessionSection = statsTab:CreateSection("Session")

local sessionTimeLabel = statsTab:CreateLabel("Session Time With Sirius: "..math.floor(sessionTime).."s")

while wait(0.1) do
    FPS:Set("FPS: "..ws:GetRealPhysicsFPS())

    local start = tick()
    game:GetService("ReplicatedStorage").frontlines_assets.r15_rig.RemoteEvent:FireServer()
    Ping:Set("Ping: "..(math.floor(((tick() - start) + 1) * 1000000)) - 1000000)
    sessionTimeLabel:Set("Session Time With Sirius: "..math.floor(sessionTime).."s")
    sessionTime +=  0.1 -- Synapse says there is an error here, but it is wrong
end
