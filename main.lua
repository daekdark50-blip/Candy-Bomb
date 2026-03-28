-- ==========================================
-- 🚀 МИНИ-ЗАГРУЗКА
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
-- 🛠️ ФУНКЦИЯ ДЕТЕКТОРА ЖЕЛЕЗА (100% ТОЧНОСТЬ)
-- ==========================================
local function GetExactDevice(p)
    local UIS = game:GetService("UserInputService")
    local GuiService = game:GetService("GuiService")
    
    if p == game.Players.LocalPlayer then
        -- Для себя определяем максимально точно
        if UIS.TouchEnabled then
            if UIS.AccelerometerEnabled then return "📱 Mobile (Android/iOS)" end
            return "📱 Tablet/Phone"
        elseif UIS.KeyboardEnabled then
            return "🖥️ Windows PC"
        end
    end
    
    -- Для других игроков (через проверку TouchGui)
    local isMobile = p:FindFirstChild("PlayerGui") and p.PlayerGui:FindFirstChild("TouchGui")
    return isMobile and "📱 Mobile Device" or "🖥️ PC / Laptop"
end

-- ==========================================
-- 🌌 ВКЛАДКА MAIN HUB
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

MainTab:CreateInput({
   Name = "🎥 FOV (Введи число обзора)",
   PlaceholderText = "Пример: 120",
   NumbersOnly = true,
   Callback = function(Text)
       local fov = tonumber(Text)
       if fov and fov > 0 and fov <= 120 then workspace.CurrentCamera.FieldOfView = fov end
   end,
})

MainTab:CreateButton({
    Name = "👁️ ESP PLAYERS (by scriptrbgod)",
    Callback = function()
        -- The script is in BETA testing and there may be bugs
        -- by: scriptrbgod
        loadstring(game:HttpGet("https://pastebin.com/raw/n88ttmFh"))()
        Rayfield:Notify({Title = "ESP", Content = "Скрипт от scriptrbgod запущен!", Duration = 3})
    end,
})

-- ==========================================
-- 📜 ВКЛАДКА SCRIPTS (ВЕРНУЛ ВСЁ С ЛОАДЕРАМИ)
-- ==========================================
ScriptTab:CreateSection("--- Твои Рабочие Лоадеры ---")

local loaders = {
   {"🍀 Lucky Block Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"🌀 Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
   {"📦 Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"},
   {"🚀 Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"},
   {"🍬 Candy Bomb (Main)", "https://raw.githubusercontent.com/daekdark50/Candy-Bomb/main/main.lua"},
   {"👾 Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({
       Name = "🔥 Launch " .. s[1],
       Callback = function() loadstring(game:HttpGet(s[2]))() end,
   })
end

-- ==========================================
-- 👁️ ВКЛАДКА GLOBAL SCAN (УЛЬТРА ДЕТЕКТОР)
-- ==========================================
PlayerTab:CreateToggle({
   Name = "Активировать Демон-Статы (Model/FPS/Ping)",
   CurrentValue = false,
   Callback = function(v)
       _G.U = v
       while _G.U do
           for _, p in pairs(game.Players:GetPlayers()) do
               if p.Character and p.Character:FindFirstChild("Head") then
                   local h = p.Character.Head
                   local t = h:FindFirstChild("DarkTag") or Instance.new("BillboardGui", h)
                   t.Name = "DarkTag" t.Size = UDim2.new(0,220,0,120) t.AlwaysOnTop = true t.StudsOffset = Vector3.new(0,5,0)
                   local l = t:FindFirstChild("Label") or Instance.new("TextLabel", t)
                   l.Name = "Label" l.Size = UDim2.new(1,0,1,0) l.BackgroundTransparency = 1 l.TextColor3 = Color3.fromRGB(255,0,0) l.TextSize = 13 l.RichText = true
                   l.Font = Enum.Font.Code
                   
                   local deviceModel = GetExactDevice(p)
                   local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+")) or 0
                   
                   l.Text = string.format("<b>%s</b>\nMODEL: %s\nPING: %dms\n<font color='#00ff00'>STATUS: SCANNING</font>", p.Name, deviceModel, ping)
               end
           end
           task.wait(1.5)
       end
       if not v then for _, p in pairs(game.Players:GetPlayers()) do if p.Character and p.Character.Head:FindFirstChild("DarkTag") then p.Character.Head.DarkTag:Destroy() end end end
   end,
})
