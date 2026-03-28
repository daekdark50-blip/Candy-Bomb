-- [[ DARK HUB v42 | AK ADMIN x10 UPGRADE ]] --
-- [[ ALL TABS RESTORED | BLOODY PROGRESS | 8 SCRIPTS ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV42") then CoreGui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV42"

-- [[ 1. ЯРКАЯ КРАСНАЯ ЗАГРУЗКА С ПОЛЗУНКОМ ]] --
local function StartLoader()
    local Loader = Instance.new("Frame", Gui)
    Loader.Size = UDim2.new(1, 0, 1, 0)
    Loader.BackgroundColor3 = Color3.fromRGB(220, 0, 0) -- ЯРКО КРАСНЫЙ
    Loader.ZIndex = 5000

    local Lab = Instance.new("TextLabel", Loader)
    Lab.Size = UDim2.new(1, 0, 0, 50)
    Lab.Position = UDim2.new(0, 0, 0.45, 0)
    Lab.Text = "LOADING DARK HUB..."
    Lab.TextColor3 = Color3.fromRGB(255, 255, 255)
    Lab.Font = Enum.Font.GothamBold
    Lab.TextSize = 30
    Lab.BackgroundTransparency = 1

    local BarBack = Instance.new("Frame", Loader)
    BarBack.Size = UDim2.new(0.6, 0, 0, 12)
    BarBack.Position = UDim2.new(0.2, 0, 0.55, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    Instance.new("UICorner", BarBack)

    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- ЯРКИЙ ПОЛЗУНОК
    Instance.new("UICorner", Fill)

    TweenService:Create(Fill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(3.5)
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
    b.Size = UDim2.new(1, 0, 0, 40)
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

-- СОЗДАЕМ ТРИ ВКЛАДКИ
local TabMain = CreateTab("MAIN")
local TabScripts = CreateTab("SCRIPTS")
local TabAuto = CreateTab("AUTO FARM")

-- [[ ВКЛАДКА 1: MAIN (INVIS + SPECTOR) ]] --
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
        Inv.BackgroundColor3 = active and Color3.fromRGB(180, 0, 0) or Color3.fromRGB(40, 40, 40)
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = active and 1 or 0 end
        end
    end)

    local List = Instance.new("Frame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 250)
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
end
BuildMain()

-- [[ ВКЛАДКА 2: SCRIPTS (ВСЕ 8 ШТУК) ]] --
local function AddS(n, u)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = n
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(u))() end)
end

AddS("FPS Flick", "https://api.junkie-development.de/api/v1/luascripts/public/8b5174946c76ba81d5c374bd4a69f7694d10c837e37522a04c91b2b32991e20e/download")
AddS("Lucky Blocks Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
AddS("Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddS("Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddS("Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddS("Fly Script", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddS("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddS("Remote Spy", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

-- [[ ВКЛАДКА 3: AUTO FARM ]] --
local function AddFarm(n, cb)
    local b = Instance.new("TextButton", TabAuto)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = n .. " [ OFF ]"
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    local a = false
    b.MouseButton1Click:Connect(function()
        a = not a
        b.Text = n .. (a and " [ ON ]" or " [ OFF ]")
        b.TextColor3 = a and Color3.fromRGB(255,0,0) or Color3.fromRGB(255,255,255)
        cb(a)
    end)
end
AddFarm("Auto Popcorn", function(v) _G.F = v while _G.F do task.wait() end end)

-- [[ КНОПКА DH ]] --
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
Instance.new("UIStroke", Tog).Color = Color3.fromRGB(255, 0, 0)
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(function() StartLoader() Main.Visible = true TabMain.Visible = true end)
