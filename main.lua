-- [[ OMNI-X HUB V2.2 | THE RETURN ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Удаление старого
if CoreGui:FindFirstChild("OmniHubV2") then CoreGui.OmniHubV2:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniHubV2"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

-- [[ МРАЧНАЯ ЗАГРУЗКА ]] --
local LoadFrame = Instance.new("Frame", Gui)
LoadFrame.Size = UDim2.new(1, 0, 1, 0)
LoadFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)

local Tl = Instance.new("TextLabel", LoadFrame)
Tl.Size = UDim2.new(0, 300, 0, 50)
Tl.Position = UDim2.new(0.5, -150, 0.4, 0)
Tl.Text = "RESTORING OMNI-X V2..."
Tl.TextColor3 = Color3.fromRGB(200, 0, 0)
Tl.Font = Enum.Font.GothamBold
Tl.TextSize = 25
Tl.BackgroundTransparency = 1

local Bar = Instance.new("Frame", LoadFrame)
Bar.Size = UDim2.new(0, 0, 0, 4)
Bar.Position = UDim2.new(0.5, -100, 0.5, 10)
Bar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Bar.BorderSizePixel = 0
Bar:TweenSize(UDim2.new(0, 200, 0, 4), "Out", "Linear", 1.5)

wait(1.7)
LoadFrame:Destroy()

-- [[ ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 240, 0, 280)
Main.Position = UDim2.new(0.5, -120, 0.5, -140)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Плюс-кнопка [+]
local Toggle = Instance.new("TextButton", Gui)
Toggle.Size = UDim2.new(0, 45, 0, 45)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.Font = Enum.Font.GothamBold
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.Text = Main.Visible and "-" or "+"
end)

-- Навигация (MAIN / SCRIPTS)
local Nav = Instance.new("Frame", Main)
Nav.Size = UDim2.new(1, 0, 0, 35)
Nav.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
Instance.new("UICorner", Nav)

local function CreateTab(n, p)
    local b = Instance.new("TextButton", Nav)
    b.Size = UDim2.new(0.5, 0, 1, 0)
    b.Position = p
    b.BackgroundTransparency = 1
    b.Text = n
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    return b
end

local Tab1 = CreateTab("MAIN", UDim2.new(0,0,0,0))
local Tab2 = CreateTab("SCRIPTS", UDim2.new(0.5,0,0,0))

-- Контейнеры
local Cont1 = Instance.new("ScrollingFrame", Main)
Cont1.Size = UDim2.new(1, -20, 1, -50)
Cont1.Position = UDim2.new(0, 10, 0, 45)
Cont1.BackgroundTransparency = 1
Cont1.ScrollBarThickness = 0
Instance.new("UIListLayout", Cont1).Padding = UDim.new(0, 5)

local Cont2 = Instance.new("ScrollingFrame", Main)
Cont2.Size = Cont1.Size
Cont2.Position = Cont1.Position
Cont2.BackgroundTransparency = 1
Cont2.Visible = false
Cont2.ScrollBarThickness = 0
Instance.new("UIListLayout", Cont2).Padding = UDim.new(0, 5)

Tab1.MouseButton1Click:Connect(function() Cont1.Visible = true Cont2.Visible = false end)
Tab2.MouseButton1Click:Connect(function() Cont1.Visible = false Cont2.Visible = true end)

-- Функция создания кнопок On/Off
local function AddToggle(text, parent, func)
    local active = false
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = text .. ": [OFF]"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)

    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = text .. (active and ": [ON]" or ": [OFF]")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        func(active)
    end)
end

-- [[ ВКЛАДКА MAIN ]] --

AddToggle("Full Invis", Cont1, function(s)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:
                    
