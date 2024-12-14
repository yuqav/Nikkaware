local NikkaLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/yuqav/Nikkaware/refs/heads/main/gui.lua')))()
local Window = NikkaLib:MakeWindow({Name = "NikkaWare", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local homeTab = Window:MakeTab({Name = "Home", Icon = "", PremiumOnly = false})
local mainTab = Window:MakeTab({Name = "Main", Icon = "", PremiumOnly = false})

local autoOrb = false

homeTab:AddParagraph("Legends Of Speed","Last update: 14.12.24 \nMade by: yuqav")

function autoOrbs()
    while autoOrb do
        local args = {
            {"collectOrb", "Orange Orb", "City"},
            {"collectOrb", "Yellow Orb", "City"},
            {"collectOrb", "Blue Orb", "City"},
            {"collectOrb", "Red Orb", "City"},
            {"collectOrb", "Gem", "City"}
        }
        for _, orbArgs in ipairs(args) do
            for i = 1, 50 do
                game:GetService("ReplicatedStorage").rEvents.orbEvent:FireServer(unpack(orbArgs))
            end
        end
        task.wait()
    end
end

mainTab:AddToggle({
    Name = "Auto Orb(City)",
    Default = false,
    Callback = function(v)
        autoOrb = v
        if autoOrb then
            autoOrbs()
        end
    end
})
