-- ОЧИСТКА СТАРЫХ ГЛЮКОВ
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "DarkCreatorGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Size = UDim2.new(0, 130, 0, 85)
Main.Position = UDim2.new(0.5, -65, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.5, 0)
Button.Position = UDim2.new(0.05, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 105, 180) -- РОЗОВЫЙ ЦВЕТ КНОПКИ
Button.Text = "РОЗОВЫЙ ВХ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

-- СКАНЕР РОЗОВЫХ МИН
Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitFor
        
