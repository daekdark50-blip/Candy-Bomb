-- ОЧИСТКА
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Main.Size = UDim2.new(0, 130, 0, 80)
Main.Position = UDim2.new(0.5, -65, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.5, 0)
Button.Position = UDim2.new(0.05, 0, 0.3, 0)
Button.Text = "ПОДСВЕТИТЬ ВСЁ"
Button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Button.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Button)

-- ФУНКЦИЯ СКАНЕРА (Ищет всё на столах)
Button.MouseButton1Click:Connect(function()
    local count = 0
    for _, v in pairs(workspace:GetDescendants()) do
        -- Если объект похож на конфету, мину или часть игрового поля
        if v:IsA("BasePart") and v.Transparency < 1 then
            local n = v.Name:lower()
            -- Расширенный список имен для этой игры
            if n:find("candy") or n:find("bomb") or n:find("tile") or n:find("part") or n:find("model") then
                -- Проверяем, что это не пол и не стена (по размеру)
                if v.Size.X < 5 and v.Size.Z < 5 then
                    local h = Instance.new("Highlight", v)
                    h.FillColor = Color3.fromRGB(255, 0, 0) -- КРАСНЫЙ ВХ
                    h.OutlineColor = Color3.fromRGB(255, 255, 255)
                    count = count + 1
                end
            end
        end
    end
    Button.Text = "НАЙДЕНО: "..count
end)
