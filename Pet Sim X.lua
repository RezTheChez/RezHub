local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/Vape.txt"))()
local notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/RezTheChez/RezHub/main/Notifications.lua"))
local Window = Library:Window("Rez Hub | Pet Simulator X 🎄", Color3.fromRGB(66, 135, 245), Enum.KeyCode.RightControl)

local player = game:GetService("Players").LocalPlayer
local ws = game:GetService("Workspace")
local character = ws:WaitForChild(player.Name) -- Could also do player.Character
local UIS = game:GetService("UserInputService")
local lighting = game:GetService("Lighting")
local cam = ws.Camera
local mouse = player:GetMouse()
local vu = game:GetService("VirtualUser")
local presentEspColor = Color3.fromRGB(0, 0, 255)
local TeleportName = "ReztheChez"
local coins = 0
local diamond = 0
local fantasy = 0
local tech = 0 
local gingerbread = 0
local rainbow = 0
local presents = 0

-- Reset Player & Character Variables If Player Respawns
game:GetService("Players").LocalPlayer.Character.Humanoid.Died:Connect(function()
	wait(7)
	player = game:GetService("Players").LocalPlayer
	character = player.Character
end)

-- For ServerHop And __MAP Deletion
function serverHop()
    local Http = game:GetService("HttpService")
	local TPS = game:GetService("TeleportService")
	local Api = "https://games.roblox.com/v1/games/"
	local _place = game.PlaceId
	local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
	function ListServers(cursor)
		local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
		return Http:JSONDecode(Raw) 
	end
	local Server, Next;
	repeat
		local Servers = ListServers(Next)
		Server = Servers.data[1] Next = Servers.nextPageCursor
	until Server TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
end

-- For Visual Dupes

do
	-- Coins

	if player.PlayerGui.Main.Right:FindFirstChild("Coins") then
		local text = player.PlayerGui.Main.Right.Coins.Amount.Text
		text = string.gsub(text, ",", "")  -- remove commas
		coins = tonumber(text) * 2
	end

    -- Diamonds
	if player.PlayerGui.Main.Right:FindFirstChild("Diamonds") then
		local text = player.PlayerGui.Main.Right.Diamonds.Amount.Text
		text = string.gsub(text, ",", "")  -- remove commas
		diamond = tonumber(text) * 2
	end

    -- Fantasy
	if player.PlayerGui.Main.Right:FindFirstChild("Fantasy Coins") then
		local text = player.PlayerGui.Main.Right["Fantasy Coins"].Amount.Text
		text = string.gsub(text, ",", "")  -- remove commas
		fantasy = tonumber(text) * 2
	end

    -- Tech
    if player.PlayerGui.Main.Right:FindFirstChild("Tech Coins") then
		local text = player.PlayerGui.Main.Right["Tech Coins"].Amount.Text
		text = string.gsub(text, ",", "")  -- remove commas
		tech = tonumber(text) * 2
	end
	
	-- Gingerbread
	if player.PlayerGui.Main.Right:FindFirstChild("Gingerbread") then
		local text = player.PlayerGui.Main.Right.Gingerbread.Amount.Text
		text = string.gsub(text, ",", "")  -- remove commas
		gingerbread = tonumber(text) * 2
	end

	-- Rainbow
	if player.PlayerGui.Main.Right:FindFirstChild("Rainbow Coins") then
		local text = player.PlayerGui.Main.Right["Rainbow Coins"].Amount.Text
		text = string.gsub(text, ",", "")  -- remove commas
		rainbow = tonumber(text) * 2
	end
end

-- For Pet ESP
function generateRandomColor()
    local red = math.random(1, 255)
    local green = math.random(1, 255)
    local blue = math.random(1, 255)
    local color = Color3.fromRGB(red, green, blue)

    return color
end

-- For Visual Dupes
function comma_value(amount)
    local formatted = amount
    while true do  
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1,%2")

        if (k==0) then
            break
        end
    end

    return formatted
end

-- For Present Stuff

if ws.__MAP.Interactive:FindFirstChild("Presents") then
	for i, v in pairs(ws.__MAP.Interactive.Presents:GetChildren()) do
        presents += 1
    end
end

