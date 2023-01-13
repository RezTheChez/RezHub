local vu = game:GetService("Virtual User")

while wait(600) do -- every 5 minutes
  vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame) -- Mouse Down
  wait(1)
  vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame) -- Mouse Up
end
