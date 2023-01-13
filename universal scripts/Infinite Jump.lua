game:GetService("UserInputService").JumpRequest:Connect(function()
  game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
end)
