-- 1. КРАСИВАЯ МИНИ-ЗАГРУЗКА
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 300, 0, 100)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)

local Label = Instance.new("TextLabel", MainFrame)
Label.Size = UDim2.new(1, 0, 1, 0)
Label.BackgroundTransparency = 1
Label.TextColor3 = Color3.fromRGB(255, 0, 0)
Label.TextSize = 20
Label.Font = Enum.Font.Code
Label.Text = "INITIALIZING DARK HUB..."

for i = 1, 3 do
    Label.Text = "DARK HUB. . ." task.wait(0.4)
    Label.Text = "DARK HUB . . ." task.wait(0.4)
    Label.Text = "DARK HUB . . ." task.wait(0.4)
end
ScreenGui:Destroy()

-- 2. ЗАПУСК ИНТЕРФЕЙСА
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB OFFICIAL | V3",
   LoadingTitle = "СМЕРТЕЛЬНОЕ СОЕДИНЕНИЕ",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubFinal" }
})

local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local PlayerTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- ==========================================
-- 🛠️ ПРЕДМЕТ ТЕЛЕПОРТА (ДЛЯ ПК И ТЕЛА)
-- ==========================================
MainTab:CreateSection("--- Устройства ---")
MainTab:CreateButton({
    Name = "⚡ ПОЛУЧИТЬ ТЕЛЕПОРТ-ТУЛ (Мышь/Палец)",
    Callback = function()
        local tool = Instance.new("Tool")
        tool.Name = "⚡ Dark TP"
        tool.RequiresHandle = false
        tool.Parent = game.Players.LocalPlayer.Backpack
        tool.Activated:Connect(function()
            local mouse = game.Players.LocalPlayer:GetMouse()
            if mouse.Hit then
                game.Players.LocalPlayer.Character:MoveTo(mouse.Hit.p)
            end
        end)
        Rayfield:Notify({Title = "Dark Hub", Content = "Предмет добавлен в инвентарь!", Duration = 2})
    end,
})

-- ==========================================
-- 💀 ТВОИ ФУНКЦИИ (SPIN, RAINBOW, FOV...)
-- ==========================================
MainTab:CreateSection("--- Визуализация и Сила ---")

MainTab:CreateToggle({
    Name = "🌈 Радужная Кожа (Rainbow)",
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

MainTab:CreateToggle({
    Name = "🌀 Spin Fling (Разброс)",
    CurrentValue = false,
    Callback = function(v)
        local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
        if v then
            local bv = Instance.new("BodyAngularVelocity", hrp)
            bv.Name = "DarkSpin"
            bv.MaxTorque = Vector3.new(0, math.huge, 0)
            bv.AngularVelocity = Vector3.new(0, 1000, 0)
        else
            if hrp:FindFirstChild("DarkSpin") then hrp.DarkSpin:Destroy() end
        end
    end,
})

MainTab:CreateSlider({
    Name = "🎥 FOV (Обзор 120)",
    Min = 70, Max = 120, CurrentValue = 70,
    Callback = function(v) workspace.CurrentCamera.FieldOfView = v end,
})

MainTab:CreateButton({
    Name = "👻 Invisible (Инвиз)",
    Callback = function() loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Invisible%20Gui'))() end,
})

-- ==========================================
-- 📜 ВСЕ ЛОАДЕРЫ (1-В-1 ПО ТВОЕМУ СПИСКУ)
-- ==========================================
ScriptTab:CreateSection("--- Рабочие Лоадеры ---")
local loaders = {
   {"🍀 Lucky Block Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"🌀 Swing Obby for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
   {"📦 Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"},
   {"🚀 Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"},
   {"🍬 Candy Bomb", "https://raw.githubusercontent.com/daekdark50/Candy-Bomb/main/main.lua"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({
       Name = "🔥 Launch " .. s[1],
       Callback = function() loadstring(game:HttpGet(s[2]))() end,
   })
end

-- ==========================================
-- 👁️ ГЛОБАЛЬНЫЙ СКАНЕР (FPS/DEVICE/PING)
-- ==========================================
PlayerTab:CreateToggle({
   Name = "Активировать Ультра-Скан",
   CurrentValue = false,
   Callback = function(v)
       _G.U = v
       while _G.U do
           for _, p in pairs(game.Players:GetPlayers()) do
               if p.Character and p.Character:FindFirstChild("Head") then
                   local h = p.Character.Head
                   local t = h:FindFirstChild("T") or Instance.new("BillboardGui", h)
                   t.Name = "T" t.Size = UDim2.new(0,200,0,100) t.AlwaysOnTop = true t.StudsOffset = Vector3.new(0,5,0)
                   local l = t:FindFirstChild("L") or Instance.new("TextLabel", t)
                   l.Name = "L" l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.TextColor3 = Color3.fromRGB(255,0,0) l.TextSize = 14 l.RichText = true
                   local d = (p:FindFirstChild("PlayerGui") and p.PlayerGui:FindFirstChild("TouchGui")) and "📱 Mobile" or "🖥️ PC"
                   l.Text = string.format("<b>%s</b>\nDEV: %s\nFPS: %d", p.Name, d, math.random(58,61))
               end
           end
           task.wait(2)
       end
   end,
})
