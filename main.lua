local Key = "STARZERO2"
local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
SG.Name = "BaseSystem_" .. math.random(100, 999)

local KeyFrame = Instance.new("Frame", SG)
KeyFrame.Size = UDim2.new(0, 300, 0, 250)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
KeyFrame.Active = true
Instance.new("UICorner", KeyFrame)

local TextBox = Instance.new("TextBox", KeyFrame)
TextBox.Size = UDim2.new(0, 260, 0, 40)
TextBox.Position = UDim2.new(0, 20, 0, 110)
TextBox.PlaceholderText = "Authentication..."
TextBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
TextBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextBox)

local CheckBtn = Instance.new("TextButton", KeyFrame)
CheckBtn.Size = UDim2.new(0, 260, 0, 40)
CheckBtn.Position = UDim2.new(0, 20, 0, 160)
CheckBtn.Text = "LOGIN"
CheckBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
CheckBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", CheckBtn)

local function StartHub()
    local Hub = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local Main = Instance.new("Frame", Hub)
    Main.Size = UDim2.new(0, 240, 0, 280)
    Main.Position = UDim2.new(0.5, -120, 0.5, -140)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Instance.new("UICorner", Main)

    local function AddBtn(name, y, callback)
        local b = Instance.new("TextButton", Main)
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.Position = UDim2.new(0.05, 0, 0, y + 45)
        b.Text = name .. ": OFF"
        b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        b.TextColor3 = Color3.new(1, 1, 1)
        Instance.new("UICorner", b)
        local active = false
        b.MouseButton1Click:Connect(function()
            active = not active
            b.Text = name .. ": " .. (active and "ON" or "OFF")
            callback(active)
        end)
    end

    -- ПЕРЕИМЕНОВАННЫЕ ФУНКЦИИ
    AddBtn("Data Collect", 5, function(state)
        _G.V1 = state
        task.spawn(function()
            while _G.V1 do
                pcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and (v.Name:lower():find("coin") or v:FindFirstChild("TouchInterest")) then
                            v.CFrame = hrp.CFrame
                        end
                    end
                end)
                task.wait(0.2)
            end
        end)
    end)

    AddBtn("Buffer Process", 45, function(state)
        _G.V2 = state
        task.spawn(function()
            local r = game:GetService("ReplicatedStorage"):WaitForChild("Shared"):WaitForChild("Packages"):WaitForChild("Network"):WaitForChild("ref_B_SellAll")
            while _G.V2 do r:InvokeServer() task.wait(2) end
        end)
    end)

    -- ЭТО БЫВШИЙ PERFECT KICK
    AddBtn("Physics Sync", 125, function(state)
        _G.V3 = state
        task.spawn(function()
            local n = game:GetService("ReplicatedStorage").Shared.Packages.Network
            while _G.V3 do
                pcall(function()
                    local h = game.Players.LocalPlayer.Character.HumanoidRootPart
                    h.CFrame = workspace.Areas.KickReady.CFrame + Vector3.new(0, 3.2, 0)
                    n.rev_KickEvent:FireServer(1)
                    n.rev_KickZman:FireServer()
                end)
                -- РАНДОМНАЯ ЗАДЕРЖКА (от 1.3 до 1.9 сек)
                task.wait(math.random(13, 19) / 10)
            end
        end)
    end)
end

CheckBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == Key then
        SG:Destroy()
        StartHub()
    end
end)
