-- [[ DARK HUB V34 | V45 ULTIMATE ]] --
-- [[ AK ADMIN | SPECTATE LIKE VIDEO + AVATAR ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV45") then CoreGui.DarkHubV45:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV45"

-- Твоя аватарка (ID нужно заменить на настоящий, если этот не сработает)
local AvatarID = "rbxassetid://82541334057881" 

-- [[ 1. КРУТАЯ ЗАГРУЗКА С ТВОЕЙ АВОЙ ]] --
local function StartLoader()
    local LoaderCont = Instance.new("Frame", Gui)
    LoaderCont.Size = UDim2.new(1, 0, 1, 0)
    LoaderCont.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    LoaderCont.ZIndex = 200

    local Img = Instance.new("ImageLabel", LoaderCont)
    Img.Size = UDim2.new(1, 0, 1, 0)
    Img.Image = AvatarID
    Img.ScaleType = Enum.ScaleType.Crop
    Img.BackgroundTransparency = 1
    Img.ImageTransparency = 1

    local T = Instance.new("TextLabel", LoaderCont)
    T.Size = UDim2.new(1, 0, 0, 50)
    T.Position = UDim2.new(0, 0, 0.5, -25)
    T.Text = "loading dark hub script nerest ready work"
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 25
    T.TextTransparency = 1
    T.BackgroundTransparency = 1
    T.ZIndex = 201

    TweenService:Create(Img, TweenInfo.new(1.5), {ImageTransparency = 0.3}):Play()
    task.wait(1)
    TweenService:Create(T, TweenInfo.new(1), {TextTransparency = 0}):Play()
    task.wait(2.5)
    TweenService:Create(LoaderCont, TweenInfo.new(1), {BackgroundTransparency = 1}):Play()
    TweenService:Create(Img, TweenInfo.new(1), {ImageTransparency = 1}):Play()
    TweenService:Create(T, TweenInfo.new(1), {TextTransparency = 1}):Play()
    task.wait(1)
    LoaderCont:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, -10)
Side.Position = UDim2.new(0, 5, 0, 5)
Side.BackgroundTransparency = 1
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
    p.ScrollBarThickness = 2
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 40)
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
local TabAuto = CreateTab("AUTO FARM")

-- [[ ФУНКЦИИ В MAIN ]] --

-- 1. SPECTATE (КАК НА ВИДЕО)
local function CreateSpectateUI()
    local SpecTitle = Instance.new("TextLabel", TabMain)
    SpecTitle.Size = UDim2.new(1, 0, 0, 30)
    SpecTitle.Text = "SPECTATE PLAYER"
    SpecTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpecTitle.BackgroundTransparency = 1
    SpecTitle.Font = Enum.Font.GothamBold

    local Search = Instance.new("TextBox", TabMain)
    Search.Size = UDim2.new(1, 0, 0, 35)
    Search.PlaceholderText = "Search players..."
    Search.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Search.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Search)

    local List = Instance.new("Frame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 200)
    List.BackgroundTransparency = 1
    local listLayout = Instance.new("UIListLayout", List)
    listLayout.Padding = UDim.new(0, 5)

    local function UpdateList()
        for _, v in pairs(List:GetChildren()) do if v:IsA("TextButton") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp and (Search.Text == "" or p.Name:lower():find(Search.Text:lower())) then
                local b = Instance.new("TextButton", List)
                b.Size = UDim2.new(1, 0, 0, 40)
                b.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
                b.Text = "   " .. p.DisplayName .. " (@" .. p.Name .. ")"
                b.TextColor3 = Color3.fromRGB(255, 255, 255)
                b.TextXAlignment = "Left"
                Instance.new("UICorner", b)
                b.MouseButton1Click:Connect(function()
                    workspace.CurrentCamera.CameraSubject = p.Character:FindFirstChild("Humanoid")
                end)
            end
        end
    end
    Search:GetPropertyChangedSignal("Text"):Connect(UpdateList)
    Players.PlayerAdded:Connect(UpdateList)
    Players.PlayerRemoving:Connect(UpdateList)
    UpdateList()

    local Reset = Instance.new("TextButton", TabMain)
    Reset.Size = UDim2.new(1, 0, 0, 40)
    Reset.Text = "STOP SPECTATE"
    Reset.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    Reset.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Reset)
    Reset.MouseButton1Click:Connect(function()
        workspace.CurrentCamera.CameraSubject = lp.Character:FindFirstChild("Humanoid")
    end)
end
CreateSpectateUI()

-- 2. INVISIBLE (РАБОЧИЙ)
local function AddToggle(parent, name, callback)
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = name .. " [ OFF ]"
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    local active = false
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = name .. (active and " [ ACTIVE ]" or " [ OFF ]")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 100) or Color3.fromRGB(255, 255, 255)
        callback(active)
    end)
end

AddToggle(TabMain, "Invisible", function(v)
    if v then
        local char = lp.Character
        if char then
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") or part:IsA("Decal") then
                    part.Transparency = 1
                end
            end
        end
    else
        lp.Character:BreakJoints() -- Ресет для возврата видимости
    end
end)

-- [[ ВКЛАДКА SCRIPTS (ВОЗВРАТ СТАРЫХ) ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
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

-- [[ КНОПКА ОТКРЫТИЯ (АВА) ]] --
local Tog = Instance.new("ImageButton", Gui)
Tog.Size = UDim2.new(0, 55, 0, 55)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Image = AvatarID
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ЗАПУСК
task.spawn(function()
    StartLoader()
    Main.Visible = true
    TabMain.Visible = true
end)
