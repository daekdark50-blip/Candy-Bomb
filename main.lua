-- УДАЛЯЕМ СТАРЫЕ МЕНЮ
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name == "BrainrotFly" or v:FindFirstChild("Main")) then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BrainrotFly"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 190, 0, 160)
Main.Position = UDim2.new(0.5, -95, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local function createBtn(text, pos, color, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0.25, 0)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn)
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- 1. АВТО-КЛИКЕР (Накачка силы)
local clicking = false
local clickBtn = createBtn("АВТО-КЛИК: ВЫКЛ", UDim2.new(0.05, 0, 0.05, 0), Color3.fromRGB(40, 40, 40), function()
    clicking = not clicking
end)

-- 2. АВТО-СБОР (Притягивает мозги к тебе)
local farming = false
local farmBtn = createBtn("АВТО-СБОР: ВЫКЛ", UDim2.new(0.05, 0, 0.35, 0), Color3.fromRGB(40, 40, 40), function()
    farming = not farming
end)

-- 3. ТЕЛЕПОРТ НА ФИНИШ
createBtn("НА ФИНИШ (WIN)", UDim2.new(0.05, 0, 0.65, 0), Color3.fromRGB(0, 100, 200), function()
    local finish = workspace:FindFirstChild("Finish") or workspace:FindFirstChild("EndLine")
    if finish then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = finish.CFrame
    end
end)

-- ЛОГИКА РАБОТЫ
task.spawn(function()
    while task.wait(0.01) do
        -- Кликаем
        if clicking then
            local event = game:GetService("ReplicatedStorage"):FindFirstChild("ClickEvent") or game:GetService("ReplicatedStorage"):FindFirstChild("Events"):FindFirstChild("Click")
            if event then event:FireServer() end
            clickBtn.Text = "АВТО-КЛИК: ВКЛ"; clickBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        else
            clickBtn.Text = "АВТО-КЛИК: ВЫКЛ"; clickBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
        
        -- Собираем мозги
        if farming then
            for _, v in pairs(workspace:GetDescendants()) do
                if v.Name:lower():find("brain") or v.Name:lower():find("token") then
                    if v:IsA("BasePart") then
                        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                end
            end
            farmBtn.Text = "АВТО-СБОР: ВКЛ"; farmBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
        else
            farmBtn.Text = "АВТО-СБОР: ВЫКЛ"; farmBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end
    end
end)
