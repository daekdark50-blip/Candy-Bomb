local lp = game:GetService("Players").LocalPlayer
local pgui = lp:WaitForChild("PlayerGui")

-- Удаляем старое
if pgui:FindFirstChild("DarkHubV42") then pgui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", pgui)
Gui.Name = "DarkHubV42"
Gui.ResetOnSpawn = false

-- [[ 1. БОЛЬШОЙ ЧЕРНЫЙ ЭКРАН ЗАГРУЗКИ ]] --
local function StartLoading()
    local L = Instance.new("Frame", Gui)
    L.Size = UDim2.new(0, 400, 0, 220) -- Сделал больше, как ты просил
    L.Position = UDim2.new(0.5, -200, 0.5, -110)
    L.BackgroundColor3 = Color3.new(0, 0, 0)
    L.ZIndex = 5000
    Instance.new("UICorner", L)

    local T = Instance.new("TextLabel", L)
    T.Size = UDim2.new(1, 0, 0, 100)
    T.Text = "DARK HUB\nLOADING..."
    T.TextColor3 = Color3.fromRGB(255, 0, 0)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 30
    T.BackgroundTransparency = 1

    local BarBack = Instance.new("Frame", L)
    BarBack.Size = UDim2.new(0.8, 0, 0, 12)
    BarBack.Position = UDim2.new(0.1, 0, 0.7, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    
    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Instance.new("UICorner", Fill)

    -- КРЕСТ НА ЗАГРУЗКЕ
    local CloseL = Instance.new("TextButton", L)
    CloseL.Size = UDim2.new(0, 45, 0, 45)
    CloseL.Position = UDim2.new(1, -50, 0, 5)
    CloseL.Text = "X"
    CloseL.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    CloseL.TextColor3 = Color3.new(1, 1, 1)
    CloseL.Font = Enum.Font.GothamBold
    CloseL.TextSize = 30
    Instance.new("UICorner", CloseL)
    CloseL.MouseButton1Click:Connect(function() Gui:Destroy() end)

    Fill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Linear", 3)
    task.wait(3.2)
    if L then L:Destroy() end
end

-- [[ 2. ГЛАВНОЕ ОКНО ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 400)
Main.Position = UDim2.new(0.5, -260, 0.5, -200)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- ТОТ САМЫЙ ОГРОМНЫЙ КРАСНЫЙ КРЕСТ СВЕРХУ
local ExitBtn = Instance.new("TextButton", Main)
ExitBtn.Size = UDim2.new(0, 45, 0, 45)
ExitBtn.Position = UDim2.new(1, -50, 0, 5)
ExitBtn.Text = "X"
ExitBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
ExitBtn.TextColor3 = Color3.new(1, 1, 1)
ExitBtn.Font = Enum.Font.GothamBold
ExitBtn.TextSize = 30
ExitBtn.ZIndex = 100
Instance.new("UICorner", ExitBtn)
ExitBtn.MouseButton1Click:Connect(function() Gui:Destroy() end)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 130, 1, 0)
Side.BackgroundColor3 = Color3.new(0, 0, 0)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -140, 1, -10)
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
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        f.Visible = true
    end)
    return f
end

local TabMain = Tab("MAIN")
local TabScripts = Tab("SCRIPTS")
local TabAuto = Tab("AUTO FARM")

-- [[ ВКЛАДКА MAIN: SPECTOR + INVISIBLE ]] --
local function BuildMain()
    -- Кнопка INVISIBLE
    local Inv = Instance.new("TextButton", TabMain)
    Inv.Size = UDim2.new(1, -5, 0, 40)
    Inv.Text = "INVISIBLE"
    Inv.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Inv.TextColor3 = Color3.fromRGB(100, 100, 255)
    Instance.new("UICorner", Inv)
    Inv.MouseButton1Click:Connect(function()
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") then v.Transparency = (v.Transparency == 0 and 0.5 or 0) end
        end
    end)

    -- Кнопка STOP SPECTATE
    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, -5, 0, 40)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    Stop.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)

    -- SPECTOR LIST
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", TabMain)
            f.Size = UDim2.new(1, -5, 0, 50)
            f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Instance.new("UICorner", f)
            
            local img = Instance.new("ImageLabel", f)
            img.Size = UDim2.new(0, 40, 0, 40)
            img.Position = UDim2.new(0, 5, 0.5, -20)
            img.Image = game.Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            Instance.new("UICorner", img).CornerRadius = UDim.new(1,0)

            local w = Instance.new("TextButton", f)
            w.Size = UDim2.new(0, 70, 0, 30)
            w.Position = UDim2.new(1, -75, 0.5, -15)
            w.Text = "WATCH"
            w.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            w.TextColor3 = Color3.new(1, 1, 1)
            Instance.new("UICorner", w)
            w.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end
end
BuildMain()

-- [[ ВКЛАДКА SCRIPTS ]] --
local function AddS(n, u)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, -5, 0, 40)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(u))() end)
end

-- ТУТ ПЕРЕИМЕНОВАЛ В DARK HUB И ВСТАВИЛ ТВОЮ ССЫЛКУ
AddS("DARK HUB (FPS FLICK LOAD)", "https://raw.githubusercontent.com/Davidfhdgfyyfytyttry/DAVITROLLZ-BRASIL/refs/heads/main/loader%20trollz%20hub%20v2.lua.txt")
AddS("Lucky Blocks Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
AddS("Fly Script", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddS("Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")

-- [[ ВКЛАДКА AUTO FARM: POPCORN BATTLE ]] --
AddS("Popcorn Hub (AUTO FARM)", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
AddS("Auto Battle Lucky", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")

-- КНОПКА DH
local DH = Instance.new("TextButton", Gui)
DH.Size = UDim2.new(0, 55, 0, 55)
DH.Position = UDim2.new(0, 10, 0.5, 0)
DH.Text = "DH"
DH.BackgroundColor3 = Color3.new(0, 0, 0)
DH.TextColor3 = Color3.new(1, 0, 0)
Instance.new("UICorner", DH).CornerRadius = UDim.new(1,0)
Instance.new("UIStroke", DH).Color = Color3.new(1, 0, 0)
DH.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(StartLoading)
Main.Visible = true
TabMain.Visible = true
