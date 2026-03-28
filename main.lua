local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local TweenService = game:GetService("TweenService")

-- 🪓 ТА САМАЯ ЗАГРУЗКА (РАЗРЕЗ)
local Left = Instance.new("Frame", ScreenGui)
Left.Size, Left.BackgroundColor3, Left.ZIndex = UDim2.new(0.5, 0, 1, 0), Color3.new(0,0,0), 10
local Right = Instance.new("Frame", ScreenGui)
Right.Size, Right.Position, Right.BackgroundColor3, Right.ZIndex = UDim2.new(0.5, 0, 1, 0), UDim2.new(0.5, 0, 0, 0), Color3.new(0,0,0), 10

local Killer = Instance.new("ImageLabel", ScreenGui)
Killer.Size, Killer.Position, Killer.AnchorPoint = UDim2.new(0,0,0,0), UDim2.new(0.5,0,0.5,0), Vector2.new(0.5,0.5)
Killer.Image, Killer.BackgroundTransparency, Killer.ZIndex = "rbxassetid://10650742189", 1, 15

-- Анимация появления и удара
TweenService:Create(Killer, TweenInfo.new(0.5, Enum.EasingStyle.Back), {Size = UDim2.new(0.6,0,0.6,0)}):Play()
task.wait(1)
TweenService:Create(Left, TweenInfo.new(0.5), {Position = UDim2.new(-0.5,0,0,0)}):Play()
TweenService:Create(Right, TweenInfo.new(0.5), {Position = UDim2.new(1,0,0,0)}):Play()
TweenService:Create(Killer, TweenInfo.new(0.3), {ImageTransparency = 1}):Play()
task.wait(0.5) ScreenGui:Destroy()

-- 👹 ЗАПУСК RAYFIELD (ПОЛНЫЙ КОМПЛЕКТ)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({Name = "👹 DARK HUB | V10 FINAL", LoadingTitle = "RESTORING...", LoadingSubtitle = "by Dark Dev"})

local MainTab = Window:CreateTab("🌌 Main Hub")
local ScriptTab = Window:CreateTab("📜 Scripts")
local PlayerTab = Window:CreateTab("👁️ Global Scan")

-- 👁️ GLOBAL SCAN (ВЕРНУЛ ВХ)
PlayerTab:CreateButton({
    Name = "👁️ ESP PLAYERS (ВХ АКТИВИРОВАТЬ)",
    Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))() end,
})

-- 📜 SCRIPTS (ВЕРНУЛ ВСЕ 9 ШТУК)
local sList = {
    {"1. Escape Tsunami", "https://raw.githubusercontent.com/Korol1Laguwok/Jez-Scripts/refs/heads/main/Main.lua"},
    {"2. Lucky Block (FIXED)", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
    {"3. Popcorn Hub", "https://pastebin.com/raw/3p8VpDqV"},
    {"4. SimpleSpy V3", "https://raw.githubusercontent.com/78n/SimpleSpy/main/SimpleSpySource.lua"},
    {"5. Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"},
    {"6. Jump to Steal", "https://pastebin.com/raw/rjYv7fS6"},
    {"7. Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
    {"8. Trollz Hub V2", "https://pastebin.com/raw/K9L1yVp0"},
    {"9. Lucky Battle", "https://pastebin.com/raw/9LkB0tV"}
}
for _, s in pairs(sList) do
    ScriptTab:CreateButton({Name = s[1], Callback = function() loadstring(game:HttpGet(s[2]))() end})
end

-- 🌌 MAIN HUB (FOV И ФУНКЦИИ)
MainTab:CreateSlider({
    Name = "🎥 FOV (Обзор 120)", Range = {70, 120}, Increment = 1, CurrentValue = 70,
    Callback = function(v) workspace.CurrentCamera.FieldOfView = v end,
})
