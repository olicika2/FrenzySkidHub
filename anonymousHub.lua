	

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/jensonhirst/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "private gui super private by anonymous", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

local Tab = Window:MakeTab({
	Name = "febipass",
	Icon = "rbxassetid://74522217830466",
	PremiumOnly = false
})

--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to Sirus Premium users only.
]]

local Section = Tab:AddSection({
	Name = "fe"
})

--[[
Name = <string> - The name of the section.
]]

OrionLib:MakeNotification({
	Name = "enjoy fe bypass!!",
	Content = "fe bypass",
	Image = "rbxassetid://74522217830466",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]

Tab:AddButton({
	Name = "inject stigma logo",
	Callback = function()
      		local StigmanFroud = Instance.new("ScreenGui")
local trajectory = Instance.new("ImageLabel")
local R = Instance.new("ImageLabel")
local Earth = Instance.new("ImageLabel")
local Green = Instance.new("ImageLabel")

StigmanFroud.Name = "Stigman Froud"
StigmanFroud.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
StigmanFroud.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
StigmanFroud.DisplayOrder = 999
StigmanFroud.ResetOnSpawn = false

trajectory.Name = "trajectory"
trajectory.Parent = StigmanFroud
trajectory.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
trajectory.BackgroundTransparency = 1.000
trajectory.Position = UDim2.new(0.45430705, 0, 0.430432826, 0)
trajectory.Size = UDim2.new(0, 110, 0, 110)
trajectory.Image = "http://www.roblox.com/asset/?id=7102118272"
trajectory.SliceScale = 3.000

R.Name = "R"
R.Parent = StigmanFroud
R.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
R.BackgroundTransparency = 1.000
R.Position = UDim2.new(0.45430705, 0, 0.430432826, 0)
R.Size = UDim2.new(0, 110, 0, 110)
R.ZIndex = 3
R.Image = "http://www.roblox.com/asset/?id=7102117818"
R.SliceScale = 3.000

Earth.Name = "Earth"
Earth.Parent = R
Earth.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Earth.BackgroundTransparency = 1.000
Earth.BorderColor3 = Color3.fromRGB(0, 0, 0)
Earth.BorderSizePixel = 0
Earth.Position = UDim2.new(0.404999346, 0, 0.406818181, 0)
Earth.Size = UDim2.new(0, 20, 0, 20)
Earth.ZIndex = 4
Earth.Image = "rbxassetid://78137783929126"

Green.Name = "Green"
Green.Parent = StigmanFroud
Green.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Green.BackgroundTransparency = 1.000
Green.BorderColor3 = Color3.fromRGB(0, 0, 0)
Green.BorderSizePixel = 0
Green.Position = UDim2.new(0.00499999989, 0, 0.824999988, 0)
Green.Size = UDim2.new(0, 110, 0, 110)
Green.ZIndex = 6
Green.Image = "rbxassetid://75554667916597"
Green.ImageTransparency = 1.000

local function AARC_fake_script() -- trajectory.Info 
	local script = Instance.new('LocalScript', trajectory)

	local img = script.Parent
	local sonic = script.Parent
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
	
	while true do
		wait(0.01)
		sonic.Rotation = sonic.Rotation +0.3
	end
	
	
end
coroutine.wrap(AARC_fake_script)()
local function LQERQ_fake_script() -- Earth.LocalScript 
	local script = Instance.new('LocalScript', Earth)

	local Angle = 0;
	local AngleIncrement = 0.02;
	local OriginPos = script.Parent.Position;
	local Distance = 55;
	
	while wait() do
		Angle = Angle + AngleIncrement;
		local dirX = math.cos(Angle) -- X
		local dirY = math.sin(Angle) -- Y
		script.Parent.Position = OriginPos + UDim2.new(0, dirX * Distance, 0, dirY * Distance);
	end
end
coroutine.wrap(LQERQ_fake_script)()
local function XBQODE_fake_script() -- R.Info 
	local script = Instance.new('LocalScript', R)

	local img = script.Parent
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
end
coroutine.wrap(XBQODE_fake_script)()
local function NSHDR_fake_script() -- Green.LocalScript 
	local script = Instance.new('LocalScript', Green)

	local Tween = game:GetService("TweenService")
	local Greenfn = script.Parent
	wait(2)
	while true do
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 0})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 1})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 0})
		TranspncyTween:Play()
		wait(0.3)
		local TranspncyTween = Tween:Create(Greenfn, TweenInfo.new(0.5), {ImageTransparency = 1})
		TranspncyTween:Play()
		wait(4)
	end
end
coroutine.wrap(NSHDR_fake_script)()
local function UDIRPT_fake_script() -- Green.Info 
	local script = Instance.new('LocalScript', Green)

	local img = script.Parent
	local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	
	img:TweenPosition(UDim2.new(0.451, 0,0.395, 0), "Out", "Linear", 0.4, false)
	wait(3)
	img:TweenPosition(UDim2.new(0.005, 0,0.619, 0), "Out", "Sine", 0.7, false)
	
	
	
	
end
coroutine.wrap(UDIRPT_fake_script)()
local function WGFAMY_fake_script() -- StigmanFroud.LocalScript 
	local script = Instance.new('LocalScript', StigmanFroud)

	local GetName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
	
	print("Loaded At",GetName.Name)
	wait(0.1)
	print("Welcome,",game.Players.LocalPlayer.Name)
	
end
coroutine.wrap(WGFAMY_fake_script)()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "inject sadrc7 logo",
	Callback = function()
      		local gui = Instance.new("ScreenGui")
gui.Name = "executor"
gui.Parent = game.CoreGui

local lel = Instance.new("ImageLabel")
lel.Size = UDim2.new(0.0, 100, 0.0, 100)
lel.Position = UDim2.new(-0.127000004, 0, 0.407999992, 0)
lel.BackgroundColor3 = Color3.new(0, 0, 0)
lel.ImageColor3 = Color3.new(1, 1, 1)
lel.Image = "rbxassetid://96331255027268"
lel.ImageTransparency = 0
lel.Parent = gui

lel.BackgroundTransparency = 1 

local Ring = Instance.new("ImageLabel")
Ring.Size = UDim2.new(1.0, 0, 1.0, 0)
Ring.Position = UDim2.new(0.0, 0, 0.0, 0)
Ring.BackgroundColor3 = Color3.new(0, 0, 0)
Ring.ImageColor3 = Color3.new(0, 0, 0)
Ring.Image = "rbxassetid://7102118272"
Ring.ImageTransparency = 0
Ring.Parent = lel

Ring.BackgroundTransparency = 1

local Orbit = Instance.new("ImageLabel")
Orbit.Size = UDim2.new(0.0, 21, 0.0, 21)
Orbit.Position = UDim2.new(0.0, 0, 0.0, 10)
Orbit.BackgroundColor3 = Color3.new(0, 0, 0)
Orbit.ImageColor3 = Color3.new(1, 1, 1)
Orbit.Image = "rbxassetid://96331255027268"
Orbit.ImageTransparency = 0
Orbit.Parent = Ring

Orbit.BackgroundTransparency = 1

lel:TweenPosition(UDim2.new(0.458, 0, 0.408, 0), "Out", "Linear", 0.4, false)
wait(3)
lel:TweenPosition(UDim2.new(0.0, 9, 0.0, 190), "Out", "Sine", 0.7, false)

while wait() do
Ring.Rotation = Ring.Rotation + 1
Orbit.Rotation = Orbit.Rotation - 1
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "external gui",
	Callback = function()
      		local gui = Instance.new("ScreenGui")
gui.Name = "credits: team secret"
gui.Parent = game.CoreGui

local Topbar = Instance.new("Frame")
Topbar.Size = UDim2.new(0.0, 279, 0.0, 49)
Topbar.Position = UDim2.new(0.0, 0, 0.0, 0)
Topbar.BackgroundColor3 = Color3.new(0, 0, 0)
Topbar.BorderColor3 = Color3.new(0, 0, 0)
Topbar.BorderSizePixel = 0
Topbar.Active = true
Topbar.BackgroundTransparency = 0 
Topbar.Draggable = true
Topbar.Parent = gui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0.9, 28, 0.9, 162)
Main.Position = UDim2.new(0.0, 0, 0.9, 5)
Main.BackgroundColor3 = Color3.new(1, 0, 0)
Main.BorderColor3 = Color3.new(0, 0, 0)
Main.BorderSizePixel = 0
Main.Active = false
Main.BackgroundTransparency = 0 
Main.Draggable = true
Main.Parent = Topbar

local Text = Instance.new("TextLabel")
Text.Size = UDim2.new(0.9, 28, 0.9, 3)
Text.Position = UDim2.new(0.0, 0, 0.0, 0)
Text.BackgroundColor3 = Color3.new(1, 1, 1)
Text.BorderColor3 = Color3.new(0, 0, 0)
Text.BorderSizePixel = 0
Text.Text = "External GU1!"
Text.BackgroundTransparency = 0.9
Text.TextColor3 = Color3.new(255, 255, 255)
Text.Parent = Topbar
Text.TextSize = 17

local Script = Instance.new("Frame")
Script.Size = UDim2.new(0.8, 32, 0.7, 29)
Script.Position = UDim2.new(0.0, 11, 0.0, 19)
Script.BackgroundColor3 = Color3.new(0, 0, 0)
Script.BorderColor3 = Color3.new(0, 0, 0)
Script.BorderSizePixel = 0
Script.Active = false
Script.BackgroundTransparency = 0 
Script.Draggable = true
Script.Parent = Main
Script.Visible = false

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent =Script

