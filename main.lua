--[[
    👹 DARK HUB OFFICIAL | V3 ULTIMATE EDITION (FINAL)
    - Имбовый лоадер с полоской
    - 9 рабочих скриптов (Vape, Brainrots, Plutonium и др.)
    - AimBot с настраиваемым кругом (FOV Circle)
    - Вкладки: Main, Scripts, Global, Aim, Extras, Visuals
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ИМБОВАЯ ЗАГРУЗКА]
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
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
    
    bar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quart", 2.2)
    task.wait(2.5)
    screen:Destroy()
end

StartLoading()

-- 2. [НАСТРОЙКА КРУГА АИМА (FOV)]
local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 2
FOVCircle.NumSides = 100
FOVCircle.Filled = false
FOVCircle.Transparency = 1
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
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubV3_Final" }
})

-- ВКЛАДКИ
local MainTab = Window:CreateTab("🏠 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483345998)
local GlobalTab = Window:CreateTab("👁️ Global Scan", 4483362458)
local AimTab = Window:CreateTab("🎯 AimBot", 4483362458)   -- 4 Вкладка
local ExtraTab = Window:CreateTab("⚙️ Extras", 4483362458)  -- 5 Вкладка
local VisualTab = Window:CreateTab("👁️ Visuals", 4483362458) -- 6 Вкладка

-- 4. [СТАТИСТИКА В MAIN HUB]
local StatsLabel = MainTab:CreateLabel("Stats: Connecting...")
task.spawn(function()
    while task.wait(0.5) do
        local fps = math.floor(1/game:GetService("RunService").RenderStepped:Wait())
        local ping = tonumber(string.format("%.0f", game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()))
        StatsLabel:Set("PING: "..ping.."ms | FPS: "..fps.." | DEV: PC | GPU: NVIDIA")
    end
end)

MainTab:CreateSection("--- Персонаж и Камера ---")
MainTab:CreateButton({Name = "🎥 Установить FOV 120", Callback = function() workspace.CurrentCamera.FieldOfView = 120 end})
MainTab:CreateSlider({Name = "⚡ Скорость Бега", Range = {16, 300}, Increment = 1, CurrentValue = 16, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = V end})
MainTab:CreateSlider({Name = "🚀 Высота Прыжка", Range = {50, 500}, Increment = 1, CurrentValue = 50, Callback = function(V) game.Players.LocalPlayer.Character.Humanoid.JumpPower = V end})

-- 5. [SCRIPTS - 9 РАБОЧИХ ССЫЛОК]
local scriptLinks = {
    ["1. Luarmor Loader (Vape)"] = "https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua",
    ["2. Escape Police"] = "https://raw.githubusercontent.com/gumanba/Scripts/main/EscapePoliceForBrainrots",
    ["3. Get STRONG"] = "
    
