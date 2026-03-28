local lp = game:GetService("Players").LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")

-- Очистка старого
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 1. КРОВАВАЯ ЗАГРУЗКА ]] --
local function BloodLoad()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(0, 320, 0, 160)
    L.Position = UDim2.new(0.5, -160, 0.5, -80)
    L.BackgroundColor3 = Color3.new(0, 0, 0)
    L.ZIndex = 2000
    Instance.new("UICorner", L)

    local Fill = Instance.new("Frame", L)
    Fill.Size = UDim2.new(0, 0, 0, 8)
    Fill.Position = UDim2.new(0.1, 0, 0.7, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Красная полоса
    Instance.new("UICorner", Fill)

    Fill:TweenSize(UDim2.new(0.8, 0, 0, 8), "Out", "Linear", 2)
    task.wait(2.2)
    L:Destroy()
end

-- [[ 2. ОСНОВНОЙ ХАБ С КРЕСТОМ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 500, 0, 360)
Main.Position = UDim2.new(0.5, -250, 0.5, -180)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- ТОТ САМЫЙ КРАСНЫЙ КРЕСТ СВЕРХУ (ДЛЯ ЗАКРЫТИЯ)
local ExitBtn = Instance.new("TextButton", Main)
ExitBtn.Size = UDim2.new(0, 35, 0, 35)
ExitBtn.Position = UDim2.new(1, -40, 0, 5)
ExitBtn.Text = "X"
ExitBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0) -- Ярко-красный
ExitBtn.TextColor3 = Color3.new(1, 1, 1)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.TextSize = 22
ExitBtn.ZIndex = 101
Instance.new("UICorner", ExitBtn)
ExitBtn.MouseButton1Click:Connect(function() Gui:Destroy() end)

-- Вкладки и контент
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 120, 1, 0)
Side.BackgroundColor3 = Color3.new(0, 0, 0)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -130, 1, -10)
Container.Position = UDim2.new(0, 125, 0, 10)
Container.BackgroundTransparency = 1

local function AddTab(name)
    local f = Instance.new("ScrollingFrame", Container)
    f.Size = UDim2.new(1, 0, 1, 0)
    f.Visible = false
    f.BackgroundTransparency = 1
    f.ScrollBarThickness = 0
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)

    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        f.Visible = true
    end)
    return f
end

local TabScripts = AddTab("SCRIPTS")
local TabMain = AddTab("MAIN")

-- Кнопка FPS FLICK
local Flick = Instance.new("TextButton", TabScripts)
Flick.Size = UDim2.new(1, -5, 0, 40)
Flick.Text = "FPS FLICK (NEW)"
Flick.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Flick.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Flick)
Flick.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/mishkahvh/rbxscripts/refs/heads/main/flick/flick.lua"))()
end)

-- Popcorn Hub (как было)
local Popcorn = Instance.new("TextButton", TabScripts)
Popcorn.Size = UDim2.new(1, -5, 0, 40)
Popcorn.Text = "Popcorn Hub"
Popcorn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Popcorn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Popcorn)
Popcorn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua"))()
end)

-- Кнопка открытия DH
local DH = Instance.new("TextButton", Gui)
DH.Size = UDim2.new(0, 50, 0, 50)
DH.Position = UDim2.new(0, 10, 0.5, 0)
DH.Text = "DH"
DH.BackgroundColor3 = Color3.new(0, 0, 0)
DH.TextColor3 = Color3.new(1, 0, 0)
Instance.new("UICorner", DH).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", DH).Color = Color3.new(1, 0, 0)
DH.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- Порядок запуска
task.spawn(BloodLoad)
task.wait(2.5)
Main.Visible = true
TabScripts.Visible = true