-- notifications

do
	local Main = Instance.new("ScreenGui")
	local Popups = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	--Properties:

	Main.Name = "Rez Notifications"
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
		local notification = Instance.new("Frame")
		local top = Instance.new("Frame")
		local close = Instance.new("TextButton")
		local text = Instance.new("TextLabel")
		local title = Instance.new("TextLabel")

		notification.Name = "notification"
		notification.Parent = Popups
		notification.BackgroundColor3 = Color3.fromRGB(36, 36, 36)
		notification.BorderSizePixel = 0
		notification.Size = UDim2.new(0, 250, 0, 110)

		top.Name = "top"
		top.Parent = notification
		top.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		top.BorderSizePixel = 0
		top.Size = UDim2.new(1, 0, 0, 20)

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

		text.Name = "text"
		text.Parent = notification
		text.BackgroundColor3 = Color3.fromRGB(34, 87, 168)
		text.BackgroundTransparency = 1.000
		text.BorderColor3 = Color3.fromRGB(27, 42, 53)
		text.BorderSizePixel = 0
		text.Position = UDim2.new(0, 0, 0, 20)
		text.Size = UDim2.new(0, 250, 0, 90)
		text.ZIndex = 2
		text.Font = Enum.Font.Ubuntu
		text.Text = name
		text.TextColor3 = textColor
		text.TextScaled = true
		text.TextSize = 14
		text.TextWrapped = true

		title.Name = "title"
		title.Parent = notification
		title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		title.BackgroundTransparency = 1.000
		title.Size = UDim2.new(0.899999976, 0, 0, 20)
		title.Font = Enum.Font.Ubuntu
		title.Text = "  RezHub | Pet Sim X"
		title.TextColor3 = Color3.fromRGB(235, 235, 235)
		title.TextSize = 14.000
		title.TextWrapped = true
		title.TextXAlignment = Enum.TextXAlignment.Left

		close.MouseButton1Click:Connect(function()
			notification:Destroy()
		end)
	end
end


local Main = Window:Tab("📜 Main")
local AutoFarm = Window:Tab("🧑🏻‍🌾 AutoFarm")
local Movement = Window:Tab("🏃🏻‍♂️ Movement")
local VisualDupes = Window:Tab("💴 Visual Dupes")
local Christmas = Window:Tab("🎄 Christmas Event")
local Misc = Window:Tab("🧑🏻‍💻 Miscellaneous")
local CoolUI = Window:Tab("🖥️ UI")

Main:Slider("FOV", 30, 120, 70, function(Value)
	cam.FieldOfView = Value
end)

Main:Dropdown("Show Gui", {"Achievements", "AutoSettings", "Collection", "DarkMatter", "EnchantPets", "FreeGifts", "FusePets", "Golden", "Hoverboards",
	"Inventory", "LoginRewards", "Mailbox", "Mastery", "MerchCodes", "Rainbow", "ServerBoosts", "Settings", "Teleport", "Trading", "TwitterCodes", "Upgrades"}, function(Value)
	player.PlayerGui[Value].Enabled = true
end)

Main:Toggle("Pet ESP", false, function(Value)
	        if Value then
            for i, v in pairs(game:GetService("Workspace").__THINGS.Pets:GetChildren()) do
                local ESP = Instance.new("Highlight")
                ESP.Parent = v
                ESP.Name = "ESP"
                ESP.FillTransparency = 0
                ESP.FillColor = generateRandomColor()
                ESP.OutlineTransparency = 0
                ESP.OutlineColor = generateRandomColor()
                ESPEnabled = true
            end
        else
            for i, v in pairs(game.Workspace.__THINGS.Pets:GetChildren()) do
                if v:FindFirstChild("ESP") then
                    v.ESP:Destroy()
                end
            end
        end
end)

Main:Button("Teleport To Player", function()
	        if game:GetService("Workspace"):FindFirstChild(TeleportName) then
            character.HumanoidRootPart.CFrame = game:GetService("Workspace")[TeleportName].HumanoidRootPart.CFrame
        else
			notify("Make sure the player is still in the game and that you have typed their name correctly. Display names do not work.", Color3.fromRGB(235, 235, 235))
        end
end)

