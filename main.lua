-- УДАЛЯЕМ СТАРЫЕ МЕНЮ
for _, v in pairs(game:GetService("CoreGui"):GetChildren()) do
    if v:IsA("ScreenGui") and (v.Name == "BrainrotFly" or v:FindFirstChild("Main")) then
        v:Destroy()
    end
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "BrainrotFly"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 190, 0, 160)
Main.Position = UDim2.new(0.5, -95, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local function createBtn(text, pos, color, callback)
    local btn = Instance.new("
        
