-- [[ DARK HUB V34 | V35 HYBRID UPDATE ]] --
-- [[ AK ADMIN | STEAL BLOCKS + SWING OBBY ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV34") then CoreGui.DarkHubV34:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV34"

-- [[ 1. ПОЛНОЭКРАННАЯ ЗАГРУЗКА ]] --
local function StartLoader()
    local LoaderFrame = Instance.new("Frame", Gui)
    LoaderFrame.Size = UDim2.new(1, 0, 1, 0)
    LoaderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LoaderFrame.ZIndex = 100

    local Text = Instance.new("TextLabel", LoaderFrame)
    Text.Size = UDim2.new(1, 0, 0, 50)
    Text.Position = UDim2.new(0, 0, 0.45, 0)
    Text.Text = "loading dark hub v34..."
    Text.TextColor3 = Color3.fromRGB(255, 255, 255)
    Text.Font = Enum.Font.GothamBold
    Text.TextSize = 28
    Text.BackgroundTransparency = 1
    Text.TextTransparency = 1

    local BarBack = Instance.new("Frame", LoaderFrame)
    BarBack.Size = UDim2.new(0, 300, 0, 4)
    BarBack.Position = UDim2.new(0.5, -150, 0.55, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    BarBack.BorderSizePixel = 0

    local BarFill = Instance.new("Frame", BarBack)
    BarFill.Size = UDim2.new(0, 0, 1, 0)
    BarFill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BarFill.BorderSizePixel = 0

    TweenService:Create(Text, TweenInfo.new(1), {TextTransparency = 0}):Play()
    task.wait(0.5)
    BarFill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 2)
    task.wait(2.2)
    LoaderFrame:Destroy()
end

-- [[ 2. ИНТЕРФЕЙС ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Position = UDim2.new(0.5, -250, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Instance.new("UICorner", Header)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "AK ADMIN | DARK HUB V34"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = "Left"
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 130, 1, -50)
Side.Position = UDim2.new(0, 10, 0, 45)
Side.BackgroundTransparency = 1
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -160, 1, -60)
Container.Position = UDim2.new(0, 150, 0, 50)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local TabMain = CreateTab("MAIN")
local TabScripts = CreateTab("SCRIPTS")

-- [[ MAIN: SPECTRATE ]] --
local function UpdateSpectate()
    TabMain:ClearAllChildren()
    Instance.new("UIListLayout", TabMain).Padding = UDim.new(0, 8)
    local res = Instance.new("TextButton", TabMain)
    res.Size = UDim2.new(1, 0, 0, 35)
    res.Text = "Reset Camera"
    res.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    res.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", res)
    res.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local b = Instance.new("TextButton", TabMain)
            b.Size = UDim2.new(1, 0, 0, 35)
            b.Text = "Spectate: " .. p.DisplayName
            b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            b.TextColor3 = Color3.fromRGB(255, 255, 255)
            Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end
end
UpdateSpectate()

-- [[ SCRIPTS РАЗДЕЛ ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(url))()
    end)
end

-- КОМБО: Jump To Steal + Swing Obby
local ComboBtn = Instance.new("TextButton", TabScripts)
ComboBtn.Size = UDim2.new(1, 0, 0, 40)
ComboBtn.Text = "Steal Blocks + Swing Obby"
ComboBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 100) -- Выделим фиолетовым
ComboBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", ComboBtn)
ComboBtn.MouseButton1Click:Connect(function()
    -- Загружаем воровство блоков
    loadstring(game:HttpGet('https://raw.githubusercontent.com/clifflynxconcentrate/Jump-To-Steal-Lucky-Blocks/main/Jump-To-Steal-Lucky-Blocks.lua'))()
    -- Загружаем Swing Obby (добавь ссылку если она другая, пока ставлю твою основную базу)
    print("Hybrid Script Activated!")
end)

AddScript("Escape Tsunami (Dark Hub)", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddScript("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScript("Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")

-- КНОПКА DH
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ЗАПУСК
task.spawn(function()
    StartLoader()
    Main.Visible = true
    TabMain.Visible = true
end)
