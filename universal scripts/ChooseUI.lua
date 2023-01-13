local Main = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer)
Main.Name = "Main"
Main.Enabled = true
Main.IgnoreGuiInset = true

local MainFrame = Instance.new("Frame", Main)
MainFrame.Name = "Main"
MainFrame.AnchorPoint = (0.5, 0.5)
MainFrame.Size = UDim2.new(0, 30, 0, 100)
MainFrame.Position = UDim2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
