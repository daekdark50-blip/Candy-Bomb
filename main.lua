-- DARKHUB: THE ANCIENT UPDATE (GOD SPEED)
local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 190, 0, 270) -- Чуть увеличил для новой кнопки
Main.Position = UDim2.new(0.5, -95, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Flags = {ancient = false, og = false, divine = false, cash = false, upg = false, speed = false, reb = false}
local BasePos = CFrame.new(0, 20, 0) -- Стандартный спавн (заменится при нажатии)

local function CreateButton(name, y, key)
    local Btn = Instance.new("TextButton", Main)
    Btn.Size = UDim2.new(0.9, 0, 0.1, 0)
    Btn.Position = UDim2.new(0.05, 0, y, 0)
    Btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    Btn.Text = name
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 11
    Instance.new("UICorner", Btn)

    Btn.MouseButton1Click:Connect(function()
        Flags[key] = not Flags[key]
        Btn.BackgroundColor3 = Flags[key] and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(30, 30, 30)
        -- Запоминаем базу в момент включения любого ТП-фарма
        if Flags[key] and (key == "ancient" or key == "og") then
            BasePos = Player.Character.HumanoidRootPart.CFrame
        end
    end)
end

-- КНОПКИ (КАК У ТОРА + ANCIENT)
CreateButton("Auto Ancient (NEW)", 0.12, "ancient")
CreateButton("Auto OG", 0.24, "og")
CreateButton("Auto Divine", 0.36, "divine")
CreateButton("Collect Cash", 0.48, "cash")
CreateButton("Upgrade All", 0.60, "upg")
CreateButton("Buy Speed +10", 0.72, "speed")
CreateButton("Auto Rebirth", 0.84, "reb")

local Footer = Instance.new("TextLabel", Main)
Footer.Size = UDim2.new(1, 0, 0.08, 0)
Footer.Position = UDim2.new(0, 0, 0.92, 0)
Footer.Text = "DarkHub (Ancient Edition)"
Footer.TextColor3 = Color3.fromRGB(200, 0, 0)
Footer.Font = Enum.Font.GothamBold
Footer.BackgroundTransparency = 1

-- СКОРОСТНОЙ ЦИКЛ СБОРА
task.spawn(function()
    while task.wait(0.05) do -- Максимальная скорость
        pcall(function()
            local root = Player.Character.HumanoidRootPart
            local foundTarget = nil

            -- Ищем цель по приоритету: Ancient -> OG -> Divine
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency ~= 1 then
                    local n = v.Name:lower()
                    if (Flags.ancient and n:find("ancient")) then
                        foundTarget = v break
                    elseif (Flags.og and n:find("og")) then
                        foundTarget = v break
                    elseif (Flags.divine and n:find("divine")) then
                        foundTarget = v break
                    end
                end
            end

            -- Телепорт-маневр
            if foundTarget and root then
                root.CFrame = foundTarget.CFrame
                task.wait(0.1) -- Задержка на подбор
                root.CFrame = BasePos
            end

            -- Обычный магнит для Cash
            if Flags.cash then
                for _, v in pairs(workspace:GetDescendants()) do
                    if v:IsA("BasePart") and v.Name:lower():find("brain") then
                        v.CFrame = root.CFrame
                    end
                end
            end

            -- Авто-кликеры
            local ev = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
            if ev then
                if Flags.upg then ev.UpgradeAll:FireServer() end
                if Flags.speed then ev.BuySpeed:FireServer() end
                if Flags.reb then ev.Rebirth:FireServer() end
            end
        end)
    end
end)
