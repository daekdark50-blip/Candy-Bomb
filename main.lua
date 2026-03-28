-- ==========================================
-- 🪓 УНИКАЛЬНАЯ ЗАГРУЗКА: МАНЬЯК С ТОПОРОМ
-- ==========================================
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Audio = Instance.new("Sound", ScreenGui)
Audio.SoundId = "rbxassetid://5633695675" -- Звук удара/страха
Audio:Play()

local DarkFrame = Instance.new("Frame", ScreenGui)
DarkFrame.Size = UDim2.new(1, 0, 1, 0)
DarkFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
DarkFrame.ZIndex = 10

local KillerImg = Instance.new("ImageLabel", DarkFrame)
KillerImg.Size = UDim2.new(0, 0, 0, 0) -- Начинаем с нуля для анимации
KillerImg.Position = UDim2.new(0.5, 0, 0.5, 0)
KillerImg.AnchorPoint = Vector2.new(0.5, 0.5)
KillerImg.Image = "rbxassetid://10650742189" -- ID маньяка с топором
KillerImg.BackgroundTransparency = 1
KillerImg.ZIndex = 11

-- Анимация появления (Резкий выпад на весь экран)
KillerImg:TweenSize(UDim2.new(0.8, 0, 0.8, 0), "Out", "Bounce", 0.5)
task.wait(1.5)

-- Эффект «Разреза» и исчезновение
KillerImg:TweenPosition(UDim2.new(0.5, 0, 1.5, 0), "In", "Back", 0.5)
task.wait(0.5)
ScreenGui:Destroy()

-- ==========================================
-- 💀 ЗАПУСК RAYFIELD
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB | EXECUTIONER V3",
   LoadingTitle = "СМЕРТЕЛЬНЫЙ ПРИГОВОР...",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubKiller" }
})

local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local PlayerTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- ==========================================
-- 🛠️ УЛЬТРА-ДЕТЕКТОР (100% ВИДИМОСТЬ ЖЕЛЕЗА)
-- ==========================================
local function GetHardcoreStats(p)
    local UIS = game:GetService("UserInputService")
    local model = "🖥️ Windows PC"
    if UIS.TouchEnabled then
        model = (UIS.AccelerometerEnabled) and "📱 Mobile (Android/iOS)" or "📱 Tablet"
    end
    if p ~= game.Players.LocalPlayer then
        local hasTouch = p:FindFirstChild("PlayerGui") and p.PlayerGui:FindFirstChild("TouchGui")
        model = hasTouch and "📱 Mobile User" or "🖥️ Desktop User"
    end
    return model
end

-- ==========================================
-- 🌌 MAIN HUB (FOV, RAINBOW, ESP)
-- ==========================================
MainTab:CreateSection("--- Визуальные Пытки ---")

MainTab:CreateInput({
   Name = "🎥 FOV (Число обзора)",
   PlaceholderText = "Пример: 120",
   Callback = function(Text) workspace.CurrentCamera.FieldOfView = tonumber(Text) or 70 end,
})

MainTab:CreateButton({
    Name = "👁️ ESP PLAYERS (scriptrbgod)",
    Callback = function() 
        loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))() 
    end,
})

MainTab:CreateToggle({
    Name = "🌈 Радужный Персонаж",
    CurrentValue = false,
    Callback = function(v)
        _G.Rain = v
        task.spawn(function()
            while _G.Rain do
                for _, part in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if part:IsA("BasePart") then part.Color = Color3.fromHSV(tick()%5/5, 1, 1) end
                end
                task.wait(0.1)
            end
        end)
    end,
})

-- ==========================================
-- 📜 SCRIPTS (ПОЛНЫЙ СПИСОК ЛОАДЕРОВ)
-- ==========================================
ScriptTab:CreateSection("--- Твои Смертельные Лоадеры ---")
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

-- ==========================================
-- 👁️ GLOBAL SCAN (СМЕРТЕЛЬНОЕ СОЕДИНЕНИЕ)
-- ==========================================
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
                   t.Name = "DarkTag" t.Size = UDim2.new(0,220,0,120) t.AlwaysOnTop = true t.StudsOffset = Vector3.new(0,5,0)
                   local l = t:FindFirstChild("Label") or Instance.new("TextLabel", t)
                   l.Name = "Label" l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.TextColor3 = Color3.fromRGB(255,0,0) l.TextSize = 13 l.RichText = true
                   l.Font = Enum.Font.Code
                   local dev = GetHardcoreStats(p)
                   l.Text = string.format("<b>%s</b>\nMODEL: %s\nSTATUS: <font color='#00ff00'>TRACKED</font>", p.Name, dev)
               end
           end
           task.wait(1.5)
       end
       if not v then for _, p in pairs(game.Players:GetPlayers()) do if p.Character and p.Character.Head:FindFirstChild("DarkTag") then p.Character.Head.DarkTag:Destroy() end end end
   end,
})
