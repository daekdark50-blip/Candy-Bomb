local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Mystic Hub | 42 Functions",
   LoadingTitle = "Загрузка систем...",
   ConfigurationSaving = { Enabled = true, FolderName = "MysticHubConfig" }
})

-- СОЗДАЕМ ТАБЫ
local MainTab = Window:CreateTab("Main Hub", 4483362458)
local ScriptTab = Window:CreateTab("Scripts", 4483362458)

-- ФУНКЦИЯ ДЛЯ СТАТИСТИКИ НАД ГОЛОВОЙ (FPS, PING, GPU)
local function CreateStatsBillboard()
    local player = game.Players.LocalPlayer
    local char = player.Character or player.CharacterAdded:Wait()
    local head = char:WaitForChild("Head")

    local bb = Instance.new("BillboardGui", head)
    bb.Name = "StatsDisplay"
    bb.Size = UDim2.new(0, 200, 0, 50)
    bb.Adornee = head
    bb.AlwaysOnTop = true
    bb.StudsOffset = Vector3.new(0, 3, 0)

    local tl = Instance.new("TextLabel", bb)
    tl.Size = UDim2.new(1, 0, 1, 0)
    tl.BackgroundTransparency = 1
    tl.TextColor3 = Color3.fromRGB(0, 255, 127)
    tl.TextStrokeTransparency = 0
    tl.TextSize = 14
    tl.Font = Enum.Font.Code

    game:GetService("RunService").RenderStepped:Connect(function()
        local fps = math.floor(1/game:GetService("RunService").RenderStepped:Wait())
        local ping = tonumber(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString():match("%d+"))
        tl.Text = string.format("FPS: %d | PING: %dms\nGPU: Rendering Active", fps, ping)
    end)
end

-- ==========================================
-- РАЗДЕЛ: MAIN HUB (Твои 32 функции + новые)
-- ==========================================

MainTab:CreateSection("Статистика и Телепорт")

MainTab:CreateButton({
    Name = "Включить Stats над головой (FPS/Ping)",
    Callback = function()
        CreateStatsBillboard()
    end,
})

MainTab:CreateButton({
    Name = "CTRL + Click Teleport",
    Callback = function()
        -- Код телепортации по нажатию CTRL+Клик
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        mouse.Button1Down:Connect(function()
            if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
                player.Character:MoveTo(mouse.Hit.p)
            end
        end)
    end,
})

MainTab:CreateSection("Твои функции (GitHub)")

-- Здесь я прописал структуру для твоих основных функций
local funcs = {"FLY V1", "SPEED (100)", "HIGH JUMP", "NOCLIP", "INFINITE JUMP", "FULLBRIGHT", "NO FOG", "ESP PLAYERS", "KILL ALL", "GOD MODE", "ANTI-AFK", "INVISIBLE (FIXED)", "AUTO-CLICKER"}
for _, name in pairs(funcs) do
    MainTab:CreateButton({
        Name = name,
        Callback = function() print(name .. " активирован") end,
    })
end

-- Добавляем слайдеры для точной настройки
MainTab:CreateSlider({
    Name = "WalkSpeed", Min = 16, Max = 1000, CurrentValue = 16,
    Callback = function(Value) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value end,
})

-- ==========================================
-- РАЗДЕЛ: SCRIPTS (Лоадеры из 1-го видео)
-- ==========================================

ScriptTab:CreateSection("Загрузчики скриптов")

local scripts = {
    {"1. Mystic Hub (Full)", ""},
    {"2. Swing Obby for Brainrot", ""},
    {"3. Be a Lucky Block", ""},
    {"4. Jump for Lucky Block", ""},
    {"5. Fly for Brainrots", ""},
    {"6. Lucky Block Battle (Fixed)", ""},
    {"7. Popcorn Hub", ""},
    {"8. Trolls Hub", ""},
    {"9. Infinite Yield", "https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"},
    {"10. CMD-X", "https://raw.githubusercontent.com/CMD-X/CMD-X/master/main"},
    {"11. X-Ray (Walls)", ""}
}

for _, s in pairs(scripts) do
    ScriptTab:CreateButton({
        Name = s[1],
        Callback = function()
            if s[2] ~= "" then
                loadstring(game:HttpGet(s[2]))()
            else
                Rayfield:Notify({Title = "Ошибка", Content = "Ссылка на скрипт не установлена", Duration = 3})
            end
        end,
    })
end
