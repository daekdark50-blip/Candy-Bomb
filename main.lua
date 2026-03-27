-- ОЧИСТКА ОТ СТАРЫХ МЕНЮ
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "DarkCreatorGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Main.Size = UDim2.new(0, 130, 0, 80)
Main.Position = UDim2.new(0.5, -65, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.5, 0)
Button.Position = UDim2.new(0.05, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(180, 0, 0)
Button.Text = "ВИДЕТЬ МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextSize = 13
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

-- СКАНЕР СМЕРТЕЛЬНЫХ КОНФЕТ
Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local minesCount = 0

    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and v.Transparency < 1 then
            local n = v.Name:lower()
            -- Ищем всё, что может забирать ЖИЗНЬ
            if n:find("mine") or n:find("bomb") or n:find("trap") or n:find("death") or n:find("danger") or n:find("bad") then
                -- ПРОВЕРКА РАССТОЯНИЯ: только столы противников (дальше 15 метров)
                local dist = (v.Position - root.Position).Magnitude
                if dist > 15 then
                    if not v:FindFirstChild("LifeStealerHighlight") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "LifeStealerHighlight"
                        h.FillColor = Color3.fromRGB(255, 0, 0) -- Ярко-красный
                        h.OutlineColor = Color3.fromRGB(255, 255, 255) -- Белый контур
                        h.FillOpacity = 0.7
                        minesCount = minesCount + 1
                    end
                end
            end
        end
    end
    Button.Text = "МИН: " .. minesCount
end)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
Close.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Close).CornerRadius = UDim.new(1, 0)
Close.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)
