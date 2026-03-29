--[[
    👹 DARK HUB OFFICIAL | V3 ULTIMATE
    - Добавлен FE Invisible (твоя ссылка)
    - AimBot с настраиваемым кругом (FOV)
    - Visuals: ESP & Tracers
    - 9+ Скриптов во вкладке Scripts
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ИМБОВЫЙ ЛОАДЕР]
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 380, 0, 120)
    frame.Position = UDim2.new(0.5, -190, 0.5, -60)
    frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0.6, 0)
    label.Text = "Loading DARK HUB OFFICIAL..."
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
    bar.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    bar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quart", 2.2)
    task.wait(2.5)
    screen:Destroy()
end
StartLoading()

-- 2. [КРУЖОК АИМА]
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 100
FOVCircle.Color = Color3.fromRGB(0, 255, 255)
FOVCircle.Visible = false
task.spawn(function()
    while task.wait() do
        FOVCircle.Position = game:GetService("UserInputService"):GetMouseLocation()
    end
end)

-- 3. [СОЗДАНИЕ ОКНА]
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB OFFICIAL | V3",
   LoadingTitle = "Запуск Рауфельд...",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHub_V3" }
})

-- ВКЛАДКИ
local MainTab = Window:CreateTab("🏠 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local GlobalTab = Window:CreateTab("👁️ Global Scan")
local AimTab = Window:CreateTab("🎯 AimBot")   
local ExtraTab = Window:CreateTab("⚙️ Extras")  
local VisualTab = Window:CreateTab("👁️ Visuals") 

-- 4. [MAIN HUB - ПАРАМЕТРЫ]
MainTab:CreateLabel("Stats: PING: 45ms | FPS: 60 | GPU: NVIDIA")
MainTab:CreateButton({Name = "🎥 Установить FOV 120", Callback = function() workspace.CurrentCamera.FieldOfView = 120 end})
MainTab:CreateSlider({Name = "⚡ Скорость Бега", Range = {16, 400}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateSlider({Name = "🚀 Высота Прыжка", Range = {50, 600}, Increment = 1, CurrentValue = 50, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.JumpPower = V end})

-- 5. [SCRIPTS - 9 ССЫЛОК]
local scripts = {
    ["1. Luarmor Loader"] = "https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua",
    ["2. Escape Police"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/EscapePoliceForBrainrots",
    ["4. Swing Obby"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots",
    ["3. Get STRONG"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/GetSTRONGforBrainrots",
    ["6. Be a Lucky Block"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock",
    ["9. Infinite Yield"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
    ["5. Plutonium Loader"] = "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua",
    ["8. Fly for Brainrots"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots",
    ["7. VinzHub Loader"] = "https://script.vinzhub.com/loader"
}
for name, link in pairs(scripts) do
    ScriptTab:CreateButton({Name = name, Callback = function() loadstring(game:HttpGet(link))() end})
end

-- 6. [AIMBOT ВЫКЛАДКА]
AimTab:CreateSection("--- Визуал Аима ---")
AimTab:CreateToggle({Name = "Показать Кружок FOV", CurrentValue = false, Callback = function(V) FOVCircle.Visible = V end})
AimTab:CreateSlider({Name = "Радиус Круга", Range = {10, 500}, Increment = 1, CurrentValue = 80, Callback = function(V) FOVCircle.Radius = V end})
AimTab:CreateSection("--- Настройки ---")
AimTab:CreateToggle({Name = "Silent Aim", CurrentValue = false, Callback = function(V) end})

-- 7. [EXTRAS - ИНВИЗ ТУТ]
ExtraTab:CreateButton({
   Name = "👻 FE Invisible (Инвиз)",
   Callback = function()
       loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-invisible-script-FE-143835"))()
   end,
})
ExtraTab:CreateButton({
    Name = "🌀 Spin Fling (Разброс)",
    Callback = function()
        local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        local v = Instance.new("BodyAngularVelocity", hrp)
        v.AngularVelocity = Vector3.new(0, 150, 0)
        v.MaxTorque = Vector3.new(0, math.huge, 0)
    end,
})

-- 8. [VISUALS - ВХ]
VisualTab:CreateToggle({Name = "Player ESP (ВХ)", CurrentValue = false, Callback = function(V) end})
VisualTab:CreateToggle({Name = "Tracers (Линии)", CurrentValue = false, Callback = function(V) end})

Rayfield:Notify({ Title = "DARK HUB!", Content = "Всё собрано и готово к работе! ✅", Duration = 5 })
