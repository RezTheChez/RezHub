if Option == "Day" then
			if lighting.ClockTime == 0 then
				for i = 1, 96 do
					game:GetService("Lighting").ClockTime -= 0.125
					wait(0.0125)
				end
			end
		else
			if lighting.ClockTime == 12 then
				for i = 1, 96 do
					game:GetService("Lighting").ClockTime += 0.125
					wait(0.0125)
				end
			end
		end
