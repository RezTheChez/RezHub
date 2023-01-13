local Main = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer)
local notification = Instance.new("Frame")
local top = Instance.new("Frame")
local close = Instance.new("TextButton")
local rayfield = Instance.new("TextButton")
local kavo = Instance.new("TextButton")
local discord = Instance.new("TextButton")
local text = Instance.new("TextLabel")
local title = Instance.new("TextLabel")

local closeC = 150
local closeH = false
local rayfieldC = 150
local rayfieldH = false

Main.Name = "Main"
Main.Enabled = true
Main.IgnoreGuiInset = true

-- Main Frame
notification.Name = "notification"
notification.Parent = Popups
notification.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
notification.BorderSizePixel = 0
notification.Size = UDim2.new(0, 400, 0, 200)

-- Topbar
top.Name = "top"
top.Parent = notification
top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
top.BorderSizePixel = 0
top.Size = UDim2.new(1, 0, 0, 20)

-- Close Button
close.Name = "close"
close.Parent = notification
close.BackgroundColor3 = Color3.fromRGB(136, 136, 136)
close.BackgroundTransparency = 1.000
close.Position = UDim2.new(0.920000017, 0, 0.0399999991, 0)
close.Size = UDim2.new(0, 15, 0, 15)
close.ZIndex = 2
close.Font = Enum.Font.Ubuntu
close.Text = "X"
close.TextColor3 = Color3.fromRGB(204, 204, 204)
close.TextScaled = true
close.TextSize = 14.000
close.TextWrapped = true

-- "Choose UI"
text.Name = "text"
text.Parent = notification
text.BackgroundColor3 = Color3.fromRGB(34, 87, 168)
text.BackgroundTransparency = 1.000
text.BorderColor3 = Color3.fromRGB(27, 42, 53)
text.BorderSizePixel = 0
text.Position = UDim2.new(0, 0, 0, 20)
text.Size = UDim2.new(0, 400, 0, 60)
text.ZIndex = 2
text.Font = Enum.Font.Ubuntu
text.Text = "Choose Script UI"

-- Rayfield Button

rayfield.Name = "text"
rayfield.Parent = notification
rayfield.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
rayfield.BorderSizePixel = 0
rayfield.Position = UDim2.new(0.2, 0, 0, 100)
rayfield.Size = UDim2.new(0.2, 0, 0, 60)
rayfield.ZIndex = 2
rayfield.Font = Enum.Font.Ubuntu
rayfield.Text = "Rayfield"


kavo.Name = "Kavo"
kavo.Parent = notification
kavo.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
kavo.BorderSizePixel = 0
kavo.Position = UDim2.new(0.5, 0, 0, 100)
kavo.Size = UDim2.new(0.2, 0, 0, 60)
kavo.ZIndex = 2
kavo.Font = Enum.Font.Ubuntu
kavo.Text = "Kavo"

rayfield.MouseEnter:Connect(function()
    rayfieldH = true
    if rayfieldC < 255 then
      repeat 
        wait(0.02)
        rayfieldC += 5
        rayfield.TextColor3 = Color3.fromRGB(rayfieldC, rayfieldC, rayfieldC)
      until rayfieldC == 255 or rayfieldH == false
    end
end)

rayfield.MouseLeave:Connect(function()
    rayfieldH = false
    if rayfieldC > 150 then
      repeat 
        wait(0.02)
        rayfieldC -= 5
        rayfield.TextColor3 = Color3.fromRGB(rayfieldC, rayfieldC, rayfieldC)
      until rayfieldC == 150 or rayfieldH == true
    end
end)

close.MouseEnter:Connect(function()
    closeH = true
    if closeC < 255 then
      repeat 
        wait(0.02)
        closeC += 5
        close.TextColor3 = Color3.fromRGB(closeC, closeC, closeC)
      until closeC == 255 or closeH == false
    end
end)

close.MouseLeave:Connect(function()
    closeH = false
    if closeC > 150 then
      repeat 
        wait(0.02)
        closeC -= 5
        close.TextColor3 = Color3.fromRGB(closeC, closeC, closeC)
      until closeC == 150 or closeH == true
    end
end)



close.MouseButton1Click:Connect(function()
    Main:Destroy()
end)
