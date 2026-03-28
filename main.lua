-- ==========================================
-- ✨ ЧИСТАЯ И КРАСИВАЯ ЗАГРУЗКА
-- ==========================================
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local TweenService = game:GetService("TweenService")

local BG = Instance.new("Frame", ScreenGui)
BG.Size = UDim2.new(1, 0, 1, 0)
BG.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BG.ZIndex = 10

local Killer = Instance.new("ImageLabel", ScreenGui)
Killer.Size = UDim2.new(0, 0, 0, 0)
Killer.Position = UDim2.new(0.5, 0, 0.5, 0)
Killer.AnchorPoint = Vector2.new(0.5, 0.5)
Killer.Image = "rbxassetid://10650742189" -- Твой маньяк
Killer.BackgroundTransparency = 1
Killer.ZIndex = 15

-- 1. Красивое появление маньяка
TweenService:Create(Killer, TweenInfo.new(0.8, Enum.EasingStyle.Back), {Size = UDim2.new(0.6, 0, 0.6, 0)}):Play()
task.wait(1.5)

-- 2. Плавное исчезновение всего лоадера
TweenService:Create(Killer, TweenInfo.new(0.5), {ImageTransparency = 1}):Play()
TweenService:Create(BG, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
task.wait(0.5)
ScreenGui:Destroy()

-- ==========================================
-- 👹 ЗАПУСК RAYFIELD (ВСЕ ФУНКЦИИ ВЕРНУЛ)
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB | OFFICIAL V3",
   LoadingTitle = "ДОБРО ПОЖАЛОВАТЬ",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubOfficial" }
})

-- Вкладки как на твоих скринах
local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local PlayerTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- Основные функции
MainTab:CreateToggle({
   Name = "🌈 РАДУЖНАЯ КОЖА (Rainbow Skin)",
   CurrentValue = false,
   Callback = function(v) _G.Rain = v while _G.Rain do for _,p in pairs(game.Players.LocalPlayer.Character:GetChildren()) do if p:IsA("BasePart") then p.Color = Color3.fromHSV(tick()%5/5,1,1) end end task.wait() end end,
})

MainTab:CreateSlider({
   Name = "🎥 FOV (Обзор 120)",
   Range = {70, 120},
   Increment = 1,
   Suffix = "studs",
   CurrentValue = 70,
   Callback = function(v) workspace.CurrentCamera.FieldOfView = v end,
})

-- Твой список скриптов
local loaders = {
   {"1. Escape Tsunami", "https://raw.githubusercontent.com/Korol1Laguwok/Jez-Scripts/refs/heads/main/Main.lua"},
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
   ScriptTab:CreateButton({ Name = s[1], Callback = function() loadstring(game:HttpGet(s[2])) end })
end
