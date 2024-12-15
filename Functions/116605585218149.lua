local NikkaLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/yuqav/Nikkaware/refs/heads/main/gui.lua')))()
local Window = NikkaLib:MakeWindow({Name = "NikkaWare", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local homeTab = Window:MakeTab({Name = "Home", Icon = "", PremiumOnly = false})
local mainTab = Window:MakeTab({Name = "Main", Icon = "", PremiumOnly = false})
local tpTab = Window:MakeTab({Name = "Teleport", Icon = "", PremiumOnly = false})

homeTab:AddParagraph("Go Fishing","Last update: 15.12.24 \nMade by: yuqav")

mainTab:AddToggle({
    Name = "Auto Fish",
    Default = false,
    Callback = function(v)
          game:GetService("Players").LocalPlayer.gui.autofishing.Value = v
end})

tpTab:AddDropdown({
	Name = "Teleport to",
	Default = "Default Isle",
	Options = {"Default Isle", "Vulcano Isle", "Snowy Biome", "Deep Waters", "Ancient Ocean", "High Field", "Toxic Zone"},
	Callback = function(v)
		local player = game.Players.LocalPlayer
		if v == "Default Isle" then
			player.Character:SetPrimaryPartCFrame(CFrame.new(779, 125, -216))
		elseif v == "Vulcano Isle" then
			player.Character:SetPrimaryPartCFrame(CFrame.new(230, 126, 911))
		elseif v == "Snowy Biome" then
			player.Character:SetPrimaryPartCFrame(CFrame.new(2304, 127, 358))
		elseif v == "Deep Waters" then
			player.Character:SetPrimaryPartCFrame(CFrame.new(-987, 124, -1564))
		elseif v == "Ancient Ocean" then
			player.Character:SetPrimaryPartCFrame(CFrame.new(566, 125, -2889))
		elseif v == "High Field" then
			player.Character:SetPrimaryPartCFrame(CFrame.new(2596, 123, -3445))
		elseif v == "Toxic Zone" then
			player.Character:SetPrimaryPartCFrame(CFrame.new(4692, 128, -2471))
		end
	end    
})
