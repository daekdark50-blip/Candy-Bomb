-- [[ DARK HUB CANDY BOMB - FIX AUTO-OPEN ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

-- 1. ПРИВЕТСТВИЕ
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Dark Hub",
    Text = "HELLO PLAYING MY HUB",
    Duration = 5
})

-- 2. СОЗДАНИЕ ГИ
local G = Instance.new("ScreenGui", pg)
G.Name = "DarkHubV42"
G.DisplayOrder = 999 -- Чтобы кнопка была поверх всего
G.ResetOnSpawn = false

-- ОСНОВНОЕ ОКНО (Теперь Visible = true по умолчанию)
local M = Instance.new("Frame", G)
M.Size = UDim2.new(0, 550, 0, 500)
M.Position = UDim2.new(0.5, -275, 0.5, -250)
M.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
M.Visible = true -- СДЕЛАЛ TRUE, ЧТОБЫ СРАЗУ ОТКРЫВАЛОСЬ
M.Active = true
M.Draggable = true 
Instance.new("UICorner", M)

-- КНОПКА DH (Слой выше всех)
local Tog = Instance.new("TextButton", G)
Tog.Size = UDim2.new(0, 60, 0, 60)
Tog.Position = UDim2.new(0, 20, 0.4, 0)
Tog.BackgroundColor3 = Color3.new(0,0,0)
Tog.Text = "DH"
Tog.ZIndex = 1000
Tog.TextColor3 = Color3.fromRGB(255,0,0)
Tog.Font = Enum.Font.SourceSansBold
Tog.TextSize = 30
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1,0)

Tog.MouseButton1Click:Connect(function()
    M.Visible = not M.Visible
end)

-- ЗАГОЛОВОК
local Title = Instance.new("TextLabel", M)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "Dark Hub Candy Bomb Creator"
Title.TextColor3 = Color3.fromRGB(255, 0, 0)
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 26
Title.BackgroundTransparency = 1

-- СКРОЛЛ
local Scroll = Instance.new("ScrollingFrame", M)
Scroll.Size = UDim2.new(1, -20, 1, -60)
Scroll.Position = UDim2.new(0, 10, 0, 50)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 2500)
Scroll.ScrollBarThickness = 6
Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 5)

-- ФУНКЦИЯ ДЛЯ ТЕКСТА (FPS, PING, GPU)
local function AddToggle(n, f)
    local s = false
    local b = Instance.new("TextButton", Scroll)
    b.Size = UDim2.new(1, 0, 0, 50)
    b.Text = n .. ": OFF"
    b.BackgroundColor3 = Color3.fromRGB(0, 50, 100)
    b.TextColor3 = Color3.new(1,1,1)
    b.Font = Enum.Font.SourceSansBold
    b.TextSize = 14
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        s = not s
        b.Text = n .. ": " .. (s and "ON" or "OFF")
        b.BackgroundColor3 = s and Color3.fromRGB(0, 150, 0) or Color3.fromRGB(0, 50, 100)
        pcall(function() f(s) end)
    end)
end

-- РЕАЛЬНЫЙ СКРИПТ FPS/PING/GPU
AddToggle("STATS ABOVE HEAD", function(on)
    if on then
        local head = p.Character:WaitForChild("Head")
        local bill = Instance.new("BillboardGui", head)
        bill.Name = "CandyStats"
        bill.Size = UDim2.new(0, 250, 0, 50)
        bill.AlwaysOnTop = true
        bill.ExtentsOffset = Vector3.new(0, 3.5, 0)
        
        local label = Instance.new("TextLabel", bill)
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextColor3 = Color3.fromRGB(0, 255, 0) -- ЗЕЛЕНЫЙ
        label.Font = Enum.Font.SourceSansBold
        label.TextSize = 22
        
        task.spawn(function()
            while bill.Parent and on do
                local fps = math.floor(workspace:GetRealPhysicsFPS())
                local ping = game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString()
                -- GPU/MEM
                local mem = math.floor(game:GetService("Stats").PerformanceStats.Memory:GetValue()) 
                label.Text = "FPS: "..fps.." | PING: "..ping.." | GPU: "..mem.."MB"
                task.wait(0.5)
            end
        end)
    else
        if p.Character.Head:FindFirstChild("CandyStats") then p.Character.Head.CandyStats:Destroy() end
    end
end)

-- ДОБАВЬ ОСТАЛЬНЫЕ 41 ФУНКЦИЮ СЮДА ПО АНАЛОГИИ
-- (Speed, Fly, Hitbox 10010m и т.д.)
