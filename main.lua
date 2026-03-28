-- [[ CANDY-BOMB HUB: UNIVERSAL EDITION (PC/MOBILE) ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

-- Функция создания интерфейса
local function CreateCandyHub()
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

    local G = Instance.new("ScreenGui", pg)
    G.Name = "DarkHubV42"
    G.ResetOnSpawn = false -- Меню не пропадает при смерти
    G.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    -- ГЛАВНОЕ ОКНО
    local M = Instance.new("Frame", G)
    M.Name = "Main"
    M.Size = UDim2.new(0, 460, 0, 400)
    M.Position = UDim2.new(0.5, -230, 0.5, -200)
    M.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    M.BorderSizePixel = 0
    M.Active = true
    M.Draggable = true -- Можно двигать и мышкой, и пальцем
    M.Visible = true
    local UICorner = Instance.new("UICorner", M)

    -- КНОПКА DH (ОТКРЫТЬ/ЗАКРЫТЬ)
    local Tog = Instance.new("TextButton", G)
    Tog.Name = "Toggle"
    Tog.Size = UDim2.new(0, 55, 0, 55)
    Tog.Position = UDim2.new(0, 15, 0.5, -27)
    Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Tog.Text = "DH"
    Tog.TextColor3 = Color3.fromRGB(255, 0, 0)
    Tog.Font = Enum.Font.SourceSansBold
    Tog.TextSize = 20
    local TogCorner = Instance.new("UICorner", Tog)
    TogCorner.CornerRadius = UDim.new(1, 0) -- Делаем круглой
    
    Tog.MouseButton1Click:Connect(function()
        M.Visible = not M.Visible
    end)

    -- БОКОВАЯ ПАНЕЛЬ
    local Side = Instance.new("Frame", M)
    Side.Size = UDim2.new(0, 100, 1, 0)
    Side.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    Instance.new("UICorner", Side)

    -- КОНТЕЙНЕР ДЛЯ КНОПОК (СКРОЛЛ)
    local Cont = Instance.new("ScrollingFrame", M)
    Cont.Size = UDim2.new(1, -110, 1, -20)
    Cont.Position = UDim2.new(0, 105, 0, 10)
    Cont.BackgroundTransparency = 1
    Cont.BorderSizePixel = 0
    Cont.CanvasSize = UDim2.new(0, 0, 12, 0) -- Большая прокрутка под все скрипты
    Cont.ScrollBarThickness = 5

    local UIList = Instance.new("UIListLayout", Cont)
    UIList.Padding = UDim.new(0, 5)

    -- ФУНКЦИЯ СОЗДАНИЯ КНОПОК
    local function AddB(txt, clr, cb)
        local b = Instance.new("TextButton", Cont)
        b.Size = UDim2.new(1, -10, 0, 38)
        b.Text = txt
        b.BackgroundColor3 = clr
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Font = Enum.Font.SourceSansBold
        b.TextSize = 14
        Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(cb)
    end

    -- [[ КОНТЕНТ МЕНЮ ]] --
    
    -- РАЗДЕЛ SPECTATE
    AddB("--- SPECTATE LIST ---", Color3.new(0.4, 0, 0), function() end)
    AddB("STOP WATCH", Color3.fromRGB(150, 0, 0), function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB("WATCH: "..v.Name, Color3.fromRGB(40, 40, 40), function() workspace.CurrentCamera.CameraSubject = v.Character.Humanoid end) end
    end

    -- РАЗДЕЛ AUTO FARM (ТВОЙ СОЛИКС)
    AddB("--- AUTO FARM ---", Color3.new(0, 0.3, 0.5), function() end)
    AddB("Solix Hub (24H KEY) 🔥", Color3.fromRGB(120, 0, 255), function() 
        setclipboard("https://ads.luarmor.net/get_key?for=Solixhub_Free_KeySystem-OWlLHDMCHADk")
        game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Candy-Bomb", Text = "Ключ скопирован!", Duration = 5})
        loadstring(game:HttpGet("https://raw.githubusercontent.com/meobeo8/a/a/a"))() 
    end)
    AddB("Mystrix Hub (Tsunami)", Color3.fromRGB(0, 80, 120), function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() 
    end)

    -- РАЗДЕЛ TELEPORT
    AddB("--- TELEPORT LIST ---", Color3.new(0, 0.4, 0), function() end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then 
            AddB("TP TO: "..v.Name, Color3.fromRGB(30, 50, 30), function() 
                p.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)
            end) 
        end
    end

    -- ТВОИ 11 СКРИПТОВ
    AddB("--- 11 SCRIPTS ---", Color3.new(0.3, 0.3, 0.3), function() end)
    local function sc(n, u) AddB(n, Color3.fromRGB(35, 35, 35), function() loadstring(game:HttpGet(u))() end) end
    sc("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
    sc("2. Be a Lucky Block", "https://vonixehub.com/raw")
    sc("3. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
    sc("4. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")
    -- Добавь остальные свои ссылки по аналогии выше
end

-- Запуск при выполнении скрипта
CreateCandyHub()

-- Авто-перезапуск если зашел на новый остров (реснулся)
p.CharacterAdded:Connect(function()
    task.wait(1)
    CreateCandyHub()
end)
