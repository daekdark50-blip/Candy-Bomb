-- [[ DARK HUB v42 | BLOODY PROGRESS REBIRTH ]] --
-- [[ AK ADMIN | FULL RESTORE + BLOODY UI ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV42") then CoreGui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV42"

-- [[ 1. КРОВАВАЯ ЗАГРУЗКА НА ВЕСЬ ЭКРАН С ПОЛЗУНКОМ ]] --
local function StartLoader()
    local LoaderCont = Instance.new("Frame", Gui)
    LoaderCont.Size = UDim2.new(1, 0, 1, 0)
    LoaderCont.BackgroundColor3 = Color3.fromRGB(15, 0, 0) -- Темно-кровавый фон
    LoaderCont.ZIndex = 500

    -- Эффект кровавого тумана (градиент)
    local Gradient = Instance.new("UIGradient", LoaderCont)
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(100, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(20, 0, 0)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
    })
    Gradient.Rotation = 45

    -- Текст DARK HUB
    local T = Instance.new("TextLabel", LoaderCont)
    T.Size = UDim2.new(1, 0, 0, 80)
    T.Position = UDim2.new(0, 0, 0.45, -40)
    T.Text = "DARK HUB"
    T.TextColor3 = Color3.fromRGB(255, 0, 0)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 35
    T.BackgroundTransparency = 1
    T.ZIndex = 501

    -- Контейнер для ползунка
    local BarCont = Instance.new("Frame", LoaderCont)
    BarCont.Size = UDim2.new(0.5, 0, 0, 10)
    BarCont.Position = UDim2.new(0.25, 0, 0.6, 0)
    BarCont.BackgroundColor3 = Color3.fromRGB(40, 0, 0) -- Фон ползунка
    BarCont.ZIndex = 502
    Instance.new("UICorner", BarCont)

    -- Сама КРОВЬ (Fill)
    local BloodFill = Instance.new("Frame", BarCont)
    BloodFill.Size = UDim2.new(0, 0, 1, 0) -- Сначала пустой
    BloodFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Яркая кровь
    BloodFill.ZIndex = 503
    Instance.new("UICorner", BloodFill)

    -- Анимация наливания крови (заполнение ползунка)
    TweenService:Create(BloodFill, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    
    -- Пульсация текста во время загрузки
    task.spawn(function()
        while LoaderCont.Parent do
            TweenService:Create(T, TweenInfo.new(0.6), {TextSize = 38}):Play()
            task.wait(0.6)
            TweenService:Create(T, TweenInfo.new(0.6), {TextSize = 35}):Play()
            task.wait(0.6)
        end
    end)

    task.wait(3.5) -- Ждем пока ползунок заполнится

    -- Исчезновение
    TweenService:Create(LoaderCont, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    TweenService:Create(T, TweenInfo.new(1), {TextTransparency = 1}):Play()
    TweenService:Create(BarCont, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    TweenService:Create(BloodFill, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    task.wait(1)
    LoaderCont:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ (Bloody Style) ]] --
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
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

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
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 35)
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

-- [[ СТАЛКЕР СПЕКТАТОР (ИЗ СКРИНШОТОВ) ]] --
local function BuildStalker()
    local Title = Instance.new("TextLabel", TabMain)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Text = "PLAYER STALKER"
    Title.TextColor3 = Color3.fromRGB(255, 0, 0)
    Title.Font = Enum.Font.GothamBold
    Title.BackgroundTransparency = 1

    local List = Instance.new("Frame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 250)
    List.BackgroundTransparency = 1
    Instance.new("UIListLayout", List).Padding = UDim.new(0, 5)

    local function update()
        for _, v in pairs(List:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp then
                local f = Instance.new("Frame", List)
                f.Size = UDim2.new(1, 0, 0, 45)
                f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Instance.new("UICorner", f)
                
                local btn = Instance.new("TextButton", f)
                btn.Size = UDim2.new(0, 70, 0, 25)
                btn.Position = UDim2.new(1, -75, 0.5, -12)
                btn.Text = "WATCH"
                btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                Instance.new("UICorner", btn)
                btn.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)

                local name = Instance.new("TextLabel", f)
                name.Size = UDim2.new(1, -90, 1, 0)
                name.Position = UDim2.new(0, 10, 0, 0)
                name.Text = p.DisplayName.."\n@"..p.Name
                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                name.TextXAlignment = "Left"
                name.TextSize = 10
                name.BackgroundTransparency = 1
            end
        end
    end
    update()
end
BuildStalker()

-- [[ ВСЕ СКРИПТЫ + LUCKY BLOCKS BATTLE ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScript("Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddScript("Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddScript("Lucky Blocks Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")

-- [[ AUTO FARM (ДЛЯ МИНИ-ИГРЫ) ]] --
local function AddToggle(parent, name, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = name .. " [ OFF ]"
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    local act = false
    b.MouseButton1Click:Connect(function()
        act = not act
        b.Text = name .. (act and " [ ACTIVE ]" or " [ OFF ]")
        b.TextColor3 = act and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
        callback(act)
    end)
end

AddToggle(TabAuto, "Auto Popcorn Farm", function(v)
    _G.AutoPop = v
    task.spawn(function()
        while _G.AutoPop do
            for _, o in pairs(workspace:GetDescendants()) do
                if o.Name:lower():find("popcorn") then
                    pcall(function() firetouchinterest(lp.Character.HumanoidRootPart, o, 0); firetouchinterest(lp.Character.HumanoidRootPart, o, 1) end)
                end
            end
            task.wait(0.1)
        end
    end)
end)

-- [[ КНОПКА ОТКРЫТИЯ (ЧЕРНЫЙ КРУГ) ]] --
local Tog = Instance.new("TextButton", Gui) -- ЗАМЕНЕНО НА TextButton
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Text = "DH" -- Кратко Dark Hub
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Tog.Font = Enum.Font.GothamBold
Tog.TextSize = 20
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- ЧИСТЫЙ ЧЕРНЫЙ
Tog.BorderSizePixel = 0
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)

-- ТОНКАЯ КРОВАВАЯ ОБВОДКА
local S = Instance.new("UIStroke", Tog)
S.Color = Color3.fromRGB(200, 0, 0) -- Кроваво-красный неоновый
S.Thickness = 3
S.Transparency = 0.3

Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ЗАПУСК
task.spawn(function()
    StartLoader()
    Main.Visible = true
    TabMain.Visible = true
end)