Main:Textbox("Player Name To Teleport To", true, function(Value)
	TeleportName = Value
end)

Movement:Button("Infinite Jump", function()
			game:GetService("UserInputService").JumpRequest:connect(function()
			character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
		end)
end)

Movement:Toggle("NoClip", false, function(Value)
	if Value then
			while true do
				player = game.Players.LocalPlayer
				character = player.Character
				for _, v in pairs(character:GetDescendants()) do
					pcall(function()
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end)
				end

				game:GetService("RunService").Stepped:wait()
			end
		else
			while true do
				player = game.Players.LocalPlayer
				character = player.Character

				for _, v in pairs(character:GetDescendants()) do
					pcall(function()
						if v:IsA("BasePart") then
							v.CanCollide = true
						end
					end)
				end

				game:GetService("RunService").Stepped:wait()
			end
		end
end)

Movement:Textbox("Set Walk Speed (Number)", true, function(Value)
	character.Humanoid.WalkSpeed = Value
end)

Movement:Textbox("Set Jump Power (Number)", true, function(Value)
	character.Humanoid.JumpPower = Value
end)

Movement:Button("Reset Walk Speed", function()
	character.Humanoid.WalkSpeed = 16
end)

Movement:Button("Reset Jump Power", function()
	character.Humanoid.JumpPower = 50
end)


VisualDupes:Button("Visual Coin Dupe", function()
			player.PlayerGui.Main.Right.Coins.Amount_odometerGUIFX.Text = comma_value(tostring(coins))
		player.PlayerGui.Main.Right.Coins.Amount.Text = comma_value(tostring(coins))

		local text = player.PlayerGui.Main.Right.Coins.Amount.Text
    	text = string.gsub(text, ",", "")  -- remove commas
    	coins = tonumber(text) * 2
end)

VisualDupes:Button("Visual Diamond Dupe", function()
		player.PlayerGui.Main.Right.Diamonds.Amount_odometerGUIFX.Text = comma_value(tostring(diamond))
		player.PlayerGui.Main.Right.Diamonds.Amount.Text = comma_value(tostring(diamond))

		local text = player.PlayerGui.Main.Right.Diamonds.Amount.Text
    	text = string.gsub(text, ",", "")  -- remove commas
    	diamond = tonumber(text) * 2
end)

if player.PlayerGui.Main.Right:FindFirstChild("Fantasy Coins") then
    VisualDupes:Button("Visual Fantasy Coin Dupe", function()
            player.PlayerGui.Main.Right["Fantasy Coins"].Amount_odometerGUIFX.Text = comma_value(tostring(fantasy))
            player.PlayerGui.Main.Right["Fantasy Coins"].Amount.Text = comma_value(tostring(fantasy))

            local text = player.PlayerGui.Main.Right["Fantasy Coins"].Amount.Text
            text = string.gsub(text, ",", "")  -- remove commas
            fantasy = tonumber(text) * 2
end)
end

if player.PlayerGui.Main.Right:FindFirstChild("Tech Coins") then
    VisualDupes:Button("Visual Tech Coin Dupe", function()
            player.PlayerGui.Main.Right["Tech Coins"].Amount_odometerGUIFX.Text = comma_value(tostring(tech))
            player.PlayerGui.Main.Right["Tech Coins"].Amount.Text = comma_value(tostring(tech))

            local text = player.PlayerGui.Main.Right["Tech Coins"].Amount.Text
            text = string.gsub(text, ",", "")  -- remove commas
            tech = tonumber(text) * 2
end)
end

if player.PlayerGui.Main.Right:FindFirstChild("Gingerbread") then
    VisualDupes:Button("Visual Gingerbread Dupe", function()
            player.PlayerGui.Main.Right.Gingerbread.Amount_odometerGUIFX.Text = comma_value(tostring(gingerbread))
            player.PlayerGui.Main.Right.Gingerbread.Amount.Text = comma_value(tostring(gingerbread))

            local text = player.PlayerGui.Main.Right.Gingerbread.Amount.Text
            text = string.gsub(text, ",", "")  -- remove commas
            gingerbread = tonumber(text) * 2
end)
end

