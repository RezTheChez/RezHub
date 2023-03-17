repeat wait() until game:GetService("Workspace"):FindFirstChild("soldier_model")

for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
    if v.Name == "soldier_model" then
        if v:FindFirstChild("fpv_rig") then
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

-- Chams
local chamsEnemyColor = Color3.fromRGB(255, 0, 0)
local chamsTeamColor = Color3.fromRGB(0, 0, 255)
local chamsFillTransparency = 0.5
local chamsOutlineTransparency = 0

-- Hitbox Extender
local hitboxSize = Vector3.new(10, 10, 10)
local hitboxTransparency = 0.5

-- Normal Variables
local ws = game:GetService("Workspace")

local playerTab = Window:CreateTab("Player", 4483362458)
local movementSection = playerTab:CreateSection("Movement")

local visualsTab = Window:CreateTab("Visuals", 4483362458)
local chamsSection = visualsTab:CreateSection("Chams")

local combatTab = Window:CreateTab("Combat", 4483362458)
local aimbotSection = combatTab:CreateSection("Aimbot")

local miscTab = Window:CreateTab("Misc", 4483362458)
local chatSection = miscTab:CreateSection("Chat Spam")

local player = game:GetService("Players").LocalPlayer
local character = player.Character

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

local noClip = playerTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        while task.wait() do
            if not Value then break end
           
            for i, v in pairs(character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
      		end
    	end
    end
})


local bHop = playerTab:CreateToggle({
    Name = "BHop",
    CurrentValue = false,
    Flag = "BHop",
    Callback = function(Value)
        while task.wait() do
            if not Value then return end

            if character:FindFirstChild("fpv_humanoid") then
                if character.fpv_humanoid.FloorMaterial ~= "Air" then
                    character.fpv_humanoid:ChangeState("Jumping")
                end
            end
        end
    end,
})

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

                            if v:FindFirstChild("friendly_marker") and v.friendly_marker.name_label.TextColor3 == Color3.new(67, 140, 229) then
                                addCham(chamsTeamColor, chamsFillTransparency, chamsBorderTransparency, v)
                            else
                                addCham(chamsEnemyColor, chamsFillTransparency, chamsBorderTransparency, v)
                            end

                        end
					end
				end
			end else clearAllChams() end
    end,
})

local chamsEnemyColor = visualsTab:CreateColorPicker({
    Name = "Chams Enemy Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "Enemy Color",
    Callback = function(Value)
        chamsEnemyColor = Value
    end,
})

