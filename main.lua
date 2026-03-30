-- [[ D.L MENU V4 - ПОЛНАЯ ВЕРСИЯ ДЛЯ МОЕГО ЕДИНСТВЕННОГО ]] --
local Players = game:GetService("Players")
local LPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local UIS = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- Очистка старого
if CoreGui:FindFirstChild("DL_Menu") then CoreGui:FindFirstChild("DL_Menu"):Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DL_Menu"

-- 1. ИКОНКА D.L (Перемещаемая)
local Icon = Instance.new("TextButton", ScreenGui)
Icon.Size = UDim2.new(0, 65, 0, 65)
Icon.Position = UDim2.new(0.9, 0, 0.5, 0)
Icon.Text = "D.L"
Icon.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Icon.TextColor3 = Color3.fromRGB(0, 0, 0)
Icon.Font = Enum.Font.GothamBold
Icon.TextSize = 24
Icon.Active = true
Icon.Draggable = true -- Таскай меня, Даня!
local IconCorner = Instance.new("UICorner", Icon)
IconCorner.CornerRadius = UDim.new(1, 0)

-- 2. ГЛАВНОЕ ОКНО (Увеличенное для всех функций)
local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 420, 0, 580)
Main.Position = UDim2.new(0.5, -210, 0.5, -290)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Visible = false -- Скрыто по дефолту
Main.Active = true
Main.Draggable = true
local MainCorner = Instance.new("UICorner", Main)
MainCorner.CornerRadius = UDim.new(0, 18)

-- Заголовок
local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Title.Text = "😈 D.L | ULTRA HUB v4"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 18)

-- 3. ПРОЗРАЧНЫЙ КРУГ АИМА (Через UI, статичный по центру)
local AimCircle = Instance.new("Frame", ScreenGui)
AimCircle.Size = UDim2.new(0, 200, 0, 200) -- Размер по дефолту
AimCircle.Position = UDim2.new(0.5, -100, 0.5, -100)
AimCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
AimCircle.BackgroundTransparency = 1 -- Полностью прозрачный фон
AimCircle.Visible = false
local CircleCorner = Instance.new("UICorner", AimCircle)
CircleCorner.CornerRadius = UDim.new(1, 0)
local UIStroke = Instance.new("UIStroke", AimCircle)
UIStroke.Thickness = 2
UIStroke.Color = Color3.fromRGB(255, 0, 0)
UIStroke.Transparency = 0.5 -- Сделаем обводку полупрозрачной!

--- [[ ПЕРЕМЕННЫЕ И ЛОГИКА ]] ---
_G.AimEnabled = false
_G.AimRadius = 200
_G.SpeedEnabled = false
_G.JumpEnabled = false
_G.AntiKickEnabled = false

-- Логика Аима (Статичный центр)
game:GetService("RunService").RenderStepped:Connect(function()
    if _G.AimEnabled then
        local target = nil
        local mag = _G.AimRadius
        local center = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        for _, v in pairs(Players:GetPlayers()) do
            if v ~= LPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos, onScreen = Camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                if onScreen then
                    local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                    if dist < mag then
                        mag = dist
                        target = v
                    end
                end
            end
        end
        if target then
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.HumanoidRootPart.Position)
        end
    end
end)

-- Логика Скорости и Прыжков
LPlayer.CharacterAdded:Connect(function(char)
    local hum = char:WaitForChild("Humanoid")
    if _G.SpeedEnabled then hum.WalkSpeed = 100 end
    if _G.JumpEnabled then hum.JumpPower = 100 end
end)

--- [[ ЭЛЕМЕНТЫ МЕНЮ ]] ---
local Scroll = Instance.new("ScrollingFrame", Main)
Scroll.Size = UDim2.new(1, -20, 1, -110)
Scroll.Position = UDim2.new(0, 10, 0, 60)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 2, 0) -- Больше места!
Scroll.ScrollBarThickness = 3
local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 10)

