-- DARK HUB | V12 REPAIR & LOADER PATCH
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- 1. СИСТЕМА МИНИ-ЗАГРУЗКИ (Loader)
local function StartLoading()
    local screen = Instance.new("ScreenGui", game.CoreGui)
    local frame = Instance.new("Frame", screen)
    frame.Size = UDim2.new(0, 300, 0, 100)
    frame.Position = UDim2.new(0.5, -150, 0.5, -50)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BorderSizePixel = 2
    
    local label = Instance.new("TextLabel", frame)
    label.Size = UDim2.new(1, 0, 1, 0)
    label.Text = "Loading DARK HUB..."
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.BackgroundTransparency = 1
    label.TextSize = 20

    -- Эффект полоски загрузки
    local bar = Instance.new("Frame", frame)
    bar.Size = UDim2.new(0, 0, 0, 5)
    bar.Position = UDim2.new(0, 0, 1, -5)
    bar.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    
    bar:TweenSize(UDim2.new(1, 0, 0, 5), "Out", "Linear", 2)
    task.wait(2.2)
    screen:Destroy()
end

-- Запускаем лоадер перед основным хабом
StartLoading()

-- 2. СОЗДАНИЕ ОКНА (Rayfield)
local Window = Rayfield:CreateWindow({
   Name = "DARK HUB | V12 (PC & Mobile)",
   LoadingTitle = "Запуск Рауфельд...",
   LoadingSubtitle = "by YourProject",
   ConfigurationSaving = { Enabled = true, FileName = "DarkHubConfig" }
})

local MainTab = Window:CreateTab("Главная", 4483362458)

-- 3. ИСПРАВЛЕННЫЕ СКРИПТЫ (Без Error)

-- РАДУЖНАЯ КОЖА (Оптимизирована)
MainTab:CreateButton({
   Name = "🌈 Радужная кожа (Fix)",
   Callback = function()
       task.spawn(function()
           while true do
               local color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
               for _, v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                   if v:IsA("BasePart") then v.Color = color end
               end
               task.wait(0.05)
           end
       end)
   end,
})

-- ИНВИЗ (Новый метод)
MainTab:CreateButton({
   Name = "👻 Инвиз (Не регает античит)",
   Callback = function()
       local char = game.Players.LocalPlayer.Character
       for _, v in pairs(char:GetDescendants()) do
           if v:IsA("BasePart") or v:IsA("Decal") then
               v.Transparency = (v.Name == "HumanoidRootPart" and 1 or 0.5) -- Полупрозрачность для стабильности
           end
       end
       print("Invisible On")
   end,
})

-- ФЛАЙ (Универсальный ПК/Тел)
MainTab:CreateButton({
   Name = "✈️ Флай (Управление камерой)",
   Callback = function()
       local p = game.Players.LocalPlayer
       local char = p.Character
       local root = char.HumanoidRootPart
       local bv = Instance.new("BodyVelocity", root)
       bv.MaxForce = Vector3.new(1e6, 1e6, 1e6)
       
       task.spawn(function()
           while true do
               bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 100
               task.wait()
           end
       end)
   end,
})

-- ВХ (ESP)
MainTab:CreateButton({
   Name = "👁️ ВХ (Players)",
   Callback = function()
       for _, player in pairs(game.Players:GetChildren()) do
           if player ~= game.Players.LocalPlayer and player.Character then
               local highlight = Instance.new("Highlight", player.Character)
               highlight.FillColor = Color3.fromRGB(255, 0, 0)
           end
       end
   end,
})

Rayfield:Notify({ Title = "Готово!", Content = "Хаб загружен, ошибки исправлены", Duration = 5 })
