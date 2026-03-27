-- [[ DARK HUB V34 | CLEAN EDITION ]] --
-- [[ ONLY MAIN & SCRIPTS | AK ADMIN HEADER ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV34") then CoreGui.DarkHubV34:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV34"

-- [[ 1. ЧЕРНОЕ ОКНО ЗАГРУЗКИ ]] --
local function StartLoader()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(1, 0, 1, 0)
    L.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    L.ZIndex = 10

    local T = Instance.new("TextLabel", L)
    T.Size = UDim2.new(1, 0, 1, 0)
    T.Text = "loading dark hub v34..."
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 30
    T.BackgroundTransparency = 1

    task.wait(2)
    L:Destroy()
end

-- [[ 2. ОСНОВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Position = UDim2.new(0.5, -250, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- ВЕРХНЯЯ ПАНЕЛЬ (AK ADMIN)
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", Header)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "AK ADMIN | DARK HUB V34"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = "Left"
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

-- НАВИГАЦИЯ (2 ВКЛАДКИ)
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, -50)
Side.Position = UDim2.new(0, 5, 0, 45)
Side.BackgroundTransparency = 1
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -160, 1, -55)
Container.Position = UDim2.new(0, 150, 0, 45)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)

    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = name
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

-- [[ ФУНКЦИИ MAIN (SPECTOR) ]] --
local function AddSpector()
    local reset = Instance.new("TextButton", TabMain)
    reset.Size = UDim2.new(1, 0, 0, 35)
    reset.Text = "Reset Camera"
    reset.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    reset.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", reset)
    reset.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local b = Instance.new("TextButton", TabMain)
            b.Size = UDim2.new(1, 0, 0, 35)
            b.Text = "Spectate: " .. p.DisplayName
            b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end
end
AddSpector()

-- [[ ФУНКЦИИ SCRIPTS ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
end

AddScript("Escape Tsunami (Dark Hub)", "https://github.com/OxyCoder32/Crackers/raw/refs/heads/main/Mystrix%20Hub")
AddScript("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScript("Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")

-- КНОПКА DH
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ЗАПУСК
task.spawn(function()
    StartLoader()
    Main.Visible = true
    TabMain.Visible = true
end)
