local NikkaLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/yuqav/Nikkaware/refs/heads/main/gui.lua')))()
local Window = NikkaLib:MakeWindow({Name = "NikkaWare", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local homeTab = Window:MakeTab({Name = "Home", Icon = "", PremiumOnly = false})
local mainTab = Window:MakeTab({Name = "Main", Icon = "", PremiumOnly = false})
local renderTab = Window:MakeTab({Name = "Render", Icon = "", PremiumOnly = false})
local autoWin = false
homeTab:AddParagraph("Dung Beetle Simulator","Last update: 17.12.24 \nMade by: yuqav")

function autow()
    while autoWin do
        local args = {
            [1] = "Area_4"
        }
        for i=1, 50 do
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1").knit.Services.FightService.RE.StartFight:FireServer(unpack(args))
        game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.5.1").knit.Services.FightService.RE.FinishFight:FireServer(unpack(args))
        task.wait()
        end
    end
end

mainTab:AddToggle({
    Name = "Auto Win",
    Default = false,
    Callback = function(v)
        autoWin = v
        if autoWin then
            autow()
        end
    end
})

renderTab:AddSlider({
    Name = "Time",
    Min = 0,
    Max = 24,
    Default = 14,
    Color = Color3.fromRGB(190, 190, 190),
    Increment = 1,
    ValueName = "Value",
    Callback = function(s)
        while task.wait() do
        game.Lighting.ClockTime = s
        end
    end    
})
