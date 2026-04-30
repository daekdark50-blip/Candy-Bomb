local Key = "STARZERO2"
local SG = Instance.new("ScreenGui", game.CoreGui)

-- 1. СИСТЕМА КЛЮЧА
local KeyFrame = Instance.new("Frame", SG)
KeyFrame.Size = UDim2.new(0, 300, 0, 200)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyFrame.BorderSizePixel = 0
Instance.new("UICorner", KeyFrame)
local Stroke = Instance.new("UIStroke", KeyFrame)
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 2

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Text = "STAR ZERO SYSTEM"
KeyTitle.TextColor3 = Color3.new(1, 1, 1)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.BackgroundTransparency = 1
KeyTitle.TextSize = 18

local TextBox = Instance.new("TextBox", KeyFrame)
TextBox.Size = UDim2.new(0, 260, 0, 40)
TextBox.Position = UDim2.new(0, 20, 0, 50)
TextBox.PlaceholderText = "Enter Key Here..."
TextBox.Text = ""
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextBox)

local CheckBtn = Instance.new("TextButton", KeyFrame)
CheckBtn.Size = UDim2.new(0, 260, 0, 40)
CheckBtn.Position = UDim2.new(0, 20, 0, 100)
CheckBtn.Text = "CHECK KEY"
CheckBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CheckBtn.TextColor3 = Color3.new(1, 1, 1)
CheckBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", CheckBtn)

local TgBtn = Instance.new("TextButton", KeyFrame)
TgBtn.Size = UDim2.new(0, 260, 0, 30)
TgBtn.Position = UDim2.new(0, 20, 0, 150)
TgBtn.Text = "COPY TELEGRAM"
TgBtn.BackgroundColor3 = Color3.fromRGB(0, 80, 150)
TgBtn.TextColor3 = Color3.new(1, 1, 1)
TgBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", TgBtn)
TgBtn.MouseButton1Click:Connect(function() setclipboard("https://t.me/starzero_scripts") end)

-- 2. ФУНКЦИЯ ТВОЕГО ХАБА
local function StartHub()
    local Hub = Instance.new("ScreenGui", game.CoreGui)
    Hub.Name = "ToraStarrZeroHub"
    local Main = Instance.new("Frame", Hub)
    Main.Size = UDim2.new(0, 240, 0, 220)
    Main.Position = UDim2.new(0.5, -120, 0.5, -110)
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", Main)
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(255, 0, 0)
    local Header = Instance.new("Frame", Main)
    Header.Size = UDim2.new(1, 0, 0, 45)
    Header.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    Instance.new("UICorner", Header)
    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.Text = "Kick a lucky block\nBY STARR ZERO"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.BackgroundTransparency = 1
    
    local function AddBtn(name, y, callback)
        local b = Instance.new("TextButton", Main)
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.Position = UDim2.new(0.05, 0, 0, y + 55)
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Text = name .. ": OFF"
        b.Font = Enum.Font.GothamBold
        Instance.new("UICorner", b)
        local active = false
        b.MouseButton1
        
