-- 1. ЖЕСТКАЯ ОЧИСТКА ЭКРАНА
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name == "BlackSpyGui" or v:FindFirstChild("Main")) then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BlackSpyGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(5, 5, 5) -- Полностью черный
Main.Size = UDim2.new(0, 180, 0, 160)
Main.Position = UDim2.new(0.5, -90, 0.1, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local function createBtn(name, pos, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0.4, 0)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    btn.Text = name
    btn.TextColor3 = Color3.new(1, 1, 1) -- Белый текст
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- КНОПКА: УЛЬТРА ТЕЛЕПОРТ
createBtn("ТП К ПОСЛЕДНИМ ANCIENT", UDim2.new(0.05, 0, 0.1, 0), function()
    local char = game.Players.LocalPlayer.Character
    if not char then return end
    local root = char:WaitForChild("HumanoidRootPart")
    
    local maxZ = -math.huge -- Ищем самую дальнюю Z координату
    local target = nil

    -- Сканируем всё в workspace
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") then
            local vName = v.Name:lower()
            -- Ищем только Ancient-объекты
            if vName:find("ancient") or vName:find("mythic") then
                -- Умная логика: находим тот, у которого максимальная координата Z
                if v.Position.Z > maxZ then
                    maxZ = v.Position.Z
                    target = v
                end
            end
        end
    end

    if target then
        root.CFrame = target.CFrame + Vector3.new(0, 3, 0)
        print("Телепортировался к самому дальнему Ancient!")
    else
        print("Последние Ancient-мозги не найдены. Подожди их появления.")
    end
end)

-- АВТО-СБОР (ПРИТЯГИВАНИЕ ВСЕХ МОЗГОВ)
local autoCollect = false
local colBtn = createBtn("АВТО-СБОР: OFF", UDim2.new(0.05, 0, 0.55, 0), function()
    autoCollect = not autoCollect
end)

-- ГЛАВНЫЙ ЦИКЛ ОБРАБОТКИ
task.spawn(function()
    while task.wait(0.1) do
        if autoCollect then
            colBtn.Text = "АВТО-СБОР: ON"
            colBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0) -- Зеленый при активации
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    local vName = v.Name:lower()
                    -- Собираем все мозги и ancient объекты
                    if vName:find("brain") or vName:find("ancient") then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
        else
            colBtn.Text = "АВТО-СБОР: OFF"
            colBtn.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        end
    end
end)
