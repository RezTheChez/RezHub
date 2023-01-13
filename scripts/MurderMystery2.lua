-- Initiating

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

local Window = Rayfield:CreateWindow({
   Name = "Murder Mystery 2",
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "MM2"
   },
   Discord = {
      Enabled = false,
      Invite = "sirius",
      RememberJoins = true
   KeySystem = false
   }
})

-- Variables

local player = game:GetService'Players'.LocalPlayer
local character = game:GetService("Workspace"):WaitForChild(player.Name)
local UIS = game:GetService'UserInputService'
local lighting = game:GetService("Lighting")
local cam = game:GetService("Workspace").Camera
local Mouse = player:GetMouse()

-- Variables for modules

local flying = false
local speedget = 1
local speedfly = 1
local T = character.HumanoidRootPart
local CONTROL = {F = 0, B = 0, L = 0, R = 0}
local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
local SPEED = speedget
local TPPlayer = nil

game:GetService("Players").LocalPlayer.Character.Humanoid.Died:Connect(function() -- Fixing the "player" and "character" variable breaking on death
  wait(4)
  player = game:GetService("Players").LocalPlayer
  character = player.Character
end)

-- Tabs
local MovementTab = Window:NewTab("Movement", nil)
local RenderTab = Window:NewTab("Render", nil)
local MurdererTab = Window:NewTab("Murderer", nil)
local TeleportTab = Window:NewTab("Teleport", nil)

