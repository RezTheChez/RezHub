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
       Enabled = true,
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

function clearAllChams(ws)
   for i, v in pairs(ws:GetChildren()) do
       if v.Name == "soldier_model" then
           if v:FindFirstChild("Highlight") then
               v.Highlight:Destroy()
           end
       end
   end
end

-- Chams
local chamsEnemyColor = Color3.fromRGB(255, 0, 0)
local chamsTeamColor = Color3.fromRGB(0, 0, 255)
local chamsFillTransparency = 0.5
local chamsOutlineTransparency = 0

-- Hitbox Extender
local hitboxSize = Vector3.new(10, 10, 10)
local hitboxTransparency = 0.5

local playerTab = Window:CreateTab("Player", 4483362458)
local movementSection = playerTab:CreateSection("Movement")

local visualsTab = Window:CreateTab("Visuals", 4483362458)
local chamsSection = visualsTab:CreateSection("Chams")

local combatTab = Window:CreateTab("Combat", 4483362458)
local hitboxSection = combatTab:CreateSection("Hitbox")

local player = game:GetService("Players").LocalPlayer
local character = player.Character

local walkSpeed = playerTab:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 100},
    Increment = 1,
    Suffix = "WalkSpeed",
    CurrentValue = 16,
    Flag = "Walk Speed",
    Callback = function(Value)
        while task.wait() do
            if character:FindFirstChild("fpv_humanoid") then
                character.fpv_humanoid.WalkSpeed = Value
            end
        end
    end,
})

-- Working on Inf Jump

--[[local infJump = playerTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Flag = "Infinite Jump",
    Callback = function(Value)
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if not Value then return end

            if character:FindFirstChild("fpv_humanoid") then
                character.fpv_humanoid:ChangeState("Jumping")
            end
        end)
    end,
})--]]

local noClip = playerTab:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        while task.wait() do
            if not Value then break end
            
            for i, v in pairs(ws.soldier_mode:GetDescendants()) do
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
            if not Value then break end

            if character:FindFirstChild("fpv_humanoid") then
                if character.fpv_humanoid.FloorMaterial ~= "Air" then
                    character.fpv_humanoid.Jump = true
                end
            end
        end
    end,
})

local chams = visualsTab:CreateToggle({
    Name = "Chams",
    CurrentValue = false,
    Flag = "Chams",
    Callback = function(Value)
        while task.wait() do
            clearAllChams(ws)
            if not Value then break end
            
            for i, v in pairs(ws:GetChildren()) do
                if v.Name == "soldier_model" then
                    addCham(chamsEnemyColor, chamsFillTransparency, chamsBorderTransparency, v)
                end
            end
        end
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
    Color = Color3.fromRGB(0, 0, 0),
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
