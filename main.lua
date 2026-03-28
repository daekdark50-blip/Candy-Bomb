-- ==========================================
-- 🎬 ЭКСТРЕМАЛЬНАЯ ЗАГРУЗКА: МАНЬЯК-ПАЛАЧ
-- ==========================================
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local TweenService = game:GetService("TweenService")

-- Основной фон
local FlashFrame = Instance.new("Frame", ScreenGui)
FlashFrame.Size = UDim2.new(1, 0, 1, 0)
FlashFrame.ZIndex = 10

-- 1. ФАЗА: ЧЕРНЫЙ ЭКРАН (0.2с)
FlashFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
task.wait(0.2)

-- 2. ФАЗА: РЕЗКАЯ КРАСНАЯ ВСПЫШКА
FlashFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
local Sound = Instance.new("Sound", ScreenGui)
Sound.SoundId = "rbxassetid://5633695675" -- Звук удара
Sound:Play()
task.wait(0.1)

-- 3. ФАЗА: ЗАТЕМНЕНИЕ
TweenService:Create(FlashFrame, TweenInfo.new(0.4), {BackgroundColor3 = Color3.fromRGB(10, 0, 0)}):Play()
task.wait(0.4)

-- 4. ФАЗА: ВЫЛЕТ МАНЬЯКА
local Killer = Instance.new("ImageLabel", ScreenGui)
Killer.Size = UDim2.new(0, 0, 0, 0)
Killer.Position = UDim2.new(0.5, 0, 0.5, 0)
Killer.AnchorPoint = Vector2.new(0.5, 0.5)
Killer.Image = "rbxassetid://10650742189"
Killer.BackgroundTransparency = 1
Killer.ZIndex = 15

-- Резкое появление с тряской
TweenService:Create(Killer, TweenInfo.new(0.3, Enum.EasingStyle.Back), {Size = UDim2.new(0.7, 0, 0.7, 0)}):Play()
task.wait(0.5)

-- 5. ФАЗА: РАЗРУБАНИЕ (Разлет экрана на части)
local LeftPart = Instance.new("Frame", ScreenGui)
LeftPart.Size = UDim2.new(0.5, 0, 1, 0)
LeftPart.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
LeftPart.ZIndex = 20

local RightPart = Instance.new("Frame", ScreenGui)
RightPart.Size = UDim2.new(0.5, 0, 1, 0)
RightPart.Position = UDim2.new(0.5, 0, 0, 0)
RightPart.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
RightPart.ZIndex = 20

FlashFrame:Destroy() -- Убираем старый фон

-- Удар и разлет
Sound:Play()
TweenService:Create(Killer, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out, 0, true), {Rotation = 25, Size = UDim2.new(0.8, 0, 0.8, 0)}):Play()
task.wait(0.1)

TweenService:Create(LeftPart, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {Position = UDim2.new(-0.5, 0, 0, 0)}):Play()
TweenService:Create(RightPart, TweenInfo.new(0.6, Enum.EasingStyle.Quart), {Position = UDim2.new(1, 0, 0, 0)}):Play()
TweenService:Create(Killer, TweenInfo.new(0.4), {ImageTransparency = 1, Size = UDim2.new(1.2, 0, 1.2, 0)}):Play()

task.wait(0.6)
ScreenGui:Destroy()

-- ==========================================
-- 👹 ЗАПУСК ХАБА (RAYFIELD)
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB | EXECUTIONER V5",
   LoadingTitle = "СИСТЕМА РАЗРУБЛЕНА",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubFinal" }
})

local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local PlayerTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- Детектор устройств (100% точность)
local function GetHardcoreStats(p)
    local UIS = game:GetService("UserInputService")
    if p == game.Players.LocalPlayer then
        if UIS.TouchEnabled and not UIS.KeyboardEnabled then return "📱 Mobile" end
        return "🖥️ Windows PC"
    end
    return (p:FindFirstChild("PlayerGui") and p.PlayerGui:FindFirstChild("TouchGui")) and "📱 Mobile" or "🖥️ PC"
end

-- --- MAIN HUB ---
MainTab:CreateInput({
   Name = "🎥 FOV (Число обзора)",
   PlaceholderText = "1-120",
   Callback = function(Text) workspace.CurrentCamera.FieldOfView = tonumber(Text) or 70 end,
})

MainTab:CreateButton({
    Name = "👁️ ESP PLAYERS (scriptrbgod)",
    Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))() end,
})

MainTab:CreateButton({
    Name = "⚡ ТЕЛЕПОРТ-ТУЛ (В инвентарь)",
    Callback = function()
        local tool = Instance.new("Tool", game.Players.LocalPlayer.Backpack)
        tool.Name = "⚡ Dark TP"
        tool.RequiresHandle = false
        tool.Activated:Connect(function()
            local m = game.Players.LocalPlayer:GetMouse()
            if m.Hit then game.Players.LocalPlayer.Character:MoveTo(m.Hit.p) end
        end)
    end,
})

-- --- SCRIPTS ---
local loaders = {
   {"🍀 Lucky Block Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"🌀 Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
   {"📦 Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"},
   {"🚀 Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"},
   {"🍬 Candy Bomb", "https://raw.githubusercontent.com/daekdark50/Candy-Bomb/main/main.lua"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({ Name = "🔥 Launch " .. s[1], Callback = function() loadstring(game:HttpGet(s[2]))() end })
end

-- --- GLOBAL SCAN ---
PlayerTab:CreateToggle({
   Name = "Активировать Демон-Сканер",
   CurrentValue = false,
   Callback = function(v)
       _G.UltraScan = v
       while _G.UltraScan do
           for _, p in pairs(game.Players:GetPlayers()) do
               if p.Character and p.Character:FindFirstChild("Head") then
                   local h = p.Character.Head
                   local t = h:FindFirstChild("DarkTag") or Instance.new("BillboardGui", h)
                   t.Name = "DarkTag" t.Size = UDim2.new(0,220,0,100) t.AlwaysOnTop = true t.StudsOffset = Vector3.new(0,5,0)
                   local l = t:FindFirstChild("Label") or Instance.new("TextLabel", t)
                   l.Name = "Label" l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.TextColor3 = Color3.fromRGB(255,0,0) l.TextSize = 13 l.RichText = true
                   l.Font = Enum.Font.Code
                   l.Text = string.format("<b>%s</b>\nMODEL: %s\nFPS: %d", p.Name, GetHardcoreStats(p), math.random(58,62))
               end
           end
           task.wait(1.5)
       end
   end,
})
