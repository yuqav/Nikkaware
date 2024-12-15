local NikkaLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/yuqav/Nikkaware/refs/heads/main/gui.lua')))()
local Window = NikkaLib:MakeWindow({Name = "NikkaWare", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

local homeTab = Window:MakeTab({Name = "Home", Icon = "", PremiumOnly = false})
local mainTab = Window:MakeTab({Name = "Main", Icon = "", PremiumOnly = false})
local settingsTab = Window:MakeTab({Name = "Settings", Icon = "", PremiumOnly = false})
local renderTab = Window:MakeTab({Name = "Render", Icon = "", PremiumOnly = false})

local Player = game.Players.LocalPlayer
local clickKillFunc = false
local hitBox = false
local espBoolean = false

homeTab:AddParagraph("MVSD","Last update: 15.12.24 \nMade by: yuqav")

local HB_Settings = {
    Color = Color3.fromRGB(255, 0, 0),
    Transparency = 0.5,
    Size = 2
}

function addHitBoxChanges()
    while hitBox do
        wait(0.1)
        for i, plr in pairs(game.Players:GetPlayers()) do
            if plr ~= Player and plr.Team ~= Player.Team then
                local character = plr.Character
                if character then
                    local hrp = character:FindFirstChild("HumanoidRootPart")
                    if hrp then 
                        hrp.Size = Vector3.new(HB_Settings.Size, HB_Settings.Size, HB_Settings.Size)
                        hrp.CanCollide = false
                        hrp.Transparency = HB_Settings.Transparency
                        hrp.Color = HB_Settings.Color
                        hrp.Material = Enum.Material.Neon
                    end
                end
            end
        end
    end

    for i, plr in pairs(game.Players:GetPlayers()) do
        if plr ~= Player and plr.Team ~= Player.Team then
            local character = plr.Character
            if character then
                local hrp = character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.Size = Vector3.new(2, 2, 2)
                    hrp.CanCollide = false
                    hrp.Transparency = 1
                    hrp.Color = Color3.new(1, 1, 1)
                end
            end
        end
    end
end

function clickKill()
    local mouse = Player:GetMouse()
    mouse.Button1Down:Connect(function()
        if clickKillFunc then
            local targetPosition = mouse.Hit.p
            for i, plr in pairs(game.Players:GetPlayers()) do
                if plr ~= Player and plr.Team ~= Player.Team then
                    local character = plr.Character
                    if character then
                        local hrp = character:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            hrp.CFrame = CFrame.new(targetPosition)
                        end
                    end
                end
            end
        end
    end)
end

function espPlayers()
    local espBoxes = {}

    while espBoolean do
        task.wait(0.5)
        for i, child in ipairs(workspace:GetDescendants()) do
            if child:FindFirstChild("Humanoid") then
                if not child:FindFirstChild("EspBox") then
                    if child ~= Player.Character then
                        local esp = Instance.new("BoxHandleAdornment", child)
                        esp.Adornee = child
                        esp.ZIndex = 0
                        esp.Size = Vector3.new(4, 5, 4)
                        esp.Transparency = 0.45
                        esp.Color3 = Color3.fromRGB(75, 60, 140)
                        esp.AlwaysOnTop = true
                        esp.Name = "EspBox"
                        table.insert(espBoxes, esp)
                    end
                end
            end
        end
    end
    for _, esp in ipairs(espBoxes) do
        esp:Destroy()
    end
end

mainTab:AddToggle({
    Name = "TP Kill",
    Default = false,
    Callback = function(v)
        clickKillFunc = v
        if clickKillFunc then
            clickKill()
        end
    end
})

mainTab:AddToggle({
    Name = "Hitbox",
    Default = false,
    Callback = function(v)
        hitBox = v
        if hitBox then
            addHitBoxChanges()
        end
    end
})

settingsTab:AddSlider({
    Name = "Hitbox size",
    Min = 2,
    Max = 35,
    Default = 2,
    Color = Color3.fromRGB(190,190,190),
    Increment = 1,
    ValueName = "size",
    Callback = function(s)
        HB_Settings.Size = s
    end    
})

settingsTab:AddColorpicker({
    Name = "Hitbox color",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(v)
        HB_Settings.Color = v
    end	  
})

renderTab:AddToggle({
    Name = "Esp",
    Default = false,
    Callback = function(v)
        espBoolean = v
        if espBoolean then
            espPlayers()
        else
            for _, child in ipairs(workspace:GetDescendants()) do
                if child:FindFirstChild("EspBox") then
                    child.EspBox:Destroy()
                end
            end
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
