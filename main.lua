--[[ 
    DARKHUB v2 - CLONE OF TORAHUB 
    FIXED: AUTO ANCIENT, OG, DIVINE, CASH, DROP
]]

local Player = game.Players.LocalPlayer
local Root = Player.Character:WaitForChild("HumanoidRootPart")
local CoreGui = game:GetService("CoreGui")

-- Очистка старого интерфейса
if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Size = UDim2.new(0, 200, 0, 280)
Main.Position = UDim2.new(0.5, -100, 0.3, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 6)

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
        Btn.BackgroundColor3 = Flags[key] and Color3.fromRGB(180, 0, 0) or Color3.fromRGB(30, 30, 30)
        if Flags[key] then BasePos = Root.CFrame end
    end)
end

-- Кнопки в порядке как у Торы
CreateToggle("AUTO ANCIENT (NEW)", 0.08, "ancient")
CreateToggle("Auto OG", 0.20, "og")
CreateToggle("Auto Divine", 0.32, "divine")
CreateToggle("Collect Cash", 0.44, "cash")
CreateToggle("Upgrade All", 0.56, "upg")
CreateToggle("Buy Speed +10", 0.68, "speed")
CreateToggle("Auto Rebirth", 0.80, "reb")

local Footer = Instance.new("TextLabel", Main)
Footer.Size = UDim2.new(1, 0, 0.1, 0)
Footer.Position = UDim2.new(0, 0, 0.9, 0)
Footer.Text = "DarkHub"
Footer.TextColor3 = Color3.fromRGB(180, 0, 0)
Footer.Font = Enum.Font.GothamBold
Footer.BackgroundTransparency = 1

-- СУПЕР-СКОРОСТНАЯ ЛОГИКА
task.spawn(function()
    while task.wait() do -- Без задержки (максимум Delta)
        pcall(function()
            local events = game:GetService("ReplicatedStorage"):FindFirstChild("Events")
            
            -- Функция мгновенного забора
            local function Grab(target)
                if target and target:IsA("BasePart") then
                    Root.CFrame = target.CFrame
                    task.wait(0.05)
                    -- Эмулируем "E" или Drop, если нужно
                    if events:FindFirstChild("Drop") then
                        events.Drop:FireServer()
                    end
                    if BasePos then Root.CFrame = BasePos end
                end
            end

            -- Приоритетный поиск
            local found = false
            for _, item in pairs(workspace:GetDescendants()) do
                if item:IsA("BasePart") and item.Transparency ~= 1 then
                    local n = item.Name:lower()
                    if Flags.ancient and n:find("ancient") then
                        Grab(item) found = true break
                    elseif Flags.og and n:find("og") then
                        Grab(item) found = true break
                    elseif Flags.divine and n:find("divine") then
                        Grab(item) found = true break
                    end
                end
            end

            -- Магнит для денег
            if Flags.
                        
