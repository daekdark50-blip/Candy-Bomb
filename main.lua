-- [[ DARK HUB v42 | AK ADMIN ULTIMATE ]] --
-- [[ PLAYERGUI VERSION | ANTI-KEY | AUTO FARM ]] --

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")

-- Очистка старого GUI
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 1. ЯРКАЯ КРОВАВАЯ ЗАГРУЗКА ]] --
local function StartLoader()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(1, 0, 1, 0)
    L.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- ЯРКО КРАСНЫЙ
    L.ZIndex = 1000

    local T = Instance.new("TextLabel", L)
    T.Size = UDim2.new(1, 0, 0, 50)
    T.Position = UDim2.new(0, 0, 0.45, 0)
    T.Text = "LOADING DARK HUB...\nBY AK ADMIN"
    T.TextColor3 = Color3.new(1, 1, 1)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 30
    T.BackgroundTransparency = 1

    local BarBack = Instance.new("Frame", L)
    BarBack.Size = UDim2.new(0.6, 0, 0, 15)
    BarBack.Position = UDim2.new(0.2, 0, 0.55, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    Instance.new("UICorner", BarBack)

    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.new(1, 1, 1) -- БЕЛЫЙ ЯРКИЙ ПОЛЗУНОК
    Instance.new("UICorner", Fill)

    Fill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 3)
    task.wait(3.5)
    L:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 500, 0, 360)
Main.Position = UDim2.new(0.5, -250, 0.5, -180)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 130, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 4)

local Cont = Instance.new("Frame", Main)
Cont.Size = UDim2.new(1, -140, 1, -20)
Cont.Position = UDim2.new(0, 135, 0, 10)
Cont.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Cont)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 6)
    
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Cont:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local TabMain = CreateTab("MAIN")
local TabScripts = CreateTab("SCRIPTS")
local TabAuto = CreateTab("AUTO FARM")

-- [[ ВКЛАДКА MAIN: INVISIBLE + SPECTOR ]] --
local function BuildMain()
    -- Кнопка Инвиза
    local Inv = Instance.new("TextButton", TabMain)
    Inv.Size = UDim2.new(1, -5, 0, 40)
    Inv.Text = "INVISIBLE [ OFF ]"
    Inv.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Inv.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", Inv)
    
    local invActive = false
    Inv.MouseButton1Click:Connect(function()
        invActive = not invActive
        Inv.Text = invActive and "INVISIBLE [ ON ]" or "INVISIBLE [ OFF ]"
        Inv.BackgroundColor3 = invActive and Color3.fromRGB(180, 0, 0) or Color3.fromRGB(35, 35, 35)
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = invActive and 1 or 0 end
        end
    end)

    -- Список игроков для Спектатора
    local SList = Instance.new("Frame", TabMain)
    SList.Size = UDim2.new(1, 0, 0, 200)
    SList.BackgroundTransparency = 1
    Instance.new("UIListLayout", SList).Padding = UDim.new(0, 4)

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", SList)
            f.Size = UDim2.new(1, -5, 0, 40)
            f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Instance.new("UICorner", f)

            local t = Instance.new("TextLabel", f)
            t.Size = UDim2.new(1, -70, 1, 0)
            t.Position = UDim2.new(0, 10, 0, 0)
            t.Text = p.DisplayName
            t.TextColor3 = Color3.new(1, 1, 1)
            t.BackgroundTransparency = 1
            t.TextXAlignment = "Left"

            local b = Instance.new("TextButton", f)
            b.Size = UDim2.new(0, 60, 0, 30)
            b.Position = UDim2.new(1, -65, 0.5, -15)
            b.Text = "WATCH"
            b.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end

    -- Кнопка СТОП СПЕКТАТОР
    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, -5, 0, 40)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
    Stop.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildMain()

-- [[ ВКЛАДКА SCRIPTS: ВСЕ 8 С ОБХОДОМ КЛЮЧЕЙ ]] --
local function AddScr(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, -5, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        -- Обход Junkie Key System
        task.spawn(function()
            for i = 1, 20 do
                local j = pgui:FindFirstChild("JunkieKeySystem") or pgui:FindFirstChild("ProjectYoda")
                if j then j:Destroy() end
                task.wait(0.5)
            end
        end)
        loadstring(game:HttpGet(url))()
    end)
end

AddScr("FPS Flick (NO KEY)", "https://api.junkie-development.de/api/v1/luascripts/public/8b5174946c76ba81d5c374bd4a69f7694d10c837e37522a04c91b2b32991e20e/download")
AddScr("Lucky Blocks", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
AddScr("Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddScr("Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddScr("Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddScr("Fly Script", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddScr("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScr("Remote Spy", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

-- [[ ВКЛАДКА AUTO FARM ]] --
local AF = Instance.new("TextButton", TabAuto)
AF.Size = UDim2.new(1, -5, 0, 45)
AF.Text = "AUTO FARM [ OFF ]"
AF.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
AF.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", AF)
local afOn = false
AF.MouseButton1Click:Connect(function()
    afOn = not afOn
    AF.Text = afOn and "AUTO FARM [ ON ]" or "AUTO FARM [ OFF ]"
    AF.TextColor3 = afOn and Color3.new(1, 0, 0) or Color3.new(1, 1, 1)
end)

-- Кнопка DH
local DH = Instance.new("TextButton", Gui)
DH.Size = UDim2.new(0, 50, 0, 50)
DH.Position = UDim2.new(0, 10, 0.5, 0)
DH.Text = "DH"
DH.BackgroundColor3 = Color3.new(0,0,0)
DH.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", DH).CornerRadius = UDim.new(1,0)
Instance.new("UIStroke", DH).Color = Color3.new(1,0,0)
DH.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

StartLoader()
Main.Visible = true
TabMain.Visible = true
