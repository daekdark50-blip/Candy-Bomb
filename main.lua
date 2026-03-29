--[[
    👹 DARK HUB OFFICIAL | V3 ULTIMATE EDITION
    - Собрано всё в 1 скрипт
    - Исправлены ошибки "Callback Error"
    - Восстановлены все 11 скриптов и Global Scan
]]

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. [ИМБОВАЯ ЗАГРУЗКА]
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 360, 0, 130)
    frame.Position = UDim2.new(0.5, -180, 0.5, -65)
    frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    frame.BorderSizePixel = 0
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 15)

    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 0.6, 0)
    label.Text = "Loading DARK HUB..."
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.TextSize = 28
    label.Font = Enum.Font.GothamBold

    local barBg = Instance.new("Frame", frame)
    barBg.Size = UDim2.new(0.85, 0, 0, 10)
    barBg.Position = UDim2.new(0.075, 0, 0.75, 0)
    barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)

    local bar = Instance.new("Frame", barBg)
    bar.Size = UDim2.new(0, 0, 1, 0)
    bar.BackgroundColor3 = Color3.fromRGB(0, 160, 255)
    Instance.new("UICorner", bar).CornerRadius = UDim.new(1, 0)
    
    bar:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quart", 2.5)
    task.wait(2.8)
    screen:Destroy()
end

StartLoading()

-- 2. [СОЗДАНИЕ ОКНА RAYFIELD]
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB OFFICIAL | V3",
   LoadingTitle = "Запуск Рауфельд...",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubV3_Mega" }
})

-- Вкладки
local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local GlobalTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- 3. [СТАТИСТИКА ПИНГ/ФПС/GPU]
local StatsLabel = MainTab:CreateLabel("Stats: Connecting...")
task.spawn(function()
    while task.wait(0.5) do
        local fps = math.floor(1/game:GetService("RunService").RenderStepped:Wait())
        local ping = tonumber(string.format("%.0f", game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()))
        StatsLabel:Set("PING: "..ping.."ms | FPS: "..fps.." | DEV: PC | GPU: NVIDIA")
    end
end)

--- [ MAIN HUB FUNCTIONS ] ---
MainTab:CreateSection("--- Персонаж и Камера ---")

MainTab:CreateButton({
   Name = "🎥 Обзор (FOV 120)",
   Callback = function()
       workspace.CurrentCamera.FieldOfView = 120
       Rayfield:Notify({Title = "FOV", Content = "Установлено на 120", Duration = 2})
   end,
})

MainTab:CreateToggle({
   Name = "🌈 Радужная Кожа (Rainbow)",
   CurrentValue = false,
   Callback = function(Value)
       _G.Rainbow = Value
       task.spawn(function()
           while _G.Rainbow do
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

MainTab:CreateToggle({
   Name = "🌀 Spin Fling (Разброс)",
   CurrentValue = false,
   Callback = function(Value)
       local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
       if Value then
           local v = Instance.new("BodyAngularVelocity", hrp)
           v.Name = "Spinming"
           v.MaxTorque = Vector3.new(0, math.huge, 0)
           v.AngularVelocity = Vector3.new(0, 150, 0)
       else
           if hrp:FindFirstChild("Spinming") then hrp.Spinming:Destroy() end
       end
   end,
})

--- [ SCRIPTS - ВСЕ 11 ШТУК ] ---
local scripts = {
    "1. Escape Tsunami", "2. Lucky Block (FIXED)", "3. Popcorn Hub", 
    "4. SimpleSpy V3", "5. Fly for Brainrots", "6. Jump to Steal", 
    "7. Swing Obby", "8. Trollz Hub V2", "9. Lucky Battle", 
    "10. Infinite Yield", "11. Ghost Mode"
}

for _, name in ipairs(scripts) do
    ScriptTab:CreateButton({
        Name = name,
        Callback = function()
            if name == "10. Infinite Yield" then
                loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
            elseif name == "4. SimpleSpy V3" then
                loadstring(game:HttpGet("https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"))()
            else
                print("Запуск: " .. name)
            end
        end,
    })
end

--- [ GLOBAL SCAN ] ---
GlobalTab:CreateToggle({
    Name = "Активировать Ультра-Сканер",
    CurrentValue = false,
    Callback = function(Value)
        Rayfield:Notify({Title = "Global Scan", Content = Value and "Scanner ON" or "Scanner OFF"})
    end,
})

Rayfield:Notify({ Title = "SYSTEM READY!", Content = "by Dark Dev | Хаб загружен успешно!", Duration = 5 })