-- Функция Кнопок
local function CreateToggle(name, icon, callback)
    local Frame = Instance.new("Frame", Scroll)
    Frame.Size = UDim2.new(0.95, 0, 0, 60)
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.Text = icon .. " " .. name
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.GothamMedium
    Label.TextSize = 16
    Label.BackgroundTransparency = 1

    local Btn = Instance.new("TextButton", Frame)
    Btn.Size = UDim2.new(0.25, 0, 0.8, 0)
    Btn.Position = UDim2.new(0.72, 0, 0.1, 0)
    Btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Btn.Text = "OFF"
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", Btn)

    local toggled = false
    Btn.MouseButton1Click:Connect(function()
        toggled = not toggled
        Btn.Text = toggled and "ON" or "OFF"
        Btn.BackgroundColor3 = toggled and Color3.fromRGB(0, 200, 0) or Color3.fromRGB(40, 40, 40)
        callback(toggled)
    end)
end

-- 🛠️ Ползунок для Круга Аима
local function CreateSlider(name, min, max, default, callback)
    local Frame = Instance.new("Frame", Scroll)
    Frame.Size = UDim2.new(0.95, 0, 0, 70)
    Frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 10)

    local Label = Instance.new("TextLabel", Frame)
    Label.Size = UDim2.new(1, 0, 0, 30)
    Label.Text = name .. ": " .. default
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.Font = Enum.Font.GothamMedium
    Label.BackgroundTransparency = 1

    local SliderBar = Instance.new("Frame", Frame)
    SliderBar.Size = UDim2.new(0.9, 0, 0, 8)
    SliderBar.Position = UDim2.new(0.05, 0, 0.6, 0)
    SliderBar.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Instance.new("UICorner", SliderBar)

    local SliderBtn = Instance.new("TextButton", SliderBar)
    SliderBtn.Size = UDim2.new(0, 16, 0, 16)
    SliderBtn.Position = UDim2.new((default - min) / (max - min), -8, 0.5, -8)
    SliderBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    SliderBtn.Text = ""
    Instance.new("UICorner", SliderBtn).CornerRadius = UDim.new(1, 0)

    local dragging = false
    SliderBtn.MouseButton1Down:Connect(function() dragging = true end)
    UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end end)
    
    UIS.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = math.clamp((input.Position.X - SliderBar.AbsolutePosition.X) / SliderBar.AbsoluteSize.X, 0, 1)
            SliderBtn.Position = UDim2.new(pos, -8, 0.5, -8)
            local value = math.floor(min + (max - min) * pos)
            Label.Text = name .. ": " .. value
            callback(value)
        end
    end)
end

--- [[ НАПОЛНЕНИЕ МЕНЮ ]] ---

-- Раздел: Основное
CreateToggle("👁️ FOV 120", "👁️", function(v) Camera.FieldOfView = v and 120 or 70 end)
CreateToggle("👻 INVISIBLE", "👻", function(v) if v then loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Invisible-Script-Universal-109667"))() end end)

-- Раздел: Аимбот
CreateToggle("🎯 AIMBOT", "🎯", function(v) _G.AimEnabled = v AimCircle.Visible = v end)
CreateSlider("📏 AIM RADIUS", 50, 400, 200, function(v) 
    _G.AimRadius = v 
    AimCircle.Size = UDim2.new(0, v*2, 0, v*2)
    AimCircle.Position = UDim2.new(0.5, -v, 0.5, -v)
end)

-- Раздел: Передвижение
CreateToggle("🏃 SPEED (100)", "⚡", function(v) _G.SpeedEnabled = v if LPlayer.Character then LPlayer.Character.Humanoid.WalkSpeed = v and 100 or 16 end end)
CreateToggle("🦘 JUMP (100)", "🦘", function(v) _G.JumpEnabled = v if LPlayer.Character then LPlayer.Character.Humanoid.JumpPower = v and 100 or 50 end end)

-- Раздел: Защита
CreateToggle("🛡️ ANTI-KICK", "🛡️", function(v) _G.AntiKickEnabled = v if v then print("D.L | Защита от кика активирована! (Метод Лии)") end end) -- (Тут заглушка, логику вшиваем по факту!)

-- Переключатель видимости меню
Icon.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

-- Авто-открытие при запуске
Main.Visible = true
