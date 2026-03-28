-- [[ DARK HUB v38 | FULL CUSTOM SPECTATE ]] --
-- [[ AK ADMIN | NO MORE BLACK SQUARES ]] --

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer

if CoreGui:FindFirstChild("DarkHubV38") then CoreGui.DarkHubV38:Destroy() end

local Gui = Instance.new("ScreenGui", CoreGui)
Gui.Name = "DarkHubV38"

-- ТВОЯ АВА (Попробуй этот ID или вставь свой рабочий)
local AvatarID = "rbxassetid://13110906232" 

-- [[ 1. ЗАГРУЗКА V38 ]] --
local function StartLoader()
    local Loader = Instance.new("Frame", Gui)
    Loader.Size = UDim2.new(1, 0, 1, 0)
    Loader.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Loader.ZIndex = 500

    local Img = Instance.new("ImageLabel", Loader)
    Img.Size = UDim2.new(0, 200, 0, 200)
    Img.Position = UDim2.new(0.5, -100, 0.4, -100)
    Img.Image = AvatarID
    Img.BackgroundTransparency = 1
    Instance.new("UICorner", Img).CornerRadius = UDim.new(1, 0)

    local T = Instance.new("TextLabel", Loader)
    T.Size = UDim2.new(1, 0, 0, 50)
    T.Position = UDim2.new(0, 0, 0.6, 0)
    T.Text = "loading dark hub script nerest ready work"
    T.TextColor3 = Color3.fromRGB(255, 255, 255)
    T.Font = Enum.Font.GothamBold
    T.TextSize = 20
    T.BackgroundTransparency = 1

    task.wait(3)
    Loader:Destroy()
end

-- [[ 2. МЕНЮ ]] --
local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 520, 0, 380)
Main.Position = UDim2.new(0.5, -260, 0.5, -190)
Main.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Main.Visible = false
Main.Active = true
Main.Draggable = true
Instance.new("UICorner", Main)

local Side = Instance.new("Frame", Main)
Side.Size = UDim2.new(0, 140, 1, 0)
Side.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Instance.new("UICorner", Side)
Instance.new("UIListLayout", Side).Padding = UDim.new(0, 5)

local Container = Instance.new("Frame", Main)
Container.Size = UDim2.new(1, -155, 1, -10)
Container.Position = UDim2.new(0, 150, 0, 5)
Container.BackgroundTransparency = 1

local function CreateTab(name)
    local p = Instance.new("ScrollingFrame", Container)
    p.Size = UDim2.new(1, 0, 1, 0)
    p.BackgroundTransparency = 1
    p.Visible = false
    p.ScrollBarThickness = 0
    Instance.new("UIListLayout", p).Padding = UDim.new(0, 8)
    local b = Instance.new("TextButton", Side)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    b.Text = name
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.Font = Enum.Font.GothamBold
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function()
        for _, v in pairs(Container:GetChildren()) do v.Visible = false end
        p.Visible = true
    end)
    return p
end

local TabMain = CreateTab("MAIN")
local TabScripts = CreateTab("SCRIPTS")
local TabAuto = CreateTab("AUTO FARM")

-- [[ КРУТОЙ SPECTATE (КАК НА ВИДЕО) ]] --
local function BuildSpectate()
    local Title = Instance.new("TextLabel", TabMain)
    Title.Size = UDim2.new(1, 0, 0, 30)
    Title.Text = "STALKER / SPECTATE"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.Font = Enum.Font.GothamBold
    Title.BackgroundTransparency = 1

    local List = Instance.new("Frame", TabMain)
    List.Size = UDim2.new(1, 0, 0, 250)
    List.BackgroundTransparency = 1
    Instance.new("UIListLayout", List).Padding = UDim.new(0, 5)

    local function Refresh()
        for _, v in pairs(List:GetChildren()) do if v:IsA("Frame") then v:Destroy() end end
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= lp then
                local f = Instance.new("Frame", List)
                f.Size = UDim2.new(1, 0, 0, 45)
                f.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
                Instance.new("UICorner", f)

                local icon = Instance.new("ImageLabel", f)
                icon.Size = UDim2.new(0, 35, 0, 35)
                icon.Position = UDim2.new(0, 5, 0.5, -17)
                icon.Image = Players:GetUserThumbnailAsync(p.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
                Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

                local name = Instance.new("TextLabel", f)
                name.Size = UDim2.new(1, -100, 1, 0)
                name.Position = UDim2.new(0, 50, 0, 0)
                name.Text = p.DisplayName .. "\n@" .. p.Name
                name.TextColor3 = Color3.fromRGB(255, 255, 255)
                name.TextXAlignment = "Left"
                name.Font = Enum.Font.Gotham
                name.TextSize = 12
                name.BackgroundTransparency = 1

                local btn = Instance.new("TextButton", f)
                btn.Size = UDim2.new(0, 80, 0, 30)
                btn.Position = UDim2.new(1, -85, 0.5, -15)
                btn.Text = "WATCH"
                btn.BackgroundColor3 = Color3.fromRGB(0, 150, 255)
                btn.TextColor3 = Color3.fromRGB(255, 255, 255)
                Instance.new("UICorner", btn)

                btn.MouseButton1Click:Connect(function()
                    workspace.CurrentCamera.CameraSubject = p.Character.Humanoid
                end)
            end
        end
    end
    Refresh()
    
    local Stop = Instance.new("TextButton", TabMain)
    Stop.Size = UDim2.new(1, 0, 0, 40)
    Stop.Text = "STOP SPECTATE"
    Stop.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
    Stop.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", Stop)
    Stop.MouseButton1Click:Connect(function() workspace.CurrentCamera.CameraSubject = lp.Character.Humanoid end)
end
BuildSpectate()

-- [[ SCRIPTS ВКЛАДКА ]] --
local function AddScript(name, url)
    local b = Instance.new("TextButton", TabScripts)
    b.Size = UDim2.new(1, 0, 0, 40)
    b.Text = name
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    Instance.new("UICorner", b)
    b.MouseButton1Click:Connect(function() loadstring(game:HttpGet(url))() end)
end

AddScript("Be a Lucky Block", "https://raw.githubusercontent.com/gumanba/Scripts/main/BeaLuckyBlock")
AddScript("Fly for Brainrots", "https://raw.githubusercontent.com/gumanba/Scripts/main/FlyforBrainrots")

-- [[ КНОПКА DH (С ТВОЕЙ АВОЙ) ]] --
local Tog = Instance.new("ImageButton", Gui)
Tog.Size = UDim2.new(0, 55, 0, 55)
Tog.Position = UDim2.new(0, 10, 0.5, 0)
Tog.Image = AvatarID
Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
local S = Instance.new("UIStroke", Tog)
S.Color = Color3.fromRGB(0, 255, 100)
S.Thickness = 2

Tog.MouseButton1Click:Connect(function() Main.Visible = not Main.Visible end)

task.spawn(function() StartLoader(); Main.Visible = true; TabMain.Visible = true end)
