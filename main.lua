local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- Очистка старого хаба
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 🛡️ ФОНОВАЯ ЗАЩИТА ОТ JUNKIE (УНИЧТОЖИТЕЛЬ) ]] --
task.spawn(function()
    while task.wait(1) do
        pcall(function()
            local junk = pgui:FindFirstChild("JunkieKeySystem") or pgui:FindFirstChild("ProjectYoda")
            if junk then junk:Destroy() end
        end)
    end
end)

-- [[ 1. КРОВАВАЯ ЗАГРУЗКА (DARK HUB STYLE) ]] --
local function StartLoader()
    local LoaderBack = Instance.new("Frame", Gui)
    LoaderBack.Size = UDim2.new(1, 0, 1, 0) -- ОГРОМНЫЙ КВАДРАТ НА ВЕСЬ ЭКРАН
    LoaderBack.Position = UDim2.new(0, 0, 0, 0)
    LoaderBack.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- ЧЕРНЫЙ ЦВЕТ
    LoaderBack.ZIndex = 10000

    local T = Instance.new("TextLabel", LoaderBack)
    T.Size = UDim2.new(1, 0, 0, 100)
    T.Position = UDim2.new(0, 0, 0.5, -70)
    T.Text = "LOADING DARK HUB...\nBY AK ADMIN"
    T.TextColor3 = Color3.fromRGB(255, 0, 0) -- КРОВАВЫЙ ЦВЕТ
    T.Font = Enum.Font.GothamBold
    T.TextSize = 35
    T.BackgroundTransparency = 1
    T.ZIndex = 10001

    local BarBack = Instance.new("Frame", LoaderBack)
    BarBack.Size = UDim2.new(0.6, 0, 0, 12)
    BarBack.Position = UDim2.new(0.2, 0, 0.5, 30)
    BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    BarBack.ZIndex = 10001
    Instance.new("UICorner", BarBack)

    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- ЯРКО-КРАСНЫЙ ПОЛЗУНОК
    Fill.ZIndex = 10002
    Instance.new("UICorner", Fill)

    TweenService:Create(Fill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)}):Play() -- АНИМАЦИЯ 3 СЕКУНДЫ
    task.wait(3.5)
    LoaderBack:Destroy()
end

-- [[ 2. ГЛАВНОЕ ОКНО (DARK HUB v42) ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- ТОТ САМЫЙ ОГРОМНЫЙ КРАСНЫЙ КРЕСТ СВЕРХУ
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 45, 0, 45) -- ОГРОМНЫЙ РАЗМЕР
Close.Position = UDim2.new(1, -50, 0, 5) -- САМЫЙ ВЕРХНИЙ УГОЛ
Close.Text = "X"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 30
Close.Font = Enum.Font.GothamBold
Close.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- КРАСНЫЙ ФОН
Close.ZIndex = 100
Instance.new("UICorner", Close)
Close.MouseButton1Click:Connect(function() Main.Visible = false end)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 130, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 4)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -140, 1, -20)
Container.Position = UDim2.new(0, 135, 0, 10)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 6)
    
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 45)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local TabMain = CreateTab("MAIN")
local TabScripts = CreateTab("SCRIPTS")

-- [[ ВКЛАДКА MAIN: INVISIBLE + SPECTOR (Watch/Stop) ]] --
local function BuildMain()
    -- ТОТ САМЫЙ ИНВИЗ (СИНЕЮЩИЙ ТЕКСТ)
    local Inv = Instance.new("TextButton", TabMain)
    Inv.Size = UDim2.new(1, -5, 0, 40)
    Inv.Text = "INVISIBLE [ OFF ]"
    Inv.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Inv.TextColor3 = Color3.fromRGB(100, 100, 255) -- СИНЕВАТЫЙ ТЕКСТ
    Instance.new("UICorner", Inv)
    
    local on = false
    Inv.MouseButton1Click:Connect(function()
        on = not on
        Inv.Text = on and "INVISIBLE [ ON ]" or "INVISIBLE [ OFF ]"
        Inv.BackgroundColor3 = on and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(40, 40, 40)
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = on and 1 or 0 end
        end
    end)

    -- КНОПКА СТОП СПЕКТАТОР (КРАСНАЯ)
    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, -5, 0, 40)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
    Stop.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)

    -- СПИСОК ИГРОКОВ (Watch/Watch) x10
    local function upSpector()
        -- Глушим Junkie Key System
        for _, v in pairs(TabMain:GetChildren()) do if v.Name == "PlayerFrame" then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp then
                local f = Instance.new("Frame", TabMain)
                f.Name = "PlayerFrame"
                f.Size = UDim2.new(1, -5, 0, 50)
                f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                Instance.new("UICorner", f)
                
                local head = Instance.new("ImageLabel", f)
                head.Size = UDim2.new(0, 40, 0, 40)
                head.Position = UDim2.new(0, 5, 0.5, -20)
                head.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420) -- ЛИЦА ИГРОКОВ xhead shot
                Instance.new("UICorner", head).CornerRadius = UDim.new(1,0)

                local name = Instance.new("TextLabel", f)
                name.Size = UDim2.new(1, -100, 1, 0)
                name.Position = UDim2.new(0, 50, 0, 0)
                name.Text = p.DisplayName
                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                name.BackgroundTransparency = 1
                name.TextXAlignment = "Left"
                name.Font = Enum.Font.GothamBold

                local watch = Instance.new("TextButton", f)
                watch.Size = UDim2.new(0, 60, 0, 30)
                watch.Position = UDim2.new(1, -65, 0.5, -15)
                watch.Text = "WATCH" -- ТОТ САМЫЙ WATCH
                watch.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                watch.TextColor3 = Color3.fromRGB(255, 255, 255)
                Instance.new("UICorner", watch)
                watch.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
            end
        end
    end
    upSpector()
end
BuildMain()

-- [[ ВКЛАДКА SCRIPTS: ВСЕ 8 С ОБХОДОМ JUNKIE ]] --
local function AddScr(n, u)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, -5, 0, 40)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b
    
