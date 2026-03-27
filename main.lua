-- [[ DARK HUB | STABLE V7 ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Удаление старого
if CoreGui:FindFirstChild("DarkHub7") then CoreGui.DarkHub7:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHub7"
Gui.ResetOnSpawn = false

-- КНОПКА ОТКРЫТИЯ
local Tog = Instance.new("TextButton", Gui)
Tog.Size = UDim2.new(0, 45, 0, 45)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Tog.Text = "DH"
Tog.TextColor3 = Color3.fromRGB(255, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)

-- ГЛАВНОЕ ОКНО
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 380, 0, 280)
Main.Position = UDim2.new(0.5, -190, 0.5, -140)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Заголовок
local Head = Instance.new("TextLabel", Main)
Head.Size = UDim2.new(1, 0, 0, 35)
Head.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
Head.Text = "Dark Hub | By Dark By Hub"
Head.TextColor3 = Color3.fromRGB(255, 255, 255)
Head.Font = Enum.Font.GothamBold
Instance.new("UICorner", Head)

-- Контейнеры (Меню выбора)
local Bar = Instance.new("Frame", Main)
Bar.Size = UDim2.new(0, 100, 1, -40)
Bar.Position = UDim2.new(0, 5, 0, 40)
Bar.BackgroundTransparency = 1
Instance.new("UIListLayout", Bar).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -115, 1, -45)
Container.Position = UDim2.new(0, 110, 0, 40)
Container.BackgroundTransparency = 1

local function NewPage(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 5)

    local b = Instance.new("TextButton", Bar)
    b.Size = UDim2.new(1, 0, 0, 30)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local P1 = NewPage("MAIN")
local P2 = NewPage("SPECTATE")
local P3 = NewPage("SCRIPTS")

Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- ФУНКЦИЯ КНОПОК
local function AddT(txt, parent, func)
    local act = false
    local b = Instance.new("TextButton", parent)
    b.Size = UDim2.new(1, 0, 0, 35)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = txt .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        act = not act
        b.Text = txt .. (act and ": ON" or ": OFF")
        b.TextColor3 = act and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        func(act)
    end)
end

-- [[ MAIN ]]
AddT("Fly", P1, function(s)
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if s then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "Fly7"
        bv.MaxForce = Vector3.new(1,1,1) * 10^7
        task.spawn(function()
            while hrp:FindFirstChild("Fly7") do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 80
                task.wait()
            end
        end)
    else if hrp:FindFirstChild("Fly7") then hrp.Fly7:Destroy() end end
end)

AddT("Wallhack", P1, function(s)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if s then Instance.new("Highlight", p.Character).Name = "ESP7"
            else if p.Character:FindFirstChild("ESP7") then p.Character.ESP7:Destroy() end end
        end
    end
end)

-- [[ SPECTATE (КАК НА ВИДЕО) ]]
local function RefreshSpec()
    for _, v in pairs(P2:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp then
            local f = Instance.new("Frame", P2)
            f.Size = UDim2.new(1, 0, 0, 45)
            f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Instance.new("UICorner", f)

            local img = Instance.new("ImageLabel", f)
            img.Size = UDim2.new(0, 35, 0, 35)
            img.Position = UDim2.new(0, 5, 0.5, -17)
            img.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            Instance.new("UICorner", img).CornerRadius = UDim.new(1,0)

            local t = Instance.new("TextButton", f)
            t.Size = UDim2.new(1, -45, 1, 0)
            t.Position = UDim2.new(0, 45, 0, 0)
            t.BackgroundTransparency = 1
            t.Text = p.DisplayName
            t.TextColor3 = Color3.fromRGB(255, 255, 255)
            t.TextXAlignment = Enum.TextXAlignment.Left
            t.MouseButton1Click:Connect(function()
                workspace.CurrentCamera.CameraSubject = p.Character.Humanoid
            end)
        end
    end
end

local rb = Instance.new("TextButton", P2)
rb.Size = UDim2.new(1, 0, 0, 30)
rb.Text = "Refresh Players"
rb.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
rb.TextColor3 = Color3.fromRGB(255, 255, 255)
rb.MouseButton1Click:Connect(RefreshSpec)

-- [[ SCRIPTS (LUCKY BLOCK) ]]
local lb = Instance.new("TextButton", P3)
lb.Size = UDim2.new(1, 0, 0, 40)
lb.Text = "Lucky Block Script"
lb.BackgroundColor3 = Color3.fromRGB(0, 50, 150)
lb.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", lb)
lb.MouseButton1Click:Connect(function()
    print("Lucky Block Loaded!")
    -- Тут будет твой лоад, который ты дашь
end)

P1.Visible = true
