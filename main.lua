-- DARKHUB: THE ULTIMATE VACUUM
local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Size = UDim2.new(0, 190, 0, 240)
Main.Position = UDim2.new(0.5, -95, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Flags = {og = false, divine = false, cash = false, upg = false, speed = false, reb = false}

local function CreateButton(name, y, key)
    local Btn = Instance.new("TextButton", Main)
    Btn.Size = UDim2.new(0.9, 0, 0.11, 0)
    Btn.Position = UDim2.new(0.05, 0, y, 0)
    Btn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    Btn.Text = name
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 12
    Instance.new("UICorner", Btn)

    Btn.MouseButton1Click:Connect(function()
        Flags[key] = not Flags[key]
        Btn.BackgroundColor3 = Flags[key] and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(35, 35, 35)
    end)
end

CreateButton("Auto OG", 0.18, "og")
CreateButton("Auto Divine", 0.30, "divine")
CreateButton("Collect Cash", 0.42, "cash")
CreateButton("Upgrade All", 0.54, "upg")
CreateButton("Buy Speed +10", 0.66, "speed")
CreateButton("Auto Rebirth", 0.78, "reb")

local Footer = Instance.new("TextLabel", Main)
Footer.Size = UDim2.new(1, 0, 0.1, 0)
Footer.Position = UDim2.new(0, 0, 0.9, 0)
Footer.Text = "DarkHub"
Footer.TextColor3 = Color3.fromRGB(200, 0, 0)
Footer.Font = Enum.Font.GothamBold
Footer.BackgroundTransparency = 1

-- СУПЕР-ЦИКЛ СБОРА
task.spawn(function()
    while task.wait(0.2) do
        pcall(function()
            local root = Player.Character.HumanoidRootPart
            
            -- Пылесосим всё, что имеет "TouchInterest" (то есть можно подобрать)
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("TouchTransmitter") then
                    local item = v.Parent
                    if item:IsA("BasePart") then
                        local name = item.Name:lower()
                        
                        -- Фильтруем по кнопкам
                        if (Flags.og and name:find("og")) or 
                           (Flags.divine and name:find("divine")) or 
                           (Flags.cash and (name:find("brain") or name:find("cash"))) then
                            
                            -- Вместо того чтобы лететь к ним, притягиваем ИХ к нам
                            item.CFrame = root.CFrame
                            -- Если это OG, то еще и телепортируем их в зону сдачи (по желанию)
                        end
                    end
                end
            end

            -- Серверные триггеры
            local remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
            if remotes then
                if Flags.upg then remotes.UpgradeAll:FireServer() end
                if Flags.speed then remotes.BuySpeed:FireServer() end
                if Flags.reb then remotes.Rebirth:FireServer() end
            end
        end)
    end
end)
