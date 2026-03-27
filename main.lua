-- [[ DARK HUB | CREATED BY DARK BY HUB ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Чистка старых версий
if CoreGui:FindFirstChild("DarkHubV4") then CoreGui.DarkHubV4:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "DarkHubV4"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false

-- [[ КНОПКА ОТКРЫТИЯ ]] --
local Toggle = Instance.new("TextButton", Gui)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Position = UDim2.new(0, 15, 0.5, -25)
Toggle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Toggle.Text = "DH"
Toggle.TextColor3 = Color3.fromRGB(255, 0, 0)
Toggle.TextSize = 20
Toggle.Font = Enum.Font.GothamBold
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНОЕ ОКНО ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 450, 0, 300) -- Сделал шире как на скрине
Main.Position = UDim2.new(0.5, -225, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- HEADER (КРЕАТОР)
local Header = Instance.new("Frame", Main)
Header.Size = UDim2.new(1, 0, 0, 35)
Header.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Instance.new("UICorner", Header)

local Title = Instance.new("TextLabel", Header)
Title.Size = UDim2.new(1, -20, 1, 0)
Title.Position = UDim2.new(0, 10, 0, 0)
Title.Text = "Dark Hub | Created by Dark By Hub"
Title.TextColor3 = Color3.fromRGB(200, 200, 200)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

-- ЛЕВАЯ ПАНЕЛЬ (ВКЛАДКИ)
local SideBar = Instance.new("Frame", Main)
SideBar.Size = UDim2.new(0, 120, 1, -40)
SideBar.Position = UDim2.new(0, 5, 0, 40)
SideBar.BackgroundTransparency = 1

local function MakeTab(txt, pos)
    local b = Instance.new("TextButton", SideBar)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.Position = UDim2.new(0, 0, 0, pos)
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.Text = txt
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    return b
end

local TabMain = MakeTab("Main", 0)
local TabLucky = MakeTab("Be a LuckyBlock", 40)

-- КОНТЕЙНЕРЫ
local MainCont = Instance.new("ScrollingFrame", Main)
MainCont.Size = UDim2.new(1, -140, 1, -50)
MainCont.Position = UDim2.new(0, 130, 0, 45)
MainCont.BackgroundTransparency = 1
MainCont.ScrollBarThickness = 0

local LuckyCont = Instance.new("ScrollingFrame", Main)
LuckyCont.Size = MainCont.Size
LuckyCont.Position = MainCont.Position
LuckyCont.BackgroundTransparency = 1
LuckyCont.Visible = false
LuckyCont.ScrollBarThickness = 0

local function SetLayout(p)
    local l = Instance.new("UIListLayout", p)
    l.Padding = UDim.new(0, 5)
end
SetLayout(MainCont)
SetLayout(LuckyCont)

-- ПЕРЕКЛЮЧЕНИЕ ВКЛАДОК
TabMain.MouseButton1Click:Connect(function() MainCont.Visible = true LuckyCont.Visible = false end)
TabLucky.MouseButton1Click:Connect(function() MainCont.Visible = false LuckyCont.Visible = true end)

Toggle.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ФУНКЦИЯ СОЗДАНИЯ КНОПОК (ДИЗАЙН КАК НА СКРИНЕ)
local function AddToggle(txt, parent, func)
    local active = false
    local f = Instance.new("Frame", parent)
    f.Size = UDim2.new(1, 0, 0, 40)
    f.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Instance.new("UICorner", f)
    
    local t = Instance.new("TextLabel", f)
    t.Size = UDim2.new(0.7, 0, 1, 0)
    t.Position = UDim2.new(0, 10, 0, 0)
    t.Text = txt
    t.TextColor3 = Color3.fromRGB(200, 200, 200)
    t.Font = Enum.Font.Gotham
    t.TextSize = 13
    t.BackgroundTransparency = 1
    t.TextXAlignment = Enum.TextXAlignment.Left
    
    local btn = Instance.new("TextButton", f)
    btn.Size = UDim2.new(0, 40, 0, 20)
    btn.Position = UDim2.new(1, -50, 0.5, -10)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    btn.Text = ""
    Instance.new("UICorner", btn).CornerRadius = UDim.new(1, 0)
    
    local circle = Instance.new("Frame", btn)
    circle.Size = UDim2.new(0, 16, 0, 16)
    circle.Position = UDim2.new(0, 2, 0.5, -8)
    circle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", circle).CornerRadius = UDim.new(1, 0)
    
    btn.MouseButton1Click:Connect(function()
        active = not active
        circle:TweenPosition(active and UDim2.new(1, -18, 0.5, -8) or UDim2.new(0, 2, 0.5, -8), "Out", "Quad", 0.2)
        btn.BackgroundColor3 = active and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(50, 50, 50)
        func(active)
    end)
end

-- [[ ВКЛАДКА: MAIN ]] --
AddToggle("Fly Mode", MainCont, function(s)
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if s then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "DarkFly"
        bv.MaxForce = Vector3.new(1,1,1) * 10^6
        task.spawn(function()
            while hrp:FindFirstChild("DarkFly") do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 70
                task.wait()
            end
        end)
    else
        if hrp:FindFirstChild("DarkFly") then hrp.DarkFly:Destroy() end
    end
end)

AddToggle("Full Invisible", MainCont, function(s)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = s and 1 or 0 end
        end
    end
end)

-- [[ ВКЛАДКА: BE A LUCKY BLOCK (КАК НА СКРИНЕ) ]] --
AddToggle("Auto Claim PlayTime Rewards", LuckyCont, function(s)
    _G.AutoClaim = s
    while _G.AutoClaim do
        -- Тут должен быть путь к RemoteEvent игры
        game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents"):FindFirstChild("ClaimReward"):FireServer()
        task.wait(1)
    end
end)

AddToggle("Auto Rebirth", LuckyCont, function(s)
    _G.AutoRebirth = s
    while _G.AutoRebirth do
        game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents"):FindFirstChild("Rebirth"):FireServer()
        task.wait(2)
    end
end)

AddToggle("Auto Buy Best LuckyBlock", LuckyCont, function(s)
    _G.AutoBuy = s
    while _G.AutoBuy do
        -- Пример команды на покупку
        game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvents"):FindFirstChild("BuyBlock"):FireServer("Best")
        task.wait(0.5)
    end
end)

local redeemBtn = Instance.new("TextButton", LuckyCont)
redeemBtn.Size = UDim2.new(1, 0, 0, 40)
redeemBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
redeemBtn.Text = "Redeem All Codes"
redeemBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", redeemBtn)

-- Спектрейт как в прошлом запросе
AddToggle("Open Stalker List", MainCont, function(s)
    print("Use old Spectate logic here")
end)
