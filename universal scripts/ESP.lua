local espColor = Color3.fromRGB(0, 255, 255)

for i, v in pairs(game:GetService("Players"):GetChildren) do
  if v ~= game:GetService("Players").LocalPlayer then
    if not v.Character:FindFirstChild("ESP") then
      local ESP = Instance.new("Highlight")
      ESP.Parent = v
      ESP.Name = "ESP"
      ESP.FillTransparency = 0
      ESP.FillColor = espColor
      ESP.OutlineTransparency = 0
      ESP.OutlineColor = espColor
    end
  end
end
