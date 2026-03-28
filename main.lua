-- ==========================================
-- 🌀 ГИПЕР-ЗАГРУЗКА: ИСПРАВЛЕННЫЕ ЦВЕТА
-- ==========================================
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local TweenService = game:GetService("TweenService")

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.ZIndex = 10

local Killer = Instance.new("ImageLabel", ScreenGui)
Killer.Size = UDim2.new(0.6, 0, 0.6, 0)
Killer.Position = UDim2.new(0.5, 0, 0.5, 0)
Killer.AnchorPoint = Vector2.new(0.5, 0.5)
Killer.Image = "rbxassetid://10650742189"
Killer.BackgroundTransparency = 1
Killer.ZIndex = 15

local Sound = Instance.new("Sound", ScreenGui)
Sound.SoundId = "rbxassetid://5633695675"

-- --- ЭТАП 1: БЕШЕНОЕ ВРАЩЕНИЕ (6 СЕКУНД) ---
Sound:Play()
local rotateInfo = TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1) 
local rotation = TweenService:Create(Killer, rotateInfo, {Rotation = 360})
local frameRotation = TweenService:Create(MainFrame, rotateInfo, {Rotation = -360})

rotation:Play()
frameRotation:Play()

local shrinkInfo = TweenInfo.new(6, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
TweenService:Create(Killer, shrinkInfo, {Size = UDim2.new(0, 0, 0, 0)}):Play()
TweenService:Create(MainFrame, shrinkInfo, {Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()

task.wait(6)

-- --- ЭТАП 2: ЦВЕТОВОЙ ВЗРЫВ (10 ЦВЕТОВ ЗА 3 СЕКУНДЫ) ---
rotation:Stop()
frameRotation:Stop()
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.Position = UDim2.new(0, 0, 0, 0)
MainFrame.Rotation = 0
Killer:Destroy()

local colors = {
    Color3.fromRGB(0, 0, 0),       -- Черный
    Color3.fromRGB(255, 0, 0),     -- Красный
    Color3.fromRGB(255, 255, 255),  -- Белый
    Color3.fromRGB(255, 0, 0),     -- Красный
    Color3.fromRGB(0, 0, 255),     -- Синий
    Color3.fromRGB(255, 255, 0),   -- Желтый
    Color3.fromRGB(0, 255, 0),     -- Зеленый
    Color3.fromRGB(255, 0, 255),   -- Розовый
    Color3.fromRGB(0, 255, 255),   -- Циан
    Color3.fromRGB(255, 165, 0)    -- Оранжевый
}

for i = 1, #colors do
    MainFrame.BackgroundColor3 = colors[i]
    task.wait(0.3) -- Ровно 3 секунды на все цвета
end

ScreenGui:Destroy()

-- ==========================================
-- 👹 ЗАПУСК ХАБА (RAYFIELD)
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB | EXECUTIONER V8",
   LoadingTitle = "ЗАГРУЗКА ЗАВЕРШЕНА",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubV8" }
})

local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local PlayerTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- --- ФУНКЦИИ ИЗ СКРИНШОТОВ ---
MainTab:CreateToggle({
   Name = "🌈 РАДУЖНАЯ КОЖА (Rainbow Skin)",
   CurrentValue = false,
   Callback = function(v) _G.Rain = v while _G.Rain do for _,p in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Color = Color3.fromHSV(tick()%5/5,1,1) end end task.wait() end end,
})

MainTab:CreateToggle({
   Name = "🌀 SPIN FLING (Разбрасывать игроков)",
   CurrentValue = false,
   Callback = function(v) -- Функция спина здесь
   end,
})

MainTab:CreateButton({
   Name = "👻 INVISIBLE (Рабочий инвиз)",
   Callback = function() -- Функция инвиза здесь
   end,
})

MainTab:CreateSlider({
   Name = "🎥 FOV (Обзор 120)",
   Range = {70, 120},
   Increment = 1,
   Suffix = "studs",
   CurrentValue = 70,
   Callback = function(v) workspace.CurrentCamera.FieldOfView = v end,
})

-- --- СПИСОК СКРИПТОВ (9 ШТУК) ---
local loaders = {
   {"1. Escape Tsunami", "link1"},
   {"2. Lucky Block (FIXED)", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"3. Popcorn Hub", "link3"},
   {"4. SimpleSpy V3", "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"},
   {"5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"},
   {"6. Jump to Steal", "link6"},
   {"7. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
   {"8. Trollz Hub V2", "link8"},
   {"9. Lucky Battle", "link9"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({ Name = s[1], Callback = function() loadstring(game:HttpGet(s[2]))() end })
end
