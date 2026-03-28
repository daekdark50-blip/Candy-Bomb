-- [[ DARK HUB v42 | OWNED BY AK ADMIN ]] --
-- [[ NO KEYS | BLOODY LOADING BAR | ALL SCRIPTS ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV42") then CoreGui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV42"

-- [[ 1. ТВОЯ ЛИЧНАЯ КРОВАВАЯ ЗАГРУЗКА ]] --
local function StartLoader()
    local LoaderCont = Instance.new("Frame", Gui)
    LoaderCont.Size = UDim2.new(1, 0, 1, 0)
    LoaderCont.BackgroundColor3 = Color3.fromRGB(5, 0, 0)
    LoaderCont.ZIndex = 2000

    local T = Instance.new("TextLabel", LoaderCont)
    T.Size = UDim2.new(1, 0, 0, 100)
    T.Position = UDim2.new(0, 0, 0.4, 0)
    T.Text = "DARK HUB V42\nCREATED BY AK ADMIN"
    T.TextColor3 = Color3.fromRGB(255, 0, 0)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 32
    T.BackgroundTransparency = 1

    -- Кровавый ползунок
    local BarBack = Instance.new("Frame", LoaderCont)
    BarBack.Size = UDim2.new(0.5, 0, 0, 12)
    BarBack.Position = UDim2.new(0.25, 0, 0.55, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
    BarBack.BorderSizePixel = 0
    Instance.new("UICorner", BarBack)

    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    Fill.BorderSizePixel = 0
    Instance.new("UICorner", Fill)

    -- Наливание крови
    local Tween = TweenService:Create(Fill, TweenInfo.new(3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(1, 0, 1, 0)})
    Tween:Play()

    task.wait(3.5)
    
    -- Плавное исчезновение
    TweenService:Create(LoaderCont, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    TweenService:Create(T, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    task.wait(0.5)
    LoaderCont:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Instance.new("UICorner", Side)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -160, 1, -20)
Container.Position = UDim2.new(0, 150, 0, 10)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    local layout = Instance.new("UIListLayout", p)
    layout.Padding = UDim.new(0, 8)
    
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, -10, 0, 40)
    b.Position = UDim2.new(0, 5, 0, 0)
    b.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
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
local TabAuto = CreateTab("AUTO FARM")

-- [[ СПЕКТАТОР (STALKER) ]] --
local function BuildStalker()
    local List = Instance.new("ScrollingFrame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 280)
    List.BackgroundTransparency = 1
    List.ScrollBarThickness = 0
    Instance.new("UIListLayout", List).Padding = UDim.new(0, 5)

    local function update()
        for _, v in pairs(List:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp then
                local f = Instance.new("Frame", List)
                f.Size = UDim2.new(1, -5, 0, 50)
                f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
                Instance.new("UICorner", f)

                local icon = Instance.new("ImageLabel", f)
                icon.Size = UDim2.new(0, 40, 0, 40)
                icon.Position = UDim2.new(0, 5, 0.5, -20)
                icon.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

                local btn = Instance.new("TextButton", f)
                btn.Size = UDim2.new(0, 70, 0, 30)
                btn.Position = UDim2.new(1, -75, 0.5, -15)
                btn.Text = "WATCH"
                btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                Instance.new("UICorner", btn)
                btn.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)

                local txt = Instance.new("TextLabel", f)
                txt.Size = UDim2.new(1, -130, 1, 0)
                txt.Position = UDim2.new(0, 55, 0, 0)
                txt.Text = p.DisplayName.."\n@"..p.Name
                txt.TextColor3 = Color3.fromRGB(255, 255, 255)
                txt.TextXAlignment = "Left"
                txt.BackgroundTransparency = 1
            end
        end
    end
    update()
    
    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, 0, 0, 35)
    Stop.Text = "RESET CAMERA"
    Stop.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildStalker()

-- [[ СКРИПТЫ (БЕЗ КЛЮЧЕЙ ХАБА) ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScript("Lucky Blocks Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
AddScript("Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddScript("Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddScript("Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddScript("Fly Script", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")

-- [[ АВТО-КЛИКЕР ДЛЯ БИТВЫ ]] --
local function AddToggle(parent, name, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.Text = name .. " [ OFF ]"
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    local act = false
    b.MouseButton1Click:Connect(function()
        act = not act
        b.Text = name .. (act and " [ ON ]" or " [ OFF ]")
        b.TextColor3 = act and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
        callback(act)
    end)
end

AddToggle(TabAuto, "Auto Popcorn Battle", function(v)
    _G.AutoMode = v
    task.spawn(function()
        while _G.AutoMode do
            pcall(function()
                for _, x in pairs(lp.PlayerGui:GetDescendants()) do
                    if x:IsA("TextButton") and x.Visible and (x.Name:lower():find("click") or x.Text:lower():find("click")) then
                        firesignal(x.MouseButton1Click)
                    end
                end
            end)
            task.wait(0.05)
        end
    end)
end)

-- [[ ЧЕРНАЯ КНОПКА DH ]] --
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Tog.Font = Enum.Font.GothamBold
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
local S = Instance.new("UIStroke", Tog)
S.Color = Color3.fromRGB(255, 0, 0)
S.Thickness = 3
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- СТАРТ
task.spawn(function() StartLoader(); Main.Visible = true; TabMain.Visible = true end)
