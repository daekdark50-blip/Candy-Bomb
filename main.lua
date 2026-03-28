-- 1. МИНИ-ЗАГРУЗКА (Перед запуском Rayfield)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Label = Instance.new("TextLabel", ScreenGui)
Label.Size = UDim2.new(0, 400, 0, 100)
Label.Position = UDim2.new(0.5, -200, 0.5, -50)
Label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Label.TextColor3 = Color3.fromRGB(255, 0, 0)
Label.TextSize = 25
Label.Font = Enum.Font.Code
Label.Text = "LOADING DARK HUB..."
Label.BorderSizePixel = 2

for i = 1, 3 do
    Label.Text = "LOADING DARK HUB." task.wait(0.3)
    Label.Text = "LOADING DARK HUB.." task.wait(0.3)
    Label.Text = "LOADING DARK HUB..." task.wait(0.3)
end
ScreenGui:Destroy()

-- 2. ЗАПУСК RAYFIELD
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
-- 🛠️ ФУНКЦИЯ ПРЕДМЕТА ТЕЛЕПОРТА (ПК / ТЕЛО)
-- ==========================================
local function GiveTeleportTool()
    local tool = Instance.new("Tool")
    tool.Name = "⚡ Dark Teleport"
    tool.RequiresHandle = false
    tool.Parent = game.Players.LocalPlayer.Backpack

    tool.Activated:Connect(function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        if mouse.Hit then
            game.Players.LocalPlayer.Character:MoveTo(mouse.Hit.p)
            Rayfield:Notify({Title = "Teleport", Content = "Перемещено!", Duration = 1})
        end
    end)
end

-- ==========================================
-- 💀 MAIN HUB (ТВОЙ СПИСОК: SPIN, INVIS, RAINBOW...)
-- ==========================================
MainTab:CreateSection("--- Уникальные Способности ---")

MainTab:CreateButton({
    Name = "🎒 ВЗЯТЬ ПРЕДМЕТ ТЕЛЕПОРТА (ПК/Тело)",
    Callback = function() GiveTeleportTool() end,
})

MainTab:CreateToggle({
    Name = "🌈 РАДУЖНАЯ КОЖА (Rainbow Skin)",
    CurrentValue = false,
    Callback = function(Value)
        _G.Rainbow = Value
        task.spawn(function()
            while _G.Rainbow do
                local char = game.Players.LocalPlayer.Character
                if char then
                    for _, v in pairs(char:GetChildren()) do
                        if v:IsA("BasePart") then v.Color = Color3.fromHSV(tick()%5/5, 1, 1) end
                    end
                end
                task.wait(0.1)
            end
        end)
    end,
})

MainTab:CreateToggle({
    Name = "🌀 SPIN FLING (Разбрасывать игроков)",
    CurrentValue = false,
    Callback = function(Value)
        _G.SpinFling = Value
        local lp = game.Players.LocalPlayer
        local char = lp.Character
        local hrp = char.HumanoidRootPart
        if Value then
            local bv = Instance.new("BodyAngularVelocity", hrp)
            bv.Name = "Spinming"
            bv.AngularVelocity = Vector3.new(0, 1000, 0)
            bv.MaxTorque = Vector3.new(0, math.huge, 0)
            char.Humanoid.PlatformStand = true
        else
            if hrp:FindFirstChild("Spinming") then hrp.Spinming:Destroy() end
            char.Humanoid.PlatformStand = false
        end
    end,
})

MainTab:CreateButton({
    Name = "👻 INVISIBLE (Рабочий инвиз)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Invisible%20Gui'))()
    end,
})

MainTab:CreateSlider({
    Name = "🎥 FOV (Обзор 120)",
    Min = 70, Max = 120, CurrentValue = 70,
    Callback = function(v) workspace.CurrentCamera.FieldOfView = v end,
})

MainTab:CreateSection("--- Читы ---")

MainTab:CreateToggle({
    Name = "🚀 FLY (Рабочий Флай)",
    CurrentValue = false,
    Callback = function(Value)
        if Value then 
            loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"))()
        end
    end,
})

MainTab:CreateButton({
    Name = "👁️ ESP (ВХ - Видеть сквозь стены)",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/EspOnly'))()
    end,
})

-- ==========================================
-- 📜 ВКЛАДКА SCRIPTS (ВСЕ ЛОАДЕРЫ)
-- ==========================================
ScriptTab:CreateSection("--- Твои Рабочие Лоадеры ---")
local loaders = {
   {"🍀 Lucky Block Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"🍬 Candy Bomb", "https://raw.githubusercontent.com/daekdark50/Candy-Bomb/main/main.lua"},
   {"🌀 Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
   {"📦 Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"},
   {"👾 Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({
       Name = "🔥 " .. s[1],
       Callback = function() loadstring(game:HttpGet(s[2]))() end,
   })
end

-- ==========================================
-- 👁️ ГЛОБАЛЬНЫЙ СКАНЕР (GPU/FPS/DEVICE)
-- ==========================================
PlayerTab:CreateToggle({
   Name = "Активировать Ультра-Скан",
   CurrentValue = false,
   Callback = function(Value)
       _G.UltraLoop = Value
       while _G.UltraLoop do
           for _, p in pairs(game.Players:GetPlayers()) do
               if p.Character and p.Character:FindFirstChild("Head") then
                   local head = p.Character.Head
                   local tag = head:FindFirstChild("DarkTag") or Instance.new("BillboardGui", head)
                   tag.Name = "DarkTag"
                   tag.Size = UDim2.new(0, 200, 0, 100)
                   tag.AlwaysOnTop = true
                   tag.StudsOffset = Vector3.new(0, 5, 0)
                   local label = tag:FindFirstChild("Label") or Instance.new("TextLabel", tag)
                   label.Name = "Label"
                   label.Size = UDim2.new(1, 0, 1, 0)
                   label.BackgroundTransparency = 1
                   label.TextColor3 = Color3.fromRGB(255, 0, 0)
                   label.TextSize = 14
                   label.RichText = true
                   label.Font = Enum.Font.Code
                   local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+")) or 0
                   local dev = (p:FindFirstChild("PlayerGui") and p.PlayerGui:FindFirstChild("TouchGui")) and "📱 Mobile" or "🖥️ PC"
                   label.Text = string.format("<b>%s</b>\nDEV: %s\nPING: %dms\nGPU: ACTIVE", p.Name, dev, ping)
               end
           end
           task.wait(1.5)
       end
   end,
})
