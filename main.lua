-- [[ DARK HUB v42 | AK ADMIN FIXED ]] --
-- [[ ALL TABS: MAIN, SCRIPTS, AUTO FARM ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

-- Удаляем старую версию, если она есть
local old = CoreGui:FindFirstChild("DarkHubV42")
if old then old:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV42"

-- [[ 1. ЯРКАЯ ЗАГРУЗКА ]] --
local function StartLoader()
    local Loader = Instance.new("Frame", Gui)
    Loader.Size = UDim2.new(1, 0, 1, 0)
    Loader.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    Loader.ZIndex = 999
    
    local T = Instance.new("TextLabel", Loader)
    T.Size = UDim2.new(1, 0, 0, 50)
    T.Position = UDim2.new(0, 0, 0.45, 0)
    T.Text = "LOADING DARK HUB..."
    T.TextColor3 = Color3.new(1, 1, 1)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 30
    T.BackgroundTransparency = 1
    
    local Bar = Instance.new("Frame", Loader)
    Bar.Size = UDim2.new(0, 0, 0, 10)
    Bar.Position = UDim2.new(0.2, 0, 0.55, 0)
    Bar.BackgroundColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", Bar)
    
    local tw = TweenService:Create(Bar, TweenInfo.new(2.5), {Size = UDim2.new(0.6, 0, 0, 10)})
    tw:Play()
    tw.Completed:Wait()
    Loader:Destroy()
end

-- [[ 2. ОСНОВНОЕ ОКНО ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 500, 0, 350)
Main.Position = UDim2.new(0.5, -250, 0.5, -175)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Боковая панель
local Sidebar = Instance.new("Frame", Main)
Sidebar.Size = UDim2.new(0, 130, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", Sidebar)
local sideLayout = Instance.new("UIListLayout", Sidebar)
sideLayout.Padding = UDim.new(0, 5)

-- Контейнер для вкладок
local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -140, 1, -20)
Container.Position = UDim2.new(0, 135, 0, 10)
Container.BackgroundTransparency = 1

local function NewTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.Visible = false
    p.BackgroundTransparency = 1
    p.ScrollBarThickness = 2
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 5)
    
    local b = Instance.new("TextButton", Sidebar)
    b.Size = UDim2.new(1, -10, 0, 35)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local Tab1 = NewTab("MAIN")
local Tab2 = NewTab("SCRIPTS")
local Tab3 = NewTab("AUTO FARM")

-- [[ ВКЛАДКА MAIN: SPECTOR + INVIS ]] --
local function AddInvis()
    local btn = Instance.new("TextButton", Tab1)
    btn.Size = UDim2.new(1, -5, 0, 35)
    btn.Text = "INVISIBLE [ OFF ]"
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", btn)
    local active = false
    btn.MouseButton1Click:Connect(function()
        active = not active
        btn.Text = active and "INVISIBLE [ ON ]" or "INVISIBLE [ OFF ]"
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = active and 1 or 0 end
        end
    end)
end
AddInvis()

-- Спектор (Список игроков)
local function AddSpector()
    local holder = Instance.new("Frame", Tab1)
    holder.Size = UDim2.new(1, -5, 0, 200)
    holder.BackgroundTransparency = 1
    Instance.new("UIListLayout", holder).Padding = UDim.new(0, 5)
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", holder)
            f.Size = UDim2.new(1, 0, 0, 40)
            f.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
            Instance.new("UICorner", f)
            
            local t = Instance.new("TextLabel", f)
            t.Size = UDim2.new(1, -60, 1, 0)
            t.Position = UDim2.new(0, 5, 0, 0)
            t.Text = p.DisplayName
            t.TextColor3 = Color3.new(1, 1, 1)
            t.BackgroundTransparency = 1
            t.TextXAlignment = "Left"
            
            local b = Instance.new("TextButton", f)
            b.Size = UDim2.new(0, 50, 0, 30)
            b.Position = UDim2.new(1, -55, 0.5, -15)
            b.Text = "WATCH"
            b.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
            Instance.new("UICorner", b)
            b.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end
    
    local stop = Instance.new("TextButton", Tab1)
    stop.Size = UDim2.new(1, -5, 0, 35)
    stop.Text = "STOP SPECTATE"
    stop.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    Instance.new("UICorner", stop)
    stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
AddSpector()

-- [[ ВКЛАДКА SCRIPTS: ВСЕ 8 ]] --
local function AddScr(n, u)
    local b = Instance.new("TextButton", Tab2)
    b.Size = UDim2.new(1, -5, 0, 35)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        task.spawn(function()
            task.wait(1.5)
            local j = CoreGui:FindFirstChild("JunkieKeySystem") or CoreGui:FindFirstChild("ProjectYoda")
            if j then j:Destroy() end
        end)
        loadstring(game:HttpGet(u))()
    end)
end

AddScr("FPS Flick (NO KEY)", "https://api.junkie-
    
