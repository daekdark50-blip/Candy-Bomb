-- [[ OMNI-X V2.3 | ULTRA STABLE ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Удаление старого
if CoreGui:FindFirstChild("OmniV2") then CoreGui.OmniV2:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniV2"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

-- [[ ПРОСТАЯ ЗАГРУЗКА (ЧТОБЫ НЕ ВЫЛЕТАЛО) ]] --
local LFrame = Instance.new("Frame", Gui)
LFrame.Size = UDim2.new(1, 0, 1, 0)
LFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
LFrame.ZIndex = 200

local LText = Instance.new("TextLabel", LFrame)
LText.Size = UDim2.new(1, 0, 1, 0)
LText.Text = "LOADING OMNI-X..."
LText.TextColor3 = Color3.fromRGB(255, 0, 0)
LText.Font = Enum.Font.GothamBold
LText.TextSize = 30
LText.BackgroundTransparency = 1

task.wait(1.5)
LFrame:Destroy()

-- [[ ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 240, 0, 280)
Main.Position = UDim2.new(0.5, -120, 0.5, -140)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Красный Плюсик [+]
local Toggle = Instance.new("TextButton", Gui)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 150
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.Text = Main.Visible and "-" or "+"
end)

-- Навигация
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

local T1 = CreateTab("MAIN", UDim2.new(0,0,0,0))
local T2 = CreateTab("SCRIPTS", UDim2.new(0.5,0,0,0))

-- Списки кнопок
local C1 = Instance.new("ScrollingFrame", Main)
C1.Size = UDim2.new(1, -20, 1, -50)
C1.Position = UDim2.new(0, 10, 0, 45)
C1.BackgroundTransparency = 1
C1.ScrollBarThickness = 0
C1.Visible = true
local L1 = Instance.new("UIListLayout", C1)
L1.Padding = UDim.new(0, 5)

local C2 = Instance.new("ScrollingFrame", Main)
C2.Size = C1.Size
C2.Position = C1.Position
C2.BackgroundTransparency = 1
C2.ScrollBarThickness = 0
C2.Visible = false
local L2 = Instance.new("UIListLayout", C2)
L2.Padding = UDim.new(0, 5)

T1.MouseButton1Click:Connect(function() C1.Visible = true C2.Visible = false end)
T2.MouseButton1Click:Connect(function() C1.Visible = false C2.Visible = true end)

-- Создание кнопок On/Off
local function AddToggle(text, parent, func)
    local active = false
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = text .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)

    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = text .. (active and ": ON" or ": OFF")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        func(active)
    end)
end

-- [[ ФУНКЦИИ ВКЛАДКИ MAIN ]] --

AddToggle("Full Invisible", C1, function(s)
    local char = lp.Character
    if char then
        for _, v in pairs(char:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then
                v.Transparency = s and 1 or 0
            end
        end
    end
end)

local flying = false
AddToggle("Fly Mode", C1, function(s)
    flying = s
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if flying then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "OmniFly"
        bv.MaxForce = Vector3.new(1,1,1) * 10^6
        task.spawn(function()
            while flying do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 50
                task.wait()
            end
            if bv then bv:Destroy() end
        end)
    else
        if hrp:FindFirstChild("OmniFly") then hrp.OmniFly:Destroy() end
    end
end)

AddToggle("Wallhack (ESP)", C1, function(s)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if s then
                local h = Instance.new("Highlight", p.Character)
                h.Name = "ESP"
                h.FillColor = Color3.fromRGB(255, 0, 0)
            else
                if p.Character:FindFirstChild("ESP") then p.Character.ESP:Destroy() end
            end
        end
    end
end)

AddToggle("Spectate Player", C1, function(s)
    if s then
        local plrs = Players:GetPlayers()
        local target = plrs[math.random(1, #plrs)]
        if target.Character then workspace.CurrentCamera.CameraSubject = target.Character.Humanoid end
    else
        workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
    end
end)

-- [[ ВКЛАДКА SCRIPTS ]] --
AddToggle("Place Holder", C2, function() end)
AddToggle("Destroy UI", C2, function() Gui:Destroy() end)
