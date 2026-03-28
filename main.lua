-- [[ DARK HUB v41 | CLEAN & POWERFUL ]] --
-- [[ ALL 5 SCRIPTS + STALKER SPECTATE ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV41") then CoreGui.DarkHubV41:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV41"

-- НОВАЯ КРУТАЯ АВА (Пройдет любую проверку)
local AvatarID = "rbxassetid://10821213645" 

-- [[ 1. КРУТАЯ ЗАГРУЗКА ]] --
local function StartLoader()
    local Loader = Instance.new("Frame", Gui)
    Loader.Size = UDim2.new(1, 0, 1, 0)
    Loader.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
    Loader.ZIndex = 500

    local Img = Instance.new("ImageLabel", Loader)
    Img.Size = UDim2.new(0, 220, 0, 220)
    Img.Position = UDim2.new(0.5, -110, 0.4, -110)
    Img.Image = AvatarID
    Img.BackgroundTransparency = 1
    Instance.new("UICorner", Img).CornerRadius = UDim.new(1, 0)
    
    local Glow = Instance.new("UIStroke", Img)
    Glow.Color = Color3.fromRGB(0, 255, 150)
    Glow.Thickness = 3

    local T = Instance.new("TextLabel", Loader)
    T.Size = UDim2.new(1, 0, 0, 50)
    T.Position = UDim2.new(0, 0, 0.7, 0)
    T.Text = "DARK HUB V41 | LOADING ASSETS"
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 20
    T.BackgroundTransparency = 1

    task.wait(2.5)
    Loader:Destroy()
end

-- [[ 2. ГЛАВНОЕ МЕНЮ (DARK V41) ]] --
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
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
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

-- [[ ТОЧНЫЙ STALKER SPECTATE ИЗ ВИДЕО ]] --
local function BuildStalker()
    local Title = Instance.new("TextLabel", TabMain)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Text = "PLAYER STALKER"
    Title.TextColor3 = Color3.fromRGB(0, 255, 150)
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

                local icon = Instance.new("ImageLabel", f)
                icon.Size = UDim2.new(0, 35, 0, 35)
                icon.Position = UDim2.new(0, 5, 0.5, -17)
                icon.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

                local name = Instance.new("TextLabel", f)
                name.Size = UDim2.new(1, -100, 1, 0)
                name.Position = UDim2.new(0, 50, 0, 0)
                name.Text = p.DisplayName .. " (@" .. p.Name .. ")"
                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                name.TextXAlignment = "Left"
                name.Font = Enum.Font.Gotham
                name.TextSize = 11
                name.BackgroundTransparency = 1

                local btn = Instance.new("TextButton", f)
                btn.Size = UDim2.new(0, 70, 0, 25)
                btn.Position = UDim2.new(1, -75, 0.5, -12)
                btn.Text = "WATCH"
                btn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
                btn.TextColor3 = Color3.fromRGB(0, 0, 0)
                Instance.new("UICorner", btn)
                btn.MouseButton1Click:Connect(function()
                    workspace.CurrentCamera.CameraSubject = p.Character.Humanoid
                end)
            end
        end
    end
    update()
    
    local Reset = Instance.new("TextButton", TabMain)
    Reset.Size = UDim2.new(1, 0, 0, 35)
    Reset.Text = "STOP SPECTATE"
    Reset.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    Reset.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Reset)
    Reset.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildStalker()

-- [[ ВСЕ 5 СКРИПТОВ ]] --
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
AddScript("Jump to Steal Lucky Blocks", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddScript("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScript("Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddScript("Swing Obby Script", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")

-- [[ AUTO FARM ]] --
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
        b.TextColor3 = act and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 255, 255)
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

-- [[ КНОПКА DH (С НОВОЙ АВОЙ) ]] --
local Tog = Instance.new("ImageButton", Gui)
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Image = AvatarID
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
local S = Instance.new("UIStroke", Tog)
S.Color = Color3.fromRGB(0, 255, 150)
S.Thickness = 2
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(function() StartLoader(); Main.Visible = true; TabMain.Visible = true end)
