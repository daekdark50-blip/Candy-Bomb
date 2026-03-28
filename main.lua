-- [[ DARK HUB v42 | UPDATED INVISIBLE & SPECTATE ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV42") then CoreGui.DarkHubV42:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV42"

-- [[ КРОВАВАЯ ЗАГРУЗКА ]] --
local function StartLoader()
    local LoaderCont = Instance.new("Frame", Gui)
    LoaderCont.Size = UDim2.new(1, 0, 1, 0)
    LoaderCont.BackgroundColor3 = Color3.fromRGB(200, 0, 0) 
    LoaderCont.ZIndex = 2000

    local T = Instance.new("TextLabel", LoaderCont)
    T.Size = UDim2.new(1, 0, 0, 100)
    T.Position = UDim2.new(0, 0, 0.4, 0)
    T.Text = "LOADING DARK HUB..."
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 35
    T.BackgroundTransparency = 1

    local BarBack = Instance.new("Frame", LoaderCont)
    BarBack.Size = UDim2.new(0.6, 0, 0, 15)
    BarBack.Position = UDim2.new(0.2, 0, 0.55, 0)
    BarBack.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
    Instance.new("UICorner", BarBack)

    local Fill = Instance.new("Frame", BarBack)
    Fill.Size = UDim2.new(0, 0, 1, 0)
    Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Fill)

    TweenService:Create(Fill, TweenInfo.new(3), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    task.wait(3.5)
    LoaderCont:Destroy()
end

-- [[ ОСНОВНОЕ МЕНЮ ]] --
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

-- [[ ВКЛАДКА MAIN: ИНВИЗ + СПЕКТАТОР ]] --
local function BuildMainTab()
    -- КНОПКА ИНВИЗА (ВКЛ/ВЫКЛ)
    local InvBtn = Instance.new("TextButton", TabMain)
    InvBtn.Size = UDim2.new(1, 0, 0, 40)
    InvBtn.Text = "INVISIBLE [ OFF ]"
    InvBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    InvBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    InvBtn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", InvBtn)
    
    local isInvis = false
    InvBtn.MouseButton1Click:Connect(function()
        isInvis = not isInvis
        InvBtn.Text = isInvis and "INVISIBLE [ ACTIVE ]" or "INVISIBLE [ OFF ]"
        InvBtn.BackgroundColor3 = isInvis and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(40, 40, 40)
        
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then
                if v.Name ~= "HumanoidRootPart" then
                    v.Transparency = isInvis and 1 or 0
                end
            end
        end
    end)

    -- РАЗДЕЛИТЕЛЬ
    local Sep = Instance.new("Frame", TabMain)
    Sep.Size = UDim2.new(1, 0, 0, 2)
    Sep.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    Sep.BorderSizePixel = 0

    -- СПИСОК ИГРОКОВ (STALKER)
    local List = Instance.new("Frame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 240)
    List.BackgroundTransparency = 1
    local layout = Instance.new("UIListLayout", List)
    layout.Padding = UDim.new(0, 5)

    local function update()
        for _, v in pairs(List:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp then
                local f = Instance.new("Frame", List)
                f.Size = UDim2.new(1, -5, 0, 50)
                f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Instance.new("UICorner", f)

                local icon = Instance.new("ImageLabel", f)
                icon.Size = UDim2.new(0, 40, 0, 40)
                icon.Position = UDim2.new(0, 5, 0.5, -20)
                icon.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

                local btn = Instance.new("TextButton", f)
                btn.Size = UDim2.new(0, 70, 0, 30)
                btn.Position = UDim2.new(1, -75, 0.5, -15)
                btn.Text = "WATCH"
                btn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                Instance.new("UICorner", btn)
                btn.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = p.Character.Humanoid end)

                local txt = Instance.new("TextLabel", f)
                txt.Size = UDim2.new(1, -140, 1, 0)
                txt.Position = UDim2.new(0, 55, 0, 0)
                txt.Text = p.DisplayName.."\n@"..p.Name
                txt.TextColor3 = Color3.fromRGB(255, 255, 255)
                txt.TextXAlignment = "Left"
                txt.TextSize = 10
                txt.BackgroundTransparency = 1
            end
        end
    end
    update()
    
    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, 0, 0, 35)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildMainTab()

-- [[ ВКЛАДКА SCRIPTS (8 ШТУК) ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScript("FPS Flick", "https://api.junkie-development.de/api/v1/luascripts/public/8b5174946c76ba81d5c374bd4a69f7694d10c837e37522a04c91b2b32991e20e/download")
AddScript("Lucky Blocks Battle", "https://raw.githubusercontent.com/PawsThePaw/Plutonium.AA/main/Plutonium.Loader.lua")
AddScript("Swing Obby", "https://raw.githubusercontent.com/gumanba/Scripts/main/SwingObbyforBrainrots")
AddScript("Jump to Steal", "https://raw.githubusercontent.com/gumanba/Scripts/main/JumpToStealLuckyBlocks")
AddScript("Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
AddScript("Fly Script", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")
AddScript("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScript("Remote Spy", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

-- [[ КНОПКА ОТКРЫТИЯ (DH) ]] --
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 255, 255)
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
local S = Instance.new("UIStroke", Tog)
S.Color = Color3.fromRGB(255, 0, 0)
S.Thickness = 3
Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(function() StartLoader(); Main.Visible = true; TabMain.Visible = true end)
