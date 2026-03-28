-- [[ DARK HUB v42 | UPDATED BY AK ADMIN ]] --
-- [[ NO KEYS | TOTAL BYPASS | NEW COOL LOADER ]] --

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
    while task.wait(0.5) do
        pcall(function()
            local junk = pgui:FindFirstChild("JunkieKeySystem") or pgui:FindFirstChild("ProjectYoda")
            if junk then junk:Destroy() end
        end)
    end
end)

-- [[ 1. КРУТОЙ ЧЕРНЫЙ КВАДРАТ ЗАГРУЗКИ ]] --
local function StartLoader()
    local LoaderBack = Instance.new("Frame", Gui)
    LoaderBack.Size = UDim2.new(0, 300, 0, 150)
    LoaderBack.Position = UDim2.new(0.5, -150, 0.5, -75)
    LoaderBack.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- ЧЕРНЫЙ КВАДРАТ
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
    Fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- ЯРКИЙ КРАСНЫЙ ПОЛЗУНОК
    Fill.ZIndex = 10002
    Instance.new("UICorner", Fill)

    TweenService:Create(Fill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(3.5)
    LoaderBack:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 4)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -160, 1, -20)
Container.Position = UDim2.new(0, 150, 0, 10)
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
local TabAuto = CreateTab("AUTO FARM")

-- [[ ВКЛАДКА MAIN: INVISIBLE + SPECTATOR + STOP ]] --
local function BuildMain()
    local Inv = Instance.new("TextButton", TabMain)
    Inv.Size = UDim2.new(1, -5, 0, 40)
    Inv.Text = "INVISIBLE [ OFF ]"
    Inv.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Inv.TextColor3 = Color3.fromRGB(255, 255, 255)
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
            t.TextColor3 = Color3.fromRGB(255, 255, 255)
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

    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, -5, 0, 40)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildMain()

-- [[ ВКЛАДКА SCRIPTS: ВСЕ 8 С ОБХОДОМ ]] --
local function AddScr(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, -5, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScr("FPS Flick (KEYLESS)", "https://api.junkie-development.de/api/v1/luascripts/public/8b5174946c76ba81d5c374bd4a69f7694d10c837e37522a04c91b2b32991e20e/download")
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
AF.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", AF)
local afOn = false
AF.MouseButton1Click:Connect(function()
    afOn = not afOn
    AF.Text = afOn and "AUTO FARM [ ON ]" or "AUTO FARM [ OFF ]"
    AF.TextColor3 = afOn and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
end)

-- [[ КНОПКА DH ]] --
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)
local S = Instance.new("UIStroke", Tog)
S.Color = Color3.fromRGB(255, 0, 0)
S.Thickness = 3
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

StartLoader()
Main.Visible = true
TabMain.Visible = true
