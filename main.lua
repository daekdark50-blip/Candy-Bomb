-- [[ DARK HUB V3 | ADVANCED STALKER EDITION ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Clean old GUIs
if CoreGui:FindFirstChild("DarkHubV3") then CoreGui.DarkHubV3:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "DarkHubV3"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ TOGGLE BUTTON (PLUS) ]] --
local Toggle = Instance.new("TextButton")
Toggle.Parent = Gui
Toggle.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.Font = Enum.Font.GothamBold
Toggle.ZIndex = 500
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- ===============================================
-- [ ГЛАВНОЕ ОКНО DARK HUB (ОСНОВНЫЕ ФУНКЦИИ) ]
-- ===============================================
local Main = Instance.new("Frame")
Main.Parent = Gui
Main.Size = UDim2.new(0, 240, 0, 280)
Main.Position = UDim2.new(0.5, -120, 0.5, -140)
Main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

-- Title
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundColor3 = Color3.fromRGB(30, 0, 0)
Title.Text = "DARK HUB | MAIN"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 16
Instance.new("UICorner", Title)

-- Scrolling Container
local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = Main
Scroll.Size = UDim2.new(1, -20, 1, -50)
Scroll.Position = UDim2.new(0, 10, 0, 45)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 400)
Scroll.ScrollBarThickness = 0
Instance.new("UIListLayout", Scroll).Padding = UDim.new(0, 6)

-- Open/Close Main
Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.Text = Main.Visible and "-" or "+"
end)

-- Button Creator
local function AddButton(txt, func)
    local active = false
    local b = Instance.new("TextButton", Scroll)
    b.Size = UDim2.new(1, 0, 0, 38)
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Text = txt .. ": OFF"
    b.TextColor3 = Color3.fromRGB(200, 200, 200)
    b.Font = Enum.Font.Gotham
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        active = not active
        b.Text = txt .. (active and ": ON" or ": OFF")
        b.TextColor3 = active and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(200, 200, 200)
        func(active)
    end)
end

-- ===============================================
-- [ ОКНО STALKER LIST (КОПИЯ КАК НА ВИДЕО) ]
-- ===============================================
local StalkerFrame = Instance.new("Frame")
StalkerFrame.Parent = Gui
StalkerFrame.Size = UDim2.new(0, 280, 0, 350)
StalkerFrame.Position = UDim2.new(0.5, 140, 0.5, -175)
StalkerFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
StalkerFrame.BorderSizePixel = 0
StalkerFrame.Visible = false
StalkerFrame.Active = true
StalkerFrame.Draggable = true
Instance.new("UICorner", StalkerFrame)

-- Stalker Title (AK ADMIN Style)
local STitle = Instance.new("TextLabel")
STitle.Parent = StalkerFrame
STitle.Size = UDim2.new(1, 0, 0, 40)
STitle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
STitle.Text = "AK ADMIN | Stalker List"
STitle.TextColor3 = Color3.fromRGB(255, 255, 255)
STitle.Font = Enum.Font.GothamBold
STitle.TextSize = 15
Instance.new("UICorner", STitle)

-- Search Box
local SearchBox = Instance.new("TextBox")
SearchBox.Parent = StalkerFrame
SearchBox.Size = UDim2.new(0.9, 0, 0, 30)
SearchBox.Position = UDim2.new(0.05, 0, 0, 45)
SearchBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
SearchBox.Text = ""
SearchBox.PlaceholderText = "Search players..."
SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchBox.Font = Enum.Font.Gotham
SearchBox.TextSize = 13
Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 5)

-- Player List Scroll
local PScroll = Instance.new("ScrollingFrame")
PScroll.Parent = StalkerFrame
PScroll.Size = UDim2.new(0.94, 0, 1, -110)
PScroll.Position = UDim2.new(0.03, 0, 0, 85)
PScroll.BackgroundTransparency = 1
PScroll.CanvasSize = UDim2.new(0, 0, 0, 1000)
PScroll.ScrollBarThickness = 2
local PList = Instance.new("UIListLayout", PScroll)
PList.Padding = UDim.new(0, 4)

-- Tracking Status (Bottom Text)
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Parent = StalkerFrame
StatusLabel.Size = UDim2.new(1, 0, 0, 20)
StatusLabel.Position = UDim2.new(0, 0, 1, -25)
StatusLabel.Text = "Stalking: None"
StatusLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 11
StatusLabel.BackgroundTransparency = 1

-- [[ STALKER FUNCTIONS (LIKE VIDEO) ]] --

