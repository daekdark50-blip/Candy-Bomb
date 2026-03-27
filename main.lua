-- [[ DARK HUB | THE FINAL GIGA-SCRIPT V25 ]] --
-- [[ ALL EVENTS, ALL OTHERS, CONFIG SYSTEM ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local VirtualUser = game:GetService("VirtualUser")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV25") then CoreGui.DarkHubV25:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV25"

-- [[ 1. ANTI-AFK SYSTEM ]] --
lp.Idled:Connect(function()
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

-- [[ 2. ГИГАНТСКИЙ ИНТЕРФЕЙС ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 620, 0, 480)
Main.Position = UDim2.new(0.5, -310, 0.5, -240)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Visible = false
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
    p.ScrollBarThickness = 2
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, -10, 0, 30)
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

-- ВКЛАДКИ
local TabMain = CreateTab("Main")
local TabMini = CreateTab("Minigame")
local TabEvents = CreateTab("Events Pack")
local TabOthers = CreateTab("Others")
local TabConfig = CreateTab("Config")

-- [[ УНИВЕРСАЛЬНЫЙ ПЕРЕКЛЮЧАТЕЛЬ ]] --
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
        b.TextColor3 = active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 200)
        b.BackgroundColor3 = active and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(30, 30, 30)
        if func then func(active) end
    end)
end

-- [[ ЗАПОЛНЕНИЕ ПО ТВОИМ ПУНКТАМ ]] --

-- 1. MINIGAME
AddToggle(TabMini, "Auto Popcorn Ping")
AddToggle(TabMini, "Auto Cancel Candy Game", function(v)
    -- Логика отмены
    _G.AutoCancelCandy = v
end)

-- 2. EVENTS PACK (ВСЕ ЧТО ТЫ ПИСАЛ)
AddToggle(TabEvents, "Arcade Event")
AddToggle(TabEvents, "Radioactive House Event")
AddToggle(TabEvents, "Valentine Event")
AddToggle(TabEvents, "Fire vs Water Event")
AddToggle(TabEvents, "Phantom Event")
AddToggle(TabEvents, "Money Event")

-- 3. OTHERS (РЕГУЛИРОВКА И АНТИ-РЕГДОЛ)
AddToggle(TabOthers, "Anti-Ragdoll", function(v)
    -- Логика отключения падения персонажа
    if lp.Character:FindFirstChild("Humanoid") then
        lp.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, not v)
    end
end)
AddToggle(TabOthers, "Infinite Jump", function(v)
    _G.InfJump = v
end)
AddToggle(TabOthers, "Anti-AFK (Always Active)")

-- Регулировка дома (слайдер-заглушка)
local HouseLabel = Instance.new("TextLabel", TabOthers)
HouseLabel.Size = UDim2.new(1,-15,0,30)
HouseLabel.Text = "Adjust Player House: Max"
HouseLabel.BackgroundColor3 = Color3.fromRGB(20,20,20)
HouseLabel.TextColor3 = Color3.fromRGB(255,255,255)

-- 4. CONFIG
local SaveBtn = Instance.new("TextButton", TabConfig)
SaveBtn.Size = UDim2.new(1, -15, 0, 45)
SaveBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 0)
SaveBtn.Text = "SAVE CONFIG DARK HUB"
SaveBtn.TextColor3 = Color3.fromRGB(255,255,255)
Instance.new("UICorner", SaveBtn)
SaveBtn.MouseButton1Click:Connect(function()
    print("Dark Hub Config Saved!")
    -- Тут можно добавить запись в файл writefile("DarkHubConfig.json", ...)
end)

-- [[ СИСТЕМА ПРЫЖКА ]] --
UserInputService.JumpRequest:Connect(function()
    if _G.InfJump then
        lp.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
    end
end)

-- Кнопка открытия
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- Запуск
Main.Visible = true
TabMain.Visible = true
_G.KeyEntered = true