if player.PlayerGui.Main.Right:FindFirstChild("Rainbow Coins") then
    VisualDupes:Button("Visual Rainbow Coin Dupe", function()
            player.PlayerGui.Main.Right["Rainbow Coins"].Amount_odometerGUIFX.Text = comma_value(tostring(rainbow))
            player.PlayerGui.Main.Right["Rainbow Coins"].Amount.Text = comma_value(tostring(rainbow))

            local text = player.PlayerGui.Main.Right["Rainbow Coins"].Amount.Text
            text = string.gsub(text, ",", "")  -- remove commas
            rainbow = tonumber(text) * 2
end)
end

AutoFarm:Toggle("AutoFarm", false, function(Value)
	-- Add Later
end)

AutoFarm:Toggle("Auto Collect Orbs", false, function(Value)
	        for i, v in pairs(ws.__THINGS.Orbs:GetChildren()) do
            v.Position = character.HumanoidRootPart.Position
        end

        ws.__THINGS.Orbs.ChildAdded:Connect(function()
            if Value then
                for i, v in pairs(ws.__THINGS.Orbs:GetChildren()) do
                    v.Position = character.HumanoidRootPart.Position
                end
            end
        end)
end)

AutoFarm:Toggle("Auto Collect Lootbags", false, function(Value)
	        for i, v in pairs(ws.__THINGS.Lootbags:GetChildren()) do
            v.Position = character.HumanoidRootPart.Position
        end

        ws.__THINGS.Lootbags.ChildAdded:Connect(function()
            if Value then
                for i, v in pairs(ws.__THINGS.Lootbags:GetChildren()) do
                    v.Position = character.HumanoidRootPart.Position
                end
            end
        end)
end)

Christmas:Label("Presents In Current World: "..presents)

Christmas:Button("Update Present Status", function()
	    presents = 0

        if ws:FindFirstChild("__MAP") then
            for i, v in pairs(ws.__MAP.Interactive.Presents:GetChildren()) do
                presents += 1
            end
        else
            PresentStatus:Set("Wait For The Map To Load")
        end

		PresentStatus:Set("Resetting Present Counter")
		wait(0.25)
		PresentStatus:Set("Resetting Present Counter..")
		wait(0.25)
		PresentStatus:Set("Resetting Present Counter....")
		wait(0.25)
		PresentStatus:Set("Resetting Present Counter......")
		wait(0.25)
        PresentStatus:Set("Presents In Current World: "..presents)
end)

Christmas:Button("Collect Nearest Present", function()
	if ws:FindFirstChild("__MAP") then
            if ws.__MAP.Interactive.Presents:FindFirstChild("ChristmasPresent") then
                for i, v in pairs(game.Workspace.__MAP.Interactive.Presents:GetChildren()) do
                    v.Position = character.HumanoidRootPart.Position
                end
            else
			notify("There Are No Presents In Your Current World.", Color3.fromRGB(235, 235, 235))
            end
        else
		notify("The Map Is Not Currently Loaded. Wait for it to load.", Color3.fromRGB(235, 235, 235))
        end
end)

