-- [[ DARK HUB v42 | AK ADMIN ULTIMATE x10 ]] --
-- [[ NO KEYS | BLOODY LOADING | 8 SCRIPTS | AUTO FARM ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV42") then CoreGui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV42"

-- [[ 1. КРОВАВАЯ ЗАГРУЗКА (ЯРКО-КРАСНЫЙ ЭКРАН) ]] --
local function StartLoader()
    local Loader = Instance.new("Frame", Gui)
    Loader.Size = UDim2.new(1, 0, 1, 0)
    Loader.BackgroundColor3 = Color3.fromRGB(230, 0, 0) -- ЯРКО КРАСНЫЙ
    Loader.ZIndex = 10000

    local Lab = Instance.new("TextLabel", Loader)
    Lab.Size = UDim2.new(1, 0, 0, 80)
    Lab.Position = UDim2.new(0, 0, 0.4, 0)
    Lab.Text = "LOADING DARK HUB...\nBY AK ADMIN"
    Lab.TextColor3 = Color3.fromRGB(255, 255, 255)
    Lab.Font = Enum.Font.GothamBold
    Lab.TextSize = 35
    Lab.BackgroundTransparency = 1

    local BarBack = Instance.new("Frame", Loader)
    BarBack.Size = UDim2.new(0.6, 0, 0, 15)
    BarBack.Position = UDim2.new(0.2, 0, 0.55, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(120, 0, 0)
    Instance.new("UICorner", BarBack)

    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- БЕЛЫЙ ЯРКИЙ ПОЛЗУНОК
    Instance.new("UICorner", Fill)

    TweenService:Create(Fill, TweenInfo.new(3.5, Enum.EasingStyle.Quart), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(4)
    Loader:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 2)

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
    b.Size = UDim2.new(1, 0, 0, 45)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
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

-- [[ ВКЛАДКА MAIN: INVISIBLE + SPECTATOR ]] --
local function BuildMain()
    local Inv = Instance.new("TextButton", TabMain)
    Inv.Size = UDim2.new(1, 0, 0, 40)
    Inv.Text = "INVISIBLE [ OFF ]"
    Inv.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Inv.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Inv)
    
    local active = false
    Inv.MouseButton1Click:Connect(function()
        active = not active
        Inv.Text = active and "INVISIBLE [ ON ]" or "INVISIBLE [ OFF ]"
        Inv.BackgroundColor3 = active and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(40, 40, 40)
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = active and 1 or 0 end
        end
    end)

    local List = Instance.new("Frame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 230)
    List.BackgroundTransparency = 1
    Instance.new("UIListLayout", List).Padding = UDim.new(0, 5)

    local function up()
        for _, v in pairs(List:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp then
                local f = Instance.new("Frame", List)
                f.Size = UDim2.new(1, 0, 0, 50)
                f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Instance.new("UICorner", f)
                
                local i = Instance.new("ImageLabel", f)
                i.Size = UDim2.new(0, 40, 0, 40)
                i.Position = UDim2.new(0, 5, 0.5, -20)
                i.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                Instance.new("UICorner", i).CornerRadius = UDim.new(1,0)

                local b = Instance.new("TextButton", f)
                b.Size = UDim2.new(0, 70, 0, 30)
                b.Position = UDim2.new(1, -75, 0.5, -15)
                b.Text = "WATCH"
                b.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                b.TextColor3 = Color3.fromRGB(255, 255, 255)
                Instance.new("UICorner", b)
                b.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
            end
        end
    end
    up()

    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, 0, 0, 40)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(70, 0, 0)
    Stop.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildMain()

-- [[ ВКЛАДКА SCRIPTS: ВСЕ 8 СКРИПТОВ ]] --
local function AddS(n, u)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        task.spawn(function()
            task.wait(1)
            local junk = CoreGui:FindFirstChild("JunkieKeySystem") or CoreGui:FindFirstChild("ProjectYoda")
            if junk then junk:Destroy() end
        end)
        loadstring(game:HttpGet(u))() 
    end)
end

AddS("FPS Flick (NO KEY)",
    