local White = Instance.new("Frame")
White.Size = UDim2.new(0.9, 26, 0.9, 18)
White.Position = UDim2.new(0.0, 0, 0.0, 0)
White.BackgroundColor3 = Color3.new(1, 1, 1)
White.BorderColor3 = Color3.new(0, 0, 0)
White.BorderSizePixel = 0
White.Active = false
White.BackgroundTransparency = 0.8
White.Draggable = true
White.Parent = Script

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 4)
UICorner.Parent = White

local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0.9, 25, 0.2, 0)
button1.Position = UDim2.new(0.0, 0, 0.0, 0)
button1.BackgroundColor3 = Color3.new(0, 0, 0)
button1.BorderColor3 = Color3.new(0, 0, 0)
button1.BorderSizePixel = 0
button1.Text = "Project Anonymous"
button1.BackgroundTransparency = 1
button1.TextColor3 = Color3.new(1, 1, 1)
button1.Parent = White
button1.TextSize = 14
button1.MouseButton1Click:Connect(function()
game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
print("Installing Project Anonymous...")
wait(2)
print("project Anonymous installed..")
wait(2)
warn("Enjoy Fe Bypass!1 ReelÃ°Å¸Â¤â€˜")
wait(2)

local sound = Instance.new("Sound", game.Workspace)
sound.SoundId = "rbxassetid://8623387557"
sound.Volume = 39
sound:Play()

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "Project Anonymous"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 500, 0, 300)
mainFrame.Position = UDim2.new(0.5, -250, 0.3, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local topBar = Instance.new("Frame")
topBar.Size = UDim2.new(1, 0, 0, 40)
topBar.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
topBar.BorderSizePixel = 0
topBar.Parent = mainFrame

local logoImage = Instance.new("ImageLabel")
logoImage.Size = UDim2.new(0, 30, 0, 30)
logoImage.Position = UDim2.new(0, 10, 0.5, -15)
logoImage.BackgroundTransparency = 1
logoImage.Image = "rbxassetid://74522217830466"
logoImage.Parent = topBar

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(0, 200, 1, 0)
titleLabel.Position = UDim2.new(0, 50, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Project Anonymous"
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 20
titleLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.Parent = topBar

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0, 30, 0, 30)
minimizeButton.Position = UDim2.new(1, -90, 0.5, -15)
minimizeButton.BackgroundTransparency = 1
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.fromRGB(50, 50, 50)
minimizeButton.Font = Enum.Font.SourceSans
minimizeButton.TextSize = 20
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = topBar

minimizeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
end)

local maximizeButton = Instance.new("TextButton")
maximizeButton.Size = UDim2.new(0, 30, 0, 30)
maximizeButton.Position = UDim2.new(1, -60, 0.5, -15)
maximizeButton.BackgroundTransparency = 1
maximizeButton.Text = "Ã¢â€“Â¡"
maximizeButton.TextColor3 = Color3.fromRGB(50, 50, 50)
maximizeButton.Font = Enum.Font.SourceSans
maximizeButton.TextSize = 18
maximizeButton.BorderSizePixel = 0
maximizeButton.Parent = topBar

maximizeButton.MouseButton1Click:Connect(function()
    print("")
end)

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -30, 0.5, -15)
closeButton.BackgroundTransparency = 1
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(0, 0, 0)
closeButton.Font = Enum.Font.SourceSans
closeButton.TextSize = 18
closeButton.BorderSizePixel = 0
closeButton.Parent = topBar

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

local inputFrame = Instance.new("ScrollingFrame")
inputFrame.Size = UDim2.new(1, -20, 0, 180)
inputFrame.Position = UDim2.new(0, 10, 0, 50)
inputFrame.BackgroundColor3 = Color3.fromRGB(245, 245, 245)
inputFrame.BorderSizePixel = 0
inputFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
inputFrame.ScrollBarThickness = 5
inputFrame.ScrollBarImageTransparency = 1
inputFrame.Parent = mainFrame

local lineFrame = Instance.new("Frame")
lineFrame.Size = UDim2.new(0, 50, 1, 0)
lineFrame.BackgroundColor3 = Color3.fromRGB(230, 230, 230)
lineFrame.BorderSizePixel = 0
lineFrame.Parent = inputFrame

local scriptBox = Instance.new("TextBox")
scriptBox.Size = UDim2.new(1, -60, 1, 0)
scriptBox.Position = UDim2.new(0, 60, 0, 0)
scriptBox.BackgroundTransparency = 1
scriptBox.Text = ""
scriptBox.TextColor3 = Color3.fromRGB(50, 50, 50)
scriptBox.TextSize = 16
scriptBox.Font = Enum.Font.Code
scriptBox.TextXAlignment = Enum.TextXAlignment.Left
scriptBox.TextYAlignment = Enum.TextYAlignment.Top
scriptBox.ClearTextOnFocus = false
scriptBox.MultiLine = true
scriptBox.TextWrapped = true
scriptBox.TextEditable = true
scriptBox.Parent = inputFrame

local lineNumbers = Instance.new("TextLabel")
lineNumbers.Size = UDim2.new(1, -10, 1, 0)
lineNumbers.BackgroundTransparency = 1
lineNumbers.Text = "1"
lineNumbers.Font = Enum.Font.Code
lineNumbers.TextSize = 16
lineNumbers.TextColor3 = Color3.fromRGB(150, 150, 150)
lineNumbers.TextXAlignment = Enum.TextXAlignment.Right
lineNumbers.TextYAlignment = Enum.TextYAlignment.Top
lineNumbers.Position = UDim2.new(0, 10, 0, 0)
lineNumbers.Parent = lineFrame

scriptBox:GetPropertyChangedSignal("Text"):Connect(function()
    local lines = scriptBox.Text:split("
")
    local lineText = ""
    for i = 1, #lines do
        lineText = lineText .. tostring(i) .. "
"
    end
    lineNumbers.Text = lineText

    inputFrame.CanvasSize = UDim2.new(0, 0, 0, #lines * 20)
end)

local buttonFrame = Instance.new("Frame")
buttonFrame.Size = UDim2.new(1, -20, 0, 50)
buttonFrame.Position = UDim2.new(0, 10, 0, 240)
buttonFrame.BackgroundTransparency = 1
buttonFrame.Parent = mainFrame

local buttonNames = {"EXE", "CLEAR", "INJECT"}
for i, name in ipairs(buttonNames) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 100, 1, 0)
    button.Position = UDim2.new(0, (i - 1) * 110, 0, 0)
    button.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
    button.Text = name
    button.TextColor3 = Color3.fromRGB(0, 0, 0)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.BorderSizePixel = 0
    button.Parent = buttonFrame

    if name == "EXE" then
        button.MouseButton1Click:Connect(function()
            local scriptText = scriptBox.Text
            local success, err = pcall(function()
                local func = loadstring(scriptText)
                if func then
                    func()
                else
                    error("Script could not be loaded.")
                end
            end)
            if not success then warn("Error: " .. err) end
        end)
    elseif name == "CLEAR" then
        button.MouseButton1Click:Connect(function()
            scriptBox.Text = ""
        end)
    elseif name == "INJECT" then
        button.MouseButton1Click:Connect(function()
            local scriptText = scriptBox.Text
            if scriptText and scriptText ~= "" then
                game.ReplicatedStorage.RemoteEvent:FireServer(scriptText)
            else
                warn("please inject a require if game backdoored/infected.")
            end
        end)
    end
end

local gui = Instance.new("ScreenGui")
gui.Name = "executor"
gui.Parent = game.CoreGui

local lel = Instance.new("ImageLabel")
lel.Size = UDim2.new(0.0, 100, 0.0, 100)
lel.Position = UDim2.new(-0.127000004, 0, 0.407999992, 0)
lel.BackgroundColor3 = Color3.new(0, 0, 0)
lel.ImageColor3 = Color3.new(1, 1, 1)
lel.Image = "rbxassetid://74522217830466"
lel.ImageTransparency = 0
lel.Parent = gui

lel.BackgroundTransparency = 1 

local Ring = Instance.new("ImageLabel")
Ring.Size = UDim2.new(1.0, 0, 1.0, 0)
Ring.Position = UDim2.new(0.0, 0, 0.0, 0)
Ring.BackgroundColor3 = Color3.new(0, 0, 0)
Ring.ImageColor3 = Color3.new(0, 0, 0)
Ring.Image = "rbxassetid://7102118272"
Ring.ImageTransparency = 0
Ring.Parent = lel

Ring.BackgroundTransparency = 1

local Orbit = Instance.new("ImageLabel")
Orbit.Size = UDim2.new(0.0, 21, 0.0, 21)
Orbit.Position = UDim2.new(0.0, 0, 0.0, 10)
Orbit.BackgroundColor3 = Color3.new(0, 0, 0)
Orbit.ImageColor3 = Color3.new(1, 1, 1)
Orbit.Image = "rbxassetid://74522217830466"
Orbit.ImageTransparency = 0
Orbit.Parent = Ring

Orbit.BackgroundTransparency = 1

lel:TweenPosition(UDim2.new(0.458, 0, 0.408, 0), "Out", "Linear", 0.4, false)
wait(3)
lel:TweenPosition(UDim2.new(0.0, 9, 0.0, 190), "Out", "Sine", 0.7, false)

while wait() do
Ring.Rotation = Ring.Rotation + 1
Orbit.Rotation = Orbit.Rotation - 1
end
end)

