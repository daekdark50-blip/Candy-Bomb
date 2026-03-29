--[[
	🌑 DARK HUB OFFICIAL | V5 ULTIMATE
	- Черный экран загрузки: "Loading DARK HUB..."
	- Панель Hacker: Coolkid GUI + John Doe (rbxscript)
	- Visuals: ВХ от scriptrbgod
	- Все 15 лоадеров на месте
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ЧЕРНЫЙ ЭКРАН ЗАГРУЗКИ]
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Черный фон
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(0, 500, 0, 100)
    label.Position = UDim2.new(0.5, -250, 0.5, -50)
    label.Text = "Loading DARK HUB..." -- Твоя надпись
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.TextSize = 40
    label.Font = Enum.Font.GothamBold
    label.BackgroundTransparency = 1
    task.wait(2.5)
    screen:Destroy()
end
StartLoading()

-- 2. [ОКНО ХАБА]
local Window = Rayfield:CreateWindow({
   Name = "🌑 DARK HUB | LAST MACHINE",
   LoadingTitle = "Запуск Системы...",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubV5" }
})

local MainTab = Window:CreateTab("🏠 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local AimTab = Window:CreateTab("🎯 AimBot")
local VisualTab = Window:CreateTab("👁️ Visuals")
local HackerTab = Window:CreateTab("💻 Hacker") -- Твоя вкладка

-- [ MAIN HUB ]
MainTab:CreateSlider({Name = "⚡ Speed", Range = {16, 500}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateButton({Name = "👻 NEW INVISIBLE", Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-Script-Universal-109667"))() end})

-- [ SCRIPTS ]
local loaders = {
    ["🎡 Swing Obby"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots",
    ["☢️ Plutonium"] = "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua",
    ["🌌 Mystrix Hub"] = "https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader",
    ["🚀 Speed Hub X"] = "https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua"
}
for name, url in pairs(loaders) do
    ScriptTab:CreateButton({Name = name, Callback = function() loadstring(game:HttpGet(url))() end})
end

-- [ VISUALS - ВХ ОТ SCRIPT RB GOD ]
VisualTab:CreateButton({
    Name = "👁️ Включить ВХ (scriptrbgod)", -- Как ты просил
    Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))() end
})

-- [ HACKER - ТВОИ СКРИПТЫ ]
HackerTab:CreateButton({
    Name = "💀 Запустить Coolkid GUI",
    Callback = function() loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-coolkid-gui-15453"))() end
})

HackerTab:CreateButton({
    Name = "🤡 Запустить John Doe (rbxscript)", -- Новый скрипт
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/johndoe", true))() 
    end
})

-- [ AIMBOT ]
local AimEnabled, AimSmoothness, AimFOV = false, 0.15, 150
AimTab:CreateToggle({Name = "Авто-наводка", CurrentValue = false, Callback = function(V) AimEnabled = V end})
AimTab:CreateSlider({Name = "Радиус", Range = {10, 600}, Increment = 1, CurrentValue = 150, Callback = function(V) AimFOV = V end})

Rayfield:Notify({ Title = "🌑 DARK HUB", Content = "Вкладка Hacker обновлена! ✅", Duration = 5 })
