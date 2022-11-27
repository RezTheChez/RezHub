while wait(5) do
			if Value then
				local BodyVelocity = Instance.new("BodyVelocity")
				BodyVelocity.MaxForce = Vector3.new(10, 0, 10)
				BodyVelocity.Velocity = character.HumanoidRootPart.CFrame.LookVector * 24
				BodyVelocity.Parent = character.HumanoidRootPart

				local originalOrientation = character.HumanoidRootPart.Orientation

				local connection = nil
				connection = game:GetService("RunService").Stepped:Connect(function()
					local newOrientation = character.HumanoidRootPart.Orientation

					if newOrientation ~= originalOrientation then
						originalOrientation = newOrientation

						BodyVelocity.Velocity = character.HumanoidRootPart.CFrame.LookVector * 24
					end
				end)

				BodyVelocity.Destroying:Connect(function()
					connection:Disconnect()
				end)
			end
		end
