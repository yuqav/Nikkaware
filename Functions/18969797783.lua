local NikkaLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/yuqav/Nikkaware/refs/heads/main/gui.lua')))()
local Window = NikkaLib:MakeWindow({Name = "NikkaWare", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local homeTab = Window:MakeTab({Name = "Home", Icon = "", PremiumOnly = false})
local mainTab = Window:MakeTab({Name = "Main", Icon = "", PremiumOnly = false})

local infStrength = false
local autoRebirth = false
local autoTrain = false

homeTab:AddParagraph("Lifting Legends Simulator","Last update: 15.12.24 \nMade by: yuqav")

function infinityStrength()
	while infStrength do
		game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.5.1"].knit.Services.ChestService.RF.ClaimDailyChest:InvokeServer()
		game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.5.1"].knit.Services.ChestService.RF.ClaimGroupChest:InvokeServer()
		task.wait()
	end
end

mainTab:AddToggle({
	Name = "Infinity Strength",
	Default = false,
	Callback = function(v)
		infStrength = v
		if infStrength then
			infinityStrength()
		end
	end
})

mainTab:AddToggle({
	Name = "Auto Train",
	Default = false,
	Callback = function(v)
		autoTrain = v
		while autoTrain do
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1").knit.Services.TrainService.RE.Train:FireServer()
			task.wait()
		end
	end
})

mainTab:AddToggle({
	Name = "Auto Rebirth",
	Default = false,
	Callback = function(v)
		autoRebirth = v
		while autoRebirth do
			game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1").knit.Services.RebirthService.RF.Rebirth:InvokeServer()
			task.wait(1)
		end
	end
})
