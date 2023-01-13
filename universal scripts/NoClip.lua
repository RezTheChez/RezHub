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
