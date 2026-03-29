--[[
    👹 DARK HUB OFFICIAL | V3 ULTIMATE REBORN
    - Добавлен Luarmor Loader (Vape V4/Other)
    - Все 9 рабочих ссылок вшиты
    - Исправлен загрузчик и кнопки в Main Hub
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

-- 2. [СОЗДАНИЕ ОКНА]
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB OFFICIAL | V3",
   LoadingTitle = "Запуск Рауфельд...",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHub_V3_Final" }
})

local MainTab = Window:CreateTab("🏠 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483345998)
local GlobalTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- 3. [СТАТИСТИКА ПИНГ/ФПС]
local StatsLabel = MainTab:CreateLabel("Stats: Connecting...")
task.spawn(function()
    while task.wait(0.5) do
        local fps = math.floor(1/game:GetService("RunService").RenderStepped:Wait())
        local ping = tonumber(string.format("%.0f", game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()))
        StatsLabel:Set("PING: "..ping.."ms | FPS: "..fps.." | DEV: PC | GPU: NVIDIA")
    end
end)

--- [ MAIN HUB ] ---
MainTab:CreateSection("--- Персонаж и Камера ---")

MainTab:CreateButton({
   Name = "🎥 Обзор (FOV 120)",
   Callback = function() workspace.CurrentCamera.FieldOfView = 120 end,
})

MainTab:CreateButton({
   Name = "🌈 Радужная Кожа (Rainbow)",
   Callback = function()
       task.spawn(function()
           while true do
               local color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
               if game.Players.LocalPlayer.Character then
                   for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                       if v:IsA("BasePart") then v.Color = color end
                   end
               end
               task.wait(0.05)
           end
       end)
   end,
})

MainTab:CreateButton({
   Name = "🌀 Spin Fling (Разброс)",
   Callback = function()
       local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
       local v = Instance.new("BodyAngularVelocity", hrp)
       v.MaxTorque = Vector3.new(0, math.huge, 0)
       v.AngularVelocity = Vector3.new(0, 150, 0)
   end,
})

MainTab:CreateSection("--- Ползунки ---")

MainTab:CreateSlider({
   Name = "⚡ WalkSpeed (Скорость)",
   Range = {16, 300},
   Increment = 1,
   CurrentValue = 16,
   Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

MainTab:CreateSlider({
   Name = "🚀 JumpPower (Прыжок)",
   Range = {50, 500},
   Increment = 1,
   CurrentValue = 50,
   Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value end,
})

--- [ SCRIPTS - ВСЕ 9 ССЫЛОК ] ---

ScriptTab:CreateButton({
   Name = "1. Luarmor Loader (Vape/Elite)",
   Callback = function()
       loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/fda9babd071d6b536a745774b6bc681c.lua"))()
   end,
})

ScriptTab:CreateButton({
   Name = "2. Escape Police (Brainrots)",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/EscapePoliceForBrainrots"))()
   end,
})

ScriptTab:CreateButton({
   Name = "3. Get STRONG (Brainrots)",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/GetSTRONGforBrainrots"))()
   end,
})

ScriptTab:CreateButton({
   Name = "4. Swing Obby (Brainrots)",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"))()
   end,
})

ScriptTab:CreateButton({
   Name = "5. Plutonium Loader",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua", true))()
   end,
})

ScriptTab:CreateButton({
   Name = "6. Be a Lucky Block",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"))()
   end,
})

ScriptTab:CreateButton({
   Name = "7. VinzHub Loader",
   Callback = function()
       loadstring(game:HttpGet("https://script.vinzhub.com/loader"))()
   end,
})

ScriptTab:CreateButton({
   Name = "8. Fly for Brainrots",
   Callback = function()
       loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"))()
   end,
})

ScriptTab:CreateButton({
   Name = "9. Infinite Yield (Admin)",
   Callback = function()
       loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
   end,
})

--- [ GLOBAL SCAN ] ---
GlobalTab:CreateToggle({
   Name = "Активировать Ультра-Сканер",
   CurrentValue = false,
   Callback = function(Value)
       Rayfield:Notify({Title = "Scan", Content = Value and "Scanner ON" or "Scanner OFF"})
   end,
})

Rayfield:Notify({ Title = "READY!", Content = "Luarmor Loader добавлен ✅", Duration = 5 })