Christmas:Toggle("Present Esp", false, function(Value)
	if Value then
            local num = 0

            if ws:FindFirstChild("__MAP") then
                for i, v in pairs(game.Workspace.__MAP.Interactive.Presents:GetChildren()) do
                    num += 1
                    if not v:FindFirstChild("ESP") then
                        local ESP = Instance.new("Highlight")
                        ESP.Parent = v
                        ESP.Name = "ESP"
                        ESP.FillTransparency = 0
                        ESP.FillColor = presentEspColor
                        ESP.OutlineTransparency = 0
                        ESP.OutlineColor = presentEspColor
                        ESPEnabled = true
                    end
                end
            else
			notify("The Map Is Not Currently Loaded. Wait for it to load.", Color3.fromRGB(235, 235, 235))
            end

            function getPresentMessage(presents) -- "presents" arg not neccassary, but it looks cool
                local presentMessage = ""
                if presents > 0 then
                    presentMessage = "Present ESP has been applied to "..presents.." presents on your current island!"
                    
                    return presentMessage
                else
                    presentMessage = "You have already collected all of the presents on this island!"

                    return presentMessage
                end
            end
			notify(getPresentMessage(num), Color3.fromRGB(235, 235, 235))
        else
            if ws:FindFirstChild("__MAP") then
                for i, v in pairs(game.Workspace.__MAP.Interactive.Presents:GetChildren()) do
                    if v:FindFirstChild("ESP") then
                        v.ESP:Destroy()
                    end
                end
            else
			notify("The Map Is Not Currently Loaded. Wait for it to load.", Color3.fromRGB(235, 235, 235))
            end
        end

		while wait(1) do
			if Value then
				num = 0
				for i, v in pairs(game.Workspace.__MAP.Interactive.Presents:GetChildren()) do
                    num += 1
                    if v:FindFirstChild("ESP") then
						v:Destroy()
                        local ESP = Instance.new("Highlight")
                        ESP.Parent = v
                        ESP.Name = "ESP"
                        ESP.FillTransparency = 0
                        ESP.FillColor = presentEspColor
                        ESP.OutlineTransparency = 0
                        ESP.OutlineColor = presentEspColor
                        ESPEnabled = true
                    end
                end
			end
		end
end)

Christmas:Colorpicker("Choose Present Esp Color", Color3.fromRGB(0, 0, 255), function(Value)
	presentEspColor = Value
end)

Misc:Button("Unlock Hoverboard", function()
	-- Add Later
end)

Misc:Button("ServerHop", function()
	serverHop()
end)

Misc:Button("Rejoin", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, player)
end)

Misc:Toggle("Anti-Afk", false, function(Value)
	while wait(600) do
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
	end
end)

Misc:Button("Remove Zone Barriers", function()
	if ws:FindFirstChild("__MAP") then
            for i, v in pairs(ws.__MAP.Gates:GetDescendants()) do
                if v:IsA("Part") then
                    v.CanCollide = false

                    if v.Name == "Gate" then
                        v.Transparency = 1
                    end
                end
            end
        else
				notify("The Map Is Not Currently Loaded. Wait for it to load.", Color3.fromRGB(235, 235, 235))
        end 
end)

Misc:Button("Remove Top Map Barriers", function()
	if ws:FindFirstChild("__DEBRIS") then
            for i, v in pairs(ws.__DEBRIS.__MAPDEBRIS.Debris.Barriers:GetDescendants()) do
                if v:IsA("Part") then
                    v.CanCollide = false
                end
            end
        else
notify("The Map Is Not Currently Loaded. Wait for it to load.", Color3.fromRGB(235, 235, 235))
        end
end)

CoolUI:Colorpicker("Change UI Theme", Color3.fromRGB(66, 135, 245), function(Value)
	Library:ChangePresetColor(Color3.fromRGB(Value.R * 255, Value.G * 255, Value.B * 255))
end)

CoolUI:Bind("Toggle UI", Enum.KeyCode.RightShift, function()
	game:GetService("CoreGui").ui.Enabled = not game:GetService("CoreGui").ui.Enabled
end)


-- Check if the Players Map Has Been Deleted
while wait(5) do
    if not ws:FindFirstChild("__MAP") then
		notify("The Map Has Been Deleted (AntiCheat). Dont Worry, Just Rejoin/Serverhop And Re-Excecute.", Color3.fromRGB(100, 235, 100))
    end
end

tab:Button("Button", function()
lib:Notification("Notification", "Hello!", "Hi!")
end)

tab:Toggle("Toggle",false, function(t)
print(t)
end)

tab:Slider("Slider",0,100,30, function(t)
print(t)
end)

tab:Dropdown("Dropdown",{"Option 1","Option 2","Option 3","Option 4","Option 5"}, function(t)
print(t)
end)

tab:Colorpicker("Colorpicker",Color3.fromRGB(255,0,0), function(t)
print(t)
end)

tab:Textbox("Textbox",true, function(t)
print(t)
end)

tab:Bind("Bind",Enum.KeyCode.RightShift, function()
print("Pressed!")
end)

tab:Label("Label")

local changeclr = win:Tab("Change UI Color")

changeclr:Colorpicker("Change UI Color",Color3.fromRGB(44, 120, 224), function(t)
lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)
