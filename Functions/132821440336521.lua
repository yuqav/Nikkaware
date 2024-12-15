local NikkaLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/yuqav/Nikkaware/refs/heads/main/gui.lua')))()
local Window = NikkaLib:MakeWindow({Name = "NikkaWare", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local homeTab = Window:MakeTab({Name = "Home", Icon = "", PremiumOnly = false})
local mainTab = Window:MakeTab({Name = "Main", Icon = "", PremiumOnly = false})

local storage = game:GetService("ReplicatedStorage").Remotes

homeTab:AddParagraph("Merge For Diamonds","Last update: 15.12.24 \nMade by: yuqav")

mainTab:AddButton({
	Name = "Infinity Gems",
	Callback = function()
		storage.GemEvent:FireServer(math.huge)
	end
})

mainTab:AddButton({
	Name = "Infinity Cash",
	Callback = function()
		storage.AddRewardEvent:FireServer("Cash",math.huge)
	end
})

mainTab:AddButton({
	Name = "Infinity Spin",
	Callback = function()
		storage.AddRewardEvent:FireServer("Spins",math.huge)
	end
})

mainTab:AddButton({
	Name = "+20 Pet",
	Callback = function()
		for i=1,20 do
            storage.SpinWheelPrizeEvent:FireServer(4)
        end
	end
})
