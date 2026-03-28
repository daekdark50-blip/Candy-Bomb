-- [[ DARK HUB v39 | ALL FEATURES RESTORED ]] --
-- [[ AK ADMIN | SPECTATE + POPCORN + AVATAR ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV39") then CoreGui.DarkHubV39:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV39"

-- Твоя новая ава из файлов (ID для примера, замени на свой если не грузит)
local AvatarID = "rbxassetid://13110906232" 

-- [[ 1. КРАСИВАЯ ЗАГРУЗКА С АВОЙ ]] --
local function StartLoader()
    local Loader = Instance.new("Frame", Gui)
    Loader.Size = UDim2.new(1, 0, 1, 0)
    Loader.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Loader.ZIndex = 500

    local Img = Instance.new("ImageLabel", Loader)
    Img.Size = UDim2.new(0, 300, 0, 450)
    Img.Position = UDim2.new(0.5, -150, 0.4, -225)
    Img.Image = AvatarID
    Img.BackgroundTransparency = 1
    Instance.new("UICorner", Img)

    local T = Instance.new("TextLabel", Loader)
    T.Size = UDim2.new(1, 0, 0, 50)
    T.Position = UDim2.new(0, 0, 0.85, 0)
    T.Text = "loading dark hub script nerest ready work"
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 22
    T.BackgroundTransparency = 1

    task.wait(3.5)
    Loader:Destroy()
end

-- [[ 2. ОСНОВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -155, 1, -10)
Container.Position = UDim2.new(0, 150, 0, 5)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 2
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

local TabMain = CreateTab("MAIN")
local TabScripts = CreateTab("SCRIPTS")
local TabAuto = CreateTab("AUTO FARM")

-- [[ SPECTATE (STALKER) В MAIN ]] --
local function BuildSpectate()
    local List = Instance.new("Frame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 280)
    List.BackgroundTransparency = 1
    Instance.new("UIListLayout", List).Padding = UDim.new(0, 5)

    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", List)
            f.Size = UDim2.new(1, 0, 0, 45)
            f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Instance.new("UICorner", f)
            
            local name = Instance.new("TextLabel", f)
            name.Size = UDim2.new(1, -90, 1, 0)
            name.Position = UDim2.new(0, 10, 0, 0)
            name.Text = p.DisplayName .. " (@" .. p.Name .. ")"
            name.TextColor3 = Color3.fromRGB(255, 255, 255)
            name.TextXAlignment = "Left"
            name.BackgroundTransparency = 1

            local btn = Instance.new("TextButton", f)
            btn.Size = UDim2.new(0, 70, 0, 30)
            btn.Position = UDim2.new(1, -75, 0.5, -15)
            btn.Text = "WATCH"
            btn.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
            Instance.new("UICorner", btn)
            btn.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)
        end
    end
end
BuildSpectate()

-- [[ AUTO FARM ПОПКРОН (ВЕРНУЛ!) ]] --
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

AddToggle(TabAuto, "Auto Popcorn +99", function(v)
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

-- [[ SCRIPTS ВКЛАДКА ]] --
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

-- [[ КНОПКА DH (С ТВОЕЙ АВОЙ) ]] --
local Tog = Instance.new("ImageButton", Gui)
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Image = AvatarID
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
local S = Instance.new("UIStroke", Tog)
S.Color = Color3.fromRGB(0, 255, 100)
S.Thickness = 2
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(function() StartLoader(); Main.Visible = true; TabMain.Visible = true end)
