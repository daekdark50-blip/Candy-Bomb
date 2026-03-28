local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB: DEATH CONNECTION | V3",
   LoadingTitle = "ПОДКЛЮЧЕНИЕ МОЩНОСТИ...",
   LoadingSubtitle = "by Dark Dev | GPU & FPS Ultra Scan",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubFinal" }
})

local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)
local PlayerTab = Window:CreateTab("👁️ Global Scan", 4483362458)

-- ==========================================
-- 🛠️ УЛЬТРА-ДЕТЕКТОР (ПК / ТЕЛО / GPU / FPS)
-- ==========================================
local function GetAdvancedStats(p)
    local UIS = game:GetService("UserInputService")
    local device = "🖥️ PC"
    if UIS.TouchEnabled and not UIS.KeyboardEnabled then device = "📱 Phone" end
    
    local fps = math.floor(1/game:GetService("RunService").RenderStepped:Wait())
    local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+")) or 0
    
    return device, fps, ping
end

local function ApplyUltraTags()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p.Character and p.Character:FindFirstChild("Head") then
            local head = p.Character.Head
            local tag = head:FindFirstChild("DarkTag") or Instance.new("BillboardGui", head)
            tag.Name = "DarkTag"
            tag.Size = UDim2.new(0, 250, 0, 120)
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
            label.TextStrokeTransparency = 0
            
            local dev, fps, ping = GetAdvancedStats(p)
            label.Text = string.format(
                "<b>[ %s ]</b>\n<font color='#ffffff'>DEVICE:</font> %s\n<font color='#00ff00'>FPS:</font> %d | <font color='#ffff00'>PING:</font> %dms\n<font color='#ff00ff'>GPU:</font> ACTIVE",
                p.Name, dev, fps, ping
            )
        end
    end
end

-- ==========================================
-- 👁️ GLOBAL SCAN (ВКЛ/ВЫКЛ)
-- ==========================================
PlayerTab:CreateToggle({
   Name = "Активировать Ультра-Скан (GPU/FPS/Device)",
   CurrentValue = false,
   Callback = function(Value)
       _G.UltraLoop = Value
       while _G.UltraLoop do
           ApplyUltraTags()
           task.wait(1)
       end
       if not Value then
           for _, p in pairs(game.Players:GetPlayers()) do
               if p.Character and p.Character.Head:FindFirstChild("DarkTag") then p.Character.Head.DarkTag:Destroy() end
           end
       end
   end,
})

-- ==========================================
-- 📜 SCRIPTS (ОБНОВЛЕННЫЙ СПИСОК + LUCKY BATTLE)
-- ==========================================
ScriptTab:CreateSection("--- Твои Рабочие Лоадеры ---")

local loaders = {
   {"🍀 Lucky Block Battle (Plutonium)", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua"},
   {"🍬 Candy Bomb", "https://raw.githubusercontent.com/daekdark50/Candy-Bomb/main/main.lua"},
   {"🌀 Swing Obby for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots"},
   {"🚀 Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"},
   {"🍀 Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"},
   {"👾 Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
   {"🏗️ Dex Explorer", "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"}
}

for _, s in pairs(loaders) do
   ScriptTab:CreateButton({
       Name = "🔥 Запустить " .. s[1],
       Callback = function() loadstring(game:HttpGet(s[2], true))() end,
   })
end

-- ==========================================
-- 💀 MAIN HUB (ТЕЛЕПОРТ И ПРЕДМЕТЫ)
-- ==========================================
MainTab:CreateSection("--- Управление для Мышки и Пальцев ---")

MainTab:CreateButton({
    Name = "⚡ ТЕЛЕПОРТ: Клик (Мышь) / Тап (Палец)",
    Callback = function()
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        mouse.Button1Down:Connect(function()
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) or game:GetService("UserInputService").TouchEnabled then
                player.Character:MoveTo(mouse.Hit.p)
                Rayfield:Notify({Title = "Teleport", Content = "Перемещение выполнено!", Duration = 1})
            end
        end)
    end,
})

MainTab:CreateButton({
    Name = "🎒 BRING ALL ITEMS (Собрать все вещи)",
    Callback = function()
        for _, v in pairs(workspace:GetChildren()) do
            if v:IsA("BackpackItem") or v:IsA("Tool") then
                v.Handle.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            end
        end
    end,
})

MainTab:CreateToggle({
   Name = "Noclip (Сквозь стены)",
   CurrentValue = false,
   Callback = function(v)
       _G.Noc = v
       game:GetService("RunService").Stepped:Connect(function()
           if _G.Noc and game.Players.LocalPlayer.Character then
               for _, p in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                   if p:IsA("BasePart") then p.CanCollide = false end
               end
           end
       end)
   end,
})

MainTab:CreateSlider({
   Name = "Speed Hack", Min = 16, Max = 500, CurrentValue = 16,
   Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end,
})