local chamsTeamColor = visualsTab:CreateColorPicker({
    Name = "Chams Team Color",
    Color = Color3.fromRGB(0, 0, 255),
    Flag = "Chams Team Color",
    Callback = function(Value)
        chamsTeamColor = Value
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

local espSection = visualsTab:CreateSection("ESP")

local enemyNames = visualsTab:CreateToggle({
    Name = "Enemy Names",
    CurrentValue = false,
    Flag = "Enemy Names",
    Callback = function(Value)
        if Value then
            local friendlyMarkerClone

            for i, v in pairs(ws:GetChildren()) do
                if v.Name == "soldier_model" then
                    if v:FindFirstChild("friendly_marker") then
                        friendlyMarkerClone = v.friendly_marker:Clone()
                        return
                    end
                end
            end

            for i, v in pairs(ws:GetChildren()) do
                if v.Name == "soldier_model" then
                    if not v:FindFirstChild("friendly_marker") then
                        friendlyMarkerClone.Parent = v
                        friendly_marker.name_label.TextColor3 = Color3.fromRGB(192, 48, 55)
                        friendly_marker.name_label.Text = "Bozo123"
                    end
                end
            end
        else
            for i, v in pairs(ws:GetChildren()) do
                if v.Name == "soldier_model" then
                    if v:FindFirstChild("friendly_marker") then
                        if v.friendly_marker.name_label.TextColor3 == Color3.fromRGB(192, 48, 55) then
                            v.friendly_marker:Destroy()
                        end
                    end
                end
            end
        end
    end
})

local miscSection = visualsTab:CreateSection("Misc")

local thirdPerson = visualsTab:CreateToggle({
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
})

local aimbot = combatTab:CreateToggle({
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
        hitboxSize = Vector3.new(Value, Value, Value)
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

local chatSpam = miscTab:CreateToggle({
    Name = "Chat Spam",
    CurrentValue = false,
    Flag = "Chat Spam",
})

-- Make sure to edit the values below in a seperated script
_G.priorityPart = "HumanoidRootPart"
_G.reactionDelay = 0 -- the lower the faster
_G.sameTeam = true
_G.toggleKey = "X" -- bind it to a familiar key, you will be using this alot
_G.esp = true -- For esp
_G.espColour = Color3.new(0,255,0)
_G.throughwalls = false -- track through walls
--
_G.triggerbot = true
_G.triggerBotDelay = 0
-- edit values below to change tracking area's size
_G.offsetSizeX = 0
_G.offsetSizeY = 0
_G.scaleSizeX = 0.7
_G.scaleSizeY = 0.7
--edit values below to change tracking area's position
_G.offsetPosX = 0
_G.offsetPosY = 0
_G.scalePosX = 0.5
_G.scalePosY = 0.5

_G.trackingColour = Color3.new(0,255,0)
_G.trackingThickness = 1
---------------

local camera = game.Workspace.CurrentCamera
local lp = game.Players.LocalPlayer
local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local raycastParams = RaycastParams.new()


raycastParams.FilterType = Enum.RaycastFilterType.Blacklist


function drawDot(frame, lifetime, x, y, colour)
  local screengui = Instance.new("ScreenGui")
  local frame = Instance.new("Frame")
  frame.Position = UDim2.new(0,x,0,y)
  frame.Size = UDim2.new(0,10,0,10)
  frame.Parent = screengui
  frame.BackgroundColor3 = colour
  screengui.Parent = lp.PlayerGui
  task.wait(lifetime)
  screengui:Destroy()
end

function PointMatch(frame, x, y)
  local pos = frame.AbsolutePosition
  local size = frame.AbsoluteSize
  if (y > pos.Y and y < pos.Y+size.Y) and (x > pos.X and x < pos.X+size.X) then
      return true
  end
  return false
end


local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ScreenGui2 = Instance.new("ScreenGui")
local Frame2 = Instance.new("Frame")

local UIStroke = Instance.new("UIStroke")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ScreenGui2.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui2.ResetOnSpawn = false
ScreenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BackgroundTransparency = 1.000
Frame.Size = UDim2.new(_G.scaleSizeX, _G.offsetSizeX, _G.scaleSizeY, _G.offsetSizeY)
Frame.Position = UDim2.new(0.5,0,0.5,0)
Frame.AnchorPoint = Vector2.new(0.5,0.5)

Frame2.Parent = ScreenGui2
Frame2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame2.BackgroundTransparency = 1.000
Frame2.Size = UDim2.new(1, 0, 1, 0)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000
TextLabel.TextTransparency = 1.000

UIStroke.Color = _G.trackingColour
UIStroke.Thickness = _G.trackingThickness
UIStroke.Parent = Frame
local val = 0.03333
local isOn = false

uis.InputBegan:Connect(function(input, gameproc)
if input.KeyCode == Enum.KeyCode[_G.toggleKey] and not gameproc then
isOn = not isOn
TextLabel.TextTransparency = 0
TextLabel.Text = tostring(isOn)
task.wait(3)
TextLabel.TextTransparency = 1
end
end)

function characterShootable(model)
   raycastParams.FilterDescendantsInstances = {lp.Character}
   local ray = workspace:Raycast(camera.CFrame.Position, (model[_G.priorityPart].Position-camera.CFrame.Position), raycastParams)
   return model == ray.Instance:FindFirstAncestorWhichIsA("Model")
end

rs.RenderStepped:Connect(function(t)
   if (Frame.Size.X.Offset ~= _G.offsetSizeX or Frame.Size.Y.Offset ~= _G.offsetSizeY) or (Frame.Size.X.Scale ~= _G.scaleSizeX or Frame.Size.Y.Scale ~= _G.scaleSizeY)  then
       Frame.Size = UDim2.new(_G.scaleSizeX, _G.offsetSizeX, _G.scaleSizeY, _G.offsetSizeY)
   end
   if (Frame.Position.X.Offset ~= _G.offsetPosX or Frame.Position.Y.Offset ~= _G.offsetPosY) or (Frame.Position.X.Scale ~= _G.scalePosX or Frame.Position.Y.Scale ~= _G.scalePosY)  then
       Frame.Position = UDim2.new(_G.scalePosX, _G.offsetPosX, _G.scalePosY, _G.offsetPosY)
   end
   if (UIStroke.Color ~= _G.trackingColour or UIStroke.Thickness ~= _G.trackingThickness) then
       UIStroke.Color = _G.trackingColour
       UIStroke.Thickness = _G.trackingThickness
   end
   for _, p in ipairs(game.Players:GetChildren()) do
       if p ~= lp and ((_G.sameTeam and p.Team == lp.Team) or (not _G.sameTeam and p.Team ~= lp.Team))  then
           local model = p.Character
           if model and model:FindFirstChild("Humanoid") and not model:FindFirstChild("ForceField") and model.Humanoid.Health > 0 then
               local vector, onscreen = camera:WorldToScreenPoint(model[_G.priorityPart].Position)
               if isOn and onscreen and PointMatch(Frame, vector.X, vector.Y) then
                   if _G.throughwalls or characterShootable(model)  then
                       if _G.esp then
                           drawDot(Frame, t, vector.X, vector.Y, Color3.new(255,0,0))
                       end
                       if _G.triggerbot then
                           task.wait(_G.triggerBotDelay)
                           mouse1click()
                       end
                       for i = 0.0, 0.9, 0.1 do
                           if not isOn then

                               break
                           end
                             
                           local larp = camera.CFrame:Lerp(CFrame.lookAt(camera.CFrame.Position, model[_G.priorityPart].Position), i)
                           camera.CFrame = larp
                           local quickvec = camera:WorldToScreenPoint(model[_G.priorityPart].Position)
                           if not PointMatch(Frame, quickvec.X, quickvec.Y) or not characterShootable(model) then
                               break
                           end
                           task.wait(val+(_G.reactionDelay < 0 and 0 or _G.reactionDelay))
                       end
                       
                   end
               elseif onscreen and PointMatch(Frame2, vector.X, vector.Y) and _G.esp then
                   drawDot(Frame2, t, vector.X, vector.Y, _G.espColour)
               end
           end
      end
     
  end
end)