local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0.9, 25, 0.2, 0)
button2.Position = UDim2.new(0.0, 0, 0.0, 35)
button2.BackgroundColor3 = Color3.new(0, 0, 0)
button2.BorderColor3 = Color3.new(0, 0, 0)
button2.BorderSizePixel = 0
button2.Text = "project stigma ultimate" 
button2.BackgroundTransparency = 1
button2.TextColor3 = Color3.new(1, 1, 1)
button2.Parent = White
button2.TextSize = 14
button2.MouseButton1Click:Connect(function()
local gui = Instance.new("ScreenGui")
gui.Name = "Stigma ultimate Beta"
gui.Parent = game.CoreGui

local Ui = Instance.new("Frame")
Ui.Size = UDim2.new(0.0, 550, 0.0, 355)
Ui.Position = UDim2.new(0.0, 0, 0.0, 0)
Ui.BackgroundColor3 = Color3.new(1, 1, 1)
Ui.BorderColor3 = Color3.new(0, 0, 0)
Ui.BorderSizePixel = 0
Ui.Active = true
Ui.BackgroundTransparency = 1
Ui.Draggable = true
Ui.Parent = gui

local image = Instance.new("ImageLabel")
image.Size = UDim2.new(0.0, 549, 0.0, 357)
image.Position = UDim2.new(0.0, 0, 0.0, 0)
image.BackgroundColor3 = Color3.new(0, 0, 0)
image.ImageColor3 = Color3.new(1, 1, 1)
image.Image = "rbxassetid://73303145092022"
image.ImageTransparency = 0
image.Parent = Ui


image.BackgroundTransparency = 1

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.0, 369, 0.0, 210)
TextBox.Position = UDim2.new(0.0, 3, 0.0, 47)
TextBox.BackgroundColor3 = Color3.new(0, 0, 0)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 19
TextBox.Parent = Ui
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = failed
TextBox.MultiLine = true
TextBox.TextWrapped = true

local exe = Instance.new("TextButton")
exe.Size = UDim2.new(0.0, 36, 0.0, 71)
exe.Position = UDim2.new(0.0, 387, 0.0, 47)
exe.BackgroundColor3 = Color3.new(0, 0, 0)
exe.BorderColor3 = Color3.new(0, 0, 0)
exe.BorderSizePixel = 0
exe.Text = ""
exe.BackgroundTransparency = 1
exe.TextColor3 = Color3.new(255, 255, 255)
exe.Font = Enum.Font.Code
exe.Parent = Ui
exe.MouseButton1Click:Connect(function()
assert(loadstring(TextBox.Text))()
end)

local clea = Instance.new("TextButton")
clea.Size = UDim2.new(0.0, 36, 0.0, 79)
clea.Position = UDim2.new(0.0, 387, 0.0, 120)
clea.BackgroundColor3 = Color3.new(0, 0, 0)
clea.BorderColor3 = Color3.new(0, 0, 0)
clea.BorderSizePixel = 0
clea.Text = ""
clea.BackgroundTransparency = 1
clea.TextColor3 = Color3.new(255, 255, 255)
clea.Font = Enum.Font.Code
clea.Parent = Ui
clea.MouseButton1Click:Connect(function()
TextBox.Text = ""
end)

local X = Instance.new("TextButton")
X.Size = UDim2.new(0.0, 29, 0.0, 19)
X.Position = UDim2.new(0.0, 518, 0.0, 0)
X.BackgroundColor3 = Color3.new(0, 0, 0)
X.BorderColor3 = Color3.new(0, 0, 0)
X.BorderSizePixel = 0
X.Text = ""
X.BackgroundTransparency = 1
X.TextColor3 = Color3.new(255, 255, 255)
X.Font = Enum.Font.Code
X.Parent = Ui
X.MouseButton1Click:Connect(function()
Ui:Remove()
end)

local R6 = Instance.new("TextButton")
R6.Size = UDim2.new(0.0, 27, 0.0, 17)
R6.Position = UDim2.new(0.0, 485, 0.0, 22)
R6.BackgroundColor3 = Color3.new(0, 0, 0)
R6.BorderColor3 = Color3.new(0, 0, 0)
R6.BorderSizePixel = 0
R6.Text = ""
R6.BackgroundTransparency = 1
R6.TextColor3 = Color3.new(255, 255, 255)
R6.Font = Enum.Font.Code
R6.Parent = Ui

local ball = Instance.new("ImageLabel")
ball.Size = UDim2.new(0.0, 80, 0.0, 80)
ball.Position = UDim2.new(-0.127000004, 0, 0.407999992, 0)
ball.BackgroundColor3 = Color3.new(0, 0, 0)
ball.ImageColor3 = Color3.new(1, 1, 1)
ball.Image = "rbxassetid://100789107867635"
ball.ImageTransparency = 0
ball.Parent = gui

ball.BackgroundTransparency = 1

local Ring = Instance.new("ImageLabel")
Ring.Size = UDim2.new(1.0, 23, 1.0, 23)
Ring.Position = UDim2.new(0.0, -12, 0.0, -12)
Ring.BackgroundColor3 = Color3.new(0, 0, 0)
Ring.ImageColor3 = Color3.new(1, 1, 1)
Ring.Image = "rbxassetid://7102118272"
Ring.ImageTransparency = 0
Ring.Parent = ball

Ring.BackgroundTransparency = 1

local orbit = Instance.new("ImageLabel")
orbit.Size = UDim2.new(0.0, 22, 0.0, 22)
orbit.Position = UDim2.new(0.0, 0, 0.0, 10)
orbit.BackgroundColor3 = Color3.new(0, 0, 0)
orbit.ImageColor3 = Color3.new(1, 1, 1)
orbit.Image = "rbxassetid://133783965637328"
orbit.ImageTransparency = 0
orbit.Parent = Ring

orbit.BackgroundTransparency = 1

ball:TweenPosition(UDim2.new(0.458, 0, 0.408, 0), "Out", "Linear", 0.4, false)
wait(4)
ball:TweenPosition(UDim2.new(0.00, 11, 0.62, 0), "Out", "Sine", 0.7, false)

while wait() do
Ring.Rotation = Ring.Rotation +1.2
orbit.Rotation = orbit.Rotation - 1.2
end
end)

local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0.9, 25, 0.2, 0)
button3.Position = UDim2.new(0.0, 0, 0.0, 70)
button3.BackgroundColor3 = Color3.new(0, 0, 0)
button3.BorderColor3 = Color3.new(0, 0, 0)
button3.BorderSizePixel = 0
button3.Text = "k00pgui v2"
button3.BackgroundTransparency = 1
button3.TextColor3 = Color3.new(255, 255, 255)
button3.Parent = White
button3.TextSize = 14
button3.MouseButton1Click:Connect(function()

-- Gui to Lua

-- Version: v1.7

-- Instances:

local gui = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Black = Instance.new("Frame")
local Whitee = Instance.new("Frame")
local Scr = Instance.new("ScrollingFrame")
local Na = Instance.new("TextLabel")
local Nice = Instance.new("TextLabel")
local Decal = Instance.new("Frame")
local Decal1 = Instance.new("TextButton")
local Sky = Instance.new("Frame")
local Set = Instance.new("TextButton")

---Properties:

gui.Name = "K00PGUI v2 lua by LuaHaxx and team secret and k00pkidd original developer"
gui.Parent = game.CoreGui

Main.Size = UDim2.new(0.0, 400, 0.0, 400)
Main.Position = UDim2.new(0.0, 0, 0.0, 0)
Main.BackgroundColor3 = Color3.new(0, 0, 0)
Main.BorderColor3 = Color3.new(0, 1, 0)
Main.BorderSizePixel = 5
Main.Active = true
Main.BackgroundTransparency = 0 
Main.Draggable = true
Main.Parent = gui

Black.Size = UDim2.new(0.9, 40, 0.9, 40)
Black.Position = UDim2.new(0.0, 0, 0.0, 0)
Black.BackgroundColor3 = Color3.new(0, 0, 0)
Black.BorderColor3 = Color3.new(0, 0, 0)
Black.BorderSizePixel = 5
Black.Active = false
Black.BackgroundTransparency = 0.3
Black.Draggable = true
Black.Parent = Main

Whitee.Size = UDim2.new(0.0, 359, 0.0, 300)
Whitee.Position = UDim2.new(0.0, 20, 0.20, 0)
Whitee.BackgroundColor3 = Color3.new(0, 0, 0)
Whitee.BorderColor3 = Color3.new(0, 0, 0)
Whitee.BorderSizePixel = 0
Whitee.Active = false
Whitee.BackgroundTransparency = 0 
Whitee.Draggable = true
Whitee.Parent = Main

Scr.Size = UDim2.new(0.0, 359, 0.0, 300)
Scr.Position = UDim2.new(0.0, 20, 0.20, 0)
Scr.BackgroundColor3 = Color3.new(1, 1, 1)
Scr.BorderColor3 = Color3.new(0, 0, 0)
Scr.BorderSizePixel = 1
Scr.Parent = Main

Scr.BackgroundTransparency = 0.9

Na.Size = UDim2.new(0.9, 39, 0.0, 48)
Na.Position = UDim2.new(0.0, 0, 0.0, 0)
Na.BackgroundColor3 = Color3.new(0, 0, 0)
Na.BorderColor3 = Color3.new(0, 0, 0)
Na.BorderSizePixel = 0
Na.Text = "k00pgui v2 reborn"
Na.BackgroundTransparency = 0 
Na.TextColor3 = Color3.new(255, 255, 255)
Na.FontSize = Enum.FontSize.Size24
Na.Parent = Main

Nice.Size = UDim2.new(0.9, 44, 0.0, 45)
Nice.Position = UDim2.new(0.0, 0, 0.0, 29)
Nice.BackgroundColor3 = Color3.new(0, 0, 0)
Nice.BorderColor3 = Color3.new(0, 0, 0)
Nice.BorderSizePixel = 0
Nice.Text = "by k00pkiddAlt [team k00pkidd]"
Nice.BackgroundTransparency = 1
Nice.TextColor3 = Color3.new(255, 255, 255)
Nice.TextSize = 12
Nice.Parent = Main

Decal.Size = UDim2.new(0.0, 144, 0.0, 39)
Decal.Position = UDim2.new(0.0, 25, 0.0, 18)
Decal.BackgroundColor3 = Color3.new(0, 0, 0)
Decal.BorderColor3 = Color3.new(0, 1, 0)
Decal.BorderSizePixel = 3
Decal.Active = false
Decal.BackgroundTransparency = 0 
Decal.Draggable = true
Decal.Parent = Scr

Decal1.Size = UDim2.new(0.9, 15, 0.9, 4)
Decal1.Position = UDim2.new(0.0, 0, 0.0, 0)
Decal1.BackgroundColor3 = Color3.new(0, 0, 0)
Decal1.BorderColor3 = Color3.new(0, 0, 0)
Decal1.BorderSizePixel = 3
Decal1.Text = "Decal Spam"
Decal1.BackgroundTransparency = 0.2
Decal1.TextColor3 = Color3.new(255, 255, 255)
Decal1.Parent = Decal
Decal1.TextSize = 16

Sky.Size = UDim2.new(0.0, 144, 0.0, 39)
Sky.Position = UDim2.new(0.5, 8, 0.0, 18)
Sky.BackgroundColor3 = Color3.new(0, 0, 0)
Sky.BorderColor3 = Color3.new(0, 1, 0)
Sky.BorderSizePixel = 3
Sky.Active = false
Sky.BackgroundTransparency = 0 
Sky.Draggable = true
Sky.Parent = Scr

Set.Size = UDim2.new(0.9, 15, 0.9, 4)
Set.Position = UDim2.new(0.0, 0, 0.0, 0)
Set.BackgroundColor3 = Color3.new(0, 0, 0)
Set.BorderColor3 = Color3.new(0, 0, 0)
Set.BorderSizePixel = 3
Set.Text = "Set SkyBox"
Set.BackgroundTransparency = 0.2
Set.TextColor3 = Color3.new(255, 255, 255)
Set.Parent = Sky
Set.TextSize = 16
end)

