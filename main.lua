-- DARKHUB: AUTO-TELEPORT & COLLECT SYSTEM
local Player = game.Players.LocalPlayer
local Root = Player.Character:WaitForChild("HumanoidRootPart")
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

local Settings = {og = false, divine = false, cash = false}

local function AddToggle(name, y, key)
    local Btn = Instance.new("TextButton", Main)
    Btn.Size = UDim2.new(0.9, 0, 0.1, 0)
    Btn.Position = UDim2.new(0.05, 0, y, 0)
    Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    Btn.Text = name
    Btn.TextColor3 = Color3.new(1, 1, 1)
    Btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", Btn)
    
    Btn.MouseButton1Click:Connect(function()
        Settings[key] = not Settings[key]
        Btn.BackgroundColor3 = Settings[key] and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(45, 45, 45)
    end)
end

AddToggle("AUTO OG (TP + BASE)", 0.2, "og")
AddToggle("Auto Divine", 0.32, "divine")
AddToggle("Collect Cash", 0.44, "cash")

local Footer = Instance.new("TextLabel", Main)
Footer.Size = UDim2.new(1, 0, 0.1, 0)
Footer.Position = UDim2.new(0, 0, 0.9, 0)
Footer.Text = "DarkHub"
Footer.TextColor3 = Color3.fromRGB(200, 0, 0)
Footer.Font = Enum.Font.GothamBold
Footer.BackgroundTransparency = 1

-- ЛОГИКА АВТО-ТЕЛЕПОРТА К OG И НА БАЗУ
task.spawn(function()
    while task.wait(0.1) do
        if Settings.og then
            local target = nil
            -- Ищем OG Brainrot на карте
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Name:lower():find("og") then
                    target = v
                    break
                end
            end

            if target then
                -- 1. ТП к бренроту
                Root.CFrame = target.CFrame
                task.wait(0.2) -- Время на подбор
                
                -- 2. ТП на базу (Спавн)
                -- Если база в другом месте, заменим Vector3.new(0, 10, 0) на нужные координаты
                Root.CFrame = CFrame.new(0, 20, 0) 
                task.wait(0.1)
            end
        end
        
        -- Обычный сбор для Cash и Divine (без ТП на базу, просто притяжение)
        if Settings.cash or Settings.divine then
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") then
                    local n = v.Name:lower()
                    if (Settings.cash and n:find("brain")) or (Settings.divine and n:find("divine")) then
                        v.CFrame = Root.CFrame
                    end
                end
            end
        end
    end
end)
