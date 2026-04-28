-- STAR ZERO HUB | TG KEY SYSTEM
local CorrectKey = "STAR_ZERO_2026" -- Твой ключ
local TG_LINK = "https://t.me/starzero_scripts" -- Твой ТГ

local ScreenGui = Instance.new("ScreenGui", game:GetService("CoreGui"))
ScreenGui.Name = "StarZero_KeySys"

-- Размытие
local Blur = Instance.new("BlurEffect", game:GetService("Lighting"))
Blur.Size = 20

-- Главное окно
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.Size = UDim2.new(0, 320, 0, 240)
MainFrame.Position = UDim2.new(0.5, -160, 0.5, -120)
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 12)
local stroke = Instance.new("UIStroke", MainFrame)
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(0, 170, 255)

local Title = Instance.new("TextLabel", MainFrame)
Title.Size = UDim2.new(1, 0, 0, 50)
Title.Text = "STAR ZERO HUB"
Title.Font = Enum.Font.GothamBold
Title.TextColor3 = Color3.new(1, 1, 1)
Title.TextSize = 24
Title.BackgroundTransparency = 1

-- Кнопка Телеграм
local TGBtn = Instance.new("TextButton", MainFrame)
TGBtn.Size = UDim2.new(0, 260, 0, 45)
TGBtn.Position = UDim2.new(0.5, -130, 0, 80)
TGBtn.BackgroundColor3 = Color3.fromRGB(0, 136, 204)
TGBtn.Text = "ПОЛУЧИТЬ КЛЮЧ (ТГ)"
TGBtn.Font = Enum.Font.GothamBold
TGBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", TGBtn)

-- Поле ввода
local KeyBox = Instance.new("TextBox", MainFrame)
KeyBox.Size = UDim2.new(0, 260, 0, 40)
KeyBox.Position = UDim2.new(0.5, -130, 0, 135)
KeyBox.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
KeyBox.PlaceholderText = "Введите ключ..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", KeyBox)

-- Кнопка проверки
local CheckBtn = Instance.new("TextButton", MainFrame)
CheckBtn.Size = UDim2.new(0, 260, 0, 40)
CheckBtn.Position = UDim2.new(0.5, -130, 0, 185)
CheckBtn.BackgroundColor3 = Color3.new(1, 1, 1)
CheckBtn.Text = "ЗАПУСТИТЬ"
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.TextColor3 = Color3.new(0, 0, 0)
Instance.new("UICorner", CheckBtn)

-- Логика кнопок
TGBtn.MouseButton1Click:Connect(function()
    setclipboard(TG_LINK)
    TGBtn.Text = "ССЫЛКА СКОПИРОВАНА!"
    wait(2)
    TGBtn.Text = "ПОЛУЧИТЬ КЛЮЧ (ТГ)"
end)

CheckBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == CorrectKey then
        Blur:Destroy()
        ScreenGui:Destroy()
        
        -- ТУТ ЗАПУСКАЮТСЯ ТВОИ ФУНКЦИИ
        print("Star Zero Loaded!")
        
        -- Уведомление о запуске
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "STAR ZERO",
            Text = "Скрипт запущен! Функции: Perfect, Collect, Upgrade активны.",
            Duration = 5
        })

        -- Здесь будет твой основной код функций
        -- (Auto Perfect, Auto Collect, Auto Upgrade)
    else
        KeyBox.Text = ""
        KeyBox.PlaceholderText = "НЕВЕРНЫЙ КЛЮЧ!"
    end
end)
