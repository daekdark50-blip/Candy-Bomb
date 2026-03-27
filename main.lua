-- [[ DARK HUB | THE ULTIMATE BLACK EDITION V17 ]] --
-- [[ REBRANDED FROM MYSTRIX HUB | NO KEY SYSTEM ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV17") then CoreGui.DarkHubV17:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV17"

-- [[ СИСТЕМА УВЕДОМЛЕНИЙ (КАК В ОРИГИНАЛЕ) ]] --
local function Notify(title, text)
    local n = Instance.new("Frame", Gui)
    n.Size = UDim2.new(0, 250, 0, 70)
    n.Position = UDim2.new(1, 10, 0.8, 0)
    n.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Instance.new("UICorner", n)
    
    local tl = Instance.new("TextLabel", n)
    tl.Size = UDim2.new(1, -10, 0, 30)
    tl.Position = UDim2.new(0, 10, 0, 5)
    tl.Text = title
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.Font = Enum.Font.GothamBold
    tl.TextXAlignment = "Left"
    tl.BackgroundTransparency = 1

    local tx = Instance.new("TextLabel", n)
    tx.Size = UDim2.new(1, -10, 0, 30)
    tx.Position = UDim2.new(0, 10, 0, 35)
    tx.Text = text
    tx.TextColor3 = Color3.fromRGB(180, 180, 180)
    tx.Font = Enum.Font.Gotham
    tx.TextXAlignment = "Left"
    tx.BackgroundTransparency = 1

    n:TweenPosition(UDim2.new(1, -260, 0.8, 0), "Out", "Quad", 0.5)
    task.delay(3, function()
        n:TweenPosition(UDim2.new(1, 10, 0.8, 0), "In", "Quad", 0.5)
        task.wait(0.5)
        n:Destroy()
    end)
end

-- [[ ЧЕРНЫЙ ЛОАДЕР (ПО ВИДЕО) ]] --
local function StartLoader()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(0, 450, 0, 200)
    L.Position = UDim2.new(0.5, -225, 0.5, -100)
    L.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- ЧЕРНЫЙ ЦВЕТ
    Instance.new("UICorner", L)

    local Title = Instance.new("TextLabel", L)
    Title.Size = UDim2.new(1, 0, 0, 60)
    Title.Text = "DARK HUB"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 28
    Title.BackgroundTransparency = 1

    local Status = Instance.new("TextLabel", L)
    Status.Size = UDim2.new(1, 0, 0, 40)
    Status.Position = UDim2.new(0, 0, 0.4, 0)
    Status.Text = "Detected: Escape Tsunami For Brainrots!"
    Status.TextColor3 = Color3.fromRGB(200, 200, 200)
    Status.BackgroundTransparency = 1

    local Bar = Instance.new("Frame", L)
    Bar.Size = UDim2.new(0.8, 0, 0, 4)
    Bar.Position = UDim2.new(0.1, 0, 0.7, 0)
    Bar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    
    local Fill = Instance.new("Frame", Bar)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    Fill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 2)
    task.wait(2.2)
    L:Destroy()
end

-- [[ ОСНОВНОЕ МЕНЮ (КОПИЯ MYSTRIX) ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 550, 0, 400)
Main.Position = UDim2.new(0.5, -275, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5) -- Ультра-черный
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Сайдбар (Список функций как на видео)
local Side = Instance.new("ScrollingFrame", Main)
Side.Size = UDim2.new(0, 150, 1, -20)
Side.Position = UDim2.new(0, 10, 0, 10)
Side.BackgroundTransparency = 1
Side.CanvasSize = UDim2.new(0, 0, 1.5, 0)
Side.ScrollBarThickness = 2
local List = Instance.new("UIListLayout", Side)
List.Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -180, 1, -20)
Container.Position = UDim2.new(0, 170, 0, 10)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)

    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, -5, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

-- КАТЕГОРИИ ИЗ ОРИГИНАЛА
local Tabs = {
    "Discord", "Tower", "Sacrifice", "St Patrick", "Acid Rain", 
    "Tornado", "Lucky Storm", "Webhook", "Carnival", "Minigame", 
    "Auto Farm", "Areas", "Stealing", "Sell", "Others", "Config"
}

for _, name in pairs(Tabs) do
    local t = CreateTab(name)
    if name == "Auto Farm" then
        -- Пример кнопки
        local btn = Instance.new("TextButton", t)
        btn.Size = UDim2.new(1, 0, 0, 40)
        btn.Text = "START ALL AUTO FARMS"
        btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        btn.TextColor3 = Color3.fromRGB(255,255,255)
        btn.MouseButton1Click:Connect(function()
            Notify("Auto Farm", "All systems activated!")
        end)
    end
end

-- КНОПКА ЗАПУСКА ОРИГИНАЛЬНОГО КОДА (КРЯК)
local Launch = Instance.new("TextButton", Main)
Launch.Size = UDim2.new(0, 150, 0, 40)
Launch.Position = UDim2.new(0, 10, 1, -50)
Launch.Text = "LAUNCH MYSTRIX"
Launch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Launch.TextColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Launch)

Launch.MouseButton1Click:Connect(function()
    Notify("Dark Hub", "Bypassing Key System...")
    _G.KeyEntered = true -- Bypass
    loadstring(game:HttpGet("https://github.com/OxyCoder32/Crackers/raw/refs/heads/main/Mystrix%20Hub"))()
end)

-- ЗАПУСК
task.spawn(function()
    StartLoader()
    Main.Visible = true
    Notify("Dark Hub", "Successfully Loaded!")
end)
