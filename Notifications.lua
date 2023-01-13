-- Gui to Lua
-- Version: 3.2

-- Instances:

local Main = Instance.new("ScreenGui")
local Popups = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")

--Properties:

Main.Name = "Main"
Main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

Popups.Name = "Popups"
Popups.Parent = Main
Popups.AnchorPoint = Vector2.new(1, 1)
Popups.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Popups.BackgroundTransparency = 1.000
Popups.Position = UDim2.new(0.98989898, 0, 0.991729081, 0)
Popups.Size = UDim2.new(0, 320, 0, 567)

UIListLayout.Parent = Popups
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
UIListLayout.Padding = UDim.new(0, 10)

function notify(name, textColor)
	local notification = Instance.new("TextLabel")
	local text = Instance.new("TextLabel")
	local TextButton = Instance.new("TextButton")

	notification.Name = "notification"
	notification.Parent = Popups
	notification.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	notification.BorderSizePixel = 0
	notification.Size = UDim2.new(0, 250, 0, 75)
	notification.Font = Enum.Font.SourceSans
	notification.Text = ""
	notification.TextColor3 = Color3.fromRGB(0, 0, 0)
	notification.TextSize = 14.000

	text.Name = "text"
	text.Parent = notification
	text.BackgroundColor3 = Color3.fromRGB(34, 87, 168)
	text.BackgroundTransparency = 1.000
	text.BorderColor3 = Color3.fromRGB(27, 42, 53)
	text.BorderSizePixel = 0
	text.Size = UDim2.new(0, 250, 0, 75)
	text.ZIndex = 2
	text.Font = Enum.Font.Ubuntu
	text.Text = name
	text.TextColor3 = textColor
	text.TextSize = 30.000
	text.TextWrapped = true

	TextButton.Parent = notification
	TextButton.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
	TextButton.BackgroundTransparency = 1.000
	TextButton.Position = UDim2.new(0.889999986, 0, 0.0500000007, 0)
	TextButton.Size = UDim2.new(0, 25, 0, 25)
	TextButton.Font = Enum.Font.Ubuntu
	TextButton.Text = "X"
	TextButton.TextColor3 = Color3.fromRGB(204, 204, 204)
	TextButton.TextScaled = true
	TextButton.TextSize = 14.000
	TextButton.TextWrapped = true

	TextButton.MouseButton1Click:Connect(function()
		notification:Destroy()
	end)
end
