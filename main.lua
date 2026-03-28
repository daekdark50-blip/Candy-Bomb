-- [[ DARK HUB v42 | STABLE VERSION ]] --
local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")

-- Чистим старое
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 1. ТА САМАЯ ЯРКАЯ ЗАГРУЗКА ]] --
local function StartLoader()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(1, 0, 1, 0)
    L.BackgroundColor3 = Color3.fromRGB(220, 0, 0) -- ЯРКО КРАСНЫЙ
    L.ZIndex = 100

    local T = Instance.new("TextLabel", L)
    T.Size = UDim2.new(1, 0, 0, 50)
    T.Position = UDim2.new(0, 0, 0.45, 0)
    T.Text = "LOADING DARK HUB..."
    T.TextColor3 = Color3.new(1, 1, 1)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 30
    T.BackgroundTransparency = 1

    local Back = Instance.new("Frame", L)
    Back.Size = UDim2.new(0.6, 0, 0, 15)
    Back.Position = UDim2.new(0.2, 0, 0.55, 0)
    Back.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    Instance.new("UICorner", Back)

    local Fill = Instance.new("Frame", Back)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.new(1, 1, 1) -- БЕЛЫЙ ПОЛЗУНОК
    Instance.new("UICorner", Fill)

    Fill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quart", 3)
    task.wait(3.5)
    L:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Position = UDim2.new(0.5, -250, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 130, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Cont = Instance.new("Frame", Main)
Cont.Size = UDim2.new(1, -145, 1, -20)
Cont.Position = UDim2.new(0, 135, 0, 10)
Cont.BackgroundTransparency = 1

local function Tab(name)
    local p = Instance.new("ScrollingFrame", Cont)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)
    
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, -10, 0, 35)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Cont:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local T1 = Tab("MAIN")
local T2 = Tab("SCRIPTS")
local T3 = Tab("AUTO FARM")

-- [[ MAIN: SPECTOR + STOP + INVIS ]] --
local function BuildMain()
    local Inv = Instance.new("TextButton", T1)
    Inv.Size = UDim2.new(1, -5, 0, 40)
    Inv.Text = "INVISIBLE [ OFF ]"
    Inv.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Inv.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", Inv)
    local active = false
    Inv.MouseButton1Click:Connect(function()
        active = not active
        Inv.Text = active and "INVISIBLE [ ON ]" or "INVISIBLE [ OFF ]"
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = active and 1 or 0 end
        end
    end)

    local List = Instance.new("Frame", T1)
    List.Size = UDim2.new(1, 0, 0, 200)
    List.BackgroundTransparency = 1
    Instance.new("UIListLayout", List).Padding = UDim.new(0, 5)

    local function up()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp then
                local f = Instance.new("Frame", List)
                f.Size = UDim2.new(1, 0, 0, 45)
                f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Instance.new("UICorner", f)
                
                local t = Instance.new("TextLabel", f)
                t.Size = UDim2.new(1, -70, 1, 0)
                t.Position = UDim2.new(0, 5, 0, 0)
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
    end
    up()

    local Stop = Instance.new("TextButton", T1)
    Stop.Size = UDim2.new(1, -5, 0, 40)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildMain()

-- [[ SCRIPTS (8 ШТУК) ]] --
local function AddS(n, u)
    local b = Instance.new("TextButton", T2)
    b.Size = UDim2.new(1, -5, 0, 40)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        task.spawn(function()
            task.wait(2)
            local j = pgui:FindFirstChild("JunkieKeySystem") or pgui:FindFirstChild("ProjectYoda")
            if j then j:Destroy() end
        end)
        loadstring(game:HttpGet(u))()
    end)
end

AddS("FPS Flick (BYPASS)", "https://api.junkie-development.de/api/v1/luascripts/public/8b5174946c76ba81d5c374bd4a69f7694d10c837e37522a04c91b2b32991e20e/download")
AddS("Lucky Blocks", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
AddS("Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddS("Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddS("Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddS("Fly Script", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddS("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddS("Remote Spy", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

-- [[ AUTO FARM ]] --
local AF = Instance.new("TextButton", T3)
AF.Size = UDim2.new(1, -5, 0, 45)
AF.Text = "AUTO POPCORN [ OFF ]"
AF.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
AF.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", AF)
AF.MouseButton1Click:Connect(function() AF.Text = "AUTO POPCORN [ ON ]" AF.TextColor3 = Color3.new(1, 0, 0) end)

-- Кнопка DH
local Btn = Instance.new("TextButton", Gui)
Btn.Size = UDim2.new(0, 55, 0, 55)
Btn.Position = UDim2.new(0, 15, 0.5, 0)
Btn.Text = "DH"
Btn.BackgroundColor3 = Color3.new(0,0,0)
Btn.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Btn).CornerRadius = UDim.new(1,0)
Instance.new("UIStroke", Btn).Color = Color3.new(1,0,0)
Btn.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

StartLoader()
Main.Visible = true
T1.Visible = true
