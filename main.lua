-- ПОЛНАЯ ОЧИСТКА
if game:GetService("CoreGui"):FindFirstChild("DarkCreatorGui") then
    game:GetService("CoreGui").DarkCreatorGui:Destroy()
end

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "DarkCreatorGui"

local Main = Instance.new("Frame", ScreenGui)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Size = UDim2.new(0, 140, 0, 90)
Main.Position = UDim2.new(0.5, -70, 0.2, 0)
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Button = Instance.new("TextButton", Main)
Button.Size = UDim2.new(0.9, 0, 0.5, 0)
Button.Position = UDim2.new(0.05, 0, 0.3, 0)
Button.BackgroundColor3 = Color3.fromRGB(255, 20, 147) -- ЯРКО-РОЗОВЫЙ
Button.Text = "ВИДЕТЬ МИНЫ"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Font = Enum.Font.GothamBold
Instance.new("UICorner", Button)

-- ФУНКЦИЯ "ГЛАЗ ШПИОНА"
Button.MouseButton1Click:Connect(function()
    local lp = game.Players.LocalPlayer
    local char = lp.Character or lp.CharacterAdded:Wait()
    local root = char:WaitForChild("HumanoidRootPart")
    local found = 0

    -- Ищем по всей карте
    for _, v in pairs(workspace:GetDescendants()) do
        -- Ищем только мелкие части на чужих столах (дальше 15 метров от тебя)
        if v:IsA("BasePart") and v.Size.X < 5 then
            local dist = (v.Position - root.Position).Magnitude
            if dist > 15 and dist < 120 then
                
                local isMine = false
                
                -- ПРОВЕРКА 1: Имена (Mine, Bomb, Trap, Danger)
                local n = v.Name:lower()
                if n:find("mine") or n:find("bomb") or n:find("trap") or n:find("danger") then isMine = true end
                
                -- ПРОВЕРКА 2: Скрытые объекты внутри конфеты
                if not isMine then
                    for _, child in pairs(v:GetChildren()) do
                        if child.Name:lower():find("mine") or child.Name:lower():find("bomb") or child:IsA("ValueBase") then
                            isMine = true; break
                        end
                    end
                end
                
                -- ПРОВЕРКА 3: Если объект почти невидимый (иногда мины прячут так)
                if not isMine and v.Transparency > 0.1 and v.Transparency < 1 then
                    isMine = true
                end

                -- КРАСИМ В РОЗОВЫЙ, ЕСЛИ ЭТО МИНА
                if isMine then
                    if not v:FindFirstChild("SpyPink") then
                        local h = Instance.new("Highlight", v)
                        h.Name = "SpyPink"
                        h.FillColor = Color3.fromRGB(255, 0, 255) -- РОЗОВЫЙ
                        h.OutlineColor = Color3.fromRGB(255, 255, 255)
                        h.FillOpacity = 0.8
                        found = found + 1
                    end
                end
            end
        end
    end
    Button.Text = "МИН НАЙДЕНО: "..found
end)

local Close = Instance.new("TextButton", Main)
Close.Size = UDim2.new(0, 20, 0, 20)
Close.Position = UDim2.new(0.85, -5, 0, 5)
Close.Text = "X"
Close.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
