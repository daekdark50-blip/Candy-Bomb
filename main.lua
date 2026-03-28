-- [[ DARK HUB v41 | BLOODY TRADE PLAZA EDITION ]] --
-- [[ ALL-IN-ONE: PLUTONIUM, STALKER, AUTO-BATTLE ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV41") then CoreGui.DarkHubV41:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV41"

-- ТВОЯ НОВАЯ АВА (Космонавт на качелях)
local AvatarID = "rbxassetid://13110906232" 

-- [[ 1. КРОВАВАЯ ЗАГРУЗКА НА ВЕСЬ ЭКРАН ]] --
local function StartLoader()
    local LoaderCont = Instance.new("Frame", Gui)
    LoaderCont.Size = UDim2.new(1, 0, 1, 0)
    LoaderCont.BackgroundColor3 = Color3.fromRGB(15, 0, 0)
    LoaderCont.ZIndex = 1000

    local BgImg = Instance.new("ImageLabel", LoaderCont)
    BgImg.Size = UDim2.new(1, 0, 1, 0)
    BgImg.Image = AvatarID
    BgImg.ScaleType = Enum.ScaleType.Crop
    BgImg.ImageTransparency = 0.5
    BgImg.BackgroundTransparency = 1

    local T = Instance.new("TextLabel", LoaderCont)
    T.Size = UDim2.new(1, 0, 0, 100)
    T.Position = UDim2.new(0, 0, 0.45, 0)
    T.Text = "DARK HUB V41\nNEREST READY WORK"
    T.TextColor3 = Color3.fromRGB(255, 0, 0)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 35
    T.BackgroundTransparency = 1
    T.ZIndex = 1001

    -- Эффект биения сердца
    task.spawn(function()
        while LoaderCont.Parent do
            TweenService:Create(T, TweenInfo.new(0.6), {TextSize = 38, TextColor3 = Color3.fromRGB(150, 0, 0)}):Play()
            task.wait(0.6)
            TweenService:Create(T, TweenInfo.new(0.6), {TextSize = 35, TextColor3 = Color3.fromRGB(255, 0, 0)}):Play()
            task.wait(0.6)
        end
    end)

    task.wait(4)
    LoaderCont:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ (BLOODY STYLE) ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.BorderSizePixel = 0
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(8, 8, 8)
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
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
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

-- [[ СТАЛКЕР СПЕКТАТОР (ИЗ СКРИНШОТОВ) ]] --
local function BuildStalker()
    local List = Instance.new("Frame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 280)
    List.BackgroundTransparency = 1
    Instance.new("UIListLayout", List).Padding = UDim.new(0, 5)

    local function update()
        for _, v in pairs(List:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp then
                local f = Instance.new("Frame", List)
                f.Size = UDim2.new(1, 0, 0, 45)
                f.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
                Instance.new("UICorner", f)
                
                local icon = Instance.new("ImageLabel", f)
                icon.Size = UDim2.new(0, 35, 0, 35)
                icon.Position = UDim2.new(0, 5, 0.5, -17)
                icon.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

                local btn = Instance.new("TextButton", f)
                btn.Size = UDim2.new(0, 70, 0, 30)
                btn.Position = UDim2.new(1, -75, 0.5, -15)
                btn.Text = "WATCH"
                btn.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                Instance.new("UICorner", btn)
                btn.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)

                local name = Instance.new("TextLabel", f)
                name.Size = UDim2.new(1, -90, 1, 0)
                name.Position = UDim2.new(0, 50, 0, 0)
                name.Text = p.DisplayName.."\n@"..p.Name
                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                name.TextXAlignment = "Left"
                name.TextSize = 10
                name.BackgroundTransparency = 1
            end
        end
    end
    update()
    
    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, 0, 0, 35)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Stop.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildStalker()

-- [[ ВСЕ СКРИПТЫ + PLUTONIUM ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScript("Plutonium (Lucky Blocks Battle)", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
AddScript("Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddScript("Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddScript("Jump to Steal Lucky Blocks", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")

-- [[ AUTO FARM (POPCORN BATTLE КЛИКЕР) ]] --
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
        b.Text = name .. (act and " [ ACTIVE ]" or " [ OFF ]")
        b.TextColor3 = act and Color3.fromRGB(255, 0, 0) or Color3.fromRGB(255, 255, 255)
        callback(act)
    end)
end

AddToggle(TabAuto, "Auto Popcorn Battle", function(v)
    _G.AutoBattle = v
    task.spawn(function()
        while _G.AutoBattle do
            pcall(function()
                -- Авто-кликер для кнопок в мини-игре
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

-- [[ КНОПКА DH (ТВОЯ АВА) ]] --
local Tog = Instance.new("ImageButton", Gui)
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Image = AvatarID
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
local S = Instance.new("UIStroke", Tog)
S.Color = Color3.fromRGB(255, 0, 0)
S.Thickness = 3
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(function() StartLoader(); Main.Visible = true; TabMain.Visible = true end)
