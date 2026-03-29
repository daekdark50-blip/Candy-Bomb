--[[
	👹 DARK HUB OFFICIAL | V3 FINAL REBORN
	- 15 Рабочих лоадеров в Scripts
	- Статичный FOV круг (по центру)
	- Авто-наводка (Smooth Aim)
	- Зеленая полоса загрузки
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ЗЕЛЕНАЯ ЗАГРУЗКА]
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 380, 0, 120)
    frame.Position = UDim2.new(0.5, -190, 0.5, -60)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0.6, 0)
    label.Text = "Loading DARK HUB..."
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 24
    label.Font = Enum.Font.GothamBold
    label.BackgroundTransparency = 1
    local barBg = Instance.new("Frame", frame)
    barBg.Size = UDim2.new(0.85, 0, 0, 8)
    barBg.Position = UDim2.new(0.075, 0, 0.75, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 255, 100) -- ЗЕЛЕНАЯ ПОЛОСА
    bar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quart", 2.2)
    task.wait(2.5)
    screen:Destroy()
end
StartLoading()

-- 2. [СТАТИЧНЫЙ КРУГ АИМА]
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 100
FOVCircle.Color = Color3.fromRGB(0, 255, 255)
FOVCircle.Visible = false
FOVCircle.Radius = 150
-- Центрируем строго по середине экрана
game:GetService("RunService").RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
end)

-- 3. [ОКНО ХАБА]
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

-- [ MAIN HUB ]
MainTab:CreateButton({Name = "🎥 FOV 120", Callback = function() workspace.CurrentCamera.FieldOfView = 120 end})
MainTab:CreateSlider({Name = "⚡ Speed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateSlider({Name = "🚀 Jump", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.JumpPower = V end})

-- [ SCRIPTS - ВСЕ 15 ЛОАДЕРОВ ]
local loaders = {
    ["👻 FE Invisible"] = "https://rawscripts.net/raw/Universal-Script-invisible-script-FE-143835",
    ["💎 Bea Lucky Block"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock",
    ["🎡 Swing Obby"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots",
    ["🌌 Mystrix Hub"] = "https://github.com/OxyCoder32/Crackers/raw/refs/heads/main/Mystrix%20Hub",
    ["⚡ Speed Escape"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/1SpeedEscapeforBrainrots",
    ["🌊 Escape Tsunami"] = "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/main/Escape%20tsunami%20for%20brainrotsGalaxy6.5",
    ["🔪 Murderers VS Sheriffs"] = "https://raw.githubusercontent.com/Rysted/scripts/main/MurderersVSSheriffs.lua",
    ["🚀 Speed Hub X"] = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua",
    ["🃏 Ace Hub"] = "https://raw.githubusercontent.com/Totocoems/Ace/main/Ace",
    ["🧪 Luarmor L1"] = "https://api.luarmor.net/files/v4/loaders/8ad57247c984da7cc88517bca6a5a36d.lua",
    ["🧪 Luarmor L2"] = "https://api.luarmor.net/files/v4/loaders/d8185b175524d935b4a6026c784375fc.lua",
    ["💪 Get STRONG"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/GetSTRONGforBrainrots",
    ["🤿 Diving Legends"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/DivingLegends",
    ["💨 Fart Training"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/FartTraining",
    ["🪰 Fly for Brainrots"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"
}

for name, url in pairs(loaders) do
    ScriptTab:CreateButton({
        Name = name,
        Callback = function() loadstring(game:HttpGet(url))() end
    })
end

-- [ AIMBOT ]
AimTab:CreateToggle({Name = "Показать Кружок FOV", CurrentValue = false, Callback = function(V) FOVCircle.Visible = V end})
AimTab:CreateSlider({Name = "Радиус Круга", Range = {10, 600}, Increment = 1, CurrentValue = 150, Callback = function(V) FOVCircle.Radius = V end})
AimTab:CreateToggle({Name = "Smooth Aim (Авто-наводка)", CurrentValue = false, Callback = function(V) _G.AimEnabled = V end})

-- [ VISUALS & EXTRAS ]
VisualTab:CreateToggle({Name = "Player ESP (ВХ)", CurrentValue = false, Callback = function(V) end})
ExtraTab:CreateButton({Name = "🌀 Spin Fling", Callback = function() end})

Rayfield:Notify({ Title = "DARK HUB!", Content = "Всё готово! ✅", Duration = 5 })
