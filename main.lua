-- [[ CANDY-BOMB HUB: TWO SECTIONS EDITION ]] --
local p = game.Players.LocalPlayer
local pg = p:WaitForChild("PlayerGui")

local function CreateCandyHub()
    if pg:FindFirstChild("DarkHubV42") then pg.DarkHubV42:Destroy() end

    local G = Instance.new("ScreenGui", pg); G.Name = "DarkHubV42"; G.ResetOnSpawn = false
    local M = Instance.new("Frame", G); M.Size = UDim2.new(0, 480, 0, 400); M.Position = UDim2.new(0.5, -240, 0.5, -200); M.BackgroundColor3 = Color3.fromRGB(15, 15, 15); M.Active = true; M.Draggable = true; Instance.new("UICorner", M)

    -- КНОПКА DH
    local Tog = Instance.new("TextButton", G); Tog.Size = UDim2.new(0, 55, 0, 55); Tog.Position = UDim2.new(0, 15, 0.5, -27); Tog.BackgroundColor3 = Color3.fromRGB(0, 0, 0); Tog.Text = "DH"; Tog.TextColor3 = Color3.fromRGB(255, 0, 0); Tog.Font = Enum.Font.SourceSansBold; Tog.TextSize = 20; Instance.new("UICorner", Tog).CornerRadius = UDim.new(1, 0)
    Tog.MouseButton1Click:Connect(function() M.Visible = not M.Visible end)

    -- БОКОВАЯ ПАНЕЛЬ (SIDEBAR)
    local Side = Instance.new("Frame", M); Side.Size = UDim2.new(0, 100, 1, 0); Side.BackgroundColor3 = Color3.fromRGB(5, 5, 5); Instance.new("UICorner", Side)
    local SideList = Instance.new("UIListLayout", Side); SideList.Padding = UDim.new(0, 5); SideList.HorizontalAlignment = Enum.HorizontalAlignment.Center

    -- КОНТЕЙНЕРЫ ДЛЯ СТРАНИЦ
    local PageScripts = Instance.new("ScrollingFrame", M); PageScripts.Size = UDim2.new(1, -110, 1, -20); PageScripts.Position = UDim2.new(0, 105, 0, 10); PageScripts.BackgroundTransparency = 1; PageScripts.Visible = true; PageScripts.CanvasSize = UDim2.new(0, 0, 15, 0); PageScripts.ScrollBarThickness = 3
    Instance.new("UIListLayout", PageScripts).Padding = UDim.new(0, 5)

    local PageMyHub = Instance.new("ScrollingFrame", M); PageMyHub.Size = UDim2.new(1, -110, 1, -20); PageMyHub.Position = UDim2.new(0, 105, 0, 10); PageMyHub.BackgroundTransparency = 1; PageMyHub.Visible = false; PageMyHub.CanvasSize = UDim2.new(0, 0, 5, 0); PageMyHub.ScrollBarThickness = 3
    Instance.new("UIListLayout", PageMyHub).Padding = UDim.new(0, 5)

    -- ФУНКЦИЯ ПЕРЕКЛЮЧЕНИЯ ВКЛАДОК
    local function ShowPage(page)
        PageScripts.Visible = (page == "Scripts")
        PageMyHub.Visible = (page == "MyHub")
    end

    -- КНОПКИ ПЕРЕКЛЮЧЕНИЯ СЛЕВА
    local function AddTab(txt, target)
        local b = Instance.new("TextButton", Side); b.Size = UDim2.new(0, 90, 0, 40); b.Text = txt; b.BackgroundColor3 = Color3.fromRGB(30, 30, 30); b.TextColor3 = Color3.new(1,1,1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 12; Instance.new("UICorner", b)
        b.MouseButton1Click:Connect(function() ShowPage(target) end)
    end
    AddTab("SCRIPTS", "Scripts")
    AddTab("MY HUB", "MyHub")

    -- ФУНКЦИЯ ДОБАВЛЕНИЯ КНОПОК
    local function AddB(parent, txt, clr, cb)
        local b = Instance.new("TextButton", parent); b.Size = UDim2.new(1, -10, 0, 38); b.Text = txt; b.BackgroundColor3 = clr; b.TextColor3 = Color3.new(1, 1, 1); b.Font = Enum.Font.SourceSansBold; b.TextSize = 14; Instance.new("UICorner", b); b.MouseButton1Click:Connect(cb)
    end

    -- [[ ВКЛАДКА 1: SCRIPTS (ВСЁ СТАРОЕ) ]] --
    AddB(PageScripts, "--- AUTO FARM ---", Color3.new(0, 0.3, 0.5), function() end)
    AddB(PageScripts, "Solix Hub (24H KEY) 🔥", Color3.fromRGB(120, 0, 255), function() 
        setclipboard("https://ads.luarmor.net/get_key?for=Solixhub_Free_KeySystem-OWlLHDMCHADk")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/meobeo8/a/a/a"))() 
    end)
    AddB(PageScripts, "Mystrix Hub", Color3.fromRGB(0, 80, 120), function() loadstring(game:HttpGet("https://raw.githubusercontent.com/ummarxfarooq/mystrix-hub/refs/heads/main/loader"))() end)

    AddB(PageScripts, "--- TELEPORTS ---", Color3.new(0, 0.4, 0), function() end)
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= p then AddB(PageScripts, "TP: "..v.Name, Color3.fromRGB(30, 50, 30), function() p.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0,0,3) end) end
    end

    AddB(PageScripts, "--- 11 SCRIPTS ---", Color3.new(0.3, 0.3, 0.3), function() end)
    local function sc(n, u) AddB(PageScripts, n, Color3.fromRGB(35, 35, 35), function() loadstring(game:HttpGet(u))() end) end
    sc("1. Escape Tsunami", "https://raw.githubusercontent.com/osakaTP2/OsakaTP2/refs/heads/main/Escape%20Tsunami%20For%20BrainrotsDelta")
    sc("2. Be a Lucky Block", "https://vonixehub.com/raw")
    sc("3. Popcorn Hub", "https://raw.githubusercontent.com/PopcornHubSaves/PopcornHub/main/PopcornHub.lua")
    sc("4. SimpleSpy V3", "https://raw.githubusercontent.com/7YSeven/SimpleSpyV3/main/main.lua")

    -- [[ ВКЛАДКА 2: MY HUB (ТВОИ ЛИЧНЫЕ СКРИПТЫ) ]] --
    AddB(PageMyHub, "--- MY EXCLUSIVE ---", Color3.fromRGB(200, 0, 0), function() end)
    
    -- Твой новый ESP (Wallhack)
    AddB(PageMyHub, "PLAYER ESP (C-Bomb)", Color3.fromRGB(255, 100, 0), function()
        for _, pl in pairs(game.Players:GetPlayers()) do
            if pl ~= p and pl.Character and not pl.Character:FindFirstChild("C_ESP") then
                local h = Instance.new("Highlight", pl.Character); h.Name = "C_ESP"; h.FillColor = Color3.new(1, 0, 0); h.OutlineColor = Color3.new(1, 1, 1)
            end
        end
    end)

    -- Твоя скорость
    AddB(PageMyHub, "CANDY SPEED (80)", Color3.fromRGB(0, 200, 255), function()
        p.Character.Humanoid.WalkSpeed = 80
    end)
end

CreateCandyHub()
p.CharacterAdded:Connect(function() task.wait(1); CreateCandyHub() end)