local button4 = Instance.new("TextButton")
button4.Size = UDim2.new(0.9, 25, 0.2, 0)
button4.Position = UDim2.new(0.0, 0, 0.0, 105)
button4.BackgroundColor3 = Color3.new(0, 0, 0)
button4.BorderColor3 = Color3.new(0, 0, 0)
button4.BorderSizePixel = 0
button4.Text = "mlg gun"
button4.BackgroundTransparency = 1
button4.TextColor3 = Color3.new(255, 255, 255)
button4.Parent = White
button4.TextSize = 14
button4.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://rawscripts.net/raw/Client-Replication-the-ss-loadstring-script-27393"))()
end)

local button5 = Instance.new("TextButton")
button5.Size = UDim2.new(0.9, 25, 0.2, -0)
button5.Position = UDim2.new(0.0, 0, 0.0, 139)
button5.BackgroundColor3 = Color3.new(0, 0, 0)
button5.BorderColor3 = Color3.new(0, 0, 0)
button5.BorderSizePixel = 0
button5.Text = "Sheldoni"
button5.BackgroundTransparency = 1
button5.TextColor3 = Color3.new(255, 255, 255)
button5.TextSize = 14
button5.Parent = White
button5.MouseButton1Click:Connect(function()
local gui = Instance.new("ScreenGui")
gui.Name = "super update :0"
gui.Parent = game.CoreGui

local Ui = Instance.new("Frame")
Ui.Size = UDim2.new(0.0, 400, 0.0, 300)
Ui.Position = UDim2.new(0.2, 89, 0.0, - 24)
Ui.BackgroundColor3 = Color3.new(1, 1, 1)
Ui.BorderColor3 = Color3.new(0, 0, 0)
Ui.BorderSizePixel = 0
Ui.Active = true
Ui.BackgroundTransparency = 1
Ui.Draggable = true
Ui.Parent = gui

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(0.9, 37, 0.9, 28)
ImageLabel.Position = UDim2.new(0.0, 0, 0.0, 0)
ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
ImageLabel.Image = "rbxassetid://14902240136"
ImageLabel.ImageTransparency = 0.4
ImageLabel.Parent = Ui

ImageLabel.BackgroundTransparency = 1

local  close = Instance.new("TextButton")
 close.Size = UDim2.new(0.2, 0, 0.1, 0)
 close.Position = UDim2.new(0.7, 32, 0.0, 5)
 close.BackgroundColor3 = Color3.new(1, 1, 1)
 close.BorderColor3 = Color3.new(0, 0, 0)
 close.BorderSizePixel = 0
 close.Text = "Close"
 close.BackgroundTransparency = 0.5
 close.TextColor3 = Color3.new(0, 0, 0)
 close.Font = Enum.Font.Montserrat
 close.Parent = Ui
close.TextSize = 19
close.MouseButton1Click:Connect(function()
Ui:Remove()
end)

local Ser = Instance.new("TextBox")
Ser.Size = UDim2.new(0.3, 80, 0.1, 0)
Ser.Position = UDim2.new(0.2, 28, 0.0, 5)
Ser.BackgroundColor3 = Color3.new(1, 1, 1)
Ser.BorderColor3 = Color3.new(0, 0, 0)
Ser.BorderSizePixel = 0
Ser.Text = ""
Ser.TextColor3 = Color3.new(0, 0, 0)
Ser.BackgroundTransparency = 0.5
Ser.Font = Enum.Font.Montserrat
Ser.PlaceholderText = "Search His Thoughts"
Ser.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
Ser.TextColor3 = Color3.new(0, 0, 0)
Ser.TextSize = 19
Ser.Parent = Ui

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.9, 29, 0.7, 6)
TextBox.Position = UDim2.new(0.0, 4, 0.1, 9)
TextBox.BackgroundColor3 = Color3.new(1, 1, 1)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.PlaceholderText = "Execute His Thoughts"
TextBox.PlaceholderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.BackgroundTransparency = 0.5
TextBox.Font = Enum.Font.Montserrat
TextBox.TextSize = 17
TextBox.Parent = Ui
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = false
TextBox.MultiLine = true
TextBox.TextWrapped = true

local Exe = Instance.new("TextButton")
Exe.Size = UDim2.new(0.4, 19, 0.1, 0)
Exe.Position = UDim2.new(0.0, 4, 0.7, 50)
Exe.BackgroundColor3 = Color3.new(1, 1, 1)
Exe.BorderColor3 = Color3.new(0, 0, 0)
Exe.BorderSizePixel = 0
Exe.Text = "Execute"
Exe.BackgroundTransparency = 0.5
Exe.TextColor3 = Color3.new(0, 0, 0)
Exe.Font = Enum.Font.Montserrat
Exe.Parent = Ui
Exe.TextSize = 19
Exe.MouseButton1Click:Connect(function()
assert(loadstring(TextBox.Text))()
end)

local clea = Instance.new("TextButton")
clea.Size = UDim2.new(0.4, 50, 0.1, 0)
clea.Position = UDim2.new(0.4, 23, 0.7, 50)
clea.BackgroundColor3 = Color3.new(1, 1, 1)
clea.BorderColor3 = Color3.new(0, 0, 0)
clea.BorderSizePixel = 0
clea.Text = "Clear"
clea.BackgroundTransparency = 0.5
clea.TextColor3 = Color3.new(0, 0, 0)
clea.Font = Enum.Font.Montserrat
clea.Parent = Ui
clea.TextSize = 19
clea.MouseButton1Click:Connect(function()
TextBox.Text = ""
end)

local Scr = Instance.new("ScrollingFrame")
Scr.Size = UDim2.new(0.9, 29, 0.7, 6)
Scr.Position = UDim2.new(0.0, 4, 0.1, 9)
Scr.BackgroundColor3 = Color3.new(1, 1, 1)
Scr.BorderColor3 = Color3.new(0, 0, 0)
Scr.BorderSizePixel = 0
Scr.Parent = Ui
Scr.ScrollBarThickness = 0
Scr.Visible = false

Scr.BackgroundTransparency = 1

local Mrbean = Instance.new("TextButton")
Mrbean.Size = UDim2.new(0.9, 39, 0.0, 29)
Mrbean.Position = UDim2.new(0.0, 0, 0.0, 0)
Mrbean.BackgroundColor3 = Color3.new(1, 1, 1)
Mrbean.BorderColor3 = Color3.new(0, 0, 0)
Mrbean.BorderSizePixel = 0
Mrbean.Text = "Mrbean Admin"
Mrbean.BackgroundTransparency = 0.5
Mrbean.TextColor3 = Color3.new(0, 0, 0)
Mrbean.Font = Enum.Font.Montserrat
Mrbean.Parent = Scr
Mrbean.TextSize = 19
Mrbean.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Test4267/mrbean/refs/heads/main/hh"))()
end)

