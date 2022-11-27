while wait(0.1) do
			if Value then
				game.Players.LocalPlayer.Character.LowerTorso.Anchored = true
				game.Players.LocalPlayer.Character.Humanoid.Jump = true
				wait(0.1)
				game.Players.LocalPlayer.Character.LowerTorso.Anchored = false
				game.Players.LocalPlayer.Character.Humanoid.Sit = true
			end
		end
