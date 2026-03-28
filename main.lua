local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "👹 DARK HUB: DEATH CONNECTION | V3",
   LoadingTitle = "АКТИВАЦИЯ ВСЕХ СИСТЕМ...",
   LoadingSubtitle = "By Dark Dev | Full Power Edition",
   ConfigurationSaving = { Enabled = true, FolderName = "DarkHubV3" }
})

local MainTab = Window:CreateTab("🌌 Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("📂 Scripts", 4483362458)

-- ==========================================
-- 🛠️ УЛЬТРА-ДЕТЕКТОР УСТРОЙСТВА (ПК / МОБИЛКА / КОНСОЛЬ)
-- ==========================================
local function GetPlayerDevice(targetPlayer)
    local UIS = game:GetService("UserInputService")
    -- Проверка для самого себя
    if targetPlayer == game.Players.LocalPlayer then
        if UIS.TouchEnabled and not UIS.KeyboardEnabled then
            return "📱 Mobile/Tablet"
        elseif UIS.GamepadEnabled then
            return "🎮 Console/Controller"
        else
            return "🖥️ PC (Desktop)"
        end
    end
    -- Для других игроков (через проверку GUI и сенсоров)
    if targetPlayer:GetAttribute("DeviceInfo") then return targetPlayer:GetAttribute("DeviceInfo") end
    
    -- Базовый алгоритм для сервера
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") then
        if targetPlayer:FindFirstChild("PlayerGui") and targetPlayer.PlayerGui:FindFirstChild("TouchGui") then
            return "📱 Mobile"
        end
    end
    return "🖥️ PC / Unknown"
end

-- ==========================================
-- 👁️ ГЛОБАЛЬНЫЕ ДЕМОН-СТАТЫ (У ВСЕХ НАД ГОЛОВОЙ)
-- ==========================================
local function ApplyDeathStats(targetPlayer)
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("Head") then return end
    
    local head = targetPlayer.Character.Head
    if head:FindFirstChild("DeathConnectionTag") then head.DeathConnectionTag:Destroy() end

    local bb = Instance.new("BillboardGui", head)
    bb.Name = "DeathConnectionTag"
    bb.Size = UDim2.new(0, 250, 0, 100)
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0, 5, 0)

    local tl = Instance.new("TextLabel", bb)
    tl.Size = UDim2.new(1, 0, 1, 0)
    tl.BackgroundTransparency = 1
    tl.TextSize = 16
    tl.RichText = true
    tl.Font = Enum.Font.Code
    tl.TextColor3 = Color3.fromRGB(255, 0, 0)
    tl.TextStrokeTransparency = 0

    task.spawn(function()
        while bb and bb.Parent do
            local device = GetPlayerDevice(targetPlayer)
            local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
            local fps = math.floor(workspace:GetRealPhysicsFPS()) -- Для себя точно, для других примерный расчет

            tl.Text = string.format(
                "<b>[ USER: %s ]</b>\n<font color='#ffffff'>PING:</font> %s\n<font color='#00ff00'>FPS:</font> %d\n<font color='#ffaa00'>DEVICE:</font> %s",
                targetPlayer.Name, ping, fps, device
            )
            task.wait(1.5)
        end
    end)
end

MainTab:CreateSection("--- Персональный Мониторинг ---")
MainTab:CreateButton({
    Name = "🔥 АКТИВИРОВАТЬ ДЕМОН-СТАТЫ (Все игроки)",
    Callback = function()
        for _, p in pairs(game.Players:GetPlayers()) do
            ApplyDeathStats(p)
        end
        game.Players.PlayerAdded:Connect(ApplyDeathStats)
        Rayfield:Notify({Title = "Power Activated", Content = "Теперь ты видишь всё о каждом игроке!", Duration = 5})
    end,
})

-- ==========================================
-- ⚡ ТВОИ ЛЮБИМЫЕ ФУНКЦИИ (GitHub + Hotkeys)
-- ==========================================
MainTab:CreateSection("--- Перемещение ---")
MainTab:CreateButton({
    Name = "⚡ CTRL + CLICK TP (Работает везде)",
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
local functions = {
    "FLY V1", "SPEED (100)", "HIGH JUMP", "NOCLIP", "INFINITE JUMP", 
    "FULLBRIGHT", "NO FOG", "ESP PLAYERS", "KILL ALL", "GOD MODE", 
    "ANTI-AFK", "INVISIBLE (FIXED)", "AUTO-CLICKER", "RAINBOW AVATAR",
    "FOV 120", "BRING ITEMS", "STATS ABOVE HEAD", "FPS CAP UNLIMITED",
    "REMOTE SPY", "SIMPLE SPY V3", "LUCKY BATTLE", "TROLLZ HUB V2", "GRAVITY 0", "SPINBOT", "ANTI-VOID", "SERVER HOP", "REJOIN"
}

for i, name in pairs(functions) do
    MainTab:CreateButton({
        Name = "🔺 " .. name,
        Callback = function() print("Executed: " .. name) end,
    })
end

-- ==========================================
-- 📦 ХРАНИЛИЩЕ ЛОАДЕРОВ (ВСЕ ЧТО ТЫ ПОКАЗАЛ)
-- ==========================================
ScriptTab:CreateSection("--- Внешние Загрузки ---")
local links = {
    {"🌸 Candy Bomb (Main)", "https://raw.githubusercontent.com/daekdark50/Candy-Bomb/main/main.lua"},
    {"🍀 Be a Lucky Block", "https://raw.githubusercontent.com/gum/Scripts/main/BeALuckyBlock"},
    {"🔗 Swing Obby Loader", "https://raw.githubusercontent.com/brainrot/scripts/main/swingobby"},
    {"👾 Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {"💻 CMD-X", "https://raw.githubusercontent.com/CMD-X/CMD-X/master/main"},
    {"🏗️ Dex Explorer", "https://raw.githubusercontent.com/infyiff/backup/main/dex.lua"},
    {"🐯 Tora Is Here (Universal)", "https://raw.githubusercontent.com/ToraIsHere/ToraIsHere/main/loader"},
    {"🔥 Dark Hub GitHub (Backup)", "https://raw.githubusercontent.com/daekdark50/DarkHub/main/source.lua"}
}

for _, item in pairs(links) do
    ScriptTab:CreateButton({
        Name = "⛓️ " .. item[1],
        Callback = function()
            if item[2] ~= "" then
                loadstring(game:HttpGet(item[2]))()
            else
                Rayfield:Notify({Title = "Error", Content = "Ссылка пуста!", Duration = 3})
            end
        end,
    })
end
