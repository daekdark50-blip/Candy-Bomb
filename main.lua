local Key = "STARZERO2"
local SG = Instance.new("ScreenGui", game:GetService("CoreGui"))
SG.Name = "StarZeroSystem"

local KeyFrame = Instance.new("Frame", SG)
KeyFrame.Size = UDim2.new(0, 300, 0, 250)
KeyFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
KeyFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
KeyFrame.Active = true
Instance.new("UICorner", KeyFrame)
local Stroke = Instance.new("UIStroke", KeyFrame)
Stroke.Color = Color3.fromRGB(255, 0, 0)
Stroke.Thickness = 2

local KeyTitle = Instance.new("TextLabel", KeyFrame)
KeyTitle.Size = UDim2.new(1, 0, 0, 40)
KeyTitle.Text = "STAR ZERO HUB | SYSTEM"
KeyTitle.TextColor3 = Color3.new(1, 1, 1)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 20
KeyTitle.BackgroundTransparency = 1

local LinkBtn = Instance.new("TextButton", KeyFrame)
LinkBtn.Size = UDim2.new(0, 260, 0, 30)
LinkBtn.Position = UDim2.new(0, 20, 0, 65)
LinkBtn.Text = "t.me/starzero_scripts"
LinkBtn.BackgroundColor3 = Color3.fromRGB(0, 100, 200)
LinkBtn.TextColor3 = Color3.new(1, 1, 1)
LinkBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", LinkBtn)
LinkBtn.MouseButton1Click:Connect(function() 
    setclipboard("https://t.me/starzero_scripts") 
    LinkBtn.Text = "COPIED!"
    task.wait(1)
    LinkBtn.Text = "t.me/starzero_scripts"
end)

local TextBox = Instance.new("TextBox", KeyFrame)
TextBox.Size = UDim2.new(0, 260, 0, 40)
TextBox.Position = UDim2.new(0, 20, 0, 110)
TextBox.PlaceholderText = "Enter Key..."
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TextBox)

local CheckBtn = Instance.new("TextButton", KeyFrame)
CheckBtn.Size = UDim2.new(0, 260, 0, 40)
CheckBtn.Position = UDim2.new(0, 20, 0, 160)
CheckBtn.Text = "CHECK KEY"
CheckBtn.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
CheckBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", CheckBtn)

local function makeDraggable(frame)
    local UIS = game:GetService("UserInputService")
    local dragStart, startPos, dragging
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end
makeDraggable(KeyFrame)

local function StartHub()
    local Hub = Instance.new("ScreenGui", game:GetService("CoreGui"))
    local Main = Instance.new("Frame", Hub)
    Main.Size = UDim2.new(0, 240, 0, 280)
    Main.Position = UDim2.new(0.5, -120, 0.5, -140)
    Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    Main.Active = true
    Instance.new("UICorner", Main)
    Instance.new("UIStroke", Main).Color = Color3.fromRGB(255, 0, 0)
    makeDraggable(Main)

    local Header = Instance.new("Frame", Main)
    Header.Size = UDim2.new(1, 0, 0, 40)
    Header.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
    Instance.new("UICorner", Header)
    local Title = Instance.new("TextLabel", Header)
    Title.Size = UDim2.new(1, 0, 1, 0)
    Title.Text = "STAR ZERO HUB"
    Title.TextColor3 = Color3.new(1, 1, 1)
    Title.Font = Enum.Font.GothamBold
    Title.BackgroundTransparency = 1

    local function AddBtn(name, y, callback)
        local b = Instance.new("TextButton", Main)
        b.Size = UDim2.new(0.9, 0, 0, 35)
        b.Position = UDim2.new(0.05, 0, 0, y + 45)
        b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        b.TextColor3 = Color3.new(1, 1, 1)
        b.Text = name .. ": OFF"
        Instance.new("UICorner", b)
        local active = false
        b.MouseButton1Click:Connect(function()
            active = not active
            b.Text = name .. ": " .. (active and "ON" or "OFF")
            b.BackgroundColor3 = active and Color3.fromRGB(150, 0, 0) or Color3.fromRGB(25, 25, 25)
            callback(active)
        end)
    end

    AddBtn("GOD BASE VACUUM", 5, function(state)
        _G.GodVac = state
        task.spawn(function()
            while _G.GodVac do
                pcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    for _, v in pairs(workspace:GetDescendants()) do
                        if v:IsA("BasePart") and (v.Name:lower():find("coin") or v:FindFirstChild("TouchInterest")) then
                            v.CFrame = hrp.CFrame
                        end
                    end
                end)
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
                pcall(function()
                    local hrp = game.Players.LocalPlayer.Character.HumanoidRootPart
                    hrp.CFrame = workspace.Areas.KickReady.CFrame + Vector3.new(0, 4.5, 0)
                    net.rev_KickEvent:FireServer(1)
                    net.rev_KickZman:FireServer()
                end)
                task.wait(1.2) -- ИЗМЕНЕНО: Задержка для защиты от кика
            end
        end)
    end)
    AddBtn("FAST CLICK 2X", 165, function(state)
        _G.FastClick = state
        task.spawn(function()
            while _G.FastClick do
                local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
                if tool then tool:Activate() end
                task.wait(0.01)
            end
        end)
    end)
end

CheckBtn.MouseButton1Click:Connect(function()
    if TextBox.Text == Key then
        SG:Destroy()
        StartHub()
    else
        CheckBtn.Text = "WRONG!"
        task.wait(1)
        CheckBtn.Text = "CHECK KEY"
    end
end)
