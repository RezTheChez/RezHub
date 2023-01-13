if Value == "Day" then
	if lighting.ClockTime == 0 then
		game:GetService("Lighting").ClockTime = 12
	end
else
	if lighting.ClockTime == 12 then
		game:GetService("Lighting").ClockTime = 0
  end
end
