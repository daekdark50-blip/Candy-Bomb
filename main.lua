--[[ 
    👹 DARK HUB OFFICIAL | V3 ULTIMATE (FIXED)
    - AimBot: Авто-наводка (Smooth Aim) + Статичный круг
    - Scripts: Все 10 лоадеров возвращены
    - Extras: FE Invisible (твой скрипт)
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Настройки Аима
local AimSettings = {
    Enabled = false,
    Smoothness = 0.25,
    FOV = 150,
    ShowFOV = false
}

-- Статичный FOV круг
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 100
FOVCircle.Color = Color3.fromRGB(0, 255, 255)
FOVCircle.Visible = false
FOVCircle.Filled = false

-- Логика Аима (Авто-наводка)
local function GetClosestPlayer()
    local target = nil
    local dist = AimSettings.FOV
    for _, v in pairs(Players:GetPlayers()) do
        if v ~= LocalPlayer and v.Character and v.Character:FindFirstChild("Head") then
            local pos, onScreen = Camera:WorldToViewportPoint(v.Character.Head.Position)
            if onScreen then
                local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                if magnitude < dist then
                    dist = magnitude
                    target = v
                end
            end
        end
    end
    return target
end

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    FOVCircle.Radius = AimSettings.FOV
    FOVCircle.Visible = AimSettings.ShowFOV

    if AimSettings.Enabled then
        local target = GetClosestPlayer()
        if target then
            local targetPos = Camera:WorldToViewportPoint(target.Character.Head.Position)
            local mousePos = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, target.Character.Head.Position), AimSettings.Smoothness)
        end
    end
end)

local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB OFFICIAL | V3",
   LoadingTitle = "Запуск Рауфельд...",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubV3" }
})

local MainTab = Window:CreateTab("🏠 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local AimTab = Window:CreateTab("🎯 AimBot")
local ExtraTab = Window:CreateTab("⚙️ Extras")
local VisualTab = Window:CreateTab("👁️ Visuals")

-- SCRIPTS (Все 10 штук из видео)
local scripts = {
    ["1. Escape Tsunami"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/EscapeTsunami",
    ["2. Lucky Block (FIXED)"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock",
    ["3. Popcorn Hub"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/PopcornHub",
    ["4. SimpleSpy V3"] = "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua",
    ["5. Fly for Brainrots"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots",
    ["6. Jump to Steal"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToSteal",
    ["7. Swing Obby"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots",
    ["8. Trollz Hub V2"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/TrollzHubV2",
    ["9. Lucky Battle"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/LuckyBattle",
    ["10. Infinite Yield"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"
}
for name, link in pairs(scripts) do
    ScriptTab:CreateButton({Name = name, Callback = function() loadstring(game:HttpGet(link))() end})
end

-- AIMBOT TAB
AimTab:CreateToggle({Name = "Smooth Aim (Авто-наводка)", CurrentValue = false, Callback = function(V) AimSettings.Enabled = V end})
AimTab:CreateToggle({Name = "Показать Кружок FOV", CurrentValue = false, Callback = function(V) AimSettings.ShowFOV = V end})
AimTab:CreateSlider({Name = "Радиус Круга", Range = {10, 600}, Increment = 1, CurrentValue = 150, Callback = function(V) AimSettings.FOV = V end})
AimTab:CreateSlider({Name = "Плавность (Smoothness)", Range = {0.1, 1}, Increment = 0.05, CurrentValue = 0.25, Callback = function(V) AimSettings.Smoothness = V end})

-- EXTRAS
ExtraTab:CreateButton({
   Name = "👻 FE Invisible (Инвиз)", 
   Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-invisible-script-FE-143835"))() end
})

Rayfield:Notify({ Title = "SYSTEM READY!", Content = "Аимбот и лоадеры исправлены! ✅", Duration = 5 })
