-- УДАЛЯЕМ ВСЁ СТАРОЕ
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name == "BlackSpyGui" or v:FindFirstChild("Main")) then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BlackSpyGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 160, 0, 90)
Main.Position = UDim2.new(0.5, -80, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.6, 0)
Button.Position = UDim2.new(0.05, 0, 0.2, 0)
Button.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Button.Text = "ВЗЛОМ: 3 МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

Button.MouseButton1Click:Connect(function()
    local found = 0
    -- Ищем ЛЮБЫЕ детали на высоте стола, которые не просто пустые плитки
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Position.Y > 3 and v.Position.Y < 8 then
            -- Если внутри плитки есть хоть что-то лишнее (метка сервера)
            if #v:GetChildren() > 0 or v.Transparency > 0 then
                if not v:FindFirstChild("BlackHighlight") then
                    local h = Instance.new("Highlight", v)
                    h.Name = "BlackHighlight"
                    h.FillColor = Color3.fromRGB(0, 0, 0) -- ЧЕРНЫЙ
                    h.OutlineColor = Color3.fromRGB(255, 255, 255)
                    h.FillOpacity = 0.8
                    found = found + 1
                end
            end
        end
    end
    Button.Text = "ЦЕЛЕЙ: " .. found
end)