local Steve = Instance.new("TextButton")
Steve.Size = UDim2.new(0.9, 39, 0.0, 29)
Steve.Position = UDim2.new(0.0, 0, 0.0, 33)
Steve.BackgroundColor3 = Color3.new(1, 1, 1)
Steve.BorderColor3 = Color3.new(0, 0, 0)
Steve.BorderSizePixel = 0
Steve.Text = "Steve"
Steve.BackgroundTransparency = 0.5
Steve.TextColor3 = Color3.new(0, 0, 0)
Steve.Font = Enum.Font.Montserrat
Steve.Parent = Scr
Steve.TextSize = 19
Steve.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Test4267/steve/refs/heads/main/rare"))()
end)

local Infinite = Instance.new("TextButton")
Infinite.Size = UDim2.new(0.9, 39, 0.0, 29)
Infinite.Position = UDim2.new(0.0, 0, 0.0, 65)
Infinite.BackgroundColor3 = Color3.new(1, 1, 1)
Infinite.BorderColor3 = Color3.new(0, 0, 0)
Infinite.BorderSizePixel = 0
Infinite.Text = "Infinite yield ( client side )"
Infinite.BackgroundTransparency = 0.5
Infinite.TextColor3 = Color3.new(0, 0, 0)
Infinite.Font = Enum.Font.Montserrat
Infinite.Parent = Scr
Infinite.TextSize = 19
Infinite.MouseButton1Click:Connect(function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

local She = Instance.new("TextButton")

local R6 = Instance.new("TextButton")
R6.Size = UDim2.new(0.1, 39, 0.1, 0)
R6.Position = UDim2.new(0.0, 4, 0.7, 50)
R6.BackgroundColor3 = Color3.new(1, 1, 1)
R6.BorderColor3 = Color3.new(0, 0, 0)
R6.BorderSizePixel = 0
R6.Text = "Re"
R6.BackgroundTransparency = 0.5
R6.TextColor3 = Color3.new(0, 0, 0)
R6.Font = Enum.Font.Montserrat
R6.Parent = Ui
R6.TextSize = 19
R6.Visible = false
R6.MouseButton1Click:Connect(function()
if game.Players.LocalPlayer.Character then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
end
end)

local Ree = Instance.new("TextButton")
Ree.Size = UDim2.new(0.1, 39, 0.1, 0)
Ree.Position = UDim2.new(0.7, 34, 0.7, 50)
Ree.BackgroundColor3 = Color3.new(1, 1, 1)
Ree.BorderColor3 = Color3.new(0, 0, 0)
Ree.BorderSizePixel = 0
Ree.Text = "R6"
Ree.BackgroundTransparency = 0.5
Ree.TextColor3 = Color3.new(0, 0, 0)
Ree.Font = Enum.Font.Montserrat
Ree.Parent = Ui
Ree.TextSize = 19
Ree.Visible = false
Ree.MouseButton1Click:Connect(function()
loadstring(game:HttpGet("https://pastebin.com/raw/9BFcHqfK"))("Copyright ERROR_CODE ECCS Co")
end)

local ygcw = Instance.new("TextButton")
ygcw.Size = UDim2.new(0.5, 23, 0.1, 0)
ygcw.Position = UDim2.new(0.1, 47, 0.7, 50)
ygcw.BackgroundColor3 = Color3.new(1, 1, 1)
ygcw.BorderColor3 = Color3.new(0, 0, 0)
ygcw.BorderSizePixel = 0
ygcw.Text = "YgCwvn"
ygcw.BackgroundTransparency = 0.5
ygcw.TextColor3 = Color3.new(0, 0, 0)
ygcw.Font = Enum.Font.Montserrat
ygcw.Parent = Ui
ygcw.TextSize = 19
ygcw.Visible = false

local Shee = Instance.new("TextButton")
Shee.Size = UDim2.new(0.2, 20, 0.1, 0)
Shee.Position = UDim2.new(0.0, 4, 0.0, 5)
Shee.BackgroundColor3 = Color3.new(1, 1, 1)
Shee.BorderColor3 = Color3.new(1, 1, 1)
Shee.BorderSizePixel = 0
Shee.Text = "Sheldoni"
Shee.BackgroundTransparency = 0.5
Shee.TextColor3 = Color3.new(0, 0, 0)
Shee.Font = Enum.Font.Montserrat
Shee.Parent = Ui
Shee.TextSize = 19
Shee.Visible = false
Shee.MouseButton1Click:Connect(function()
clea.Visible = true
Exe.Visible = true
Scr.Visible = false
Shee.Visible = false
R6.Visible = false
Ree.Visible = false
ygcw.Visible = false
She.Visible = true
TextBox.Visible = true
end)

She.Size = UDim2.new(0.2, 20, 0.1, 0)
She.Position = UDim2.new(0.0, 4, 0.0, 5)
She.BackgroundColor3 = Color3.new(1, 1, 1)
She.BorderColor3 = Color3.new(1, 1, 1)
She.BorderSizePixel = 0
She.Text = "Sheldoni"
She.BackgroundTransparency = 0.5
She.TextColor3 = Color3.new(0, 0, 0)
She.Font = Enum.Font.Montserrat
She.Parent = Ui
She.TextSize = 19
She.MouseButton1Click:Connect(function()
clea.Visible = false
Exe.Visible = false
Scr.Visible = true
Shee.Visible = true
R6.Visible = true
Ree.Visible = true
ygcw.Visible = true
She.Visible = false
TextBox.Visible = false
end)
end)

local pas = Instance.new("Frame")
pas.Size = UDim2.new(0.9, 10, 0.0, 39)
pas.Position = UDim2.new(0.0, 9, 0.0, 9)
pas.BackgroundColor3 = Color3.new(0, 0, 0)
pas.BorderColor3 = Color3.new(0, 0, 0)
pas.BorderSizePixel = 1
pas.BackgroundTransparency = 0
pas.Parent = Main

local pas1 = Instance.new("TextBox")
pas1.Size = UDim2.new(0.9, 19, 0.9, 2)
pas1.Position = UDim2.new(0.0, 0, 0.0, 0)
pas1.BackgroundColor3 = Color3.new(0, 0, 0)
pas1.BorderColor3 = Color3.new(0, 0, 0)
pas1.BorderSizePixel = 0
pas1.Text = ""
pas1.TextColor3 = Color3.new(255, 255, 255)
pas1.BackgroundTransparency = 0
pas1.TextSize = 15
pas1.Parent = pas

local submit = Instance.new("TextButton")
submit.Size = UDim2.new(0.3, 49, 0.2, 19)
submit.Position = UDim2.new(0.0, 59, 0.0, 59)
submit.BackgroundColor3 = Color3.new(0, 0, 0)
submit.BorderColor3 = Color3.new(0, 0, 0)
submit.BorderSizePixel = 1
submit.Text = "Submit"
submit.BackgroundTransparency = 0 
submit.TextColor3 = Color3.new(255, 255, 255)
submit.Parent = Main
submit.TextSize = 14
submit.MouseButton1Click:Connect(function()
local pas1 = pas1.Text
    if pas1 == "team anonymous" then
pas:Remove()
Script.Visible = true
submit:Remove()
end
end)

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 5)
UICorner.Parent = submit
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "exser ss",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/gitluau/luauexser/refs/heads/main/pHzp8uG1PO962o6qucrlP3AJy17eV3B.lua"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "jeff the killer jumpscare not recommended",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Jeff-The-Killer-JumpScare-27384"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "obama jumpscare",
	Callback = function()
      		

local gui = Instance.new("ScreenGui")
gui.Name = "Obama update by Team secret"
gui.Parent = game.CoreGui

local jump = Instance.new("ImageLabel")
jump.Size = UDim2.new(0.9, 150, 0.9, 150)
jump.Position = UDim2.new(0.0, 0, 0.0, -59)
jump.BackgroundColor3 = Color3.new(0, 0, 0)
jump.ImageColor3 = Color3.new(1, 1, 1)
jump.Image = "rbxassetid://5643866"
jump.ImageTransparency = 0
jump.Parent = gui

jump.BackgroundTransparency = 0 

local jumpscareSound = Instance.new("Sound", workspace)
jumpscareSound.Name = "JumpscareSound"
jumpscareSound.Volume = 999
jumpscareSound.Pitch = 1
jumpscareSound.SoundId = "rbxassetid://9067444671"
jumpscareSound:play()

wait(5.7)
jump.ImageTransparency = 0.1
wait(0.02)
jump.ImageTransparency = 0.2
wait(0.02)
jump.ImageTransparency = 0.3
wait(0.02)
jump.ImageTransparency = 0.4
wait(0.02)
jump.ImageTransparency = 0.5
wait(0.02)
jump.ImageTransparency = 0.6
wait(0.02)
jump.ImageTransparency = 0.7
wait(0.02)
jump.ImageTransparency = 0.8
wait(0.02)
jump.ImageTransparency = 0.9
wait(0.02)
jump.ImageTransparency = 1
wait(3.5)
jump.Image = "rbxassetid://17397008583"
wait(0.01)
jump.ImageTransparency = 0.9
wait(0.01)
jump.ImageTransparency = 0.8
wait(0.01)
jump.ImageTransparency = 0.7
wait(0.01)
jump.ImageTransparency = 0.6
wait(0.01)
jump.ImageTransparency = 0.5
wait(0.01)
jump.ImageTransparency = 0.4
wait(0.01)
jump.ImageTransparency = 0.3
wait(0.01)
jump.ImageTransparency = 0.2
wait(0.01)
jump.ImageTransparency = 0.1
wait(0.01)
jump.ImageTransparency = 0

local jumpscareSound = Instance.new("Sound", workspace)
jumpscareSound.Name = "JumpscareSound"
jumpscareSound.Volume = 7
jumpscareSound.Pitch = 1
jumpscareSound.SoundId = "rbxassetid://131902818695416"
jumpscareSound:play()
jumpscareSound.Looped = true

