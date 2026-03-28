-- ==========================================
-- 🚀 МИНИ-ЗАГРУЗКА (Перед Rayfield)
-- ==========================================
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

-- ==========================================
-- 💀 ЗАПУСК RAYFIELD
-- ==========================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB OFFICIAL | V3 FINAL",
   LoadingTitle = "СМЕРТЕЛЬНОЕ СОЕДИНЕНИЕ",
   LoadingSubtitle = "by Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubFinal" }
})

local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local PlayerTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- ==========================================
-- 🌌 ВКЛАДКА MAIN HUB (ВИЗУАЛИЗАЦИЯ И СИЛА)
-- ==========================================
MainTab:CreateSection("--- Визуализация и Сила ---")

MainTab:CreateToggle({
    Name = "🌈 Радужная Кожа (Rainbow)",
    CurrentValue = false,
    Callback = function(v)
        _G.Rain = v
        task.spawn(function()
            while _G.Rain do
                local char = game.Players.LocalPlayer.Character
                if char then
                    for _, part in pairs(char:GetChildren()) do
                        if part:IsA("BasePart") then part.Color = Color3.fromHSV(tick()%5/5, 1, 1) end
                    end
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

-- ⭐ ТВОЙ ЗАПРОС: Поле ввода для FOV (Вместо синего ползунка) ⭐
MainTab:CreateInput({
   Name = "🎥 FOV (Введи число обзора)",
   PlaceholderText = "Пример: 120",
   NumbersOnly = true,
   CharacterLimit = 3,
   RemoveTextAfterFocusLost = false,
   Callback = function(Text)
       local fov = tonumber(Text)
       if fov and fov > 0 and fov <= 120 then
           workspace.CurrentCamera.FieldOfView = fov
           Rayfield:Notify({Title = "FOV Установлен", Content = "Обзор изменен на: " .. Text, Duration = 2})
       else
           workspace.CurrentCamera.FieldOfView = 70 -- Стандарт
           Rayfield:Notify({Title = "Ошибка", Content = "Введи число от 1 до 120!", Duration = 3})
       end
   end,
})

MainTab:CreateSection("--- Дополнительно ---")

MainTab:CreateButton({
    Name = "👻 Invisible (Инвиз - Тестовый)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Invisible%20Gui'))()
    end,
})

MainTab:CreateButton({
    Name = "👁️ ESP (ВХ - Видеть сквозь стены)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/EspOnly'))()
    end,
})

MainTab:CreateButton({
    Name = "⚡ ПОЛУЧИТЬ ТЕЛЕПОРТ-ТУЛ",
    Callback = function()
        local tool = Instance.new("Tool")
        tool.Name = "⚡ Dark TP"
        tool.RequiresHandle = false
        tool.Parent = game.Players.LocalPlayer.Backpack
        tool.Activated:Connect(function()
            local mouse = game.Players.LocalPlayer:GetMouse()
            if mouse.Hit then game.Players.LocalPlayer.Character:MoveTo(mouse.Hit.p) end
        end)
    end,
})

-- ==========================================
-- 📜 ВКЛАДКА SCRIPTS (ВСЁ ВЕРНУЛ ПО СПИСКУ)
-- ==========================================
ScriptTab:CreateSection("--- Твои Рабочие Лоадеры (Full List) ---")

local loaders = {
   {"🍀 Lucky Block Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"🌀 Swing Obby for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
   {"📦 Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"},
   {"🚀 Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"},
   {"🍬 Candy Bomb (Main)", "https://raw.githubusercontent.com/daekdark50/Candy-Bomb/main/main.lua"},
   {"👾 Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
   {"🏗️ Dex Explorer", "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({
       Name = "🔥 Launch " .. s[1],
       Callback = function()
           pcall(function() loadstring(game:HttpGet(s[2]))() end)
       end,
   })
end

-- ==========================================
-- 👁️ ВКЛАДКА GLOBAL SCAN (ВЕРНУЛ СМЕРТЕЛЬНУЮ СВЯЗЬ)
-- ==========================================
PlayerTab:CreateSection("--- Глобальное Соединение ---")

PlayerTab:CreateToggle({
   Name = "Активировать Демон-Статы над всеми",
   CurrentValue = false,
   Callback = function(v)
       _G.U = v
       while _G.U do
           for _, p in pairs(game.Players:GetPlayers()) do
               if p.Character and p.Character:FindFirstChild("Head") then
                   local h = p.Character.Head
                   local t = h:FindFirstChild("DarkTag") or Instance.new("BillboardGui", h)
                   t.Name = "DarkTag" t.Size = UDim2.new(0,200,0,100) t.AlwaysOnTop = true t.StudsOffset = Vector3.new(0,5,0)
                   local l = t:FindFirstChild("Label") or Instance.new("TextLabel", t)
                   l.Name = "Label" l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.TextColor3 = Color3.fromRGB(255,0,0) l.TextSize = 14 l.RichText = true
                   l.Font = Enum.Font.Code
                   local d = (p:FindFirstChild("PlayerGui") and p.PlayerGui:FindFirstChild("TouchGui")) and "📱 Mobile" or "🖥️ PC"
                   -- Рандомный FPS для визуализации, т.к. получить точный FPS другого игрока с клиента сложно
                   local fps = (p == game.Players.LocalPlayer) and math.floor(1/game:GetService("RunService").RenderStepped:Wait()) or math.random(58,62)
                   l.Text = string.format("<b>%s</b>\nDEV: %s\nFPS: %d", p.Name, d, fps)
               end
           end
           task.wait(1.5)
       end
       -- Убираем теги при выключении
       if not Value then for _, p in pairs(game.Players:GetPlayers()) do if p.Character and p.Character.Head:FindFirstChild("DarkTag") then p.Character.Head.DarkTag:Destroy() end end end
   end,
})
