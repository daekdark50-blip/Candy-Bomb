-- [[ DARK HUB | CREATED BY DARK BY HUB ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Удаление старой версии перед запуском
if CoreGui:FindFirstChild("DarkHubFinal") then CoreGui.DarkHubFinal:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubFinal"
Gui.ResetOnSpawn = false

-- [[ КНОПКА DH ]] --
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 0, 0)
Tog.Font = Enum.Font.GothamBold
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНОЕ ОКНО ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 400, 0, 300)
Main.Position = UDim2.new(0.5, -200, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Шапка
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

-- Навигация (Слева)
local Nav = Instance.new("Frame", Main)
Nav.Size = UDim2.new(0, 110, 1, -45)
Nav.Position = UDim2.new(0, 5, 0, 40)
Nav.BackgroundTransparency = 1
Instance.new("UIListLayout", Nav).Padding = UDim.new(0, 5)

-- Контент (Справа)
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

-- [ Кнопка переключения ON/OFF ] --
local function AddToggle(txt, parent, func)
    local active = false
    local btn = Instance.new("TextButton", parent)
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    btn.Text = txt .. ": OFF"
    btn.TextColor3 = Color3.fromRGB(200, 200, 200)
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(function()
        active = not active
        btn.Text = txt .. (active and ": ON" or ": OFF")
        btn.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        func(active)
    end)
end

-- [[ 1. MAIN ]] --
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

AddToggle("Invis", TabMain, function(s)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = s and 1 or 0 end
        end
    end
end)

AddToggle("Wallhack", TabMain, function(s)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if s then Instance.new("Highlight", p.Character).Name = "DH_ESP"
            else if p.Character:FindFirstChild("DH_ESP") then p.Character.DH_ESP:Destroy() end end
        end
    end
end)

-- [[ 2. SPECTATE ]] --
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
            t.Text = "Spectate: " .. p.DisplayName
            t.TextColor3 = Color3.fromRGB(255, 255, 255)
            t.MouseButton1Click:Connect(function()
                workspace.CurrentCamera.CameraSubject = p.Character.Humanoid
            end)
        end
    end
end
local rb = Instance.new("TextButton", TabSpec)
rb.Size = UDim2.new(1, 0, 0, 30)
rb.Text = "REFRESH PLAYERS"
rb.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
rb.TextColor3 = Color3.fromRGB(255, 255, 255)
rb.MouseButton1Click:Connect(Refresh)

-- [[ 3. SCRIPTS (ВОТ ТВОЙ ЛОАД) ]] --
local lbBtn = Instance.new("TextButton", TabScripts)
lbBtn.Size = UDim2.new(1, 0, 0, 45)
lbBtn.BackgroundColor3 = Color3.fromRGB(0, 60, 150)
lbBtn.Text = "Dark hub Be a Lucky blok script Only"
lbBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
lbBtn.Font = Enum.Font.GothamBold
lbBtn.TextSize = 12
Instance.new("UICorner", lbBtn)

lbBtn.MouseButton1Click:Connect(function()
    -- Твой загрузчик
    loadstring(game:HttpGet("https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock"))()
end)

TabMain.Visible = true