while wait() do
wait(2.9)
jump.Image = "rbxassetid://17397008583"
wait(0.9)
jump.Image = "rbxassetid://2050833946"
local jumpscareSound = Instance.new("Sound", workspace)
jumpscareSound.Name = "JumpscareSound"
jumpscareSound.Volume = 15
jumpscareSound.SoundId = "rbxassetid://5547866547"
jumpscareSound:play()
wait(1)
jump.Image = "rbxassetid://17397008583"
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "rc7 require",
	Callback = function()
      		local gui = Instance.new("ScreenGui")
gui.Name = "patrickGui"
gui.Parent = game.CoreGui

local lock = Instance.new("Frame")
lock.Size = UDim2.new(0.4, 19, 0.9, 19)
lock.Position = UDim2.new(0.0, 0, 0.0, 0)
lock.BackgroundColor3 = Color3.new(1, 1, 1)
lock.BorderColor3 = Color3.new(0, 0, 0)
lock.BorderSizePixel = 0
lock.Active = true
lock.BackgroundTransparency = 1
lock.Draggable = true
lock.Parent = gui

local rc7 = Instance.new("Frame")
rc7.Size = UDim2.new(0.9, 33, 0.9, 30)
rc7.Position = UDim2.new(0.0, 0, 0.0, 0)
rc7.BackgroundColor3 = Color3.new(1, 1, 1)
rc7.BorderColor3 = Color3.new(0, 0, 0)
rc7.BorderSizePixel = 0
rc7.Active = false
rc7.BackgroundTransparency = 1
rc7.Draggable = true
rc7.Parent = lock
rc7.Visible = false

local ImageLabel = Instance.new("ImageLabel")
ImageLabel.Size = UDim2.new(0.9, 31, 0.9, 29)
ImageLabel.Position = UDim2.new(0.0, 0, 0.0, 0)
ImageLabel.BackgroundColor3 = Color3.new(0, 0, 0)
ImageLabel.ImageColor3 = Color3.new(1, 1, 1)
ImageLabel.Image = "rbxassetid://87234781699544"
ImageLabel.ImageTransparency = 0
ImageLabel.Parent = rc7

ImageLabel.BackgroundTransparency = 1

