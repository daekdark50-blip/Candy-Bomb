-- ==========================================
-- 🌀 ПРИНУДИТЕЛЬНАЯ ЗАГРУЗКА (БЕЗ ОБРЫВОВ)
-- ==========================================
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local TweenService = game:GetService("TweenService")

local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(1, 0, 1, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.ZIndex = 10

local Killer = Instance.new("ImageLabel", ScreenGui)
Killer.Size = UDim2.new(0.6, 0, 0.6, 0)
Killer.Position = UDim2.new(0.5, 0, 0.5, 0)
Killer.AnchorPoint = Vector2.new(0.5, 0.5)
Killer.Image = "rbxassetid://10650742189"
Killer.BackgroundTransparency = 1
Killer.ZIndex = 15

-- 1. ЦИКЛ ВРАЩЕНИЯ (6 СЕКУНД)
local rot = TweenService:Create(Killer, TweenInfo.new(0.3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1), {Rotation = 360})
rot:Play()
TweenService:Create(Killer, TweenInfo.new(6, Enum.EasingStyle.Sine), {Size = UDim2.new(0,0,0,0)}):Play()
task.wait(6) 
rot:Stop()

-- 2. ЦВЕТОВОЙ ВЗРЫВ (10 ЦВЕТОВ ЗА 3 СЕКУНДЫ)
Killer:Destroy()
local colors = {
    Color3.fromRGB(0,0,0), Color3.fromRGB(255,0,0), Color3.fromRGB(255,255,255), 
    Color3.fromRGB(255,0,0), Color3.fromRGB(0,0,255), Color3.fromRGB(255,255,0),
    Color3.fromRGB(0,255,0), Color3.fromRGB(255,0,255), Color3.fromRGB(0,255,255), Color3.fromRGB(255,165,0)
}
for i = 1, #colors do
    MainFrame.BackgroundColor3 = colors[i]
    task.wait(0.3) 
end
ScreenGui:Destroy()

-- ==========================================
-- 👹 ТОЛЬКО ТЕПЕРЬ ЗАПУСКАЕМ RAYFIELD
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB | V9 FINAL",
   LoadingTitle = "СИСТЕМА РАЗРУБЛЕНА",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubV9" }
})

-- Вкладки и функции по твоим скринам
local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)

MainTab:CreateSlider({
   Name = "🎥 FOV (Обзор 120)",
   Range = {70, 120},
   Increment = 1,
   Suffix = "studs",
   CurrentValue = 70,
   Callback = function(v) workspace.CurrentCamera.FieldOfView = v end,
})

-- Список из 9 скриптов
local loaders = {
   {"1. Escape Tsunami", "https://raw.githubusercontent.com/Korol1Laguwok/Jez-Scripts/refs/heads/main/Main.lua"},
   {"2. Lucky Block (FIXED)", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"3. Popcorn Hub", "link"}, {"4. SimpleSpy V3", "link"}, {"5. Fly for Brainrots", "link"},
   {"6. Jump to Steal", "link"}, {"7. Swing Obby", "link"}, {"8. Trollz Hub V2", "link"}, {"9. Lucky Battle", "link"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({ Name = s[1], Callback = function() loadstring(game:HttpGet(s[2]))() end })
end
