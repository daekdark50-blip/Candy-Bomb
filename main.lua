-- [[ DARK HUB | NEAREST WORK READY ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Очистка старых версий
if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "DarkHub"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

-- [[ СТИЛЬНАЯ ЗАГРУЗКА DARK HUB ]] --
local LFrame = Instance.new("Frame", Gui)
LFrame.Size = UDim2.new(1, 0, 1, 0)
LFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LFrame.ZIndex = 1000

local LText = Instance.new("TextLabel", LFrame)
LText.Size = UDim2.new(1, 0, 0, 100)
LText.Position = UDim2.new(0, 0, 0.4, 0)
LText.Text = "DARK HUB\nNEAREST WORK READY"
LText.TextColor3 = Color3.fromRGB(255, 0, 0)
LText.Font = Enum.Font.GothamBold
LText.TextSize = 35
LText.BackgroundTransparency = 1

local BarBg = Instance.new("Frame", LFrame)
BarBg.Size = UDim2.new(0, 250, 0, 3)
BarBg.Position = UDim2.new(0.5, -125, 0.6, 0)
BarBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
BarBg.BorderSizePixel = 0

local BarFill = Instance.new("Frame", BarBg)
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
BarFill.BorderSizePixel = 0
BarFill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 1.5)

task.wait(1.8)
LFrame:Destroy()

-- [[ КНОПКА ОТКРЫТИЯ [+] ]] --
local Toggle = Instance.new("TextButton", Gui)
Toggle.Size = UDim2.new(0, 45, 0, 45)
Toggle.Position = UDim2.new(0, 15, 0.5, -22)
Toggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 30
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 500
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНОЕ ОКНО ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 240, 0, 300)
Main.Position = UDim2.new(0.5, -120, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Вкладки
local Nav = Instance.new("Frame", Main)
Nav.Size = UDim2.new(1, 0, 0, 35)
Nav.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Instance.new("UICorner", Nav)

local function MakeTab(txt, pos)
    local b = Instance.new("TextButton", Nav)
    b.Size = UDim2.new(0.5, 0, 1, 0)
    b.Position = pos
    b.BackgroundTransparency = 1
    b.Text = txt
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    return b
end

local T1 = MakeTab("MAIN", UDim2.new(0,0,0,0))
local T2 = MakeTab("SCRIPTS", UDim2.new(0.5,0,0,0))

local C1 = Instance.new("ScrollingFrame", Main)
C1.Size = UDim2.new(1, -20, 1, -50)
C1.Position = UDim2.new(0, 10, 0, 45)
C1.BackgroundTransparency = 1
C1.ScrollBarThickness = 0
Instance.new("UIListLayout", C1).Padding = UDim.new(0, 5)

local C2 = Instance.new("ScrollingFrame", Main)
C2.Size = C1.Size
C2.Position = C1.Position
C2.BackgroundTransparency = 1
C2.Visible = false
C2.ScrollBarThickness = 0
Instance.new("UIListLayout", C2).Padding = UDim.new(0, 5)

T1.MouseButton1Click:Connect(function() C1.Visible = true C2.Visible = false end)
T2.MouseButton1Click:Connect(function() C1.Visible = false C2.Visible = true end)

Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.Text = Main.Visible and "-" or "+"
end)

-- [[ КНОПКИ ]] --
local function AddToggle(txt, parent, func)
    local active = false
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = txt .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = txt .. (active and ": ON" or ": OFF")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        func(active)
    end)
end

-- 1. Full Invis
AddToggle("Full Invisible", C1, function(s)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = s and 1 or 0 end
        end
    end
end)

-- 2. Fly
local flying = false
AddToggle("Fly Mode", C1, function(s)
    flying = s
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if flying then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "DarkFly"
        bv.MaxForce = Vector3.new(1,1,1) * 10^6
        task.spawn(function()
            while flying do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
                task.wait()
            end
            if bv then bv:Destroy() end
        end)
    else
        if hrp:FindFirstChild("Dark
                    
