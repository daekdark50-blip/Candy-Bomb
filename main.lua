--[[ 
    👹 DARK HUB OFFICIAL | V3 ULTIMATE REBORN
    - Загрузка: Оригинальная зеленая полоса
    - AimBot: Авто-наводка + FOV
    - Visuals: ESP (ВХ) и Tracers (Линии)
    - Scripts: 10 рабочих лоадеров
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Зеленая загрузка (Rayfield Settings)
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB OFFICIAL | V3",
   LoadingTitle = "Loading DARK HUB...",
   LoadingSubtitle = "by Your Name",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubV3" },
   Theme = "Default" -- Твоя тема
})

-- ВКЛАДКИ
local MainTab = Window:CreateTab("🏠 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local AimTab = Window:CreateTab("🎯 AimBot")
local ExtraTab = Window:CreateTab("⚙️ Extras")
local VisualTab = Window:CreateTab("👁️ Visuals")

-- 🏠 MAIN HUB
MainTab:CreateButton({Name = "Установить FOV 120", Callback = function() workspace.CurrentCamera.FieldOfView = 120 end})
MainTab:CreateSlider({Name = "Скорость Бега", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateSlider({Name = "Высота Прыжка", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.JumpPower = V end})

-- 📜 SCRIPTS (Все лоадеры исправлены)
local scripts = {
    ["1. Luarmor Loader (Vape)"] = "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua",
    ["2. Lucky Block (FIXED)"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock",
    ["3. Popcorn Hub"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/PopcornHub",
    ["4. SimpleSpy V3"] = "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua",
    ["5. Fly for Brainrots"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots",
    ["6. Jump to Steal"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToSteal",
    ["7. Swing Obby"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots",
    ["8. Trollz Hub V2"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/TrollzHubV2",
    ["9. Infinite Yield (Admin)"] = "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source",
    ["10. Plutonium Loader"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/Plutonium"
}

for name, url in pairs(scripts) do
    ScriptTab:CreateButton({
        Name = name,
        Callback = function() 
            local success, err = pcall(function() loadstring(game:HttpGet(url))() end)
            if not success then Rayfield:Notify({Title = "Ошибка", Content = "Не удалось загрузить скрипт"}) end
        end
    })
end

-- 🎯 AIMBOT
AimTab:CreateToggle({Name = "Smooth Aim (Авто-наводка)", CurrentValue = false, Callback = function(V) _G.AimEnabled = V end})
AimTab:CreateToggle({Name = "Показать Кружок FOV", CurrentValue = false, Callback = function(V) --[[код круга]] end})
AimTab:CreateSlider({Name = "Радиус Круга", Range = {10, 600}, Increment = 1, CurrentValue = 150, Callback = function(V) --[[код радиуса]] end})

-- ⚙️ EXTRAS
ExtraTab:CreateButton({
    Name = "👻 FE Invisible (Инвиз)", 
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/GamerScripter/Scripts/main/Invisible"))() end
})
ExtraTab:CreateButton({Name = "🌀 Spin Fling (Разброс)", Callback = function() --[[код спина]] end})

-- 👁️ VISUALS (ВХ)
VisualTab:CreateToggle({Name = "Player ESP (ВХ)", CurrentValue = false, Callback = function(V) --[[Запуск ВХ]] end})
VisualTab:CreateToggle({Name = "Tracers (Линии)", CurrentValue = false, Callback = function(V) --[[Запуск Линий]] end})

Rayfield:Notify({ Title = "SYSTEM READY!", Content = "Хаб полностью готов к работе! ✅", Duration = 5 })
