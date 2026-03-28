-- ==========================================
-- 🌀 УЛЬТРА-ЗАГРУЗКА: РАЗРЕЗ, ДЫРА И ВСПЫШКИ
-- ==========================================
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local TweenService = game:GetService("TweenService")

-- Основной холст
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0

-- Картинка маньяка
local Killer = Instance.new("ImageLabel", ScreenGui)
Killer.Size = UDim2.new(0.6, 0, 0.6, 0)
Killer.Position = UDim2.new(0.5, 0, 0.5, 0)
Killer.AnchorPoint = Vector2.new(0.5, 0.5)
Killer.Image = "rbxassetid://10650742189"
Killer.BackgroundTransparency = 1
Killer.ZIndex = 15

-- Звук
local Sound = Instance.new("Sound", ScreenGui)
Sound.SoundId = "rbxassetid://5633695675"

-- --- ЦИКЛ АНИМАЦИИ ---

-- 1. УДАР И НАЧАЛО ВРАЩЕНИЯ (Черная дыра)
task.wait(0.2)
Sound:Play()
local voidInfo = TweenInfo.new(1.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
TweenService:Create(Killer, voidInfo, {Rotation = 1080, Size = UDim2.new(0, 0, 0, 0)}):Play()
TweenService:Create(MainFrame, voidInfo, {Rotation = 360, Size = UDim2.new(0, 0, 0, 0), Position = UDim2.new(0.5,0,0.5,0)}):Play()
task.wait(1.2)

-- 2. СЕРИЯ ИЗ 6 ЦВЕТОВ (Вспышки)
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.Position = UDim2.new(0, 0, 0, 0)
MainFrame.Rotation = 0

local colors = {
    Color3.fromRGB(0, 0, 0),    -- Черный
    Color3.fromRGB(255, 0, 0),  -- Красный
    Color3.fromRGB(255, 255, 255), -- Белый
    Color3.fromRGB(255, 0, 0),  -- Еще раз Красный
    Color3.fromRGB(0, 0, 255),  -- Синий
    Color3.fromRGB(255, 255, 0)  -- Желтый
}

for _, color in pairs(colors) do
    MainFrame.BackgroundColor3 = color
    task.wait(0.08) -- Очень быстрая смена
end

ScreenGui:Destroy()

-- ==========================================
-- 👹 ЗАПУСК ХАБА (RAYFIELD)
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB | EXECUTIONER V6",
   LoadingTitle = "ВОЙД АКТИВИРОВАН",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubV6" }
})

-- Создаем вкладки (как на твоем видео)
local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local PlayerTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- --- ФУНКЦИИ ИЗ ТВОЕГО СКРИНШОТА ---
MainTab:CreateToggle({
   Name = "🌈 РАДУЖНАЯ КОЖА (Rainbow Skin)",
   CurrentValue = false,
   Callback = function(Value)
       _G.RainbowSkin = Value
       while _G.RainbowSkin do
           local c = game.Players.LocalPlayer.Character
           if c then
               for _, p in pairs(c:GetChildren()) do
                   if p:IsA("BasePart") then p.Color = Color3.fromHSV(tick()%5/5,1,1) end
               end
           end
           task.wait()
       end
   end,
})

MainTab:CreateSlider({
   Name = "🎥 FOV (Обзор 120)",
   Range = {70, 120},
   Increment = 1,
   Suffix = "studs",
   CurrentValue = 70,
   Callback = function(Value) workspace.CurrentCamera.FieldOfView = Value end,
})

-- Вкладка со скриптами (наполнение как в видео)
local loaders = {
   {"🌊 Escape Tsunami", "https://pastebin.com/raw/example1"},
   {"🍀 Lucky Block (FIXED)", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"🍿 Popcorn Hub", "https://pastebin.com/raw/example3"},
   {"🕵️ SimpleSpy V3", "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"},
   {"🚀 Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({ Name = s[1], Callback = function() loadstring(game:HttpGet(s[2]))() end })
end
