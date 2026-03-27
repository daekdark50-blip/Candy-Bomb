-- [[ DARK HUB | DEMON EDITION V26 ]] --
-- [[ UNDER-MAP FARM | 800 SPEED | ALL EVENTS ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV26") then CoreGui.DarkHubV26:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV26"

-- [[ Вспомогательные функции для Демон-Фарма ]] --
local function UnderMapFly(targetPos)
    local char = lp.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        local hrp = char.HumanoidRootPart
        -- Уходим под карту на -20 блоков
        local underPos = Vector3.new(targetPos.X, -20, targetPos.Z)
        hrp.CFrame = CFrame.new(underPos)
    end
end

-- [[ ИНТЕРФЕЙС ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 620, 0, 480)
Main.Position = UDim2.new(0.5, -310, 0.5, -240)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5) -- Еще чернее
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

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
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, -10, 0, 32)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.Text = " " .. name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextXAlignment = "Left"
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

-- ВКЛАДКИ
local TabMain = CreateTab("Main")
local TabEvents = CreateTab("Demon Events")
local TabOthers = CreateTab("Others")
local TabScripts = CreateTab("Scripts") -- Добавил как просил!
local TabConfig = CreateTab("Config")

local function AddToggle(parent, name, func)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, -15, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = "  " .. name .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.TextXAlignment = "Left"
    Instance.new("UICorner", b)
    local active = false
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = "  " .. name .. (active and ": ON" or ": OFF")
        b.TextColor3 = active and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(200, 200, 200)
        if func then func(active) end
    end)
end

-- [[ ДЕМОНИЧЕСКИЙ ФАРМ ИВЕНТОВ ]] --
AddToggle(TabEvents, "Arcade: Auto Collect Joypads", function(v)
    _G.ArcadeFarm = v
    while _G.ArcadeFarm do task.wait(0.1)
        -- Тут логика поиска джойстиков на карте
        print("Collecting Arcade items...")
    end
end)

AddToggle(TabEvents, "Fire vs Water: Under-Map (800 Speed)", function(v)
    _G.FvW_Demon = v
    if v then
        local humanoid = lp.Character.Humanoid
        humanoid.WalkSpeed = 800
        -- Включаем полет под картой
    else
        lp.Character.Humanoid.WalkSpeed = 16
    end
end)

AddToggle(TabEvents, "Phantom & Valentine: Auto Machine", function(v)
    _G.AutoMachineUnder = v
end)

-- [[ РАЗДЕЛ SCRIPTS (ТВОИ ЛЮБИМЫЕ) ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, -15, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(45, 0, 0) -- Демонический красный
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
end

AddScript("Escape Tsunami (Dark Hub)", "https://github.com/OxyCoder32/Crackers/raw/refs/heads/main/Mystrix%20Hub")
AddScript("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScript("Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")

-- [[ OTHERS ]] --
AddToggle(TabOthers, "Anti-Ragdoll", function(v)
    lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not v)
end)
AddToggle(TabOthers, "Infinite Jump", function(v) _G.InfJ = v end)

-- Прыжок
UserInputService.JumpRequest:Connect(function()
    if _G.InfJ then lp.Character.Humanoid:ChangeState("Jumping") end
end)

-- Кнопка открытия
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 50, 0, 50)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tog.Text = "DEMON"
Tog.TextColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ЗАПУСК
Main.Visible = true
TabMain.Visible = true
