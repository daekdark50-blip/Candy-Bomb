-- [[ DARK HUB V34 | V44 AVATAR + NEW LOAD ]] --
-- [[ AK ADMIN | COMPLETE OVERHAUL ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

-- Удаление старой версии
if CoreGui:FindFirstChild("DarkHubV44") then CoreGui.DarkHubV44:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV44"

-- Ссылка на твою аву
local AvatarID = "rbxassetid://1234567890" -- ЗАМЕНИ ЭТО НА ID ТВОЕЙ АВАТАРКИ!

-- [[ 1. КРУТАЯ ЗАГРУЗКА С АВОЙ ]] --
local function StartLoader()
    local LoaderCont = Instance.new("Frame", Gui)
    LoaderCont.Size = UDim2.new(1, 0, 1, 0)
    LoaderCont.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LoaderCont.ZIndex = 100

    -- Силуэт на весь экран
    local Img = Instance.new("ImageLabel", LoaderCont)
    Img.Size = UDim2.new(1, 0, 1, 0)
    Img.Position = UDim2.new(0, 0, 0, 0)
    Img.Image = AvatarID
    Img.ScaleType = Enum.ScaleType.Crop
    Img.BackgroundTransparency = 1
    Img.ImageTransparency = 1 -- Сначала скрыт

    -- Твой текст
    local T = Instance.new("TextLabel", LoaderCont)
    T.Size = UDim2.new(1, -40, 0, 80)
    T.Position = UDim2.new(0.5, -T.Size.X.Offset/2, 0.45, 0)
    T.Text = "loading dark hub script nerest ready work"
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 24
    T.TextTransparency = 1 -- Сначала скрыт
    T.BackgroundTransparency = 1
    T.ZIndex = 101

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

-- [[ 2. ИНТЕРФЕЙС (AK ADMIN) ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Хедер
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
Instance.new("UICorner", Header)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.Text = "AK ADMIN | DARK HUB V34"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextXAlignment = "Left"
Title.Font = Enum.Font.GothamBold
Title.BackgroundTransparency = 1

-- Сайдбар
local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, -50)
Side.Position = UDim2.new(0, 10, 0, 45)
Side.BackgroundTransparency = 1
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -170, 1, -60)
Container.Position = UDim2.new(0, 160, 0, 50)
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
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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

-- [[ СКРИПТЫ (ТВОИ ССЫЛКИ) ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScript("Jump to Steal Lucky Blocks", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddScript("Swing Obby for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddScript("Escape Tsunami (Original)", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")

-- Кнопка авто-попкорна (из V43)
local function PopcornFarm(state)
    _G.AutoPop = state
    task.spawn(function()
        while _G.AutoPop do
            for _, obj in pairs(workspace:GetDescendants()) do
                if obj.Name:lower():find("popcorn") then
                    pcall(function()
                        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
                            firetouchinterest(lp.Character.HumanoidRootPart, obj, 0)
                            firetouchinterest(lp.Character.HumanoidRootPart, obj, 1)
                        end
                    end)
                end
            end
            task.wait(0.1)
        end
    end)
end

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
AddToggle(TabAuto, "Auto Popcorn Tsunami", PopcornFarm)

-- [[ 3. ИКОНКА МЕНЮ (НА ТВОЕЙ АВАТАРКЕ) ]] --
local Tog = Instance.new("ImageButton", Gui) -- ЗАМЕНЕНО НА ImageButton
Tog.Size = UDim2.new(0, 50, 0, 50)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Image = AvatarID -- Твоя ава!
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
local C = Instance.new("UICorner", Tog)
C.CornerRadius = UDim.new(1, 0) -- Идеальный круг

Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ЗАПУСК
task.spawn(function()
    StartLoader()
    Main.Visible = true
    TabMain.Visible = true
end)