local TextBox = Instance.new("TextBox")
TextBox.Size = UDim2.new(0.8, 2, 0.6, 14)
TextBox.Position = UDim2.new(0.0, 9, 0.1, 8)
TextBox.BackgroundColor3 = Color3.new(0, 0, 0)
TextBox.BorderColor3 = Color3.new(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Text = ""
TextBox.TextColor3 = Color3.new(0, 0, 0)
TextBox.BackgroundTransparency = 1
TextBox.Font = Enum.Font.Code
TextBox.TextSize = 15
TextBox.Parent = rc7
TextBox.TextYAlignment = Enum.TextYAlignment.Top
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.ClearTextOnFocus = failed
TextBox.MultiLine = true
TextBox.TextWrapped = true

local exe = Instance.new("TextButton")
exe.Size = UDim2.new(0.2, 21, 0.0, 23)
exe.Position = UDim2.new(0.2, 30, 0.7, 19)
exe.BackgroundColor3 = Color3.new(0, 0, 0)
exe.BorderColor3 = Color3.new(0, 0, 0)
exe.BorderSizePixel = 0
exe.Text = ""
exe.BackgroundTransparency = 1
exe.TextColor3 = Color3.new(0, 0, 0)
exe.Font = Enum.Font.Code
exe.Parent = rc7
exe.MouseButton1Click:Connect(function()
assert(loadstring(TextBox.Text))()
end)

local clea = Instance.new("TextButton")
clea.Size = UDim2.new(0.2, 22, 0.0, 23)
clea.Position = UDim2.new(0.5, 21, 0.7, 19)
clea.BackgroundColor3 = Color3.new(0, 0, 0)
clea.BorderColor3 = Color3.new(0, 0, 0)
clea.BorderSizePixel = 0
clea.Text = ""
clea.BackgroundTransparency = 1
clea.TextColor3 = Color3.new(255, 255, 255)
clea.Font = Enum.Font.Code
clea.Parent = rc7
clea.MouseButton1Click:Connect(function()
TextBox.Text = ""
end)

local roe = Instance.new("TextButton")
roe.Size = UDim2.new(0.1, 0, 0.0, 25)
roe.Position = UDim2.new(0.8, 20, 0.7, 26)
roe.BackgroundColor3 = Color3.new(0, 0, 0)
roe.BorderColor3 = Color3.new(0, 0, 0)
roe.BorderSizePixel = 0
roe.Text = ""
roe.BackgroundTransparency = 1
roe.TextColor3 = Color3.new(255, 255, 255)
roe.Font = Enum.Font.Code
roe.Parent = rc7
roe.MouseButton1Click:Connect(function()
loadstring(game:GetObjects("rbxassetid://364364477")[1].Source)()
end)

local X = Instance.new("TextButton")
X.Size = UDim2.new(0.1, 0, 0.1, 0)
X.Position = UDim2.new(0.9, 0, 0.0, 0)
X.BackgroundColor3 = Color3.new(0, 0, 0)
X.BorderColor3 = Color3.new(0, 0, 0)
X.BorderSizePixel = 0
X.Text = ""
X.BackgroundTransparency = 1
X.TextColor3 = Color3.new(0, 0, 0)
X.Font = Enum.Font.Code
X.Parent = rc7
X.MouseButton1Click:Connect(function()
lock:Remove()
end)

local lock1 = Instance.new("ImageLabel")
lock1.Size = UDim2.new(0.9, 33, 0.9, 30)
lock1.Position = UDim2.new(0.0, 0, 0.0, 0)
lock1.BackgroundColor3 = Color3.new(0, 0, 0)
lock1.ImageColor3 = Color3.new(1, 1, 1)
lock1.Image = "rbxassetid://90888446221641"
lock1.ImageTransparency = 0
lock1.Parent = lock

lock1.BackgroundTransparency = 1

local user = Instance.new("TextBox")
user.Size = UDim2.new(0.4, 14, 0.0, 19)
user.Position = UDim2.new(0.2, 0, 0.3, 28)
user.BackgroundColor3 = Color3.new(0, 0, 0)
user.BorderColor3 = Color3.new(0, 0, 0)
user.BorderSizePixel = 0
user.Text = ""
user.TextColor3 = Color3.new(1, 1, 1)
user.BackgroundTransparency = 1
user.Font = Enum.Font.Code
user.TextSize = 18
user.Parent = lock1
user.TextWrapped = true

local pass = Instance.new("TextLabel")
pass.Size = UDim2.new(0.4, 14, 0.0, 19)
pass.Position = UDim2.new(0.2, 0, 0.4, 22)
pass.BackgroundColor3 = Color3.new(0, 0, 0)
pass.BorderColor3 = Color3.new(0, 0, 0)
pass.BorderSizePixel = 0
pass.Text = "Free pass"
pass.BackgroundTransparency = 1
pass.TextColor3 = Color3.new(1, 1, 1)
pass.Font = Enum.Font.Code
pass.Parent = lock1
pass.TextSize = 18
pass.TextWrapped = true

local submit = Instance.new("TextButton")
submit.Size = UDim2.new(0.3, 0, 0.0, 21)
submit.Position = UDim2.new(0.2, 20, 0.5, 18)
submit.BackgroundColor3 = Color3.new(0, 0, 0)
submit.BorderColor3 = Color3.new(0, 0, 0)
submit.BorderSizePixel = 0
submit.Text = ""
submit.BackgroundTransparency = 1
submit.TextColor3 = Color3.new(255, 255, 255)
submit.Font = Enum.Font.Code
submit.Parent = lock1
submit.MouseButton1Click:Connect(function()
lock1.Visible = false
rc7.Visible = true
end)

local Xlock = Instance.new("TextButton")
Xlock.Size = UDim2.new(0.1, 0, 0.1, 0)
Xlock.Position = UDim2.new(0.9, 0, 0.0, 0)
Xlock.BackgroundColor3 = Color3.new(0, 0, 0)
Xlock.BorderColor3 = Color3.new(0, 0, 0)
Xlock.BorderSizePixel = 0
Xlock.Text = ""
Xlock.BackgroundTransparency = 1
Xlock.TextColor3 = Color3.new(255, 255, 255)
Xlock.Font = Enum.Font.Code
Xlock.Parent = lock1
Xlock.MouseButton1Click:Connect(function()
lock:Remove()
end)
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "ronald McDonald's🍟🍔🍦",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Spooky-Scary-MCDonalds-Script-28270"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Lua Hammer",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/Prison-Life-Lua-Hammer-18934"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "r15 to r6",
	Callback = function()
      		loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-from-R15-to-R6-9639"))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "shedletsky",
	Callback = function()
      		s = Instance.new("Sky")
s.Name = "SKY"
s.SkyboxBk = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxDn = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxFt = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxLf = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxRt = "http://www.roblox.com/asset/?id=172423468"
s.SkyboxUp = "http://www.roblox.com/asset/?id=172423468"
s.Parent = game.Lighting
Spooky = Instance.new("Sound", game.Workspace)
Spooky.Name = "Spooky"
Spooky.SoundId = "rbxassetid://93240326658391"
Spooky.Volume = 1
Spooky.Looped = true
Spooky.Pitch = 1
Spooky:Play()
local ID =18889618673 --id here
t1 = "http://www.roblox.com/asset/?id=18343405871"
t2 = "http://www.roblox.com/asset/?id=18343405871"
t3 = "http://www.roblox.com/asset/?id=18343405871"
 
local p = game.Players:GetChildren()
local w = game.Workspace:GetChildren()
 
for i,v in pairs(p) do
pe = Instance.new("ParticleEmitter", v.Character.Head)
pe.Texture = t3
pe.VelocitySpread = 5
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "rocky2u admin",
	Callback = function()
      		str_srce = "14682300022" loadstring(game:GetObjects("rbxassetid://"..str_srce)[1].Source)()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "china",
	Callback = function()
      		char = game:service'Players'.LocalPlayer.Character
m = game:service'Players'.LocalPlayer:GetMouse()

-----------------------------
function Aesthetics()


    char.Head.face.Texture = "http://www.roblox.com/asset/?id=111865733232046"
end

Aesthetics()


m.KeyDown:connect(function(k)
if k == "z" then
char.Head.face.Texture = "http://www.roblox.com/asset/?id=111865733232046"
end
end)
local song = Instance.new("Sound")
song.Volume = "0.5"
song.SoundId = "rbxassetid://123933240720384"
song.Parent = game.Chat
song.Looped = false
song:Play()
for i,v in pairs(workspace:GetDescendants()) do 
    if v:IsA("WedgePart") then 
        local decal = Instance.new("Decal")
        decal.Texture = "http://www.roblox.com/asset/?id=124872714710239"
        decal.Face = "Front"
        decal.Parent = v

        local decal = Instance.new("Decal")
        decal.Texture = "http://www.roblox.com/asset/?id=111616848"

        decal.Face = "Back"
        decal.Parent = v 

        local decal = Instance.new("Decal")
        decal.Texture = "http://www.roblox.com/asset/?id=111616664"

        decal.Face = "Bottom"
        decal.Parent = v 
        local decal = Instance.new("Decal")
        decal.Texture = "http://www.roblox.com/asset/?id=112188192"

        decal.Face = "Left"
        decal.Parent = v 
        local decal = Instance.new("Decal")
        decal.Texture = "http://www.roblox.com/asset/?id=111616722"

        decal.Face = "Right"
        decal.Parent = v 
        local decal = Instance.new("Decal")
        decal.Texture = "http://www.roblox.com/asset/?id=111616450"

        decal.Face = "Top"
        decal.Parent = v 
    end
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "polaria lua",
	Callback = function()
      		local gui = Instance.new("ScreenGui")
gui.Name = "Polaria 1.5"
gui.Parent = game.CoreGui

local Ui = Instance.new("Frame")
Ui.Size = UDim2.new(0.6, 12, 0.9, 69)
Ui.Position = UDim2.new(0.2, 0, 0.0, 0)
Ui.BackgroundColor3 = Color3.new(0, 0, 0)
Ui.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
Ui.BorderSizePixel = 3
Ui.Active = true
Ui.BackgroundTransparency = 0 
Ui.Draggable = true
Ui.Parent = gui

local TextLabel = Instance.new("TextLabel")
TextLabel.Size = UDim2.new(0.9, 45, 0.0, 26)
TextLabel.Position = UDim2.new(0.0, 0, 0.0, 0)
TextLabel.BackgroundColor3 = Color3.new(0, 0, 0)
TextLabel.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
TextLabel.BorderSizePixel = 3
TextLabel.Text = ""
TextLabel.BackgroundTransparency = 0 
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.Font = Enum.Font.Code
TextLabel.Parent = Ui
TextLabel.TextSize = 19

local text1 = Instance.new("TextLabel")
text1.Size = UDim2.new(0.1, 34, 0.2, 0)
text1.Position = UDim2.new(0.0, 0, 0.3, 3)
text1.BackgroundColor3 = Color3.new(0, 0, 0)
text1.BorderColor3 = Color3.new(0, 0, 0)
text1.BorderSizePixel = 0
text1.Text = "POLARIA"
text1.BackgroundTransparency = 0 
text1.TextColor3 = Color3.new(255, 255, 255)
text1.Font = Enum.Font.Code
text1.Parent = TextLabel
text1.TextSize = 19

local X = Instance.new("TextButton")
X.Size = UDim2.new(0.0, 28, 0.9, 2)
X.Position = UDim2.new(0.9, 18, 0.0, 0)
X.BackgroundColor3 = Color3.new(0, 0, 0)
X.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
X.BorderSizePixel = 3
X.Text = "X"
X.BackgroundTransparency = 0 
X.TextColor3 = Color3.new(255, 255, 255)
X.Font = Enum.Font.Code
X.Parent = TextLabel
X.TextSize = 25

local idk = Instance.new("Frame")
idk.Size = UDim2.new(0.0, 28, 0.9, 2)
idk.Position = UDim2.new(0.8, 32, 0.0, 0)
idk.BackgroundColor3 = Color3.new(0, 0, 0)
idk.BorderColor3 = Color3.new(0.5, 0, 1.0)
idk.BorderSizePixel = 3
idk.Active = false
idk.BackgroundTransparency = 0 
idk.Draggable = true
idk.Parent = TextLabel

local so = Instance.new("Frame")
so.Size = UDim2.new(0.2, 7, 0.5, 1)
so.Position = UDim2.new(0.3, 0, 0.2, 0)
so.BackgroundColor3 = Color3.new(0, 0, 0)
so.BorderColor3 = Color3.new(1, 1, 1)
so.BorderSizePixel = 1
so.Active = false
so.BackgroundTransparency = 0 
so.Draggable = true
so.Parent = idk

local Kl = Instance.new("TextButton")
Kl.Size = UDim2.new(0.0, 28, 0.9, 2)
Kl.Position = UDim2.new(0.8, 2, 0.0, 0)
Kl.BackgroundColor3 = Color3.new(0, 0, 0)
Kl.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
Kl.BorderSizePixel = 3
Kl.Text = "–"
Kl.BackgroundTransparency = 0 
Kl.TextColor3 = Color3.new(255, 255, 255)
Kl.Font = Enum.Font.Code
Kl.Parent = TextLabel
Kl.TextSize = 24

local Home = Instance.new("TextButton")
Home.Size = UDim2.new(0.2, 9, 0.0, 29)
Home.Position = UDim2.new(0.0, 0, 0.0, 29)
Home.BackgroundColor3 = Color3.new(0, 0, 0)
Home.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
Home.BorderSizePixel = 3
Home.Text = "Home"
Home.BackgroundTransparency = 0 
Home.TextColor3 = Color3.new(255, 255, 255)
Home.Font = Enum.Font.Code
Home.Parent = Ui
Home.TextSize = 20

local server = Instance.new("TextButton")
server.Size = UDim2.new(0.2, 25, 0.0, 29)
server.Position = UDim2.new(0.1, 58, 0.0, 29)
server.BackgroundColor3 = Color3.new(0, 0, 0)
server.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
server.BorderSizePixel = 3
server.Text = "Server/Local"
server.BackgroundTransparency = 0 
server.TextColor3 = Color3.new(255, 255, 255)
server.Font = Enum.Font.Code
server.Parent = Ui
server.TextSize = 18

local scr = Instance.new("TextButton")
scr.Size = UDim2.new(0.2, 0, 0.0, 29)
scr.Position = UDim2.new(0.3, 85, 0.0, 29)
scr.BackgroundColor3 = Color3.new(0, 0, 0)
scr.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
scr.BorderSizePixel = 3
scr.Text = "Scripts"
scr.BackgroundTransparency = 0 
scr.TextColor3 = Color3.new(255, 255, 255)
scr.Font = Enum.Font.Code
scr.Parent = Ui
scr.TextSize = 19

local exe = Instance.new("TextButton")
exe.Size = UDim2.new(0.1, 34, 0.0, 29)
exe.Position = UDim2.new(0.6, 39, 0.0, 29)
exe.BackgroundColor3 = Color3.new(0, 0, 0)
exe.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
exe.BorderSizePixel = 3
exe.Text = "Executor"
exe.BackgroundTransparency = 0 
exe.TextColor3 = Color3.new(255, 255, 255)
exe.Font = Enum.Font.Code
exe.Parent = Ui
exe.TextSize = 19

local out = Instance.new("TextButton")
out.Size = UDim2.new(0.1, 15, 0.0, 29)
out.Position = UDim2.new(0.8, 30, 0.0, 29)
out.BackgroundColor3 = Color3.new(0, 0, 0)
out.BorderColor3 = Color3.new(0.5, 0, 1.0)
out.BorderSizePixel = 3
out.Text = "Output"
out.BackgroundTransparency = 0 
out.TextColor3 = Color3.new(255, 255, 255)
out.Font = Enum.Font.Code
out.Parent = Ui
out.TextSize = 19

local Box = Instance.new("TextBox")
Box.Size = UDim2.new(0.9, 35, 0.6, 15)
Box.Position = UDim2.new(0.0, 5, 0.2, 0)
Box.BackgroundColor3 = Color3.new(0, 0, 0)
Box.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
Box.BorderSizePixel = 3
Box.Text = "Made by Executor scripts"
Box.TextColor3 = Color3.new(1, 1, 1)
Box.BackgroundTransparency = 0
Box.Font = Enum.Font.Code
Box.TextSize = 15
Box.Parent = Ui
Box.TextYAlignment = Enum.TextYAlignment.Top
Box.TextXAlignment = Enum.TextXAlignment.Left
Box.ClearTextOnFocus = failed
Box.TextWrapped = true

local execu = Instance.new("TextButton")
execu.Size = UDim2.new(0.2, 0, 0.1, 0)
execu.Position = UDim2.new(0.0, 5, 0.8, 27)
execu.BackgroundColor3 = Color3.new(0, 0, 0)
execu.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
execu.BorderSizePixel = 3
execu.Text = "Execute"
execu.BackgroundTransparency = 0 
execu.TextColor3 = Color3.new(255, 255, 255)
execu.Font = Enum.Font.Code
execu.Parent = Ui
execu.TextSize = 19

local clea = Instance.new("TextButton")
clea.Size = UDim2.new(0.2, 0, 0.1, 0)
clea.Position = UDim2.new(0.2, 19, 0.8, 27)
clea.BackgroundColor3 = Color3.new(0, 0, 0)
clea.BorderColor3 = Color3.new(0.5, 0, 1.0, 0)
clea.BorderSizePixel = 3
clea.Text = "Clear"
clea.BackgroundTransparency = 0 
clea.TextColor3 = Color3.new(255, 255, 255)
clea.Font = Enum.Font.Code
clea.Parent = Ui
clea.TextSize = 19

local Oppk = Instance.new("TextLabel")
Oppk.Size = UDim2.new(0.2, 0, 0.1, 0)
Oppk.Position = UDim2.new(0.5, 9, 0.8, 27)
Oppk.BackgroundColor3 = Color3.new(0, 0, 0)
Oppk.BorderColor3 = Color3.new(0, 0, 0)
Oppk.BorderSizePixel = 0
Oppk.Text = "Execute on :"
Oppk.BackgroundTransparency = 1
Oppk.TextColor3 = Color3.new(255, 255, 255)
Oppk.Font = Enum.Font.Code
Oppk.Parent = Ui
Oppk.TextSize = 20

local ll = Instance.new("TextLabel")
ll.Size = UDim2.new(0.3, 0, 0.1, 0)
ll.Position = UDim2.new(0.7, 0, 0.8, 27)
ll.BackgroundColor3 = Color3.new(0, 0, 0)
ll.BorderColor3 = Color3.new(0, 0, 0)
ll.BorderSizePixel = 0
ll.Text = "Server"
ll.BackgroundTransparency = 1
ll.TextColor3 = Color3.new(0, 1, 0)
ll.Font = Enum.Font.Code
ll.Parent = Ui
ll.TextSize = 19

---Scripts:

X.MouseButton1Click:Connect(function()
Ui:remove()
end)

clea.MouseButton1Click:Connect(function()
Box.Text = ""
end)

execu.MouseButton1Click:Connect(function()
assert(loadstring(Box.Text))()
end)
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "lazytown",
	Callback = function()
      		 imageOne = "http://www.roblox.com/asset/?id=110240864101518"
imageTwo = "http://www.roblox.com/asset/?id=110240864101518"
imageThree = "http://www.roblox.com/asset/?id=110240864101518"
imageFour = "http://www.roblox.com/asset/?id=110240864101518"
imageFive = "http://www.roblox.com/asset/?id=110240864101518"
imageSix = "http://www.roblox.com/asset/?id=110240864101518"
imageSeven = "http://www.roblox.com/asset/?id=110240864101518"
imageEight = "http://www.roblox.com/asset/?id=110240864101518"
Spooky = Instance.new("Sound", game.Workspace)
Spooky.Name = "Spooky"
Spooky.SoundId = "rbxassetid://18988381150"
Spooky.Volume = 1500
Spooky.Looped = true
Spooky:Play()
Sky = Instance.new("Sky", game.Lighting)
Sky.SkyboxBk = imageOne
Sky.SkyboxDn = imageOne
Sky.SkyboxFt = imageOne
Sky.SkyboxLf = imageOne
Sky.SkyboxRt = imageOne
Sky.SkyboxUp = imageOne
while true do
    Sky.SkyboxBk = imageOne
    Sky.SkyboxDn = imageOne
    Sky.SkyboxFt = imageOne
    Sky.SkyboxLf = imageOne
    Sky.SkyboxRt = imageOne
    Sky.SkyboxUp = imageOne
    wait(0.25)
    Sky.SkyboxBk = imageTwo
    Sky.SkyboxDn = imageTwo
    Sky.SkyboxFt = imageTwo
    Sky.SkyboxLf = imageTwo
    Sky.SkyboxRt = imageTwo
    Sky.SkyboxUp = imageTwo
    wait(0.25)
    Sky.SkyboxBk = imageThree
    Sky.SkyboxDn = imageThree
    Sky.SkyboxFt = imageThree
    Sky.SkyboxLf = imageThree
    Sky.SkyboxRt = imageThree
    Sky.SkyboxUp = imageThree
    wait(0.25)
    Sky.SkyboxBk = imageFour
    Sky.SkyboxDn = imageFour
    Sky.SkyboxFt = imageFour
    Sky.SkyboxLf = imageFour
    Sky.SkyboxRt = imageFour
    Sky.SkyboxUp = imageFour
    wait(0.25)
    Sky.SkyboxBk = imageFive
    Sky.SkyboxDn = imageFive
    Sky.SkyboxFt = imageFive
    Sky.SkyboxLf = imageFive
    Sky.SkyboxRt = imageFive
    Sky.SkyboxUp = imageFive
    wait(0.25)
    Sky.SkyboxBk = imageSix
    Sky.SkyboxDn = imageSix
    Sky.SkyboxFt = imageSix
    Sky.SkyboxLf = imageSix
    Sky.SkyboxRt = imageSix
    Sky.SkyboxUp = imageSix
    wait(0.25)
    Sky.SkyboxBk = imageSeven
    Sky.SkyboxDn = imageSeven
    Sky.SkyboxFt = imageSeven
    Sky.SkyboxLf = imageSeven
    Sky.SkyboxRt = imageSeven
    Sky.SkyboxUp = imageSeven
    wait(0.25)
    Sky.SkyboxBk = imageEight
    Sky.SkyboxDn = imageEight
    Sky.SkyboxFt = imageEight
    Sky.SkyboxLf = imageEight
    Sky.SkyboxRt = imageEight
    Sky.SkyboxUp = imageEight
    wait(0.25)
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "spookyify",
	Callback = function()
      		imageOne = "http://www.roblox.com/asset/?id=169585459"
imageTwo = "http://www.roblox.com/asset/?id=169585475"
imageThree = "http://www.roblox.com/asset/?id=169585485"
imageFour = "http://www.roblox.com/asset/?id=169585502"
imageFive = "http://www.roblox.com/asset/?id=169585515"
imageSix = "http://www.roblox.com/asset/?id=169585502"
imageSeven = "http://www.roblox.com/asset/?id=169585485"
imageEight = "http://www.roblox.com/asset/?id=169585475"
Spooky = Instance.new("Sound", game.Workspace)
Spooky.Name = "Spooky"
Spooky.SoundId = "rbxassetid://4808613510"
Spooky.Volume = 1500
Spooky.Looped = true
Spooky:Play()
Sky = Instance.new("Sky", game.Lighting)
Sky.SkyboxBk = imageOne
Sky.SkyboxDn = imageOne
Sky.SkyboxFt = imageOne
Sky.SkyboxLf = imageOne
Sky.SkyboxRt = imageOne
Sky.SkyboxUp = imageOne
while true do
    Sky.SkyboxBk = imageOne
    Sky.SkyboxDn = imageOne
    Sky.SkyboxFt = imageOne
    Sky.SkyboxLf = imageOne
    Sky.SkyboxRt = imageOne
    Sky.SkyboxUp = imageOne
    wait(0.25)
    Sky.SkyboxBk = imageTwo
    Sky.SkyboxDn = imageTwo
    Sky.SkyboxFt = imageTwo
    Sky.SkyboxLf = imageTwo
    Sky.SkyboxRt = imageTwo
    Sky.SkyboxUp = imageTwo
    wait(0.25)
    Sky.SkyboxBk = imageThree
    Sky.SkyboxDn = imageThree
    Sky.SkyboxFt = imageThree
    Sky.SkyboxLf = imageThree
    Sky.SkyboxRt = imageThree
    Sky.SkyboxUp = imageThree
    wait(0.25)
    Sky.SkyboxBk = imageFour
    Sky.SkyboxDn = imageFour
    Sky.SkyboxFt = imageFour
    Sky.SkyboxLf = imageFour
    Sky.SkyboxRt = imageFour
    Sky.SkyboxUp = imageFour
    wait(0.25)
    Sky.SkyboxBk = imageFive
    Sky.SkyboxDn = imageFive
    Sky.SkyboxFt = imageFive
    Sky.SkyboxLf = imageFive
    Sky.SkyboxRt = imageFive
    Sky.SkyboxUp = imageFive
    wait(0.25)
    Sky.SkyboxBk = imageSix
    Sky.SkyboxDn = imageSix
    Sky.SkyboxFt = imageSix
    Sky.SkyboxLf = imageSix
    Sky.SkyboxRt = imageSix
    Sky.SkyboxUp = imageSix
    wait(0.25)
    Sky.SkyboxBk = imageSeven
    Sky.SkyboxDn = imageSeven
    Sky.SkyboxFt = imageSeven
    Sky.SkyboxLf = imageSeven
    Sky.SkyboxRt = imageSeven
    Sky.SkyboxUp = imageSeven
    wait(0.25)
    Sky.SkyboxBk = imageEight
    Sky.SkyboxDn = imageEight
    Sky.SkyboxFt = imageEight
    Sky.SkyboxLf = imageEight
    Sky.SkyboxRt = imageEight
    Sky.SkyboxUp = imageEight
    wait(0.25)
end
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
end});
