local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local localPlayer = Players.LocalPlayer
local camera = workspace.CurrentCamera

local X, Y = 0, 0
local maxAngleY = 720
local sensitivity = 0.3
local height = 1.5
local distance = 12
local ativo = false

if CoreGui:FindFirstChild("Mobilador2GUI") then
    CoreGui.Mobilador2GUI:Destroy()
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Mobilador2GUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = CoreGui

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Name = "ToggleBtn"
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0, 20, 0, 200)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
ToggleBtn.TextColor3 = Color3.fromRGB(0, 200, 255)
ToggleBtn.Text = "M"
ToggleBtn.TextSize = 24
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.BorderSizePixel = 0
ToggleBtn.Active = true
ToggleBtn.Draggable = true
ToggleBtn.Parent = ScreenGui

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 12)
ToggleCorner.Parent = ToggleBtn

local ToggleStroke = Instance.new("UIStroke")
ToggleStroke.Color = Color3.fromRGB(0, 200, 255)
ToggleStroke.Thickness = 2
ToggleStroke.Parent = ToggleBtn

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 260, 0, 320)
MainFrame.Position = UDim2.new(0.5, -130, 0.5, -160)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = false
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(0, 200, 255)
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

local Titulo = Instance.new("TextLabel")
Titulo.Size = UDim2.new(1, 0, 0, 45)
Titulo.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
Titulo.BackgroundTransparency = 0.85
Titulo.Text = "MOBILADOR 2.0"
Titulo.TextColor3 = Color3.fromRGB(0, 200, 255)
Titulo.TextSize = 20
Titulo.Font = Enum.Font.GothamBold
Titulo.BorderSizePixel = 0
Titulo.Parent = MainFrame

local TituloCorner = Instance.new("UICorner")
TituloCorner.CornerRadius = UDim.new(0, 14)
TituloCorner.Parent = Titulo

local AtivarBtn = Instance.new("TextButton")
AtivarBtn.Size = UDim2.new(0.85, 0, 0, 45)
AtivarBtn.Position = UDim2.new(0.075, 0, 0, 65)
AtivarBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
AtivarBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AtivarBtn.Text = "ATIVAR"
AtivarBtn.TextSize = 16
AtivarBtn.Font = Enum.Font.GothamBold
AtivarBtn.BorderSizePixel = 0
AtivarBtn.Parent = MainFrame

local AtivarCorner = Instance.new("UICorner")
AtivarCorner.CornerRadius = UDim.new(0, 8)
AtivarCorner.Parent = AtivarBtn

local SensLabel = Instance.new("TextLabel")
SensLabel.Size = UDim2.new(0.85, 0, 0, 25)
SensLabel.Position = UDim2.new(0.075, 0, 0, 125)
SensLabel.BackgroundTransparency = 1
SensLabel.Text = "Sensibilidade: 0.3"
SensLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
SensLabel.TextSize = 14
SensLabel.Font = Enum.Font.Gotham
SensLabel.TextXAlignment = Enum.TextXAlignment.Left
SensLabel.Parent = MainFrame

local SensSlider = Instance.new("Frame")
SensSlider.Size = UDim2.new(0.85, 0, 0, 10)
SensSlider.Position = UDim2.new(0.075, 0, 0, 158)
SensSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
SensSlider.BorderSizePixel = 0
SensSlider.Parent = MainFrame

local SliderCorner = Instance.new("UICorner")
SliderCorner.CornerRadius = UDim.new(1, 0)
SliderCorner.Parent = SensSlider

local SensFill = Instance.new("Frame")
SensFill.Size = UDim2.new(0.3, 0, 1, 0)
SensFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
SensFill.BorderSizePixel = 0
SensFill.Parent = SensSlider

local FillCorner = Instance.new("UICorner")
FillCorner.CornerRadius = UDim.new(1, 0)
FillCorner.Parent = SensFill

local SensBtn = Instance.new("TextButton")
SensBtn.Size = UDim2.new(1, 0, 1, 0)
SensBtn.BackgroundTransparency = 1
SensBtn.Text = ""
SensBtn.Parent = SensSlider

local DistLabel = Instance.new("TextLabel")
DistLabel.Size = UDim2.new(0.85, 0, 0, 25)
DistLabel.Position = UDim2.new(0.075, 0, 0, 185)
DistLabel.BackgroundTransparency = 1
DistLabel.Text = "Distância: 12"
DistLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
DistLabel.TextSize = 14
DistLabel.Font = Enum.Font.Gotham
DistLabel.TextXAlignment = Enum.TextXAlignment.Left
DistLabel.Parent = MainFrame

