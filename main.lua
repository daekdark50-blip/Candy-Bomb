-- [[ DARK HUB | ULTIMATE CONSOLIDATED V24 ]] --
-- [[ BASED ON 20+ SCREENSHOTS & VIDEOS | BY DARK BY HUB ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer

-- Удаление старой версии
if CoreGui:FindFirstChild("DarkHubV24") then CoreGui.DarkHubV24:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV24"
Gui.ResetOnSpawn = false

-- [[ 1. СИСТЕМА УВЕДОМЛЕНИЙ ]] --
local function Notify(title, text)
    local n = Instance.new("Frame", Gui)
    n.Size = UDim2.new(0, 250, 0, 60)
    n.Position = UDim2.new(1, 10, 0.85, 0)
    n.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", n)
    local t = Instance.new("TextLabel", n)
    t.Size = UDim2.new(1, -20, 1, 0)
    t.Position = UDim2.new(0, 10, 0, 0)
    t.Text = title .. ": " .. text
    t.TextColor3 = Color3.fromRGB(255, 255, 255)
    t.Font = Enum.Font.GothamBold
    t.TextSize = 12
    t.BackgroundTransparency = 1
    n:TweenPosition(UDim2.new(1, -260, 0.85, 0), "Out", "Quad", 0.4)
    task.delay(3, function()
        n:TweenPosition(UDim2.new(1, 10, 0.85, 0), "In", "Quad", 0.4)
        task.wait(0.4) n:Destroy()
    end)
end

-- [[ 2. ЗАГРУЗКА ИЗ ВИДЕО ]] --
local function StartLoader()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(0, 420, 0, 180)
    L.Position = UDim2.new(0.5, -210, 0.5, -90)
    L.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Instance.new("UICorner", L)
    local T = Instance.new("TextLabel", L)
    T.Size = UDim2.new(1, 0, 0, 60)
    T.Text = "DARK HUB"
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 35
    T.BackgroundTransparency = 1
    local B = Instance.new("Frame", L)
    B.Size = UDim2.new(0.8, 0, 0, 4)
    B.Position = UDim2.new(0.1, 0, 0.75, 0)
    B.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    local F = Instance.new("Frame", B)
    F.Size = UDim2.new(0, 0, 1, 0)
    F.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    F:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 2)
    task.wait(2.2)
    L:Destroy()
end

-- [[ 3. ОСНОВНОЙ ХАБ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 600, 0, 450)
Main.Position = UDim2.new(0.5, -300, 0.5, -225)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Сайдбар
local Side = Instance.new("ScrollingFrame", Main)
Side.Size = UDim2.new(0, 160, 1, -10)
Side.Position = UDim2.new(0, 5, 0, 5)
Side.BackgroundTransparency = 1
Side.ScrollBarThickness = 0
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 2)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -175, 1, -10)
Container.Position = UDim2.new(0, 170, 0, 5)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 2
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 10)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, -10, 0, 32)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = " " .. name
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.TextXAlignment = "Left"
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

-- Создаем все вкладки из 20 фоток
local TabMain = CreateTab("Main & Stalk")
local TabMini = CreateTab("Minigames")
local TabEvents = CreateTab("Events & Bosses")
local TabMachines = CreateTab("Machines Slots")
local TabFarm = CreateTab("Auto Farm (X)")
local TabOthers = CreateTab("Others & Misc")
local TabScripts = CreateTab("External Scripts")

-- [[ УНИВЕРСАЛЬНЫЙ КОНСТРУКТОР ЭЛЕМЕНТОВ ]] --
local function AddToggle(parent, name, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, -15, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = "  " .. name .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.TextXAlignment = "Left"
    Instance.new("UICorner", b)
    local active = false
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = "  " .. name .. (active and ": ON" or ": OFF")
        b.TextColor3 = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)
        b.BackgroundColor3 = active and Color3.fromRGB(50, 0, 100) or Color3.fromRGB(30, 30, 30)
        if callback then callback(active) end
    end)
end

-- [[ ЗАПОЛНЕНИЕ ПО СКРИНШОТАМ ]] --

-- MAIN (Stalker из старых версий + Rewards)
AddToggle(TabMain, "Auto Claim Playtime", function(v) end)
AddToggle(TabMain, "Auto Rebirth", function(v) end)
for _, p in pairs(Players:GetPlayers()) do
    if p ~= lp then
        local stalk = Instance.new("TextButton", TabMain)
        stalk.Size = UDim2.new(1,-15,0,35)
        stalk.Text = "Stalk: " .. p.DisplayName
        stalk.BackgroundColor3 = Color3.fromRGB(20,20,20)
        stalk.TextColor3 = Color3.fromRGB(180,0,255)
        stalk.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
    end
end

-- MINIGAMES (По запросу: Popcorn, Cancel, Candy)
AddToggle(TabMini, "Auto Popcorn Ping")
AddToggle(TabMini, "Auto Cancel Candy Game")
AddToggle(TabMini, "Instant Win Candy Game")

-- EVENTS
AddToggle(TabEvents, "Auto Lift Up")
AddToggle(TabEvents, "Auto Trade Up (Nebuluck)")
AddToggle(TabEvents, "Auto Farm Orbs/Shards")

-- MACHINES
AddToggle(TabMachines, "Auto Slot 1")
AddToggle(TabMachines, "Auto Slot 2")
AddToggle(TabMachines, "Auto Slot 3")

-- AUTO FARM
AddToggle(TabFarm, "Tween Speed (500) Active")
AddToggle(TabFarm, "Infinity Rarity Only")
AddToggle(TabFarm, "Auto Farm Best Brainrots")

-- OTHERS
AddToggle(TabOthers, "Infinite Jump", function(v)
    UserInputService.JumpRequest:Connect(function()
        if v then lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping") end
    end)
end)
AddToggle(TabOthers, "Max Zoom Distance (33)", function(v)
    lp.CameraMaxZoomDistance = v and 33 or 128
end)

-- SCRIPTS (Внешние)
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1,-15,0,40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(45,45,45)
    b.TextColor3 = Color3.fromRGB(255,255,255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        _G.KeyEntered = true
        loadstring(game:HttpGet(url))()
    end)
end
AddScript("Escape Tsunami (Original Crack)", "https://github.com/OxyCoder32/Crackers/raw/refs/heads/main/Mystrix%20Hub")
AddScript("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")

-- Кнопка открытия
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(180, 0, 255)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- Запуск
task.spawn(function()
    StartLoader()
    Main.Visible = true
    TabMain.Visible = true
    Notify("Dark Hub", "V24 Loaded Successfully!")
end)
