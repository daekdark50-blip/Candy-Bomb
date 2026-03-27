-- [[ DARK HUB | CREATED BY DARK BY HUB ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TS = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV9") then CoreGui.DarkHubV9:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV9"
Gui.ResetOnSpawn = false

-- [[ СТИЛЬНАЯ ЗАГРУЗКА ]] --
local LFrame = Instance.new("Frame", Gui)
LFrame.Size = UDim2.new(0, 300, 0, 100)
LFrame.Position = UDim2.new(0.5, -150, 0.5, -50)
LFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
LFrame.BorderSizePixel = 0
Instance.new("UICorner", LFrame)

local LTitle = Instance.new("TextLabel", LFrame)
LTitle.Size = UDim2.new(1, 0, 0, 40)
LTitle.Text = "DARK HUB | NEAREST WORK"
LTitle.TextColor3 = Color3.fromRGB(255, 0, 0)
LTitle.Font = Enum.Font.GothamBold
LTitle.TextSize = 16
LTitle.BackgroundTransparency = 1

local LBarBg = Instance.new("Frame", LFrame)
LBarBg.Size = UDim2.new(0.8, 0, 0, 4)
LBarBg.Position = UDim2.new(0.1, 0, 0.7, 0)
LBarBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LBarBg.BorderSizePixel = 0

local LBarFill = Instance.new("Frame", LBarBg)
LBarFill.Size = UDim2.new(0, 0, 1, 0)
LBarFill.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
LBarFill.BorderSizePixel = 0

task.spawn(function()
    LBarFill:TweenSize(UDim2.new(1, 0, 1, 0), "Out", "Quad", 2)
    task.wait(2.2)
    LFrame:TweenPosition(UDim2.new(0.5, -150, 0.5, -200), "In", "Back", 0.5)
    task.wait(0.5)
    LFrame:Destroy()
end)

-- [[ КНОПКА DH ]] --
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 0, 0)
Tog.Font = Enum.Font.GothamBold
Tog.Visible = false
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)

task.delay(2.5, function() Tog.Visible = true end)

-- [[ ГЛАВНОЕ ОКНО ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.Position = UDim2.new(0.5, -200, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Head = Instance.new("Frame", Main)
Head.Size = UDim2.new(1, 0, 0, 35)
Head.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Instance.new("UICorner", Head)

local Title = Instance.new("TextLabel", Head)
Title.Size = UDim2.new(1, 0, 1, 0)
Title.Text = "Dark Hub | By Dark By Hub"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1
Title.Font = Enum.Font.GothamBold

local Nav = Instance.new("Frame", Main)
Nav.Size = UDim2.new(0, 110, 1, -45)
Nav.Position = UDim2.new(0, 5, 0, 40)
Nav.BackgroundTransparency = 1
Instance.new("UIListLayout", Nav).Padding = UDim.new(0, 5)

local Pages = Instance.new("Frame", Main)
Pages.Size = UDim2.new(1, -125, 1, -45)
Pages.Position = UDim2.new(0, 120, 0, 40)
Pages.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Pages)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)

    local b = Instance.new("TextButton", Nav)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)

    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Pages:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local TabMain = CreateTab("MAIN")
local TabSpec = CreateTab("SPECTATE")
local TabScripts = CreateTab("SCRIPTS")

Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- Функции MAIN
local function AddToggle(txt, parent, func)
    local act = false
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = txt .. ": OFF"
    b.TextColor3 = Color3.fromRGB(180, 180, 180)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        act = not act
        b.Text = txt .. (act and ": ON" or ": OFF")
        b.TextColor3 = act and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(180, 180, 180)
        func(act)
    end)
end

AddToggle("Fly", TabMain, function(s)
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if s then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "DHFly"
        bv.MaxForce = Vector3.new(1,1,1) * 10^7
        task.spawn(function()
            while hrp:FindFirstChild("DHFly") do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80
                task.wait()
            end
        end)
    else if hrp:FindFirstChild("DHFly") then hrp.DHFly:Destroy() end end
end)

AddToggle("Wallhack", TabMain, function(s)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if s then Instance.new("Highlight", p.Character).Name = "DH_ESP"
            else if p.Character:FindFirstChild("DH_ESP") then p.Character.DH_ESP:Destroy() end end
        end
    end
end)

-- [[ SPECTATE ]] --
local function Refresh()
    for _, v in pairs(TabSpec:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", TabSpec)
            f.Size = UDim2.new(1, 0, 0, 40)
            f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Instance.new("UICorner", f)
            local t = Instance.new("TextButton", f)
            t.Size = UDim2.new(1, 0, 1, 0)
            t.BackgroundTransparency = 1
            t.Text = "Watch: " .. p.DisplayName
            t.TextColor3 = Color3.fromRGB(255, 255, 255)
            t.MouseButton1Click:Connect(function()
                workspace.CurrentCamera.CameraSubject = p.Character.Humanoid
            end)
        end
    end
end
local rb = Instance.new("TextButton", TabSpec)
rb.Size = UDim2.new(1, 0, 0, 30)
rb.Text = "REFRESH LIST"
rb.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
rb.TextColor3 = Color3.fromRGB(255, 255, 255)
rb.MouseButton1Click:Connect(Refresh)

-- [[ SCRIPTS TAB ]] --
-- 1. Скрипт на Lucky Block
local lbBtn = Instance.new("TextButton", TabScripts)
lbBtn.Size = UDim2.new(1, 0, 0, 40)
lbBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 150)
lbBtn.Text = "Dark hub Be a Lucky blok script Only"
lbBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", lbBtn)
lbBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"))()
end)

-- 2. Скрипт Fly for Brainrots
local flyBrBtn = Instance.new("TextButton", TabScripts)
flyBrBtn.Size = UDim2.new(1, 0, 0, 40)
flyBrBtn.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
flyBrBtn.Text = "Fly for Brainrots"
flyBrBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", flyBrBtn)
flyBrBtn.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots"))()
end)

TabMain.Visible = true
