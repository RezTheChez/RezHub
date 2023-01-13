local chatMessage = "RezHub on Top"
local chatInterval = 0.1

local A_1 = chatMessage
local A_2 = chatMessage
local Event = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest

while wait(chatInterval) do
  Event:FireServer(A_1, A_2)
end
