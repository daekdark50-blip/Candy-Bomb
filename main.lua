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
Button.Position = UDim2.new(0.05, 0, 0.25, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 0, 255)
Button.Text = "ТОЛЬКО МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Button)

-- ФУНКЦИЯ ПОИСКА СКРЫТЫХ МИН
Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local count = 0

    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем мелкие объекты на чужих столах
        if v:IsA("BasePart") and v.Size.X < 5 then
            local dist = (v.Position - root.Position).Magnitude
            if dist > 15 and dist < 100 then
                
                -- ГЛАВНАЯ ПРОВЕРКА: ищем мину внутри конфеты
                local isMine = false
                for _, child in pairs(v:GetDescendants()) do
                    local cn = child.Name:lower()
                    if cn:find("mine") or cn:find("bomb") or cn:find("death") or cn:find("boom") or cn:find("explode") then
                        isMine = true
                        break
                    end
                end

                -- Если это мина — красим в РОЗОВЫЙ
                if isMine then
                    if not v:FindFirstChild("PinkMine") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "PinkMine"
                        h.FillColor = Color3.fromRGB(255, 0, 255)
                        h.OutlineColor = Color3.fromRGB(255, 255, 255)
                        h.FillOpacity = 0.8
                        count = count + 1
                    end
                end
            end
        end
    end
    Button.Text = "МИНЫ: " .. count
end)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
