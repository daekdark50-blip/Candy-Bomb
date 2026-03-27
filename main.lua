-- [[ DARK HUB | CREATED BY DARK BY HUB ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV13") then CoreGui.DarkHubV13:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV13"
Gui.ResetOnSpawn = false

-- [[ ФИОЛЕТОВАЯ ЗАГРУЗКА ]] --
local function DarkLoading(text)
    local LFrame = Instance.new("Frame", Gui)
    LFrame.Size = UDim2.new(0, 300, 0, 100)
    LFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
    LFrame.BackgroundColor3 = Color3.fromRGB(10, 5, 15) -- Темно-фиолетовый фон
    LFrame.BorderSizePixel = 0
    Instance.new("UICorner", LFrame)

    local LTitle = Instance.new("TextLabel", LFrame)
    LTitle.Size = UDim2.new(1, 0, 0, 40)
    LTitle.Text = text
    LTitle.TextColor3 = Color3.fromRGB(180, 0, 255) -- Фиолетовый текст
    LTitle.Font = Enum.Font.GothamBold
    LTitle.TextSize = 14
    LTitle.BackgroundTransparency = 1

    local LBarBg = Instance.new("Frame", LFrame)
    LBarBg.Size = UDim2.new(0.8, 0, 0, 4)
    LBarBg.Position = UDim2.new(0.1, 0, 0.7, 0)
    LBarBg.BackgroundColor3 = Color3.fromRGB(30, 20, 40)

    local LBarFill = Instance.new("Frame", LBarBg)
    LBarFill.Size = UDim2.new(0, 0, 1, 0)
    LBarFill.BackgroundColor3 = Color3.fromRGB(180, 0, 255) -- Фиолетовый прогресс

    LBarFill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 2.5)
    task.wait(2.7)
    LFrame:Destroy()
end

-- Основной запуск Dark Hub Loader
task.spawn(function() DarkLoading("DARK HUB | BY DARK BY HUB") end)

-- [[ КНОПКА DH ]] --
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(180, 0, 255)
Tog.Font = Enum.Font.GothamBold
Tog.Visible = false
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
task.delay(2.8, function() Tog.Visible = true end)

-- [[ ОКНО ХАБА ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 420, 0, 320)
Main.Position = UDim2.new(0.5, -210, 0.5, -160)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Head = Instance.new("Frame", Main)
Head.Size = UDim2.new(1, 0, 0, 35)
Head.BackgroundColor3 = Color3.fromRGB(50, 0, 100) -- Фиолетовая шапка
Instance.new("UICorner", Head)

local Title = Instance.new("TextLabel", Head)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Text = "Dark Hub | Created by Dark By Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

-- Навигация
local Nav = Instance.new("Frame", Main)
Nav.Size = UDim2.new(0, 120, 1, -45)
Nav.Position = UDim2.new(0, 5, 0, 40)
Nav.BackgroundTransparency = 1
Instance.new("UIListLayout", Nav).Padding = UDim.new(0, 4)

local Pages = Instance.new("Frame", Main)
Pages.Size = UDim2.new(1, -135, 1, -45)
Pages.Position = UDim2.new(0, 130, 0, 40)
Pages.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Pages)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)

    local b = Instance.new("TextButton", Nav)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)

    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Pages:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local TabMain = CreateTab("MAIN")
local TabSpec = CreateTab("SPECTATE")
local TabScripts = CreateTab("SCRIPTS")

Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- [ SPECTATE + STOP ]
local function Refresh()
    for _, v in pairs(TabSpec:GetChildren()) do if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end end
    
    local stop = Instance.new("TextButton", TabSpec)
    stop.Size = UDim2.new(1, 0, 0, 35)
    stop.BackgroundColor3 = Color3.fromRGB(100, 0, 200)
    stop.Text = "🛑 STOP SPECTATE"
    stop.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", stop)
    stop.MouseButton1Click:Connect(function()
        workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
    end)

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", TabSpec)
            f.Size = UDim2.new(1, 0, 0, 40)
            f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Instance.new("UICorner", f)
            local t = Instance.new("TextButton", f)
            t.Size = UDim2.new(1, 0, 1, 0)
            t.BackgroundTransparency = 1
            t.Text = "Watch: " .. p.DisplayName
            t.TextColor3 = Color3.fromRGB(255, 255, 255)
            t.MouseButton1Click:Connect(function()
                workspace.CurrentCamera.CameraSubject = p.Character:FindFirstChild("Humanoid")
            end)
        end
    end
end
Refresh()

-- [ SCRIPTS ]
local function AddScript(name, color, code)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = color
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        -- Запуск загрузки
        task.spawn(function() DarkLoading("LOADING DARK HUB...") end)
        
        -- Bypass Key System (Mystrix/Cracked)
        _G.Mystrix_Key = "DarkHubBypass"
        _G.KeyEntered = true
        _G.CheckKey = function() return true end
        
        loadstring(game:HttpGet(code))()
    end)
end

AddScript("Dark Hub | Be a Lucky Block", Color3.fromRGB(0, 70, 180), "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScript("Dark Hub | Fly for Brainrots", Color3.fromRGB(120, 0, 0), "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddScript("Escape tsunami for brairot Dark hub", Color3.fromRGB(100, 0, 200), "https://github.com/OxyCoder32/Crackers/raw/refs/heads/main/Mystrix%20Hub")

TabMain.Visible = true