local SpeedSlider = MovementTab:CreateSlider({
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

local JumpSlider = MovementTab:CreateSlider({
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

local FOVSlider = MovementTab:CreateSlider({
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

local Fly = MovementTab:CreateButton({
  Name = "Fly",
  Callback = function() -- Here we go
    flying = false
    speedget = 1
    speedfly = 1

    if flying == false then
      local T = character.HumanoidRootPart
      local CONTROL = {F = 0, B = 0, L = 0, R = 0}
      local lCONTROL = {F = 0, B = 0, L = 0, R = 0}
      local SPEED = speedget

      local function fly() -- Fly function to call later
        flying = true
        local BG = Instance.new('BodyGyro', T) -- Creating parts needed to fly
        local BV = Instance.new('BodyVelocity', T)
        BG.P = 9e4 -- Customizing those parts
        BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        BG.cframe = T.CFrame
        BV.velocity = Vector3.new(0, 0.1, 0)
        BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
        spawn(function() -- Actually Flying around and moving
          repeat wait()
          character.Humanoid.PlatformStand = true -- Neccasarry in order to fly, my spelling sucks because im dyslexic
          if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 then -- Turn speed up if going in a direction
          SPEED = 50
        elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0) and SPEED ~= 0 then -- If not going in direction
          SPEED = 0
        end
        if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 then
          BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
          lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
        elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and SPEED ~= 0 then
          BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
        else
          BV.velocity = Vector3.new(0, 0.1, 0)
        end
                
        BG.cframe = workspace.CurrentCamera.CoordinateFrame
        until not flying
        CONTROL = {F = 0, B = 0, L = 0, R = 0}
        lCONTROL = {F = 0, B = 0, L = 0, R = 0}
        SPEED = 0
        BG:destroy()
        BV:destroy()
        character.Humanoid.PlatformStand = false
      end)
    end
    Mouse.KeyDown:connect(function(KEY) -- When user presses key
      if KEY:lower() == 'w' then -- If going forward
        CONTROL.F = speedfly
      elseif KEY:lower() == 's' then -- If going Back
        CONTROL.B = -speedfly
      elseif KEY:lower() == 'a' then -- If going Left
        CONTROL.L = -speedfly
      elseif KEY:lower() == 'd' then -- If going Right
        CONTROL.R = speedfly
      end
    end)
    Mouse.KeyUp:connect(function(KEY) -- When the user lets go
      if KEY:lower() == 'w' then
        CONTROL.F = 0
      elseif KEY:lower() == 's' then
        CONTROL.B = 0
      elseif KEY:lower() == 'a' then
        CONTROL.L = 0
      elseif KEY:lower() == 'd' then
        CONTROL.R = 0
      end
    end)
        
    fly() -- Start fly
  else -- If user is flying
    flying = false
    character.Humanoid.PlatformStand = false
    end
  end,
})

local InfJump = MovementTab:CreateButton({
Name = "Infinite Jump",
Callback = function()
    game:GetService("UserInputService").JumpRequest:connect(function() -- When the user touches space bar
      character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping") -- Jump No Matter What
    end)
end,
})

local NoClip = MovementTab:CreateToggle({
  Name = "NoClip",
  CurrentValue = false,
  Flag = "NoClip",
  Callback = function()
    -- adding
  end,
})

local TPLabel = TeleportTab:CreateInput({
  Name = "TP Player",
  PlaceholderText = "Player Name",
  RemoveTextAfterFocusLost = false,
  Callback = function(Input)
    TPPlayer = Input
  end,
})

local TP = TeleportTab:CreateButton({
  Name = "Teleport to player",
  Callback = function()
    character.HumanoidRootPart.CFrame = game.Players[TPPlayer].Character.HumanoidRootPart.CFrame
  end,
})


local LobbyTP = TeleportTab:CreateButton({
  Name = "Teleport to Lobby",
  Callback = function()
    character.HumanoidRootPart.CFrame = CFrame.new(-108.5, 145, 0.6)
  end,
})

local MapTP = TeleportTab:CreateButton({
  Name = "Teleport to Map",
  Callback = function()
      for i, v in pairs(game:GetService("workspace"):GetChildren()) do
          for i, child in pairs(v:GetChildren()) do
              if child.Name == "Spawns" then
               character.HumanoidRootPart.CFrame = child.Spawn.CFrame
              end
          end
      end
  end,
})

local MurdTP = TeleportTab:CreateButton({
  Name = "Teleport to Murderer",
  Callback = function()
    for i, v in pairs(Players:GetPlayers()) do
         for i, backpack in pairs(v:GetChildren()) do
             if backpack.Name == "Backpack" then
                 if backpack:FindFirstChild("Knife") ~= nil then
                    character.HumanoidRootPart.CFrame = game.Players[backpack:FindFirstChild("Knife").Parent.Parent.Name].Character.HumanoidRootPart.CFrame
                  end
                end
            end
        end
  end,
})


local SheriffTP = TeleportTab:CreateButton({
  Name = "Teleport to Sheriff",
  Callback = function()
    for i, v in pairs(Players:GetPlayers()) do
         for i, backpack in pairs(v:GetChildren()) do
             if backpack.Name == "Backpack" then
                 if backpack:FindFirstChild("Gun") ~= nil then
                    character.HumanoidRootPart.CFrame = game.Players[backpack:FindFirstChild("Gun").Parent.Parent.Name].Character.HumanoidRootPart.CFrame
                  end
                end
            end
        end
  end,
})

local GrabGun = MovementTab:CreateButton({
  Name = "Grab Gun",
  Callback = function()
    local currentX = character.HumanoidRootPart.CFrame.X
    local currentY = character.HumanoidRootPart.CFrame.Y
    local currentZ = character.HumanoidRootPart.CFrame.Z

    if workspace:FindFirstChild("GunDrop") ~= nil then

      character.HumanoidRootPart.CFrame = workspace:FindFirstChild("GunDrop").CFrame
       wait(.25)
      character.HumanoidRootPart.CFrame = CFrame.new(currentX, currentY, currentZ)

    else
      Rayfield:Notify({
      Title = "Sheriff Not Dead",
      Content = "Wait until the sherrif is dead of the gun is dropped to pick it up. Currently, a player has the gun",
      Duration = 5,
      Image = nil,
      Actions = { -- Notification Buttons
          Ignore = {
            Name = "Okay!",
          },
        },
      })
  end,
})

local MurdererESP = RenderTab:CreateToggle({
    Name = "Murderer ESP",
    CurrentValue = false,
    Flag = "MurdererESP",
    Callback = function(Value)
      for i, v in pairs(Players:GetPlayers()) do
         for i, backpack in pairs(v:GetChildren()) do
             if backpack.Name == "Backpack" then
                 if backpack:FindFirstChild("Knife") ~= nil then
                          if v.ESP ~= nil then
                              if Value then
                                  local ESP = v.ESP
                                  ESP.InnerTransparency = 0
                                  ESP.OuterTransparency = 0
                              else
                                  local ESP = v.ESP
                                  ESP.InnerTransparency = 1
                                  ESP.OuterTransparency = 1
                              end
                          else
                              local ESP = Instance.new("Highlight")
                              ESP.Parent = v
                              ESP.Name = "ESP"
                              ESP.InnerTransparency = 0
                              ESP.InnerColor = Color3.fromRGB(255, 0, 0)
                              ESP.OutlineTransparency = 0
                              ESP.OutlineColor = Color.fromRGB(255, 255, 255)
                           end
                      end
                end
            end
        end
    end,
})

local SheriffESP = RenderTab:CreateToggle({
    Name = "Sheriff ESP",
    CurrentValue = false,
    Flag = "SheriffESP",
    Callback = function(Value)
      for i, v in pairs(Players:GetPlayers()) do
         for i, backpack in pairs(v:GetChildren()) do
             if backpack.Name == "Backpack" then
                 if backpack:FindFirstChild("Gun") ~= nil then
                          if v.ESP ~= nil then
                              if Value then
                                  local ESP = v.ESP
                                  ESP.InnerTransparency = 0
                                  ESP.OuterTransparency = 0
                              else
                                  local ESP = v.ESP
                                  ESP.InnerTransparency = 1
                                  ESP.OuterTransparency = 1
                              end
                          else
                              local ESP = Instance.new("Highlight")
                              ESP.Parent = v
                              ESP.Name = "ESP"
                              ESP.InnerTransparency = 0
                              ESP.InnerColor = Color3.fromRGB(0, 0, 255)
                              ESP.OutlineTransparency = 0
                              ESP.OutlineColor = Color.fromRGB(255, 255, 255)
                           end
                      end
                end
            end
        end
    end,
})

local ShowNames = RenderTab:CreateToggle({
    Name = "Show Names",
    CurrentValue = false,
    Flag = "ShowNames",
    Callback = function(Value)
        if Value then
					game.StarterPlayer.NameDisplayDistance = 100
				else
					game.StarterPlayer.NameDisplayDistance = 0
				end
    end,
})

local KillAll = MurdererTab:CreateButton({
    Name = "Kill All",
    Callback = function()
      if game.Players.LocalPlayer.Backpack:FindFirstChild("Knife") ~= nil then9
 
    local Players = game:GetService("Players")
   for i, Victim in pairs(Players:GetPlayers()) do
       if Victim.Name ~= game.Players.LocalPlayer.Name then
 
           repeat wait()
               character.HumanoidRootPart.CFrame = Victim.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
           until
               Victim.Character.Humanoid.Health == 0
 
       end
   end
 
else
      Rayfield:Notify({
      Title = "You are not murderer",
      Content = "Make sure you are currenty the murderer",
      Duration = 5,
      Image = nil,
      Actions = { -- Notification Buttons
          Ignore = {
            Name = "Okay!",
          },
        },
      })
    end,
})
