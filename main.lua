-- ПОДКЛЮЧАЕМ КОМПАКТНУЮ БИБЛИОТЕКУ
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

-- СОЗДАЕМ МАЛЕНЬКОЕ ОКНО
local Window = OrionLib:MakeWindow({
    Name = "Dark Creator", 
    HidePremium = true, 
    SaveConfig = false, 
    IntroText = "Dark Hub Loading...",
    ConfigFolder = "DarkConfig"
})

-- ВКЛАДКА (Сделаем её короткой)
local Tab = Window:MakeTab({
	Name = "ESP",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- ФУНКЦИЯ ВХ
local function doESP()
    for _, v in pairs(workspace:GetDescendants()) do
        if v:IsA("BasePart") and (v.Name:lower():find("candy") or v.Name:lower():find("bomb")) then
            if not v:FindFirstChild("DarkHighlight") then
                local h = Instance.new("Highlight", v)
                h.Name = "DarkHighlight"
                h.FillColor = Color3.fromRGB(255, 0, 0)
                h.OutlineColor = Color3.fromRGB(255, 255, 255)
            end
        end
    end
end

-- КНОПКА
Tab:AddButton({
	Name = "Включить Candy ESP",
	Callback = function()
        doESP()
        -- Авто-обновление каждые 5 секунд
        task.spawn(function()
            while true do
                task.wait(5)
                doESP()
            end
        end)
  	end    
})

OrionLib:Init()
