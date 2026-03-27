-- DARKHUB V5: TORA IS ME CLONE (CHECKBOXES + ANCIENT)
local Player = game.Players.LocalPlayer
local CoreGui = game:GetService("CoreGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Удаление старого меню
if CoreGui:FindFirstChild("DarkHub") then CoreGui.DarkHub:Destroy() end

local ScreenGui = Instance.new("ScreenGui", CoreGui)
ScreenGui.Name = "DarkHub"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
Main.Size = UDim2.new(0, 210, 0, 300)
Main.Position = UDim2.new(0.5, -105, 0.3, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Text = "FLY FOR BRAINROTS"
Title.TextColor3 = Color3.new(1, 1, 1)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.BackgroundTransparency = 1

local Flags = {ancient = false, og = false, divine = false, cash = false, upg = false, speed = false, reb = false}
local BasePos = nil

-- ФУНКЦИЯ СОЗДАНИЯ ГАЛОЧЕК (КАК У ТОРА)
local function CreateToggle(name, y, key)
    local Label = Instance.new("TextLabel", Main)
    Label.Size = UDim2.new(0.7, 0, 0, 25)
    Label.Position = UDim2.new(0.05, 0, 0, y)
    Label.Text = name
    Label.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.BackgroundTransparency = 1

    local Box = Instance.new("TextButton", Main)
    Box.Size = UDim2.new(0, 20, 0, 20)
    Box.Position = UDim2.new(0.85, 0, 0, y + 2)
    Box.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    Box.Text = ""
    Instance.new("UICorner", Box).CornerRadius = UDim.new(0, 4)

    local Check = Instance.new("TextLabel", Box)
    Check.Size = UDim2.new(1, 0, 1, 0)
    Check.Text = "✓"
    Check.TextColor3 = Color3.new(1, 1, 1)
    Check.Visible = false
    Check.BackgroundTransparency = 1
    Check.Font = Enum.Font.GothamBold

    Box.MouseButton1Click:Connect(function()
        Flags[key] = not Flags[key]
        Check.Visible = Flags[key]
        Box.BackgroundColor3 = Flags[key] and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(40, 40, 40)
        
        if Flags[key] and (key == "ancient" or key == "og" or key == "divine") then
            BasePos = Player.Character.HumanoidRootPart.CFrame
        end
    end)
end

-- Список функций с галочками
CreateToggle("Auto Ancient", 40, "ancient")
CreateToggle("Auto OG", 70, "og")
CreateToggle("Auto Divine", 100, "divine")
CreateToggle("Collect Cash", 130, "cash")
CreateToggle("Upgrade All", 160, "upg")
CreateToggle("Buy Speed +10", 190, "speed")
CreateToggle("Auto Rebirth", 220, "reb")

local Footer = Instance.new("TextLabel", Main)
Footer.Size = UDim2.new(1, 0, 0, 25)
Footer.Position = UDim2.new(0, 0, 1, -25)
Footer.Text = "DarkHub: Tora IsMe"
Footer.TextColor3 = Color3.fromRGB(200, 0, 0)
Footer.Font = Enum.Font.GothamBold
Footer.TextSize = 12
Footer.BackgroundTransparency = 1

-- ДВИЖОК ФАРМА
task.spawn(function()
    while task.wait(0.01) do
        pcall(function()
            local root = Player.Character.HumanoidRootPart
            local events = ReplicatedStorage:FindFirstChild("Events")

            -- ФАРМ ТЕЛЕПОРТОМ (Ancient -> OG -> Divine)
            for _, v in pairs(workspace:GetDescendants()) do
                if v:IsA("BasePart") and v.Transparency ~= 1 then
                    local n = v.Name:lower()
                    if (Flags.ancient and n:find("ancient")) or 
                       (
                                    
