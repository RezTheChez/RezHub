while wait(0.1) do
			local A_1=chatMesage
			local A_2=chatMesage
			local Event=game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
			while wait(chatInerval) do
				Event:FireServer (A_1, A_2)
			end
		end
