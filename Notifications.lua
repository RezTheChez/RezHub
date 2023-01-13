local module = {}
local NotifyTemplate = script:WaitForChild("newNotify")	

function module:NotifyPlayer(player, text)
	local PlayerGui = player:WaitForChild("PlayerGui")
	local NotificationsGui = PlayerGui.Main:WaitForChild("Popups")
	
	local newNotify = Instance.new("TextLabel")
	newNotify.Name = "newNotify"
	newNotify.Parent = game.ReplicatedStorage
	newNotify.BackgroundColor3 = Color3.fromRGB(34, 87, 168)
	newNotify.BorderColor3 = Color3.fromRGB(27, 42, 53)
	newNotify.BorderSizePixel = 0
	newNotify.Position = UDim2.new(-0.903124988, 0, 0.931617498, 0)
	newNotify.Size = UDim2.new(0, 100, 0, 15)
	newNotify.Font = Enum.Font.Highway
	newNotify.Text = "Test Notification!"
	newNotify.TextColor3 = Color3.fromRGB(234, 247, 255)
	newNotify.TextScaled = true
	newNotify.TextSize = 32.000
	newNotify.TextWrapped = true
	newNotify.Text = text
	newNotify.Parent = NotificationsGui
	newNotify.BackgroundColor3 = Color3.fromRGB(34, 87, 168)
	
	newNotify:TweenSize(UDim2.new(0, 380,0, 28), Enum.EasingDirection.Out, Enum.EasingStyle.Back,0.15)
	coroutine.wrap(function()
		wait(3)
		for t = 0,1,0.1 do
			newNotify.BackgroundTransparency = t
			newNotify.TextTransparency = t
			wait()
		end
		wait(0.05)
		newNotify:Destroy()
	end)()
end

return module