local DistSlider = Instance.new("Frame")
DistSlider.Size = UDim2.new(0.85, 0, 0, 10)
DistSlider.Position = UDim2.new(0.075, 0, 0, 218)
DistSlider.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
DistSlider.BorderSizePixel = 0
DistSlider.Parent = MainFrame

local DistSliderCorner = Instance.new("UICorner")
DistSliderCorner.CornerRadius = UDim.new(1, 0)
DistSliderCorner.Parent = DistSlider

local DistFill = Instance.new("Frame")
DistFill.Size = UDim2.new(0.2, 0, 1, 0)
DistFill.BackgroundColor3 = Color3.fromRGB(0, 200, 255)
DistFill.BorderSizePixel = 0
DistFill.Parent = DistSlider

local DistFillCorner = Instance.new("UICorner")
DistFillCorner.CornerRadius = UDim.new(1, 0)
DistFillCorner.Parent = DistFill

local DistBtn = Instance.new("TextButton")
DistBtn.Size = UDim2.new(1, 0, 1, 0)
DistBtn.BackgroundTransparency = 1
DistBtn.Text = ""
DistBtn.Parent = DistSlider

local ResetBtn = Instance.new("TextButton")
ResetBtn.Size = UDim2.new(0.85, 0, 0, 40)
ResetBtn.Position = UDim2.new(0.075, 0, 0, 250)
ResetBtn.BackgroundColor3 = Color3.fromRGB(60, 30, 30)
ResetBtn.TextColor3 = Color3.fromRGB(255, 100, 100)
ResetBtn.Text = "RESETAR CÂMERA"
ResetBtn.TextSize = 14
ResetBtn.Font = Enum.Font.GothamBold
ResetBtn.BorderSizePixel = 0
ResetBtn.Parent = MainFrame

local ResetCorner = Instance.new("UICorner")
ResetCorner.CornerRadius = UDim.new(0, 8)
ResetCorner.Parent = ResetBtn

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

AtivarBtn.MouseButton1Click:Connect(function()
    ativo = not ativo
    if ativo then
        AtivarBtn.Text = "DESATIVAR"
        AtivarBtn.BackgroundColor3 = Color3.fromRGB(0, 150, 80)
    else
        AtivarBtn.Text = "ATIVAR"
        AtivarBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end
end)

local arrastandoSens = false
SensBtn.MouseButton1Down:Connect(function() arrastandoSens = true end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        arrastandoSens = false
        arrastandoDist = false
    end
end)

local arrastandoDist = false
DistBtn.MouseButton1Down:Connect(function() arrastandoDist = true end)

RunService.RenderStepped:Connect(function()
    if arrastandoSens then
        local mouse = UserInputService:GetMouseLocation()
        local relative = math.clamp((mouse.X - SensSlider.AbsolutePosition.X) / SensSlider.AbsoluteSize.X, 0, 1)
        SensFill.Size = UDim2.new(relative, 0, 1, 0)
        sensitivity = 0.05 + (relative * 0.95)
        SensLabel.Text = string.format("Sensibilidade: %.2f", sensitivity)
    end
    
    if arrastandoDist then
        local mouse = UserInputService:GetMouseLocation()
        local relative = math.clamp((mouse.X - DistSlider.AbsolutePosition.X) / DistSlider.AbsoluteSize.X, 0, 1)
        DistFill.Size = UDim2.new(relative, 0, 1, 0)
        distance = 3 + (relative * 27)
        DistLabel.Text = string.format("Distância: %.0f", distance)
    end
end)

ResetBtn.MouseButton1Click:Connect(function()
    X, Y = 0, 0
end)

local humanoidRootPart

local function atualizarPersonagem()
    local char = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    humanoidRootPart = char:WaitForChild("HumanoidRootPart")
end

localPlayer.CharacterAdded:Connect(atualizarPersonagem)
atualizarPersonagem()

RunService.RenderStepped:Connect(function(dt)
    if not ativo or not humanoidRootPart then return end
    
    local rotacionando = UserInputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton2)
    
    if rotacionando then
        local delta = UserInputService:GetMouseDelta()
        X = X + delta.X * sensitivity * 0.05
        Y = math.clamp(Y + delta.Y * sensitivity * 0.05, -math.rad(maxAngleY), math.rad(maxAngleY))
    end
    
    local focusPos = humanoidRootPart.Position
    local targetCFrame = CFrame.new(focusPos) 
        * CFrame.fromEulerAnglesYXZ(-Y, -X, 0) 
        * CFrame.new(0, height, distance)
    
    camera.CFrame = camera.CFrame:Lerp(targetCFrame, dt * 15)
end)
