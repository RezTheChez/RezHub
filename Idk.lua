local Xray = RenderTab:CreateToggle({
    Name = "Xray",
    CurrentValue = false,
    Flag = "Xray",
    Callback = function(Value)
          for i, v in pairs(game:GetService("Workspace").Map:GetChildren()) do
              if Value then
                  v.Transparency = 0
              else
                  v.Transparency = 0.8
              end
          end
    end,
})

local CoinESP = RenderTab:CreateToggle({
    Name = "Coin ESP",
    CurrentValue = false,
    Flag = "CoinESP",
    Callback = function(Value)
        for i, v in pairs(game:GetService("Workspace").Map.Coins:GetChildren()) do
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
                ESP.InnerColor = Color3.fromRGB(0, 255, 0)
                ESP.OutlineTransparency = 0
                ESP.OutlineColor = Color.fromRGB(255, 255, 255)
            end
        end
    end
})