-- Function to update the player list
local function UpdateList()
    for _, v in pairs(PScroll:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
    
    local searchText = SearchBox.Text:lower()
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and (searchText == "" or p.Name:lower():match(searchText)) then
            -- Player Frame
            local pf = Instance.new("Frame", PScroll)
            pf.Size = UDim2.new(1, 0, 0, 50)
            pf.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            Instance.new("UICorner", pf)
            
            -- Avatar Image (LIKE VIDEO)
            local av = Instance.new("ImageLabel", pf)
            av.Size = UDim2.new(0, 40, 0, 40)
            av.Position = UDim2.new(0, 5, 0.5, -20)
            av.BackgroundTransparency = 1
            av.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
            Instance.new("UICorner", av).CornerRadius = UDim.new(1, 0)
            
            -- Nickname Text
            local nick = Instance.new("TextLabel", pf)
            nick.Size = UDim2.new(0.7, 0, 0.5, 0)
            nick.Position = UDim2.new(0, 55, 0, 5)
            nick.Text = p.Name
            nick.TextColor3 = Color3.fromRGB(255, 255, 255)
            nick.Font = Enum.Font.GothamBold
            nick.TextSize = 14
            nick.BackgroundTransparency = 1
            nick.TextXAlignment = Enum.TextXAlignment.Left
            
            -- Display Name (Optional grey)
            local disp = Instance.new("TextLabel", pf)
            disp.Size = UDim2.new(0.7, 0, 0.5, 0)
            disp.Position = UDim2.new(0, 55, 0.5, -5)
            disp.Text = "@" .. p.DisplayName
            disp.TextColor3 = Color3.fromRGB(150, 150, 150)
            disp.Font = Enum.Font.Gotham
            disp.TextSize = 12
            disp.BackgroundTransparency = 1
            disp.TextXAlignment = Enum.TextXAlignment.Left

            -- Watch Button (Invisible over frame)
            local b = Instance.new("TextButton", pf)
            b.Size = UDim2.new(1, 0, 1, 0)
            b.BackgroundTransparency = 1
            b.Text = ""
            b.MouseButton1Click:Connect(function()
                if p.Character then
                    workspace.CurrentCamera.CameraSubject = p.Character.Humanoid
                    StatusLabel.Text = "Stalking: " .. p.Name .. " (@" .. p.DisplayName .. ")"
                    print("Watch: ", p.Name)
                end
            end)
        end
    end
end

-- Refresh list on search text change
SearchBox.GetPropertyChangedSignal(SearchBox, "Text"):Connect(UpdateList)

-- Refresh on player joining/leaving
Players.PlayerAdded:Connect(UpdateList)
Players.PlayerRemoving:Connect(UpdateList)

-- [[ MAIN FUNCTIONS ]] --

AddButton("Fly Mode", function(s)
    local hrp = lp.Character:FindFirstChild("HumanoidRootPart")
    if s then
        local bv = Instance.new("BodyVelocity", hrp)
        bv.Name = "OmniFlyV3"
        bv.MaxForce = Vector3.new(1,1,1) * 10^6
        task.spawn(function()
            while hrp:FindFirstChild("OmniFlyV3") do
                bv.Velocity = workspace.CurrentCamera.CFrame.LookVector * 60
                task.wait()
            end
        end)
    else
        if hrp:FindFirstChild("OmniFlyV3") then hrp.OmniFlyV3:Destroy() end
    end
end)

AddButton("Full Invisible", function(s)
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = s and 1 or 0 end
        end
    end
end)

AddButton("Wallhack (ESP)", function(s)
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if s then
                local h = Instance.new("Highlight", p.Character)
                h.Name = "ESP"
                h.FillColor = Color3.fromRGB(255, 0, 0)
            else
                if p.Character:FindFirstChild("ESP") then p.Character.ESP:Destroy() end
            end
        end
    end
end)

-- BUTTON IN MAIN TO OPEN STALKER LIST
local openSpec = Instance.new("TextButton", Scroll)
openSpec.Size = UDim2.new(1, 0, 0, 38)
openSpec.BackgroundColor3 = Color3.fromRGB(50, 0, 0)
openSpec.Text = "🎥 OPEN STALKER LIST (ADV)"
openSpec.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", openSpec)
openSpec.MouseButton1Click:Connect(function()
    StalkerFrame.Visible = not StalkerFrame.Visible
    if StalkerFrame.Visible then UpdateList() end
end)

-- Кнопка сброса камеры
local resCam = Instance.new("TextButton", Scroll)
resCam.Size = UDim2.new(1, 0, 0, 38)
resCam.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
resCam.Text = "🏠 Reset Camera"
resCam.TextColor3 = Color3.fromRGB(255, 255, 255)
Instance.new("UICorner", resCam)
resCam.MouseButton1Click:Connect(function()
    workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
    StatusLabel.Text = "Stalking: None"
end)
