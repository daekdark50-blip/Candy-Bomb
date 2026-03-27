-- [[ OMNI-X HUB V7 | FLY & FULL INVIS ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

-- Cleanup
if CoreGui:FindFirstChild("OmniHubV7") then CoreGui.OmniHubV7:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniHubV7"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

-- [[ КНОПКА [+] ]] --
local Toggle = Instance.new("TextButton")
Toggle.Parent = Gui
Toggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 100
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНАЯ ПАНЕЛЬ ]] --
local Main = Instance.new("Frame")
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Position = UDim2.new(0.5, -120, 0.5, -140)
Main.Size = UDim2.new(0, 240, 0, 280)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- [[ НАВИГАЦИЯ ]] --
local Nav = Instance.new("Frame")
Nav.Size = UDim2.new(1, 0, 0, 35)
Nav.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
Nav.Parent = Main
Instance.new("UICorner", Nav)

local function CreateTabBtn(name, pos)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(0.5, 0, 1, 0)
    b.Position = pos
    b.BackgroundTransparency = 1
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    b.Parent = Nav
    return b
end

local MainTabBtn = CreateTabBtn("MAIN", UDim2.new(0, 0, 0, 0))
local ScriptTabBtn = CreateTabBtn("SCRIPTS", UDim2.new(0.5, 0, 0, 0))

local MainContent = Instance.new("ScrollingFrame")
MainContent.Size = UDim2.new(1, -20, 1, -50)
MainContent.Position = UDim2.new(0, 10, 0, 45)
MainContent.BackgroundTransparency = 1
MainContent.CanvasSize = UDim2.new(0, 0, 0, 400)
MainContent.ScrollBarThickness = 0
MainContent.Parent = Main

local ScriptContent = Instance.new("ScrollingFrame")
ScriptContent.Size = MainContent.Size
ScriptContent.Position = MainContent.Position
ScriptContent.BackgroundTransparency = 1
ScriptContent.Visible = false
ScriptContent.CanvasSize = MainContent.CanvasSize
ScriptContent.ScrollBarThickness = 0
ScriptContent.Parent = Main

local function SetLayout(p)
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 6)
end
SetLayout(MainContent)
SetLayout(ScriptContent)

-- [[ ЛОГИКА ]] --
Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.Text = Main.Visible and "-" or "+"
end)

MainTabBtn.MouseButton1Click:Connect(function()
    MainContent.Visible = true
    ScriptContent.Visible = false
end)

ScriptTabBtn.MouseButton1Click:Connect(function()
    MainContent.Visible = false
    ScriptContent.Visible = true
end)

local function AddBtn(text, parent, callback)
    local active = false
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, 0, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = text .. ": [OFF]"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    b.Parent = parent
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)

    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = text .. (active and ": [ON]" or ": [OFF]")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        callback(active)
    end)
end

-- [[ ФУНКЦИИ ]] --

-- 1. ПОЛНЫЙ ИНВИ
