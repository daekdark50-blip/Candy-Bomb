-- 1. ЗАГРУЗКА
local sg = Instance.new("ScreenGui", game.CoreGui)
local bg = Instance.new("Frame", sg)
bg.Size = UDim2.new(1, 0, 1, 0)
bg.BackgroundColor3 = Color3.new(0, 0, 0)
bg.ZIndex = 1000

local mainText = Instance.new("TextLabel", bg)
mainText.Size = UDim2.new(1, 0, 1, 0)
mainText.BackgroundTransparency = 1
mainText.Font = Enum.Font.GothamBold
mainText.TextSize = 60
mainText.TextColor3 = Color3.new(1, 1, 1)
mainText.Text = "Kick a lucky block\nDev: Starr Zero"

local function StartHub()
    if game.CoreGui:FindFirstChild("ToraStarrZeroHub") then game.CoreGui.ToraStarrZeroHub:Destroy() end
    local Hub = Instance.new("ScreenGui", game.CoreGui)
    Hub.Name = "ToraStarrZeroHub"

    local Main = Instance.new("Frame", Hub)
    Main.Size = UDim2.new(0, 240, 0, 220)
    Main.Position = UDim2.new(0.5, -120, 0.5, -110)
    Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Instance.new("UICorner", Main)
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(255, 0, 0)

    -- ШАПКА С ИМЕНЕМ РАЗРАБОТЧИКА
    local Header = Instance.new("Frame", Main)
    Header.Size = UDim2.new(1, 0, 0, 45)
    Header.BackgroundColor3 = Color3.fromRGB(80, 0, 0)
    Instance.new("UICorner", Header)

    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.Text = "Kick a lucky block\nBY STARR ZERO" -- Название и автор тут
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 14
    Title.BackgroundTransparency = 1

    -- ПЕРЕМЕЩЕНИЕ ХАБА
    local UIS = game:GetService("UserInputService")
    local dragToggle, dragStart, startPos
    Header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragToggle = true dragStart = input.Position startPos = Main.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function() dragToggle = false end)

    local function AddBtn(name, y, callback)
        local b = Instance.new("TextButton", Main)
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.Position = UDim2.new(0.05, 0, 0, y + 55)
        b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Text = name .. ": OFF"
        b.Font = Enum.Font.GothamBold
        Instance.new("UICorner", b)
        local active = false
        b.MouseButton1Click:Connect(function()
            active = not active
            b.Text = name .. ": " .. (active and "ON" or "OFF")
            b.BackgroundColor3 = active and Color3.fromRGB(200, 0, 0) or Color3.fromRGB(30, 30, 30)
            callback(active)
        end)
    end

    -- 4 ЧИСТЫЕ ФУНКЦИИ (БЕЗ ХИТБОКСА)
    AddBtn("GOD BASE VACUUM", 5, function(state)
        _G.GodVac = state
        task.spawn(function()
            while _G.GodVac do
                local char = game.Players.LocalPlayer.Character
                local hrp = char and char:FindFirstChild("HumanoidRootPart")
                if hrp then
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and v.Parent then
                            local name = v.Name:lower()
                            -- Ищем деньги, монеты и предметы на стендах
                            if name:find("coin") or name:find("brainrot") or name:find("pickup") or name:find("cash") or v:FindFirstChild("TouchInterest") then
                                if (v.Position - hrp.Position).Magnitude < 400 then
                                    v.CFrame = hrp.CFrame -- Тянем к себе
                                    firetouchinterest(hrp, v, 0)
                                    firetouchinterest(hrp, v, 1)
                                end
                            end
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end)

    AddBtn("AUTO SELL ALL", 45, function(state)
        _G.Sell = state
        task.spawn(function()
            local net = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Network"):WaitForChild("ref_B_SellAll")
            while _G.Sell do net:InvokeServer() task.wait(1.5) end
        end)
    end)

    AddBtn("AUTO UPGRADE", 85, function(state)
        _G.Upgr = state
        task.spawn(function()
            local net = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Network"):WaitForChild("rev_SPEED_UPGRADE")
            while _G.Upgr do net:FireServer() task.wait(0.7) end
        end)
    end)

    AddBtn("PERFECT KICK", 125, function(state)
        _G.Kick = state
        task.spawn(function()
            local net = game:GetService("ReplicatedStorage").Shared.Packages.Network
            while _G.Kick do
                local hrp = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    hrp.CFrame = workspace.Areas.KickReady.CFrame + Vector3.new(0, 4.5, 0)
                    net.rev_KickEvent:FireServer(1)
                    net.rev_KickZman:FireServer()
                end
                task.wait(0.4)
            end
        end)
    end)
end

-- СТАРТ
task.spawn(function()
    task.wait(0.2)
    for _, txt in pairs({"Kick a lucky block", "Developed by Starr Zero", "Enjoy Farming!"}) do
        mainText.Text = txt
        task.wait(0.5)
    end
    sg:Destroy()
    StartHub()
end)
