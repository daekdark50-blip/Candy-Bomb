-- [[ DARK HUB v37 | ULTIMATE EDITION ]] --
-- [[ ONILEGO STALKER + ANIME AVATAR ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

-- Удаление старой версии
if CoreGui:FindFirstChild("DarkHubV37") then CoreGui.DarkHubV37:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV37"

-- Ссылка на твою Аниме Аватарку
local AvatarID = "rbxassetid://1234567890" -- !!! ЗАМЕНИ ЭТО НА ПРАВИЛЬНЫЙ ID СВОЕЙ АНИМЕ АВЫ !!!

-- [[ 1. КРУТАЯ АНИМЕ ЗАГРУЗКА ]] --
local function StartLoader()
    local LoaderCont = Instance.new("Frame", Gui)
    LoaderCont.Size = UDim2.new(1, 0, 1, 0)
    LoaderCont.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LoaderCont.ZIndex = 200

    -- Твоя аниме аватарка на весь экран
    local Img = Instance.new("ImageLabel", LoaderCont)
    Img.Size = UDim2.new(1, 0, 1, 0)
    Img.Image = AvatarID
    Img.ScaleType = Enum.ScaleType.Crop
    Img.BackgroundTransparency = 1
    Img.ImageTransparency = 1 -- Сначала скрыт

    -- Твой текст
    local T = Instance.new("TextLabel", LoaderCont)
    T.Size = UDim2.new(1, 0, 0, 50)
    T.Position = UDim2.new(0, 0, 0.45, 0)
    T.Text = "loading dark hub script nerest ready work"
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 25
    T.TextTransparency = 1 -- Сначала скрыт
    T.BackgroundTransparency = 1
    T.ZIndex = 201

    -- Анимация появления авы
    TweenService:Create(Img, TweenInfo.new(1.5), {ImageTransparency = 0}):Play()
    task.wait(1)
    
    -- Анимация появления текста
    TweenService:Create(T, TweenInfo.new(1), {TextTransparency = 0}):Play()
    task.wait(2.5)

    -- Исчезновение
    TweenService:Create(LoaderCont, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Img, TweenInfo.new(1), {ImageTransparency = 1}):Play()
    TweenService:Create(T, TweenInfo.new(1), {TextTransparency = 1}):Play()
    task.wait(1)
    LoaderCont:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ (v37 Style) ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Сайдбар
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Instance.new("UICorner", Side)

local Nav = Instance.new("UIListLayout", Side)
Nav.Padding = UDim.new(0, 5)

-- Контейнер для вкладок
local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -150, 1, -10)
Container.Position = UDim2.new(0, 145, 0, 5)
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

-- [[ ВКЛАДКА MAIN: ЗАГРУЗКА ONILEGO STALKER ]] --
-- Мы заменяем старый Spectate на тот, что на втором видео
local StalkerLoader = Instance.new("TextLabel", TabMain)
StalkerLoader.Size = UDim2.new(1, 0, 0, 40)
StalkerLoader.Text = "   loading Onilego Stalker..."
StalkerLoader.TextColor3 = Color3.fromRGB(0, 255, 100) -- Зеленый неоновый цвет
StalkerLoader.Font = Enum.Font.GothamBold
StalkerLoader.BackgroundTransparency = 1
StalkerLoader.TextXAlignment = "Left"

-- Запуск самого Onilego Stalker через 1.5 секунды
task.delay(1.5, function()
    pcall(function()
        loadstring(game:HttpGet("https://github.com/Onilego/Stalker/raw/main/stalker.lua"))()
    end)
    StalkerLoader.Text = "   Onilego Stalker Activated!"
    StalkerLoader.TextColor3 = Color3.fromRGB(255, 255, 255)
end)

-- [[ ВКЛАДКА SCRIPTS (ВОЗВРАТ ЛАКИ БЛОКОВ + ФЛАЙ) ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScript("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScript("Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddScript("Jump to Steal Lucky Blocks", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddScript("Swing Obby for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddScript("Escape Tsunami (Brainrots)", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")

-- [[ AUTO FARM (POPCORN) ]] --
local function AddToggle(parent, name, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = "  " .. name .. " [ OFF ]"
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextXAlignment = "Left"
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    
    local active = false
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = active and "  " .. name .. " [ ACTIVE ]" or "  " .. name .. " [ OFF ]"
        b.TextColor3 = active and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 255, 255)
        callback(active)
    end)
end

AddToggle(TabAuto, "Auto Popcorn +99/81", function(v)
    _G.AutoPop = v
    task.spawn(function()
        while _G.AutoPop do
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name:lower():find("popcorn") then
                    pcall(function() firetouchinterest(lp.Character.HumanoidRootPart, obj, 0); firetouchinterest(lp.Character.HumanoidRootPart, obj, 1) end)
                end
            end
            task.wait(0.1)
        end
    end)
end)

-- [[ 3. КНОПКА ОТКРЫТИЯ (АНИМЕ АВА) ]] --
-- Теперь вместо черного круга будет твоя Аниме аватарка
local Tog = Instance.new("ImageButton", Gui)
Tog.Size = UDim2.new(0, 55, 0, 55)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Image = AvatarID
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Tog.BorderSizePixel = 0
local C = Instance.new("UICorner", Tog)
C.CornerRadius = UDim.new(1, 0) -- Идеальный круг

-- ЗЕЛЕНОЕ СВЕЧЕНИЕ (ОБВОДКА)
local Stroke = Instance.new("UIStroke", Tog)
Stroke.Thickness = 2
Stroke.Color = Color3.fromRGB(0, 255, 100) -- Зеленый неоновый цвет
Stroke.Transparency = 0.3

Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ЗАПУСК
task.spawn(function()
    StartLoader()
    Main.Visible = true
    TabMain.Visible = true
end)
