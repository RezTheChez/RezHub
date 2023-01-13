local Main = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer)
local notification = Instance.new("Frame")
local top = Instance.new("Frame")
local close = Instance.new("TextButton")
local rayfield = Instance.new("TextButton")
local kavo = Instance.new("TextButton")
local discord = Instance.new("TextButton")
local text = Instance.new("TextLabel")
local title = Instance.new("TextLabel")
local rc = Instance.new("UICorner")
local kc = Instance.new("UICorner")
local dc = Instance.new("UICorner")

local closeC = 150
local closeH = false
local rayfieldC = 150
local rayfieldH = false
local kavoC = 150
local kavoH = false
local discordC = 150
local discordH = false

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
rayfield.Position = UDim2.new(0.1, 0, 0, 100)
rayfield.Size = UDim2.new(0.2, 0, 0, 60)
rayfield.TextScaled = true
rayfield.ZIndex = 2
rayfield.Font = Enum.Font.Ubuntu
rayfield.TextColor3 = Color3.fromRGB(150, 150, 150)
rayfield.Text = "Rayfield UI"

-- Kavo Button

kavo.Name = "Kavo"
kavo.Parent = notification
kavo.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
kavo.BorderSizePixel = 0
kavo.Position = UDim2.new(0.4, 0, 0, 100)
kavo.Size = UDim2.new(0.2, 0, 0, 60)
kavo.TextScaled = true
kavo.ZIndex = 2
kavo.Font = Enum.Font.Ubuntu
kavo.TextColor3 = Color3.fromRGB(150, 150, 150)
kavo.Text = "Kavo UI"

-- Discord Button

discord.Name = "Discord"
discord.Parent = notification
discord.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
discord.BorderSizePixel = 0
discord.Position = UDim2.new(0.7, 0, 0, 100)
discord.Size = UDim2.new(0.2, 0, 0, 60)
discord.TextScaled = true
discord.ZIndex = 2
discord.Font = Enum.Font.Ubuntu
discord.TextColor3 = Color3.fromRGB(150, 150, 150)
discord.Text = "Discord UI"

-- Rayfield Corner

rc.Name = "UICorner"
rc.CornerRadius = Udim2.new(3)
rc.Parent = rayfield

kc.Name = "UICorner"
kc.CornerRadius = Udim2.new(3)
kc.Parent = kavo

dc.Name = "UICorner"
dc.CornerRadius = Udim2.new(3)
dc.Parent = discord


discord.MouseEnter:Connect(function()
    discordH = true
    if discordC < 255 then
      repeat 
        wait(0.02)
        discordC += 5
        discord.TextColor3 = Color3.fromRGB(discordC, discordC, discordC)
      until discordC == 255 or discordH == false
    end
end)

discord.MouseLeave:Connect(function()
    discordH = false
    if discordC > 150 then
      repeat 
        wait(0.02)
        discordC -= 5
        discord.TextColor3 = Color3.fromRGB(discordC, discordC, discordC)
      until discordC == 150 or discordH == true
    end
end)

kavo.MouseEnter:Connect(function()
    discordH = true
    if discordC < 255 then
      repeat 
        wait(0.02)
        discordC += 5
        discord.TextColor3 = Color3.fromRGB(discordC, discordC, discordC)
      until discordC == 255 or discordH == false
    end
end)

kavo.MouseLeave:Connect(function()
    kavoH = false
    if kavoC > 150 then
      repeat 
        wait(0.02)
        kavoC -= 5
        kavo.TextColor3 = Color3.fromRGB(kavoC, kavoC, kavoC)
      until kavoC == 150 or kavoH == true
    end
end)

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

rayfield.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RezTheChez/RezHub/main/scripts/UniversalHubRayfield.lua"))
        Main:Destroy()
end)

kavo.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RezTheChez/RezHub/main/scripts/UniversalHubKavo.lua"))
        Main:Destroy()
end)

discord.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/RezTheChez/RezHub/main/scripts/UniversalHubDiscord.lua"))
        Main:Destroy()
end)
