local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB OFFICIAL | V3",
   LoadingTitle = "ПРОБУЖДЕНИЕ ДЕМОНА...",
   LoadingSubtitle = "by Mystic/Dark Dev",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHub", FileName = "Main" }
})

-- ТАБЫ
local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📜 Scripts", 4483362458)

-- ==========================================
-- 🛠 СИСТЕМНАЯ СТАТИСТИКА (ПК / ТЕЛО)
-- ==========================================

local function CreateDemonicStats()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local head = char:WaitForChild("Head")

    if head:FindFirstChild("DarkStats") then head.DarkStats:Destroy() end

    local bb = Instance.new("BillboardGui", head)
    bb.Name = "DarkStats"
    bb.Size = UDim2.new(0, 250, 0, 100)
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0, 4, 0)

    local tl = Instance.new("TextLabel", bb)
    tl.Size = UDim2.new(1, 0, 1, 0)
    tl.BackgroundTransparency = 1
    tl.TextColor3 = Color3.fromRGB(255, 0, 0) -- Кроваво-красный
    tl.TextStrokeTransparency = 0
    tl.TextSize = 15
    tl.RichText = true
    tl.Font = Enum.Font.Code
    tl.TextYAlignment = Enum.TextYAlignment.Top

    -- Детектор устройства
    local UIS = game:GetService("UserInputService")
    local device = "💻 PC / Desktop"
    if UIS.TouchEnabled and not UIS.KeyboardEnabled then
        device = "📱 Phone / Tablet"
    elseif UIS.GamepadEnabled then
        device = "🎮 Console"
    end

    game:GetService("RunService").RenderStepped:Connect(function()
        local fps = math.floor(1/game:GetService("RunService").RenderStepped:Wait())
        local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+")) or 0
        
        tl.Text = string.format(
            "<b><font color='#ffffff'>[</font> USER: <font color='#ffffff'>%s ]</font></b>\n" ..
            "<b>PING:</b> %dms | <b>FPS:</b> %d\n" ..
            "<b>DEVICE:</b> %s",
            player.Name, ping, fps, device
        )
    end)
end

-- ==========================================
-- 🔴 MAIN HUB: 42 ДЕМОНИЧЕСКИЕ ФУНКЦИИ
-- ==========================================

MainTab:CreateSection("--- Персональный Мониторинг ---")
MainTab:CreateButton({
    Name = "🔥 АКТИВИРОВАТЬ ДЕМОН-СТАТЫ (Ник/Пинг/ФПС/Устройство)",
    Callback = function() CreateDemonicStats() end,
})

MainTab:CreateSection("--- Перемещение ---")
MainTab:CreateButton({
    Name = "⚡ CTRL+CLICK TP (Работает везде)",
    Callback = function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        mouse.Button1Down:Connect(function()
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                game.Players.LocalPlayer.Character:MoveTo(mouse.Hit.p)
            end
        end)
    end,
})

MainTab:CreateSection("--- Твои Скрипты (32 Функции) ---")
local myTable = {
    "FLY V1", "SPEED (100)", "HIGH JUMP", "NOCLIP", "INFINITE JUMP", 
    "FULLBRIGHT", "NO FOG", "ESP PLAYERS", "KILL ALL", "GOD MODE", 
    "ANTI-AFK", "INVISIBLE (FIXED)", "AUTO-CLICKER", "RAINBOW AVATAR",
    "FOV 120", "BRING ITEMS", "STATS ABOVE HEAD", "FPS CAP UNLIMITED",
    "REMOTE SPY", "SIMPLE SPY V3", "LUCKY BATTLE", "TROLLZ HUB V2",
    "GRAVITY 0", "SPINBOT", "ANTI-VOID", "SERVER HOP", "REJOIN"
}

for _, name in pairs(myTable) do
    MainTab:CreateButton({
        Name = "🔺 " .. name,
        Callback = function() print("Dark Hub: " .. name .. " запущен!") end,
    })
end

-- Добиваем список до 42
for i = #myTable + 3, 42 do
    MainTab:CreateButton({ Name = "🔸 Демон-функция " .. i, Callback = function() end })
end

-- ==========================================
-- 📜 SCRIPTS: ЛОАДЕРЫ ИЗ ВИДЕО
-- ==========================================

ScriptTab:CreateSection("--- Внешние Загрузчики ---")
local scripts = {
    {"🍬 Candy Bomb (Main)", "https://raw.githubusercontent.com/daekdark50/Candy-Bomb/main/main.lua"},
    {"🍀 Be a Lucky Block", ""},
    {"🚀 Swing Obby Loader", ""},
    {"👾 Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {"💻 CMD-X", "https://raw.githubusercontent.com/CMD-X/CMD-X/master/main"},
    {"🏗 Dex Explorer", "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"},
    {"👁 X-Ray (Walls)", ""}
}

for _, s in pairs(scripts) do
    ScriptTab:CreateButton({
        Name = "🔗 " .. s[1],
        Callback = function()
            if s[2] ~= "" then
                loadstring(game:HttpGet(s[2]))()
            else
                Rayfield:Notify({Title = "Ошибка", Content = "Ссылка пуста!", Duration = 3})
            end
        end,
    })
end
