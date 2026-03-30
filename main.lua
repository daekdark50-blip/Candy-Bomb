-- [[ DARK HUB | ULTIMATE INJECTOR | BY DANYA & LIYA ]] --
local Players = game:GetService("Players")
local LPlayer = Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")

-- Чистим старые меню
for _, v in pairs(CoreGui:GetChildren()) do
    if v.Name == "DarkMenu_Final" or v.Name == "DL_LoadSystem" then v:Destroy() end
end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkMenu_Final"

-- [[ 1. СИСТЕМА ЛОАД-ИНЖЕКТА ]] --
local LoadFrame = Instance.new("Frame", ScreenGui)
LoadFrame.Name = "DL_LoadSystem"
LoadFrame.Size = UDim2.new(0, 380, 0, 150)
LoadFrame.Position = UDim2.new(0.5, -190, 0.5, -75)
LoadFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
LoadFrame.BorderSizePixel = 2
LoadFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", LoadFrame)

local StatusLabel = Instance.new("TextLabel", LoadFrame)
StatusLabel.Size = UDim2.new(1, 0, 0.4, 0)
StatusLabel.Position = UDim2.new(0, 0, 0.1, 0)
StatusLabel.Text = "WAITING FOR INJECTION..."
StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusLabel.Font = Enum.Font.GothamBold
StatusLabel.TextSize = 18
StatusLabel.BackgroundTransparency = 1

local BarBack = Instance.new("Frame", LoadFrame)
BarBack.Size = UDim2.new(0.8, 0, 0, 12)
BarBack.Position = UDim2.new(0.1, 0, 0.6, 0)
BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
local BarFill = Instance.new("Frame", BarBack)
BarFill.Size = UDim2.new(0, 0, 1, 0)
BarFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", BarFill)

local PercentText = Instance.new("TextLabel", LoadFrame)
PercentText.Size = UDim2.new(1, 0, 0.2, 0)
PercentText.Position = UDim2.new(0, 0, 0.75, 0)
PercentText.Text = "0%"
PercentText.TextColor3 = Color3.fromRGB(255, 0, 0)
PercentText.Font = Enum.Font.GothamBold
PercentText.BackgroundTransparency = 1

-- [[ 2. ТВОЁ ЛЮБИМОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 430, 0, 600)
Main.Position = UDim2.new(0.5, -215, 0.5, -300)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Иконка D.L
local Icon = Instance.new("TextButton", ScreenGui)
Icon.Size = UDim2.new(0, 60, 0, 60)
Icon.Position = UDim2.new(0.05, 0, 0.15, 0)
Icon.Text = "D.L"
Icon.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Icon.Font = Enum.Font.GothamBold
Instance.new("UICorner", Icon).CornerRadius = UDim.new(1, 0)
Icon.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1, -20, 1, -80)
Scroll.Position = UDim2.new(0, 10, 0, 70)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 9, 0)
Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 10)

-- Функции кнопок
local function NewSec(t)
    local l = Instance.new("TextLabel", Scroll)
    l.Size = UDim2.new(1, 0, 0, 35); l.Text = "--- " .. t .. " ---"; l.TextColor3 = Color3.fromRGB(255, 0, 0); l.BackgroundTransparency = 1; l.Font = Enum.Font.GothamBold
end

local function NewBtn(t, code)
    local b = Instance.new("TextButton", Scroll)
    b.Size = UDim2.new(0.95, 0, 0, 45); b.BackgroundColor3 = Color3.fromRGB(25, 25, 25); b.Text = t; b.TextColor3 = Color3.fromRGB(255, 255, 255); b.Font = Enum.Font.GothamBold; Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() pcall(function() loadstring(game:HttpGet(code))() end) end)
end

-- НАПОЛНЕНИЕ
NewSec("LEGENDS")
NewBtn("👻 UNIVERSAL INVIS", "https://rawscripts.net/raw/Universal-Script-Invisible-Script-Universal-109667")
NewBtn("👤 JOHN DOE FE", "https://rawscripts.net/raw/Client-Replication-John-doe-up-by-gojohdkaisenkt-34198")
NewBtn("💀 GUEST 666", "https://raw.githubusercontent.com/gObl00x/My-Scripts/refs/heads/main/Guest%20666.lua")
NewSec("COMBAT")
local AimEnabled = false; local AimRadius = 350
local OnBtn = Instance.new("TextButton", Scroll); OnBtn.Size = UDim2.new(0.95, 0, 0, 45); OnBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); OnBtn.Text = "ВКЛЮЧИТЬ АИМ"; OnBtn.TextColor3 = Color3.fromRGB(0, 255, 0); OnBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", OnBtn)
local OffBtn = Instance.new("TextButton", Scroll); OffBtn.Size = UDim2.new(0.95, 0, 0, 45); OffBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); OffBtn.Text = "ВЫКЛЮЧИТЬ АИМ"; OffBtn.TextColor3 = Color3.fromRGB(255, 0, 0); OffBtn.Font = Enum.Font.GothamBold; Instance.new("UICorner", OffBtn)
local AimCircle = Instance.new("Frame", ScreenGui); AimCircle.Size = UDim2.new(0, AimRadius*2, 0, AimRadius*2); AimCircle.Position = UDim2.new(0.5, -AimRadius, 0.5, -AimRadius); AimCircle.BackgroundTransparency = 1; AimCircle.Visible = false
local Stroke = Instance.new("UIStroke", AimCircle); Stroke.Thickness = 3; Stroke.Color = Color3.fromRGB(255, 0, 0); Stroke.Transparency = 0.4; Instance.new("UICorner", AimCircle).CornerRadius = UDim.new(1, 0)
OnBtn.MouseButton1Click:Connect(function() AimEnabled = true AimCircle.Visible = true end)
OffBtn.MouseButton1Click:Connect(function() AimEnabled = false AimCircle.Visible = false end)

-- АИМ логика и FOV
Camera.FieldOfView = 120
game:GetService("RunService").RenderStepped:Connect(function()
    if AimEnabled then
        local target = nil; local mag = AimRadius
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos, onScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if dist < mag then mag = dist; target = v end
                end
            end
        end
        if target then Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position) end
    end
end)

-- [[ 3. КРАСИВЫЙ ПРОЦЕСС ИНЖЕКТА ]] --
task.spawn(function()
    local steps = {"Fetching Scripts...", "Injecting Aimbot...", "Loading John Doe...", "Activating Invisible...", "Dark Hub Ready!"}
    for i = 1, 100 do
        task.wait(0.04)
        BarFill.Size = UDim2.new(i/100, 0, 1, 0)
        PercentText.Text = i .. "%"
        if i == 20 then StatusLabel.Text = steps[1] end
        if i == 45 then StatusLabel.Text = steps[2] end
        if i == 70 then StatusLabel.Text = steps[3] end
        if i == 90 then StatusLabel.Text = steps[4] end
        if i == 100 then StatusLabel.Text = steps[5] end
    end
    task.wait(0.5)
    LoadFrame:Destroy()
    Main.Visible = true
end)
