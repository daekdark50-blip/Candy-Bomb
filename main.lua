-- [[ OMNI-X PRO | STABLE MOBILE EDITION ]] --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local lp = Players.LocalPlayer

-- Удаление старых копий
if CoreGui:FindFirstChild("OmniPro") then CoreGui.OmniPro:Destroy() end

local Gui = Instance.new("ScreenGui")
Gui.Name = "OmniPro"
Gui.Parent = CoreGui
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- [[ КНОПКА ПЛЮСИК (TOGGLE) ]] --
local Toggle = Instance.new("TextButton")
Toggle.Name = "Toggle"
Toggle.Parent = Gui
Toggle.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
Toggle.Position = UDim2.new(0, 15, 0.4, 0)
Toggle.Size = UDim2.new(0, 50, 0, 50)
Toggle.Font = Enum.Font.GothamBold
Toggle.Text = "+"
Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
Toggle.TextSize = 35
Toggle.ZIndex = 100
Instance.new("UICorner", Toggle).CornerRadius = UDim.new(1, 0)

-- [[ ГЛАВНОЕ МЕНЮ ]] --
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Parent = Gui
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, -110, 0.5, -135)
Main.Size = UDim2.new(0, 220, 0, 270)
Main.Visible = false
Main.Active = true
Main.Draggable = true -- Можно двигать пальцем за это окно

local CornerMain = Instance.new("UICorner", Main)
CornerMain.CornerRadius = UDim.new(0, 10)

-- Заголовок меню
local Header = Instance.new("TextLabel")
Header.Parent = Main
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(25, 0, 0)
Header.Text = "OMNI-X HUB"
Header.TextColor3 = Color3.fromRGB(255, 255, 255)
Header.Font = Enum.Font.GothamBold
Header.TextSize = 16
Instance.new("UICorner", Header)

-- Список функций
local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = Main
Scroll.Position = UDim2.new(0, 10, 0, 45)
Scroll.Size = UDim2.new(1, -20, 1, -55)
Scroll.BackgroundTransparency = 1
Scroll.CanvasSize = UDim2.new(0, 0, 0, 350)
Scroll.ScrollBarThickness = 0

local UIList = Instance.new("UIListLayout", Scroll)
UIList.Padding = UDim.new(0, 6)

-- Логика кнопки [+]
Toggle.MouseButton1Click:Connect(function()
    Main.Visible = not Main.Visible
    Toggle.Text = Main.Visible and "-" or "+"
end)

-- Функция создания кнопок
local function AddBtn(text, func)
    local b = Instance.new("TextButton")
    b.Parent = Scroll
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    b.Text = text
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.MouseButton1Click:Connect(func)
    Instance.new("UICorner", b).CornerRadius = UDim.new(0, 6)
end

-- [[ ФУНКЦИИ ]] --

AddBtn("Invis (Local)", function()
    if lp.Character then
        for _, v in pairs(lp.Character:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("Decal") then v.Transparency = 0.5 end
        end
    end
end)

AddBtn("ESP (Wallhack)", function()
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= lp and p.Character then
            if not p.Character:FindFirstChild("Highlight") then
                local h = Instance.new("Highlight", p.Character)
                h.FillColor = Color3.fromRGB(255, 0, 0)
            end
        end
    end
end)

local sIdx = 1
AddBtn("Spectate Player", function()
    local plrs = Players:GetPlayers()
    sIdx = sIdx + 1
    if sIdx > #plrs then sIdx = 1 end
    local target = plrs[sIdx]
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        workspace.CurrentCamera.CameraSubject = target.Character.Humanoid
    end
end)

AddBtn("Reset Camera", function()
    if lp.Character and lp.Character:FindFirstChild("Humanoid") then
        workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid
    end
end)

AddBtn("Close UI", function() Gui:Destroy() end)
