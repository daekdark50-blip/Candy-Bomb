-- [[ DARK HUB | THE FINAL BOSS V23 ]] --
-- [[ EVERYTHING STOLEN & REBRANDED | NO KEY ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV23") then CoreGui.DarkHubV23:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV23"

-- [[ ЧЕРНЫЙ ЛОАДЕР ]] --
local function StartDarkLoading()
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
    T.TextSize = 30
    T.BackgroundTransparency = 1

    local Bar = Instance.new("Frame", L)
    Bar.Size = UDim2.new(0.8, 0, 0, 4)
    Bar.Position = UDim2.new(0.1, 0, 0.75, 0)
    Bar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    
    local Fill = Instance.new("Frame", Bar)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

    Fill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 1.5)
    task.wait(1.7)
    L:Destroy()
end

-- [[ ИНТЕРФЕЙС ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 580, 0, 440)
Main.Position = UDim2.new(0.5, -290, 0.5, -220)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Сайдбар
local Side = Instance.new("ScrollingFrame", Main)
Side.Size = UDim2.new(0, 150, 1, -20)
Side.Position = UDim2.new(0, 5, 0, 10)
Side.BackgroundTransparency = 1
Side.ScrollBarThickness = 0
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 2)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -170, 1, -20)
Container.Position = UDim2.new(0, 165, 0, 10)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 2
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)

    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, -10, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.Text = " " .. name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextXAlignment = "Left"
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

-- Вкладки
local Tabs = {"Main", "Minigame", "Events", "Machines", "Auto Farm", "Others", "Scripts"}
local Pages = {}
for _, n in pairs(Tabs) do Pages[n] = CreateTab(n) end

-- [[ ФУНКЦИИ ИЗ СКРИНШОТОВ ]] --
local function AddControl(parent, name, desc)
    local f = Instance.new("TextButton", parent)
    f.Size = UDim2.new(1, -10, 0, 40)
    f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    f.Text = "  " .. name .. (desc and (" | " .. desc) or "")
    f.TextColor3 = Color3.fromRGB(200, 200, 200)
    f.TextXAlignment = "Left"
    Instance.new("UICorner", f)
end

-- MAIN (Stalker)
AddControl(Pages["Main"], "STOP STALK", "Return Camera")
AddControl(Pages["Main"], "Auto Claim Rewards")

-- MINIGAME
AddControl(Pages["Minigame"], "Auto Popcorn Ping")
AddControl(Pages["Minigame"], "Auto Cancel")
AddControl(Pages["Minigame"], "Candy Game")

-- EVENTS
AddControl(Pages["Events"], "Auto Lift")
AddControl(Pages["Events"], "Trade Up (Nebuluck)")
AddControl(Pages["Events"], "Auto Farm Orbs/Shards")

-- MACHINES
AddControl(Pages["Machines"], "Slot 1: Active")
AddControl(Pages["Machines"], "Slot 2: Active")
AddControl(Pages["Machines"], "Slot 3: Active")

-- AUTO FARM
AddControl(Pages["Auto Farm"], "Tween Speed", "500")
AddControl(Pages["Auto Farm"], "Rarity Filter", "Infinity")

-- OTHERS
AddControl(Pages["Others"], "Infinite Jump", "ON")
AddControl(Pages["Others"], "Max Zoom Distance", "33")

-- SCRIPTS
AddControl(Pages["Scripts"], "Launch Tsunami (No Key)")

-- Кнопка DH
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- Старт
task.spawn(function()
    StartDarkLoading()
    Main.Visible = true
    Pages["Main"].Visible = true
    _G.KeyEntered = true
    _G.CheckKey = function() return true end
end)
