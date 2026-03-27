-- УДАЛЯЕМ СТАРЬЕ
local old = game:GetService("CoreGui"):FindFirstChild("AncientGodGui")
if old then old:Destroy() end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "AncientGodGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Size = UDim2.new(0, 200, 0, 150)
Main.Position = UDim2.new(0.5, -100, 0.2, 0)
Main.Active = true
Main.Draggable = true

local function createBtn(text, pos, color, callback)
    local btn = Instance.new("TextButton", Main)
    btn.Size = UDim2.new(0.9, 0, 0.4, 0)
    btn.Position = pos
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.GothamBold
    btn.MouseButton1Click:Connect(callback)
    return btn
end

-- КНОПКА: ТЕЛЕПОРТ К САМОМУ ДАЛЬНЕМУ ANCIENT
createBtn("TP TO ANCIENT", UDim2.new(0.05, 0, 0.1, 0), Color3.fromRGB(120, 0, 255), function()
    local target = nil
    local maxZ = -math.huge
    
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Name:lower():find("ancient
                    
