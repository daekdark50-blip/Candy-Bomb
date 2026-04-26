-- 1. ЛОАДЕР (ПОЛОСКА ЗАГРУЗКИ)
local sg = Instance.new("ScreenGui", game.CoreGui)
local loadFrame = Instance.new("Frame", sg)
loadFrame.Size = UDim2.new(0, 280, 0, 90)
loadFrame.Position = UDim2.new(0.5, -140, 0.5, -45)
loadFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", loadFrame)
Instance.new("UIStroke", loadFrame).Color = Color3.fromRGB(255, 0, 0)

local loadText = Instance.new("TextLabel", loadFrame)
loadText.Size = UDim2.new(1, 0, 0, 40)
loadText.Text = "STARR ZERO HUB"
loadText.TextColor3 = Color3.new(1, 1, 1)
loadText.Font = Enum.Font.GothamBold
loadText.BackgroundTransparency = 1

local barBg = Instance.new("Frame", loadFrame)
barBg.Size = UDim2.new(0.8, 0, 0, 8)
barBg.Position = UDim2.new(0.1, 0, 0.7, 0)
barBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local bar = Instance.new("Frame", barBg)
bar.Size = UDim2.new(0, 0, 1, 0)
bar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)

-- Анимация загрузки
task.spawn(function()
    for i = 1, 100 do
        bar.Size = UDim2.new(i/100, 0, 1, 0)
        loadText.Text = "Loading: " .. i .. "%"
        task.wait(0.01)
    end
    loadText.Text = "Done!"
    task.wait(0.5)
    sg:Destroy()
    StartFarm() -- Запуск самой фермы
end)

-- 2. САМА ФЕРМА (БЕЗ ЛИШНИХ ВКЛАДОК)
function StartFarm()
    local Hub = Instance.new("ScreenGui", game.CoreGui)
    local Main = Instance.new("Frame", Hub)
    Main.Size = UDim2.new(0, 220, 0, 200)
    Main.Position = UDim2.new(0.5, -110, 0.5, -100)
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", Main)
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(255, 0, 0)

    local Header = Instance.new("Frame", Main)
    Header.Size = UDim2.new(1, 0, 0, 35)
    Header.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    Instance.new("UICorner", Header)

    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.Text = "KICK BLOCK | BY STARR ZERO"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 12
    Title.BackgroundTransparency = 1

    local function AddBtn(name, y, callback)
        local b = Instance.new("TextButton", Main)
        b.Size = UDim2.new(0.9, 0, 0, 32)
        b.Position = UDim2.new(0.05, 0, 0, y + 45)
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Text = name .. ": OFF"
        b.Font = Enum.Font.GothamBold
        Instance.new("UICorner", b)
        local act = false
        b.MouseButton1Click:Connect(function()
            act = not act
            b.Text = name .. ": " .. (act and "ON" or "OFF")
            b.BackgroundColor3 = act and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(30, 30, 30)
            callback(act)
        end)
    end

    -- Твои рабочие функции
    AddBtn("GOD VACUUM", 5, function(s)
        _G.GV = s
        task.spawn(function()
            while _G.GV do
                local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and (v.Name:lower():find("coin") or v.Name:lower():find("pickup") or v.Name:lower():find("brainrot")) then
                            v.CFrame = hrp.CFrame
                            firetouchinterest(hrp, v, 0)
                            firetouchinterest(hrp, v, 1)
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end)

    AddBtn("AUTO UPGRADE", 45, function(s)
        _G.UG = s
        task.spawn(function()
            local net = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Network"):WaitForChild("rev_SPEED_UPGRADE")
            while _G.UG do net:FireServer() task.wait(0.7) end
        end)
    end)

    AddBtn("AUTO SELL", 85, function(s)
        _G.AS = s
        task.spawn(function()
            local net = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Network"):WaitForChild("ref_B_SellAll")
            while _G.AS do net:InvokeServer() task.wait(2) end
        end)
    end)

    -- Перетаскивание
    local dragToggle, dragStart, startPos
    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true dragStart = input.Position startPos = Main.Position
        end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    game:GetService("UserInputService").InputEnded:Connect(function() dragToggle = false end)
end
