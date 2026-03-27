-- DARKHUB V4: ULTIMATE TORA CLONE (INSTANT EQUIP + DROP)
local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Size = UDim2.new(0, 190, 0, 280)
Main.Position = UDim2.new(0.5, -95, 0.3, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Flags = {ancient=false, og=false, divine=false, cash=false, upg=false, speed=false, reb=false}
local BasePos = nil

local function CreateToggle(name, y, key)
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
        if Flags[key] then 
            BasePos = Player.Character.HumanoidRootPart.CFrame 
        end
    end)
end

-- Кнопки (Очередность как на видео)
CreateToggle("AUTO ANCIENT", 0.08, "ancient")
CreateToggle("AUTO OG", 0.20, "og")
CreateToggle("AUTO DIVINE", 0.32, "divine")
CreateToggle("COLLECT CASH", 0.44, "cash")
CreateToggle("UPGRADE ALL", 0.56, "upg")
CreateToggle("BUY SPEED +10", 0.68, "speed")
CreateToggle("AUTO REBIRTH", 0.80, "reb")

-- ГЛАВНЫЙ ФАРМЕР
task.spawn(function()
    while task.wait(0.01) do
        pcall(function()
            local char = Player.Character
            local root = char.HumanoidRootPart
            local events = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
            
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency ~= 1 then
                    local n = v.Name:lower()
                    
                    -- Проверка флагов (Ancient, OG, Divine)
                    if (Flags.ancient and n:find("ancient")) or 
                       (Flags.og and n:find("og")) or 
                       (Flags.divine and n:find("divine")) then
                        
                        -- 1. МГНОВЕННЫЙ ТП К ОБЪЕКТУ
                        root.CFrame = v.CFrame
                        
                        -- 2. ПРИНУДИТЕЛЬНОЕ КАСАНИЕ (Чтобы он взялся в руки)
                        firetouchinterest(root, v, 0)
                        firetouchinterest(root, v, 1)
                        
                        task.wait(0.05)
                        
                        -- 3. ТП НА БАЗУ И СБРОС
                        if BasePos then
                            root.CFrame = BasePos
                            task.wait(0.05)
                            -- Нажимаем "Drop" через сервер, как это делает Тора
                            if events:FindFirstChild("Drop") then
                                events.Drop:FireServer()
                            end
                        end
                        break
                    end
                end
            end
            
            -- Авто-кликеры и апгрейды
            if events then
                if Flags.upg then events.UpgradeAll:FireServer() end
                if Flags.speed then events.BuySpeed:FireServer() end
                if Flags.reb then events.Rebirth:FireServer() end
            end
        end)
    end
end)
