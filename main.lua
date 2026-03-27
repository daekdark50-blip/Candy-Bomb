local function Script()
    -- УДАЛЯЕМ СТАРЫЕ ГУИ
    local old = game:GetService("CoreGui"):FindFirstChild("DarkHub")
    if old then old:Destroy() end

    local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    ScreenGui.Name = "DarkHub"

    local Main = Instance.new("Frame", ScreenGui)
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Main.Size = UDim2.new(0, 200, 0, 250)
    Main.Position = UDim2.new(0.5, -100, 0.2, 0)
    Main.Active = true
    Main.Draggable = true

    local Title = Instance.new("TextLabel", Main)
    Title.Size = UDim2.new(1, 0, 0.15, 0)
    Title.Text = "FLY FOR BRAINROTS"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.GothamBold
    Title.BackgroundTransparency = 1
    Title.TextSize = 14

    local function createToggle(name, yPos, callback)
        local Label = Instance.new("TextLabel", Main)
        Label.Size = UDim2.new(0.7, 0, 0.1, 0)
        Label.Position = UDim2.new(0.05, 0, yPos, 0)
        Label.Text = name
        Label.TextColor3 = Color3.new(1, 1, 1)
        Label.Font = Enum.Font.GothamBold
        Label.BackgroundTransparency = 1
        Label.TextXAlignment = Enum.TextXAlignment.Left
        Label.TextSize = 12

        local Btn = Instance.new("TextButton", Main)
        Btn.Size = UDim2.new(0.12, 0, 0.1, 0)
        Btn.Position = UDim2.new(0.8, 0, yPos, 0)
        Btn.BackgroundColor3 = Color3.fromRGB(40,
            
