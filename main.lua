-- [[ DARK HUB v42 | FINAL VERSION ]] --
-- [[ BLOOD LOAD | BIG PLUS | NO KEYS ]] --

local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")

-- Очистка старого хаба
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 1. КРОВАВАЯ ЗАГРУЗКА (ЧЕРНЫЙ ЭКРАН) ]] --
local Loader = Instance.new("Frame", Gui)
Loader.Size = UDim2.new(0, 320, 0, 160)
Loader.Position = UDim2.new(0.5, -160, 0.5, -80)
Loader.BackgroundColor3 = Color3.new(0, 0, 0)
Loader.ZIndex = 500
Instance.new("UICorner", Loader)

local LText = Instance.new("TextLabel", Loader)
LText.Size = UDim2.new(1, 0, 0, 50)
LText.Position = UDim2.new(0, 0, 0, 25)
LText.Text = "LOADING DARK HUB...\nBY AK ADMIN"
LText.TextColor3 = Color3.new(1, 1, 1)
LText.Font = Enum.Font.GothamBold
LText.TextSize = 20
LText.BackgroundTransparency = 1

local BarBack = Instance.new("Frame", Loader)
BarBack.Size = UDim2.new(0.8, 0, 0, 8)
BarBack.Position = UDim2.new(0.1, 0, 0, 100)
BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", BarBack)

local Fill = Instance.new("Frame", BarBack)
Fill.Size = UDim2.new(0, 0, 1, 0)
Fill.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Кровавый цвет
Instance.new("UICorner", Fill)

-- [[ ТОТ САМЫЙ БОЛЬШОЙ ПЛЮС НА ЗАГРУЗКЕ ]] --
local Plus = Instance.new("TextButton", Loader)
Plus.Size = UDim2.new(0, 35, 0, 35)
Plus.Position = UDim2.new(1, -40, 0, 5)
Plus.Text = "+"
Plus.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Plus.TextColor3 = Color3.new(1, 1, 1)
Plus.Font = Enum.Font.GothamBold
Plus.TextSize = 25
Plus.ZIndex = 501
Instance.new("UICorner", Plus)

Plus.MouseButton1Click:Connect(function()
    Gui:Destroy()
end)

-- [[ 2. ГЛАВНЫЙ ХАБ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 500, 0, 360)
Main.Position = UDim2.new(0.5, -250, 0.5, -180)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Плюс на хабе (справа сверху)
local MainPlus = Plus:Clone()
MainPlus.Parent = Main
MainPlus.MouseButton1Click:Connect(function() Main.Visible = false end)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 130, 1, 0)
Side.BackgroundColor3 = Color3.new(0,0,0)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -140, 1, -10)
Container.Position = UDim2.new(0, 135, 0, 5)
Container.BackgroundTransparency = 1

local function Tab(name)
    local f = Instance.new("ScrollingFrame", Container)
    f.Size = UDim2.new(1, 0, 1, 0)
    f.Visible = false
    f.BackgroundTransparency = 1
    f.ScrollBarThickness = 0
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)

    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        f.Visible = true
    end)
    return f
end

local T1 = Tab("MAIN")
local T2 = Tab("SCRIPTS")

-- Спектор (Watch)
local function upSpector()
    for _, v in pairs(T1:GetChildren()) do if v.Name == "PlayerFrame" then v:Destroy() end end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", T1)
            f.Name = "PlayerFrame"
            f.Size = UDim2.new(1, -5, 0, 45)
            f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Instance.new("UICorner", f)
            
            local t = Instance.new("TextLabel", f)
            t.Size = UDim2.new(1, -70, 1, 0)
            t.Position = UDim2.new(0, 10, 0, 0)
            t.Text = p.DisplayName
            t.TextColor3 = Color3.new(1,1,1)
            t.BackgroundTransparency = 1
            t.TextXAlignment = "Left"
            
            local b = Instance.new("TextButton", f)
            b.Size = UDim2.new(0, 60, 0, 30)
            b.Position = UDim2.new(1, -65, 0.5, -15)
            b.Text = "WATCH"
            b.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end
end
upSpector()

-- Скрипт FPS FLICK
local Flick = Instance.new("TextButton", T2)
Flick.Size = UDim2.new(1, -5, 0, 40)
Flick.Text = "FPS FLICK (NO KEY)"
Flick.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
Flick.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner", Flick)
Flick.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mishkahvh/rbxscripts/refs/heads/main/flick/flick.lua"))()
end)

-- Кнопка DH
local DH = Instance.new("TextButton", Gui)
DH.Size = UDim2.new(0, 50, 0, 50)
DH.Position = UDim2.new(0, 10, 0.5, 0)
DH.Text = "DH"
DH.BackgroundColor3 = Color3.new(0,0,0)
DH.TextColor3 = Color3.new(1,0,0)
Instance.new("UICorner", DH).CornerRadius = UDim.new(1,0)
DH.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- Анимация загрузки
Fill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 3)
task.wait(3.2)
Loader:Destroy()
Main.Visible = true
T1.Visible = true
