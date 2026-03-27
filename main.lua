-- [[ DARK HUB | NEAREST WORK READY ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Очистка
if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "DarkHub"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ КНОПКА ПЛЮСИК [+] ]] --
local Toggle = Instance.new("TextButton")
Toggle.Parent = Gui
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Position = UDim2.new(0, 10, 0.4, 0)
Toggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 500
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame")
Main.Parent = Gui
Main.Size = UDim2.new(0, 240, 0, 300)
Main.Position = UDim2.new(0.5, -120, 0.5, -150)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Title.Text = "DARK HUB | V2"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Instance.new("UICorner", Title)

-- Контейнер для кнопок
local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = Main
Scroll.Size = UDim2.new(1, -20, 1, -50)
Scroll.Position = UDim2.new(0, 10, 0, 45)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 450)
Scroll.ScrollBarThickness = 0
local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 6)

-- Открыть/Закрыть
Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.Text = Main.Visible and "-" or "+"
end)

-- Функция для кнопок
local function AddButton(txt, func)
    local active = false
    local b = Instance.new("TextButton", Scroll)
    b.Size = UDim2.new(1, 0, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = txt .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = txt .. (active and ": ON" or ": OFF")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        func(active)
    end)
end

-- [[ ФУНКЦИИ ]] --

-- 1. Полная невидимость
AddButton("Full Invisible", function(s)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = s and 1 or 0 end
        end
    end
end)

-- 2. Полет (Fly)
local flying = false
AddButton("Fly Mode", function(s)
    flying = s
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if flying then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "DarkFly"
        bv.MaxForce = Vector3.new(1,1,1) * 10^6
        task.spawn(function()
            while flying do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
                task.wait()
            end
            if bv then bv:Destroy() end
        end)
    else
        if hrp:FindFirstChild("DarkFly") then hrp.DarkFly:Destroy() end
    end
end)

-- 3. ESP (Wallhack)
AddButton("Wallhack (ESP)", function(s)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if s then
                local h = Instance.new("Highlight", p.Character)
                h.Name = "DarkESP"
                h.FillColor = Color3.fromRGB(255, 0, 0)
            else
                if p.Character:FindFirstChild("DarkESP") then p.Character.DarkESP:Destroy() end
            end
        end
    end
end)

-- 4. Спектрейт (Случайный игрок)
AddButton("Spectate Random", function(s)
    if s then
        local p = Players:GetPlayers()
        local t = p[math.random(1, #p)]
        if t and t.Character then workspace.CurrentCamera.CameraSubject = t.Character.Humanoid end
    else
        workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
    end
end)

-- Кнопка сброса камеры
local res = Instance.new("TextButton", Scroll)
res.Size = UDim2.new(1, 0, 0, 38)
res.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
res.Text = "Reset Camera"
res.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", res)
res.MouseButton1Click:Connect(function()
    workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
end)
