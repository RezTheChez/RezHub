local wPressed = false
      local sPressed = false
      local aPressed = false
      local dPressed = false

      local flying = false
      UIS.InputBegan:Connect(function(key, chat)
        if chat then return end
        if key.KeyCode == Enum.KeyCode.E then
          if flying then --Stop Flying
            flying = false
            character.Animate.Disabled = false

          else --Start Flying
            flying = true

            character.Animate.Disabled = true

            local bv = Instance.new("BodyVelocity", character.PrimaryPart)
            bv.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            bv.Velocity = Vector3.new(0,0,0)
            bv.Name = "FlightForce"

            repeat wait(0.1) until flying == false
            bv:Destroy()
          end
        end

        if key.KeyCode == Enum.KeyCode.W then
          wPressed = true
        elseif key.KeyCode == Enum.KeyCode.S then
          sPressed = true
        elseif key.KeyCode == Enum.KeyCode.A then
          aPressed = true
        elseif key.KeyCode == Enum.KeyCode.D then
          dPressed = true
        end
      end)

      UIS.InputEnded:Connect(function(key)	
        if key.KeyCode == Enum.KeyCode.W then
          wPressed = false
        elseif key.KeyCode == Enum.KeyCode.S then
          sPressed = false
        elseif key.KeyCode == Enum.KeyCode.A then
          aPressed = false
        elseif key.KeyCode == Enum.KeyCode.D then
          dPressed = false
        end
      end)

      while wait() do
        if flying then
          character.PrimaryPart:FindFirstChild("FlightForce").Velocity = Vector3.new(0,0,0)

          if wPressed then
            character.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * flySpeed
          end
          if sPressed then
            character.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.LookVector * -flySpeed
          end
          if aPressed then
            character.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.RightVector * -flySpeed
          end
          if dPressed then
            character.PrimaryPart:FindFirstChild("FlightForce").Velocity = cam.CFrame.RightVector * flySpeed
          end
        else
          wait(1)
        end
      end
