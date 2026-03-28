-- [[ DARK HUB v42 | UPDATED BY AK ADMIN ]] --
-- [[ MishkaHvH FPS Flick | SIZE FIX | MINIMIZE BTN ]] --

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- Очистка старого хаба
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 1. ЧЕРНЫЙ КВАДРАТ ЗАГРУЗКИ ]] --
local function StartLoader()
    local LoaderBack = Instance.new("Frame", Gui)
    LoaderBack.Size = UDim2.new(0, 300, 0, 150)
    LoaderBack.Position = UDim2.new(0.5, -150, 0.5, -75)
    LoaderBack.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LoaderBack.ZIndex = 10000
    Instance.new("UICorner", LoaderBack)
    
    local T = Instance.new("TextLabel", LoaderBack)
    T.Size = UDim2.new(1, 0, 0, 40)
    T.Position = UDim2.new(0, 0, 0, 20)
    T.Text = "LOADING DARK HUB...\nBY AK ADMIN"
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 22
    T.BackgroundTransparency = 1
    T.ZIndex = 10001

    local BarBack = Instance.new("Frame", LoaderBack)
    BarBack.Size = UDim2.new(0.8, 0, 0, 10)
    BarBack.Position = UDim2.new(0.1, 0, 0, 90)
    BarBack.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    BarBack.ZIndex = 10001
    Instance.new("UICorner", BarBack)

    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Fill.ZIndex = 10002
    Instance.new("UICorner", Fill)

    TweenService:Create(Fill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(3.5)
    LoaderBack:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ (МЕНЬШЕ ПО РАЗМЕРАМ) ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 480, 0, 350) -- РАЗМЕР МЕНЬШЕ
Main.Position = UDim2.new(0.5, -240, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- КНОПКА ПРИКРЫТЬ (+)
local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 25, 0, 25)
Close.Position = UDim2.new(1, -30, 0, 5)
Close.Text = "+"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 20
Close.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Instance.new("UICorner", Close)
Close.MouseButton1Click:Connect(function() Main.Visible = false end)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 130, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 4)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -150, 1, -20)
Container.Position = UDim2.new(0, 140, 0, 10)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 6)
    
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.TextSize = 12
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local TabMain = CreateTab("MAIN")
local TabScripts = CreateTab("SCRIPTS")
local TabAuto = CreateTab("AUTO FARM")

-- [[ ВКЛАДКА MAIN ]] --
local function BuildMain()
    local Inv = Instance.new("TextButton", TabMain)
    Inv.Size = UDim2.new(1, -5, 0, 40)
    Inv.Text = "INVISIBLE [ OFF ]"
    Inv.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Inv.TextColor3 = Color3.fromRGB(255, 255, 255)
    Inv.TextSize = 12
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

    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, -5, 0, 40)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
    Stop.TextSize = 12
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local b = Instance.new("TextButton", TabMain)
            b.Size = UDim2.new(1, -5, 0, 35)
            b.Text = "WATCH: "..p.DisplayName
            b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            b.TextSize = 10
            Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end
end
BuildMain()

-- [[ ВКЛАДКА SCRIPTS (С ЧИСТЫМ FLICK) ]] --
local function AddScr(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, -5, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextSize = 12
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScr("FPS Flick (MishkaHvH)", "https://raw.githubusercontent.com/mishkahvh/rbxscripts/refs/heads/main/flick/flick.lua")
AddScr("Lucky Blocks Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
AddScr("Swing Obby Script", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddScr("Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddScr("Escape Tsunami For Brainrots", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddScr("Fly Script For Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddScr("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScr("Remote Spy SimpleSpyV3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

-- [[ ВКЛАДКА AUTO FARM ]] --
local AF = Instance.new("TextButton", TabAuto)
AF.Size = UDim2.new(1, -5, 0, 45)
AF.Text = "AUTO FARM [ OFF ]"
AF.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
AF.TextColor3 = Color3
