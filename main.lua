local Players = game:GetService("Players")
local lp = Players.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")

-- Полная очистка перед запуском
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 1. ТОТ САМЫЙ БОЛЬШОЙ ЧЕРНЫЙ ЭКРАН ЗАГРУЗКИ ]] --
local function RunLoading()
    local LBack = Instance.new("Frame", Gui)
    LBack.Size = UDim2.new(1, 0, 1, 0)
    LBack.BackgroundColor3 = Color3.new(0, 0, 0)
    LBack.ZIndex = 10000

    local Title = Instance.new("TextLabel", LBack)
    Title.Size = UDim2.new(1, 0, 0, 100)
    Title.Position = UDim2.new(0, 0, 0.4, 0)
    Title.Text = "DARK HUB\nLOADING..."
    Title.TextColor3 = Color3.fromRGB(255, 0, 0)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 50
    Title.BackgroundTransparency = 1

    local BarBack = Instance.new("Frame", LBack)
    BarBack.Size = UDim2.new(0.5, 0, 0, 15)
    BarBack.Position = UDim2.new(0.25, 0, 0.6, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Instance.new("UICorner", BarBack)

    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Instance.new("UICorner", Fill)

    Fill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 3)
    task.wait(3.5)
    LBack:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ С КРЕСТОМ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- КРАСНЫЙ КРЕСТ (X)
local Exit = Instance.new("TextButton", Main)
Exit.Size = UDim2.new(0, 45, 0, 45)
Exit.Position = UDim2.new(1, -50, 0, 5)
Exit.Text = "X"
Exit.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Exit.TextColor3 = Color3.new(1, 1, 1)
Exit.Font = Enum.Font.GothamBold
Exit.TextSize = 30
Instance.new("UICorner", Exit)
Exit.MouseButton1Click:Connect(function() Gui:Destroy() end)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 130, 1, 0)
Side.BackgroundColor3 = Color3.new(0, 0, 0)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -140, 1, -20)
Container.Position = UDim2.new(0, 135, 0, 10)
Container.BackgroundTransparency = 1

local function Tab(name)
    local f = Instance.new("ScrollingFrame", Container)
    f.Size = UDim2.new(1, 0, 1, 0)
    f.Visible = false
    f.BackgroundTransparency = 1
    f.ScrollBarThickness = 0
    Instance.new("UIListLayout", f).Padding = UDim.new(0, 5)

    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 45)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        f.Visible = true
    end)
    return f
end

local T1 = Tab("MAIN")
local T2 = Tab("SCRIPTS")

-- [[ КНОПКИ В MAIN: INVISIBLE + SPECTOR ]] --
local Inv = Instance.new("TextButton", T1)
Inv.Size = UDim2.new(1, -5, 0, 40)
Inv.Text = "INVISIBLE"
Inv.TextColor3 = Color3.fromRGB(100, 100, 255)
Inv.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Instance.new("UICorner", Inv)
Inv.MouseButton1Click:Connect(function()
    for _, v in pairs(lp.Character:GetDescendants()) do
        if v:IsA("BasePart") then v.Transparency = (v.Transparency == 0 and 0.5 or 0) end
    end
end)

local function RefreshSpector()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", T1)
            f.Size = UDim2.new(1, -5, 0, 50)
            f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Instance.new("UICorner", f)

            local img = Instance.new("ImageLabel", f)
            img.Size = UDim2.new(0, 40, 0, 40)
            img.Position = UDim2.new(0, 5, 0.5, -20)
            img.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            Instance.new("UICorner", img).CornerRadius = UDim.new(1, 0)

            local btn = Instance.new("TextButton", f)
            btn.Size = UDim2.new(0, 70, 0, 30)
            btn.Position = UDim2.new(1, -75, 0.5, -15)
            btn.Text = "WATCH"
            btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            btn.TextColor3 = Color3.new(1, 1, 1)
            Instance.new("UICorner", btn)
            btn.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end
end
RefreshSpector()

-- [[ ВКЛАДКА SCRIPTS: ВСЕ 8 ]] --
local function Add(n, u)
    local b = Instance.new("TextButton", T2)
    b.Size = UDim2.new(1, -5, 0, 40)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(u))() end)
end

Add("DARK HUB (TROLLZ LOAD)", "https://raw.githubusercontent.com/Davidfhdgfyyfytyttry/DAVITROLLZ-BRASIL/refs/heads/main/loader%20trollz%20hub%20v2.lua.txt")
Add("Popcorn Hub Auto", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
Add("Lucky Battle", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
Add("Fly Brainrot", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
Add("Be Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
Add("Escape Tsunami", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
Add("Lucky Blocks Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
Add("SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

-- КНОПКА DH
local DH = Instance.new("TextButton", Gui)
DH.Size = UDim2.new(0, 55, 0, 55)
DH.Position = UDim2.new(0, 10, 0.5, 0)
DH.Text = "DH"
DH.BackgroundColor3 = Color3.new(0, 0, 0)
DH.TextColor3 = Color3.new(1, 0, 0)
Instance.new("UICorner", DH).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", DH).Color = Color3.new(1, 0, 0)
DH.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(RunLoading)
Main.Visible = true
T1.Visible = true
