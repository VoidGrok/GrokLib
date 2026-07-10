local CoreGui = game:GetService("CoreGui")

if CoreGui:FindFirstChild("VOIDLIB") then
    local CoreGui2 = game:GetService("CoreGui")

    if CoreGui2:FindFirstChild("ScreenGui") then
        local CoreGui3 = game:GetService("CoreGui")
        CoreGui3.VOIDLIB:Destroy()
        local CoreGui4 = game:GetService("CoreGui")
        CoreGui4.ScreenGui:Destroy()
    end
end

if _G.Theme == "Red" then
    _G.Primary = Color3.fromRGB(255, 30, 50)
    _G.Dark = Color3.fromRGB(90, 10, 20)
else
    if _G.Theme == "Cyan" then
        _G.Primary = Color3.fromRGB(40, 230, 255)
        _G.Dark = Color3.fromRGB(10, 80, 115)
    else
        if _G.Theme == "Blue" then
            _G.Primary = Color3.fromRGB(40, 155, 255)
            _G.Dark = Color3.fromRGB(10, 80, 115)
        else
            if _G.Theme == "DarkBlue" then
                _G.Primary = Color3.fromRGB(50, 30, 255)
                _G.Dark = Color3.fromRGB(20, 10, 90)
            else
                if _G.Theme == "Green" then
                    _G.Primary = Color3.fromRGB(70, 255, 205)
                    _G.Dark = Color3.fromRGB(20, 90, 90)
                else
                    if _G.Theme == "LightGreen" then
                        _G.Primary = Color3.fromRGB(205, 255, 205)
                        _G.Dark = Color3.fromRGB(70, 90, 70)
                    else
                        if _G.Theme == "Purple" then
                            _G.Primary = Color3.fromRGB(205, 125, 255)
                            _G.Dark = Color3.fromRGB(60, 20, 95)
                        else
                            if _G.Theme == "Zinc" then
                                _G.Primary = Color3.fromRGB(30, 30, 30)
                                _G.Dark = Color3.fromRGB(10, 10, 10)
                            else
                                _G.Primary = Color3.fromRGB(30, 30, 30)
                                _G.Dark = Color3.fromRGB(10, 10, 10)
                            end
                        end
                    end
                end
            end
        end
    end
end

if not (_G.Theme) then
    _G.Primary = Color3.fromRGB(110, 110, 120)
    _G.Dark = Color3.fromRGB(20, 20, 30)
    print("Theme not found")
end

local config = {}
local uIStroke = Instance.new("UIStroke")
local uICorner = Instance.new("UICorner")
local imageButton = Instance.new("ImageButton")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
imageButton.Parent = screenGui
imageButton.Position = UDim2.new(0, 10, 0, 10)
imageButton.Size = UDim2.new(0, 50, 0, 50)
imageButton.Draggable = true
imageButton.BackgroundColor3 = _G.Dark
imageButton.ImageColor3 = _G.Primary
imageButton.ImageTransparency = 0.1
imageButton.BackgroundTransparency = 0.1
imageButton.Image = "rbxassetid://13940080072"
local uIStroke2 = Instance.new("UIStroke")
uIStroke2.Color = _G.Primary
uIStroke2.Thickness = 1
uIStroke2.Transparency = 0
uIStroke2.Parent = imageButton
local uICorner2 = Instance.new("UICorner")
uICorner2.Name = "MCNR"
uICorner2.Parent = imageButton
uICorner2.CornerRadius = UDim.new(0, 5)
imageButton.MouseButton1Click:connect(function()
    game.CoreGui:FindFirstChild("VOIDLIB").Enabled = not game.CoreGui:FindFirstChild("VOIDLIB").Enabled
end)

repeat
    wait(1)
until game:IsLoaded()
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
config.Window = function(p0, p1)
    local config = {}

    string.gsub(tostring(Enum.KeyCode.RightControl), "Enum.KeyCode.", "")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "AlertFrame"
    screenGui.Parent = game.CoreGui
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    local screenGui2 = Instance.new("ScreenGui")
    screenGui2.Name = "VOIDLIB"
    screenGui2.Parent = game.CoreGui
    screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Global
    local frame = Instance.new("Frame")
    frame.Name = "Main"
    frame.Parent = screenGui2
    frame.ClipsDescendants = true
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = _G.Dark
    frame.BackgroundTransparency = 0.1
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.Size = UDim2.new(0, 0, 0, 0)
    frame:TweenSize(UDim2.new(0, 524, 0, 332), "Out", "Quad", 0.4, true)
    local uIStroke = Instance.new("UIStroke")
    uIStroke.Color = _G.Primary
    uIStroke.Thickness = 1
    uIStroke.Transparency = 0
    uIStroke.Parent = frame
    local uICorner = Instance.new("UICorner")
    uICorner.Name = "CircleMain"
    uICorner.Parent = frame
    uICorner.CornerRadius = UDim.new(0, 5)
    local uIStroke2 = Instance.new("UIStroke")
    local uICorner2 = Instance.new("UICorner")
    uICorner2.Name = "MCNR"
    uICorner2.Parent = frame
    local uICorner3 = Instance.new("UICorner")
    uICorner3.Name = "MCNR"
    uICorner3.Parent = BackgroundImage
    local uICorner4 = Instance.new("UICorner")
    uICorner4.Name = "lol"
    uICorner4.Parent = Dark
    local frame2 = Instance.new("Frame")
    frame2.Name = "DragButton"
    frame2.Parent = frame
    frame2.Position = UDim2.new(1, 5, 1, 5)
    frame2.AnchorPoint = Vector2.new(1, 1)
    frame2.Size = UDim2.new(0, 15, 0, 15)
    frame2.BackgroundColor3 = _G.Primary
    frame2.BackgroundTransparency = 0.1
    frame2.ZIndex = 10
    game.Players.LocalPlayer:GetMouse()
    local UserInputService = game:GetService("UserInputService")
    local uICorner5 = Instance.new("UICorner")
    uICorner5.Name = "CircleDragButton"
    uICorner5.Parent = frame2
    uICorner5.CornerRadius = UDim.new(0, 99)
    local frame3 = Instance.new("Frame")
    frame3.Name = "Top"
    frame3.Parent = frame
    frame3.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    frame3.Size = UDim2.new(1, 0, 0, 40)
    frame3.BackgroundTransparency = 1
    local uICorner6 = Instance.new("UICorner")
    uICorner6.Name = "TCNR"
    uICorner6.Parent = frame3
    uICorner6.CornerRadius = UDim.new(0, 5)
    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "ttittles"
    textLabel.Parent = frame3
    textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0, 15, 0.5, 0)
    textLabel.AnchorPoint = Vector2.new(0, 0.5)
    textLabel.Size = UDim2.new(0, 1, 0, 25)
    textLabel.Font = Enum.Font.GothamBold
    textLabel.Text = "VOID LIB |"
    textLabel.TextSize = 15
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextXAlignment = Enum.TextXAlignment.Left
    local TextService = game:GetService("TextService")
    textLabel.Size = UDim2.new(0, TextService:GetTextSize(textLabel.Text, textLabel.TextSize, textLabel.Font, Vector2.new(math.huge, math.huge)).X, 0, 25)
    local textLabel2 = Instance.new("TextLabel")
    textLabel2.Name = "patch"
    textLabel2.Parent = textLabel
    textLabel2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    textLabel2.BackgroundTransparency = 1
    textLabel2.Position = UDim2.new(1, 5, 0.5, 0)
    textLabel2.Size = UDim2.new(0, 1, 0, 25)
    textLabel2.Font = Enum.Font.Gotham
    textLabel2.AnchorPoint = Vector2.new(0, 0.5)
    textLabel2.Text = p1
    textLabel2.TextSize = 15
    textLabel2.TextColor3 = _G.Primary
    local TextService2 = game:GetService("TextService")
    textLabel2.Size = UDim2.new(0, TextService2:GetTextSize(textLabel2.Text, textLabel2.TextSize, textLabel2.Font, Vector2.new(math.huge, math.huge)).X, 0, 25)
    local imageButton = Instance.new("ImageButton")
    imageButton.Name = "Hide"
    imageButton.Parent = frame3
    imageButton.BackgroundColor3 = _G.Primary
    imageButton.BackgroundTransparency = 1
    imageButton.AnchorPoint = Vector2.new(1, 0.5)
    imageButton.Position = UDim2.new(1, -10, 0.5, 0)
    imageButton.Size = UDim2.new(0, 25, 0, 25)
    imageButton.Image = "rbxassetid://7743878857"
    imageButton.ImageTransparency = 0
    imageButton.ImageColor3 = Color3.fromRGB(245, 245, 245)
    local frame4 = Instance.new("Frame")
    frame4.Name = "SepBot"
    frame4.Parent = frame3
    frame4.BackgroundColor3 = _G.Primary
    frame4.BackgroundTransparency = 0
    frame4.BorderSizePixel = 0
    frame4.AnchorPoint = Vector2.new(0.5, 1)
    frame4.Position = UDim2.new(0.5, 0, 1, 0)
    frame4.Size = UDim2.new(1, 0, 0, 1)
    local uICorner7 = Instance.new("UICorner")
    uICorner7.Name = "MCNR"
    uICorner7.Parent = imageButton
    uICorner7.CornerRadius = UDim.new(0, 3)
    imageButton.MouseButton1Click:connect(function()
        game.CoreGui:FindFirstChild("VOIDLIB").Enabled = not game.CoreGui:FindFirstChild("VOIDLIB").Enabled
    end)
    local uICorner8 = Instance.new("UICorner")
    uICorner8.Name = "MCNR"
    uICorner8.Parent = zbtn
    uICorner8.CornerRadius = UDim.new(0, 3)
    local frame5 = Instance.new("Frame")
    frame5.Name = "Tab"
    frame5.Parent = frame
    frame5.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frame5.Position = UDim2.new(0, 8, 0, 45)
    frame5.BackgroundTransparency = 1
    frame5.Size = UDim2.new(0, 148, 0, 275)
    local uIStroke3 = Instance.new("UIStroke")
    local scrollingFrame = Instance.new("ScrollingFrame")
    scrollingFrame.Name = "ScrollTab"
    scrollingFrame.Parent = frame5
    scrollingFrame.Active = true
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(0, 10, 250)
    scrollingFrame.Position = UDim2.new(0, 0, 0, 0)
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
    scrollingFrame.ScrollBarThickness = 0
    scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
    local uICorner9 = Instance.new("UICorner")
    uICorner9.Parent = frame5
    uICorner9.CornerRadius = UDim.new(0, 5)
    local uIListLayout = Instance.new("UIListLayout")
    uIListLayout.Name = "PLL"
    uIListLayout.Parent = scrollingFrame
    uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uIListLayout.Padding = UDim.new(0, 2)
    local uIPadding = Instance.new("UIPadding")
    uIPadding.Name = "PPD"
    uIPadding.Parent = scrollingFrame
    local uIStroke4 = Instance.new("UIStroke")
    local frame6 = Instance.new("Frame")
    frame6.Name = "Page"
    frame6.Parent = frame
    frame6.BackgroundColor3 = _G.Dark
    frame6.Position = UDim2.new(0, 166, 0, 45)
    frame6.Size = UDim2.new(0, 350, 0, 275)
    frame6.BackgroundTransparency = 1
    local uICorner10 = Instance.new("UICorner")
    uICorner10.Parent = frame6
    uICorner10.CornerRadius = UDim.new(0, 3)
    local frame7 = Instance.new("Frame")
    frame7.Name = "MainPage"
    frame7.Parent = frame6
    frame7.ClipsDescendants = true
    frame7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame7.BackgroundTransparency = 1
    frame7.Size = UDim2.new(1, 0, 1, 0)
    local folder = Instance.new("Folder")
    folder.Name = "PageList"
    folder.Parent = frame7
    local uIPageLayout = Instance.new("UIPageLayout")
    uIPageLayout.Parent = folder
    uIPageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    uIPageLayout.EasingDirection = Enum.EasingDirection.InOut
    uIPageLayout.EasingStyle = Enum.EasingStyle.Quad
    uIPageLayout.FillDirection = Enum.FillDirection.Vertical
    uIPageLayout.Padding = UDim.new(0, 10)
    uIPageLayout.TweenTime = 0
    uIPageLayout.GamepadInputEnabled = false
    uIPageLayout.ScrollWheelInputEnabled = false
    uIPageLayout.TouchInputEnabled = false
    func_f4e9459d(frame3, frame)
    UserInputService.InputBegan:Connect(function(p0)
        if p0.KeyCode == Enum.KeyCode.Insert then
            game.CoreGui:FindFirstChild("VOIDLIB").Enabled = not game.CoreGui:FindFirstChild("VOIDLIB").Enabled
        end
    end)
    local v = false
    frame2.InputBegan:Connect(function(p0)
        if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then

            if p0.UserInputType == Enum.UserInputType.Touch then
                v = true
            end

            return

        end
    end)
    UserInputService.InputEnded:Connect(function(p0)
        if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then

            if p0.UserInputType == Enum.UserInputType.Touch then
                v = false
            end

            return

        end
    end)
    UserInputService.InputChanged:Connect(function(p0)
        if v and p0.UserInputType ~= Enum.UserInputType.MouseMovement then

            if p0.UserInputType == Enum.UserInputType.Touch then
                frame.Size = UDim2.new(0, math.clamp(p0.Position.X - frame.AbsolutePosition.X, 524, math.huge), 0, math.clamp(p0.Position.Y - frame.AbsolutePosition.Y, 322, math.huge))
                frame6.Size = UDim2.new(0, math.clamp(p0.Position.X - frame6.AbsolutePosition.X - 8, 350, math.huge), 0, math.clamp(p0.Position.Y - frame6.AbsolutePosition.Y - 8, 270, math.huge))
                frame5.Size = UDim2.new(0, 148, 0, math.clamp(p0.Position.Y - frame5.AbsolutePosition.Y - 8, 270, math.huge))
            end

            return

        end
    end)
    local config2 = {}
    local _upv4 = ""
    local _upv6 = false
    config2.Tab = function(p0, p1, p2)
        local uIStroke = Instance.new("UIStroke")
        local textButton = Instance.new("TextButton")
        local textLabel = Instance.new("TextLabel")
        local uICorner = Instance.new("UICorner")
        local uICorner2 = Instance.new("UICorner")
        local textLabel2 = Instance.new("TextLabel")
        textButton.Parent = scrollingFrame
        textButton.Name = p1 .. "Server"
        textButton.Text = ""
        textButton.BackgroundColor3 = _G.Primary
        textButton.BackgroundTransparency = 1
        textButton.Size = UDim2.new(1, 0, 0, 35)
        textButton.Font = Enum.Font.GothamSemibold
        textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        textButton.TextSize = 12
        textButton.TextTransparency = 0.9
        local frame = Instance.new("Frame")
        frame.Name = "SelectedTab"
        frame.Parent = textButton
        frame.BackgroundColor3 = _G.Primary
        frame.BackgroundTransparency = 0
        frame.Size = UDim2.new(0, 3, 0, 0)
        frame.Position = UDim2.new(0, 0, 0.5, 0)
        frame.AnchorPoint = Vector2.new(0, 0.5)
        frame.ZIndex = 4
        uICorner2.CornerRadius = UDim.new(0, 100)
        uICorner2.Parent = frame
        textLabel2.Parent = textButton
        textLabel2.Name = "Title"
        textLabel2.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        textLabel2.BackgroundTransparency = 1
        textLabel2.Position = UDim2.new(0, 30, 0.5, 0)
        textLabel2.Size = UDim2.new(0, 100, 0, 30)
        textLabel2.Font = Enum.Font.GothamSemibold
        textLabel2.Text = p1
        textLabel2.AnchorPoint = Vector2.new(0, 0.5)
        textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
        textLabel2.TextTransparency = 0.4
        textLabel2.TextSize = 13
        textLabel2.TextXAlignment = Enum.TextXAlignment.Left
        local imageLabel = Instance.new("ImageLabel")
        imageLabel.Name = "IDK"
        imageLabel.Parent = textButton
        imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        imageLabel.BackgroundTransparency = 1
        imageLabel.ImageTransparency = 0.3
        imageLabel.Position = UDim2.new(0, 7, 0.5, 0)
        imageLabel.Size = UDim2.new(0, 15, 0, 15)
        imageLabel.AnchorPoint = Vector2.new(0, 0.5)
        imageLabel.Image = p2
        uICorner.CornerRadius = UDim.new(0, 5)
        uICorner.Parent = textButton
        local scrollingFrame = Instance.new("ScrollingFrame")
        scrollingFrame.Name = p1 .. "_Page"
        scrollingFrame.Parent = folder
        scrollingFrame.Active = true
        scrollingFrame.BackgroundColor3 = _G.Dark
        scrollingFrame.Position = UDim2.new(0, 0, 0, 0)
        scrollingFrame.BackgroundTransparency = 1
        scrollingFrame.Size = UDim2.new(1, 0, 1, 0)
        scrollingFrame.ScrollBarThickness = 0
        scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
        local uICorner3 = Instance.new("UICorner")
        uICorner3.Parent = frame7
        uICorner3.CornerRadius = UDim.new(0, 5)
        local uIPadding = Instance.new("UIPadding")
        local uIListLayout = Instance.new("UIListLayout")
        uIPadding.Parent = scrollingFrame
        uIListLayout.Padding = UDim.new(0, 3)
        uIListLayout.Parent = scrollingFrame
        uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        textButton.MouseButton1Click:Connect(function(...)
            for v, v2 in next(scrollingFrame:GetChildren) do

                if v2:IsA("TextButton") then
                    TweenService:Create(v2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 1,
                    }):Play()
                    TweenService:Create(v2.SelectedTab, TweenInfo.new(0, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 3, 0, 0),
                    }):Play()
                    TweenService:Create(v2.IDK, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0.4,
                    }):Play()
                    TweenService:Create(v2.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextTransparency = 0.4,
                    }):Play()
                end

                TweenService:Create(textButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 0.8,
                }):Play()
                TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 3, 0, 15),
                }):Play()
                TweenService:Create(imageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageTransparency = 0,
                }):Play()
                TweenService:Create(textLabel2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextTransparency = 0,
                }):Play()
            end

            for v3, v4 in next(folder:GetChildren) do
                _upv4 = string.gsub(textButton.Name, "Server", "") .. "_Page"

                if v4.Name == _upv4 then
                    uIPageLayout:JumpTo(v4)
                end
            end
        end)

        if _upv6 == false then

            for v, v2 in next(scrollingFrame:GetChildren) do

                if v2:IsA("TextButton") then
                    TweenService:Create(v2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundTransparency = 1,
                    }):Play()
                    TweenService:Create(v2.SelectedTab, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        Size = UDim2.new(0, 3, 0, 15),
                    }):Play()
                    TweenService:Create(v2.IDK, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        ImageTransparency = 0.4,
                    }):Play()
                    TweenService:Create(v2.Title, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        TextTransparency = 0.4,
                    }):Play()
                end

                TweenService:Create(textButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    BackgroundTransparency = 0.8,
                }):Play()
                TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 3, 0, 15),
                }):Play()
                TweenService:Create(imageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    ImageTransparency = 0,
                }):Play()
                TweenService:Create(textLabel2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                    TextTransparency = 0,
                }):Play()
            end

            uIPageLayout:JumpToIndex(1)
            _upv6 = true
        end

        local RunService = game:GetService("RunService")
        RunService.Stepped:Connect(function()
            pcall(function()
                scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uIListLayout.AbsoluteContentSize.Y)
            end)
        end)
        config.Alert = function(p0, p1)
            if game.CoreGui:FindFirstChild("AlertFrame") then
                local v = game.CoreGui.AlertFrame

                if v:FindFirstChild("Frame") then
                    v.Frame:Destroy()
                end
            end

            local frame = Instance.new("Frame")
            local imageLabel = Instance.new("ImageLabel")
            local textLabel = Instance.new("TextLabel")
            local textLabel2 = Instance.new("TextLabel")
            local uICorner = Instance.new("UICorner")
            frame.Name = "Frame"
            frame.Parent = game.CoreGui.AlertFrame
            frame.BackgroundColor3 = _G.Dark
            frame.BackgroundTransparency = 0.1
            frame.Position = UDim2.new(1, 0, 0, 0)
            frame.Size = UDim2.new(0, 200, 0, 60)
            local uIStroke = Instance.new("UIStroke")
            uIStroke.Color = _G.Primary
            uIStroke.Thickness = 1
            uIStroke.Transparency = 0
            uIStroke.Parent = frame
            imageLabel.Name = "Icon"
            imageLabel.Parent = frame
            imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            imageLabel.BackgroundTransparency = 1
            imageLabel.Position = UDim2.new(0, 8, 0, 8)
            imageLabel.Size = UDim2.new(0, 45, 0, 45)
            imageLabel.Image = "rbxassetid://13940080072"
            textLabel.Parent = frame
            textLabel.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
            textLabel.BackgroundTransparency = 1
            textLabel.Position = UDim2.new(0, 55, 0, 14)
            textLabel.Size = UDim2.new(0, 10, 0, 20)
            textLabel.Font = Enum.Font.GothamBold
            textLabel.Text = "Void Lib"
            textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            textLabel.TextSize = 16
            textLabel.TextXAlignment = Enum.TextXAlignment.Left
            textLabel2.Parent = frame
            textLabel2.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
            textLabel2.BackgroundTransparency = 1
            textLabel2.Position = UDim2.new(0, 55, 0, 33)
            textLabel2.Size = UDim2.new(0, 10, 0, 10)
            textLabel2.Font = Enum.Font.GothamSemibold
            textLabel2.TextTransparency = 0.3
            textLabel2.Text = p1
            textLabel2.TextColor3 = Color3.fromRGB(200, 200, 200)
            textLabel2.TextSize = 12
            textLabel2.TextXAlignment = Enum.TextXAlignment.Left
            uICorner.CornerRadius = UDim.new(0, 5)
            uICorner.Parent = frame
            frame:TweenPosition(UDim2.new(1, -195, 0, 0), "Out", "Quad", 0.4, true)
            wait(2)
            frame:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
            wait(0.6)
            frame:Destroy()
        end

        return {
            Button = function(p0, p1, p2)
                local frame = Instance.new("Frame")
                local uICorner = Instance.new("UICorner")
                local textLabel = Instance.new("TextLabel")
                local textButton = Instance.new("TextButton")
                local uICorner2 = Instance.new("UICorner")
                local frame2 = Instance.new("Frame")
                local uICorner3 = Instance.new("UICorner")
                frame.Name = "Button"
                frame.Parent = scrollingFrame
                frame.BackgroundColor3 = _G.Primary
                frame.BackgroundTransparency = 0.8
                frame.Size = UDim2.new(1, 0, 0, 36)
                uICorner.CornerRadius = UDim.new(0, 5)
                uICorner.Parent = frame
                local imageLabel = Instance.new("ImageLabel")
                imageLabel.Name = "ImageLabel"
                imageLabel.Parent = textButton
                imageLabel.BackgroundColor3 = _G.Primary
                imageLabel.BackgroundTransparency = 1
                imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
                imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
                imageLabel.Size = UDim2.new(0, 15, 0, 15)
                imageLabel.Image = "rbxassetid://10723375250"
                imageLabel.ImageTransparency = 0.2
                imageLabel.ImageColor3 = Color3.fromRGB(245, 245, 245)
                uICorner2.CornerRadius = UDim.new(0, 4)
                uICorner2.Parent = textButton
                textButton.Name = "TextButton"
                textButton.Parent = frame
                textButton.BackgroundColor3 = _G.Primary
                textButton.BackgroundTransparency = 0
                textButton.AnchorPoint = Vector2.new(1, 0.5)
                textButton.Position = UDim2.new(1, -10, 0.5, 0)
                textButton.Size = UDim2.new(0, 22, 0, 22)
                textButton.Font = Enum.Font.GothamSemibold
                textButton.Text = ""
                textButton.TextXAlignment = Enum.TextXAlignment.Left
                textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                textButton.TextSize = 13
                textLabel.Name = "TextLabel"
                textLabel.Parent = frame
                textLabel.BackgroundColor3 = _G.Primary
                textLabel.BackgroundTransparency = 1
                textLabel.AnchorPoint = Vector2.new(0, 0.5)
                textLabel.Position = UDim2.new(0, 15, 0.5, 0)
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.Font = Enum.Font.GothamSemibold
                textLabel.Text = p1
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextSize = 13
                frame2.Name = "Black"
                frame2.Parent = frame
                frame2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
                frame2.BackgroundTransparency = 1
                frame2.BorderSizePixel = 0
                frame2.Position = UDim2.new(0, 0, 0, 0)
                frame2.Size = UDim2.new(1, 0, 0, 33)
                uICorner3.CornerRadius = UDim.new(0, 5)
                uICorner3.Parent = frame2
                textButton.MouseButton1Click:Connect(function()
                    p2()
                end)
            end,
            Toggle = function(p0, p1, p2, p3, p4)
                if not (p2) then
                    local v = false
                end

                _G.TrueColor = _G.Primary
                local uICorner = Instance.new("UICorner")
                local uIPadding = Instance.new("UIPadding")
                local uIStroke = Instance.new("UIStroke")
                local textButton = Instance.new("TextButton")
                local uICorner2 = Instance.new("UICorner")
                local textLabel = Instance.new("TextLabel")
                local textLabel2 = Instance.new("TextLabel")
                local textLabel3 = Instance.new("TextLabel")
                local textButton2 = Instance.new("TextButton")
                local uICorner3 = Instance.new("UICorner")
                local uICorner4 = Instance.new("UICorner")
                local frame = Instance.new("Frame")
                local frame2 = Instance.new("Frame")
                local uICorner5 = Instance.new("UICorner")
                local imageLabel = Instance.new("ImageLabel")
                textButton.Name = "Button"
                textButton.Parent = scrollingFrame
                textButton.BackgroundColor3 = _G.Primary
                textButton.BackgroundTransparency = 0.8
                textButton.Size = UDim2.new(1, 0, 0, 46)
                textButton.AutoButtonColor = false
                textButton.Font = Enum.Font.SourceSans
                textButton.Text = ""
                textButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                textButton.TextSize = 11
                uICorner2.CornerRadius = UDim.new(0, 5)
                uICorner2.Parent = textButton
                textLabel2.Parent = textButton
                textLabel2.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                textLabel2.BackgroundTransparency = 1
                textLabel2.Size = UDim2.new(1, 0, 0, 35)
                textLabel2.Font = Enum.Font.GothamSemibold
                textLabel2.Text = p1
                textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel2.TextSize = 13
                textLabel2.TextXAlignment = Enum.TextXAlignment.Left
                textLabel2.AnchorPoint = Vector2.new(0, 0.5)
                textLabel3.Parent = textLabel2
                textLabel3.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                textLabel3.BackgroundTransparency = 1
                textLabel3.Position = UDim2.new(0, 0, 0, 22)
                textLabel3.Size = UDim2.new(0, 280, 0, 16)
                textLabel3.Font = Enum.Font.Gotham

                if p3 then
                    textLabel3.Text = p3
                    textLabel2.Position = UDim2.new(0, 15, 0.5, -5)
                    textLabel3.Position = UDim2.new(0, 0, 0, 22)
                else
                    textLabel2.Position = UDim2.new(0, 15, 0.5, 0)
                    textLabel3.Visible = false
                end

                textLabel3.TextColor3 = Color3.fromRGB(200, 200, 200)
                textLabel3.TextSize = 10
                textLabel3.TextXAlignment = Enum.TextXAlignment.Left
                frame2.Name = "ToggleFrame"
                frame2.Parent = textButton
                frame2.BackgroundColor3 = _G.Dark
                frame2.BackgroundTransparency = 1
                frame2.Position = UDim2.new(1, -10, 0.5, 0)
                frame2.Size = UDim2.new(0, 35, 0, 20)
                frame2.AnchorPoint = Vector2.new(1, 0.5)
                uICorner4.CornerRadius = UDim.new(0, 10)
                uICorner4.Parent = frame2
                textButton2.Name = "ToggleImage"
                textButton2.Parent = frame2
                textButton2.BackgroundColor3 = _G.Dark
                textButton2.BackgroundTransparency = 0
                textButton2.Position = UDim2.new(0, 0, 0, 0)
                textButton2.AnchorPoint = Vector2.new(0, 0)
                textButton2.Size = UDim2.new(1, 0, 1, 0)
                textButton2.Text = ""
                textButton2.AutoButtonColor = false
                local uIStroke2 = Instance.new("UIStroke")
                uIStroke2.Color = _G.Primary
                uIStroke2.Thickness = 1
                uIStroke2.Transparency = 0
                uIStroke2.Parent = frame2
                uICorner3.CornerRadius = UDim.new(0, 10)
                uICorner3.Parent = textButton2
                frame.Name = "Circle"
                frame.Parent = textButton2
                frame.BackgroundColor3 = _G.Primary
                frame.BackgroundTransparency = 0
                frame.Position = UDim2.new(0, 3, 0.5, 0)
                frame.Size = UDim2.new(0, 14, 0, 14)
                frame.AnchorPoint = Vector2.new(0, 0.5)
                uICorner5.CornerRadius = UDim.new(0, 10)
                uICorner5.Parent = frame
                textButton2.MouseButton1Click:Connect(function()
                    if v == false then
                        v = true
                        uIStroke2.Thickness = 0
                        frame:TweenPosition(UDim2.new(0, 18, 0.5, 0), "Out", "Sine", 0.2, true)
                        TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = _G.Dark,
                        }):Play()
                        TweenService:Create(textButton2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = _G.Primary,
                        }):Play()
                    else
                        v = false
                        uIStroke2.Thickness = 1
                        frame:TweenPosition(UDim2.new(0, 3, 0.5, 0), "Out", "Sine", 0.2, true)
                        TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = _G.Primary,
                        }):Play()
                        TweenService:Create(textButton2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundColor3 = _G.Dark,
                        }):Play()
                    end

                    pcall(p4, v)
                end)

                if v == true then
                    uIStroke2.Thickness = 0
                    frame:TweenPosition(UDim2.new(0, 18, 0.5, 0), "Out", "Sine", 0.4, true)
                    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = _G.Dark,
                    }):Play()
                    TweenService:Create(textButton2, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                        BackgroundColor3 = _G.Primary,
                    }):Play()
                    pcall(p4, true)
                end
            end,
            Dropdown = function(p0, p1, p2, p3, p4)
                local v = false
                local frame = Instance.new("Frame")
                local frame2 = Instance.new("Frame")
                local uICorner = Instance.new("UICorner")
                local uICorner2 = Instance.new("UICorner")
                local uICorner3 = Instance.new("UICorner")
                local uICorner4 = Instance.new("UICorner")
                local textLabel = Instance.new("TextLabel")
                local scrollingFrame = Instance.new("ScrollingFrame")
                local uIListLayout = Instance.new("UIListLayout")
                local uIPadding = Instance.new("UIPadding")
                local textButton = Instance.new("TextButton")
                local textButton2 = Instance.new("TextButton")
                local textButton3 = Instance.new("TextButton")
                local imageLabel = Instance.new("ImageLabel")
                local uIStroke = Instance.new("UIStroke")
                frame.Name = "Dropdown"
                frame.Parent = scrollingFrame
                frame.BackgroundColor3 = _G.Primary
                frame.BackgroundTransparency = 0.8
                frame.ClipsDescendants = false
                frame.Size = UDim2.new(1, 0, 0, 40)
                uICorner.CornerRadius = UDim.new(0, 5)
                uICorner.Parent = frame
                textLabel.Name = "DropTitle"
                textLabel.Parent = frame
                textLabel.BackgroundColor3 = _G.Primary
                textLabel.BackgroundTransparency = 1
                textLabel.Size = UDim2.new(1, 0, 0, 30)
                textLabel.Font = Enum.Font.GothamSemibold
                textLabel.Text = p1
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextSize = 13
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                textLabel.Position = UDim2.new(0, 15, 0, 5)
                textLabel.AnchorPoint = Vector2.new(0, 0)
                textButton3.Name = "SelectItems"
                textButton3.Parent = frame
                textButton3.BackgroundColor3 = _G.Dark
                textButton3.TextColor3 = Color3.fromRGB(255, 255, 255)
                textButton3.BackgroundTransparency = 0.1
                textButton3.Position = UDim2.new(1, -5, 0, 5)
                textButton3.Size = UDim2.new(0, 100, 0, 30)
                textButton3.AnchorPoint = Vector2.new(1, 0)
                textButton3.Font = Enum.Font.GothamMedium
                textButton3.TextSize = 9
                textButton3.ZIndex = 1

                if p3 then
                    textButton3.Text = " " .. p3
                else
                    textButton3.Text = " Select Items"
                end

                textButton3.ClipsDescendants = true
                textButton3.TextXAlignment = Enum.TextXAlignment.Left
                uICorner2.Parent = textButton3
                uICorner2.CornerRadius = UDim.new(0, 5)
                uICorner3.Parent = scrollingFrame
                uICorner3.CornerRadius = UDim.new(0, 5)
                frame2.Name = "DropdownFrameScroll"
                frame2.Parent = frame
                frame2.BackgroundColor3 = _G.Dark
                frame2.BackgroundTransparency = 0
                frame2.ClipsDescendants = true
                frame2.Size = UDim2.new(1, -10, 0, 100)
                frame2.Position = UDim2.new(0, 5, 0, 40)
                frame2.Visible = false
                frame2.AnchorPoint = Vector2.new(0, 0)
                uICorner4.Parent = frame2
                uICorner4.CornerRadius = UDim.new(0, 5)
                scrollingFrame.Name = "DropScroll"
                scrollingFrame.Parent = frame2
                scrollingFrame.ScrollingDirection = Enum.ScrollingDirection.Y
                scrollingFrame.Active = true
                scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                scrollingFrame.BackgroundTransparency = 1
                scrollingFrame.BorderSizePixel = 0
                scrollingFrame.Position = UDim2.new(0, 0, 0, 10)
                scrollingFrame.Size = UDim2.new(1, 0, 0, 80)
                scrollingFrame.AnchorPoint = Vector2.new(0, 0)
                scrollingFrame.ClipsDescendants = true
                scrollingFrame.ScrollBarThickness = 3
                scrollingFrame.ZIndex = 3
                local uIPadding2 = Instance.new("UIPadding")
                uIPadding2.PaddingLeft = UDim.new(0, 10)
                uIPadding2.PaddingRight = UDim.new(0, 10)
                uIPadding2.Parent = scrollingFrame
                uIPadding2.Name = "PaddingDrop"
                uIListLayout.Parent = scrollingFrame
                uIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
                uIListLayout.Padding = UDim.new(0, 1)
                uIPadding.Parent = scrollingFrame
                uIPadding.PaddingLeft = UDim.new(0, 5)

                for v2, v3 in next(p2) do
                    local textButton4 = Instance.new("TextButton")
                    local uICorner5 = Instance.new("UICorner")
                    local uICorner6 = Instance.new("UICorner")
                    local uIPadding3 = Instance.new("UIPadding")
                    textButton4.Name = "Item"
                    textButton4.Parent = scrollingFrame
                    textButton4.BackgroundColor3 = _G.Primary
                    textButton4.BackgroundTransparency = 1
                    textButton4.Size = UDim2.new(1, 0, 0, 30)
                    textButton4.Font = Enum.Font.GothamSemibold
                    textButton4.Text = tostring(v3)
                    textButton4.TextColor3 = Color3.fromRGB(255, 255, 255)
                    textButton4.TextSize = 11
                    textButton4.TextTransparency = 0.5
                    textButton4.TextXAlignment = Enum.TextXAlignment.Left
                    textButton4.ZIndex = 4
                    uIPadding3.Parent = textButton4
                    uIPadding3.PaddingLeft = UDim.new(0, 8)
                    uICorner6.Parent = textButton4
                    uICorner6.CornerRadius = UDim.new(0, 5)
                    local frame3 = Instance.new("Frame")
                    frame3.Name = "SelectedItems"
                    frame3.Parent = textButton4
                    frame3.BackgroundColor3 = _G.Primary
                    frame3.BackgroundTransparency = 1
                    frame3.Size = UDim2.new(0, 3, 0.4, 0)
                    frame3.Position = UDim2.new(0, -8, 0.5, 0)
                    frame3.AnchorPoint = Vector2.new(0, 0.5)
                    frame3.ZIndex = 4
                    uICorner5.Parent = frame3
                    uICorner5.CornerRadius = UDim.new(0, 999)
                    textButton4.MouseEnter:Connect(function()
                        TweenService:Create(textButton4, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextTransparency = 0,
                            BackgroundTransparency = 0.8,
                        }):Play()
                        TweenService:Create(frame3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 0,
                        }):Play()
                    end)
                    textButton4.MouseLeave:Connect(function()
                        TweenService:Create(textButton4, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            TextTransparency = 0.5,
                            BackgroundTransparency = 1,
                        }):Play()
                        TweenService:Create(frame3, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            BackgroundTransparency = 1,
                        }):Play()
                    end)
                    textButton4.MouseButton1Click:Connect(function()
                        v = false
                        textButton3.ClipsDescendants = true
                        TweenService:Create(frame2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, -10, 0, 0),
                            Visible = false,
                        }):Play()
                        p4(textButton4.Text)
                        textButton3.Text = " " .. textButton4.Text
                        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, 0, 0, 40),
                        }):Play()
                    end)
                end

                scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uIListLayout.AbsoluteContentSize.Y)
                textButton3.MouseButton1Click:Connect(function()
                    if v == false then
                        v = true
                        TweenService:Create(frame2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, -10, 0, 100),
                            Visible = true,
                        }):Play()
                        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, 0, 0, 145),
                        }):Play()
                    else
                        v = false
                        TweenService:Create(frame2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, -10, 0, 0),
                            Visible = false,
                        }):Play()
                        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                            Size = UDim2.new(1, 0, 0, 40),
                        }):Play()
                    end
                end)

                return {
                    Add = function(p0, p1)
                        local textButton = Instance.new("TextButton")
                        local uICorner = Instance.new("UICorner")
                        local uICorner2 = Instance.new("UICorner")
                        local uIPadding = Instance.new("UIPadding")
                        textButton.Name = "Item"
                        textButton.Parent = scrollingFrame
                        textButton.BackgroundColor3 = _G.Primary
                        textButton.BackgroundTransparency = 1
                        textButton.Size = UDim2.new(1, 0, 0, 30)
                        textButton.Font = Enum.Font.GothamSemibold
                        textButton.Text = tostring(p1)
                        textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                        textButton.TextSize = 11
                        textButton.TextTransparency = 0.5
                        textButton.TextXAlignment = Enum.TextXAlignment.Left
                        textButton.ZIndex = 4
                        uIPadding.Parent = textButton
                        uIPadding.PaddingLeft = UDim.new(0, 8)
                        uICorner2.Parent = textButton
                        uICorner2.CornerRadius = UDim.new(0, 5)
                        local frame = Instance.new("Frame")
                        frame.Name = "SelectedItems"
                        frame.Parent = textButton
                        frame.BackgroundColor3 = _G.Primary
                        frame.BackgroundTransparency = 1
                        frame.Size = UDim2.new(0, 3, 0.4, 0)
                        frame.Position = UDim2.new(0, -8, 0.5, 0)
                        frame.AnchorPoint = Vector2.new(0, 0.5)
                        frame.ZIndex = 4
                        uICorner.Parent = frame
                        uICorner.CornerRadius = UDim.new(0, 999)
                        textButton.MouseEnter:Connect(function()
                            TweenService:Create(textButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextTransparency = 0,
                                BackgroundTransparency = 0.8,
                            }):Play()
                            TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 0,
                            }):Play()
                        end)
                        textButton.MouseLeave:Connect(function()
                            TweenService:Create(textButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                TextTransparency = 0.5,
                                BackgroundTransparency = 1,
                            }):Play()
                            TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                BackgroundTransparency = 1,
                            }):Play()
                        end)
                        textButton.MouseButton1Click:Connect(function()
                            v = false
                            p4(textButton.Text)
                            textButton3.Text = " " .. textButton.Text
                            TweenService:Create(frame2, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(1, -10, 0, 0),
                                Visible = false,
                            }):Play()
                            TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(1, 0, 0, 40),
                            }):Play()
                        end)
                    end,
                    Clear = function(p0)
                        textButton3.Text = " Select Items"
                        v = false
                        frame2.Visible = false

                        for v, v2 in next(scrollingFrame:GetChildren) do

                            if v2:IsA("TextButton") then
                                v2:Destroy()
                            end
                        end
                    end,
                }
            end,
            Slider = function(p0, p1, p2, p3, p4, p5)
                local frame = Instance.new("Frame")
                local uICorner = Instance.new("UICorner")
                local frame2 = Instance.new("Frame")
                local uICorner2 = Instance.new("UICorner")
                local imageLabel = Instance.new("ImageLabel")
                local uIStroke = Instance.new("UIStroke")
                local textLabel = Instance.new("TextLabel")
                local frame3 = Instance.new("Frame")
                local textButton = Instance.new("TextButton")
                local frame4 = Instance.new("Frame")
                local frame5 = Instance.new("Frame")
                local uICorner3 = Instance.new("UICorner")
                local uICorner4 = Instance.new("UICorner")
                local frame6 = Instance.new("Frame")
                local uICorner5 = Instance.new("UICorner")
                local frame7 = Instance.new("Frame")
                local uICorner6 = Instance.new("UICorner")
                local textBox = Instance.new("TextBox")
                local uICorner7 = Instance.new("UICorner")
                local uIStroke2 = Instance.new("UIStroke")
                frame.Name = "Slider"
                frame.Parent = scrollingFrame
                frame.BackgroundColor3 = _G.Primary
                frame.BackgroundTransparency = 1
                frame.Size = UDim2.new(1, 0, 0, 45)
                uICorner.CornerRadius = UDim.new(0, 5)
                uICorner.Name = "slidercorner"
                uICorner.Parent = frame
                frame2.Name = "sliderr"
                frame2.Parent = frame
                frame2.BackgroundColor3 = _G.Primary
                frame2.BackgroundTransparency = 0.8
                frame2.Position = UDim2.new(0, 0, 0, 0)
                frame2.Size = UDim2.new(1, 0, 0, 45)
                uICorner2.CornerRadius = UDim.new(0, 5)
                uICorner2.Name = "sliderrcorner"
                uICorner2.Parent = frame2
                textLabel.Parent = frame2
                textLabel.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                textLabel.BackgroundTransparency = 1
                textLabel.Position = UDim2.new(0, 15, 0.5, 0)
                textLabel.Size = UDim2.new(1, 0, 0, 30)
                textLabel.Font = Enum.Font.GothamSemibold
                textLabel.Text = p1
                textLabel.AnchorPoint = Vector2.new(0, 0.5)
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextSize = 13
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                frame4.Name = "bar"
                frame4.Parent = frame2
                frame4.BackgroundColor3 = _G.Primary
                frame4.Size = UDim2.new(0, 100, 0, 4)
                frame4.Position = UDim2.new(1, -10, 0.5, 10)
                frame4.BackgroundTransparency = 0.8
                frame4.AnchorPoint = Vector2.new(1, 0.5)
                frame5.Name = "bar1"
                frame5.Parent = frame4
                frame5.BackgroundColor3 = _G.Dark
                frame5.BackgroundTransparency = 0
                frame5.Size = UDim2.new(p4 / p3, 0, 0, 4)
                uICorner3.CornerRadius = UDim.new(0, 5)
                uICorner3.Name = "bar1corner"
                uICorner3.Parent = frame5
                uICorner4.CornerRadius = UDim.new(0, 5)
                uICorner4.Name = "barcorner"
                uICorner4.Parent = frame4
                frame6.Name = "circlebar"
                frame6.Parent = frame5
                frame6.BackgroundColor3 = _G.Dark
                frame6.Position = UDim2.new(1, 0, 0, -5)
                frame6.AnchorPoint = Vector2.new(0.5, 0)
                frame6.Size = UDim2.new(0, 13, 0, 13)
                uICorner5.CornerRadius = UDim.new(0, 100)
                uICorner5.Parent = frame6
                uICorner6.CornerRadius = UDim.new(0, 2)
                uICorner6.Name = "valuecorner"
                uICorner6.Parent = frame7
                textBox.Parent = frame2
                textBox.BackgroundColor3 = _G.Dark
                textBox.BackgroundTransparency = 0.1
                textBox.Font = Enum.Font.Code
                textBox.Size = UDim2.new(0, 35, 0, 15)
                textBox.AnchorPoint = Vector2.new(1, 0.5)
                textBox.Position = UDim2.new(1, -10, 0.5, -10)
                textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
                textBox.TextSize = 9
                textBox.Text = p4
                textBox.TextTransparency = 0.1
                textBox.ClearTextOnFocus = false
                textBox.TextXAlignment = Enum.TextXAlignment.Center
                uICorner7.CornerRadius = UDim.new(0, 3)
                uICorner7.Parent = textBox
                game.Players.LocalPlayer:GetMouse()
                local UserInputService = game:GetService("UserInputService")

                if Value == nil then
                    Value = p4
                    pcall(function()
                        p5(Value)
                    end)
                end

                local v = false
                frame6.InputBegan:Connect(function(p0)
                    if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then

                        if p0.UserInputType == Enum.UserInputType.Touch then
                            v = true
                        end

                        return

                    end
                end)
                frame4.InputBegan:Connect(function(p0)
                    if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then

                        if p0.UserInputType == Enum.UserInputType.Touch then
                            v = true
                        end

                        return

                    end
                end)
                UserInputService.InputEnded:Connect(function(p0)
                    if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then

                        if p0.UserInputType == Enum.UserInputType.Touch then
                            v = false
                        end

                        return

                    end
                end)
                UserInputService.InputChanged:Connect(function(p0)
                    if v and p0.UserInputType ~= Enum.UserInputType.MouseMovement then

                        if p0.UserInputType == Enum.UserInputType.Touch then

                            Value = 0
                            pcall(function()
                                p5(Value)
                            end)
                            textBox.Text = Value
                            frame5.Size = UDim2.new(0, math.clamp(p0.Position.X - frame5.AbsolutePosition.X, 0, 100), 0, 4)
                            frame6.Position = UDim2.new(0, math.clamp(p0.Position.X - frame5.AbsolutePosition.X - 5, 0, 100), 0, -5)
                        end

                        return

                    end
                end)
                textBox.FocusLost:Connect(function()
                    if p3 < tonumber(textBox.Text) then
                        textBox.Text = p3
                    end

                    frame5.Size = UDim2.new(0 / p3, 0, 0, 4)
                    frame6.Position = UDim2.new(1, 0, 0, -5)

                    textBox.Text = tostring(math.floor(textBox.Text / p3 * p3 - p2 + p2))
                    pcall(p5, textBox.Text)
                end)
            end,
            Textbox = function(p0, p1, p2, p3)
                local frame = Instance.new("Frame")
                local uICorner = Instance.new("UICorner")
                local textLabel = Instance.new("TextLabel")
                local textBox = Instance.new("TextBox")
                local uICorner2 = Instance.new("UICorner")
                local imageLabel = Instance.new("ImageLabel")
                frame.Name = "Textbox"
                frame.Parent = scrollingFrame
                frame.BackgroundColor3 = _G.Primary
                frame.BackgroundTransparency = 0.8
                frame.Size = UDim2.new(1, 0, 0, 35)
                uICorner.CornerRadius = UDim.new(0, 5)
                uICorner.Name = "TextboxCorner"
                uICorner.Parent = frame
                textLabel.Name = "TextboxLabel"
                textLabel.Parent = frame
                textLabel.BackgroundColor3 = _G.Primary
                textLabel.BackgroundTransparency = 1
                textLabel.Position = UDim2.new(0, 15, 0.5, 0)
                textLabel.Text = p1
                textLabel.Size = UDim2.new(1, 0, 0, 35)
                textLabel.Font = Enum.Font.GothamSemibold
                textLabel.AnchorPoint = Vector2.new(0, 0.5)
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextSize = 13
                textLabel.TextTransparency = 0
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                textBox.Name = "RealTextbox"
                textBox.Parent = frame
                textBox.BackgroundColor3 = _G.Dark
                textBox.BackgroundTransparency = 0.1
                textBox.Position = UDim2.new(1, -5, 0.5, 0)
                textBox.AnchorPoint = Vector2.new(1, 0.5)
                textBox.Size = UDim2.new(0, 80, 0, 25)
                textBox.Font = Enum.Font.GothamSemibold
                textBox.Text = ""
                textBox.TextColor3 = Color3.fromRGB(225, 225, 225)
                textBox.TextSize = 11
                textBox.TextTransparency = 0
                textBox.ClipsDescendants = true
                textBox.FocusLost:Connect(function()
                    p3(textBox.Text)
                end)
                uICorner2.CornerRadius = UDim.new(0, 5)
                uICorner2.Parent = textBox
            end,
            Label = function(p0, p1)
                local textLabel = Instance.new("TextLabel")
                local uIPadding = Instance.new("UIPadding")
                local config = {}
                textLabel.Name = "Label"
                textLabel.Parent = scrollingFrame
                textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.BackgroundTransparency = 1
                textLabel.Size = UDim2.new(1, 0, 0, 20)
                textLabel.Font = Enum.Font.GothamSemibold
                textLabel.TextColor3 = Color3.fromRGB(225, 225, 225)
                textLabel.TextSize = 13
                textLabel.Text = p1
                textLabel.TextXAlignment = Enum.TextXAlignment.Left
                uIPadding.PaddingLeft = UDim.new(0, 2)
                uIPadding.Parent = textLabel
                uIPadding.Name = "PaddingLabel"
                config.Set = function(p0, p1)
                    textLabel.Text = p1
                end

                return config
            end,
            Seperator = function(p0, p1)
                local frame = Instance.new("Frame")
                local frame2 = Instance.new("Frame")
                local textLabel = Instance.new("TextLabel")
                local frame3 = Instance.new("Frame")
                local uICorner = Instance.new("UICorner")
                frame.Name = "Seperator"
                frame.Parent = scrollingFrame
                frame.BackgroundColor3 = _G.Primary
                frame.BackgroundTransparency = 1
                frame.Size = UDim2.new(1, 0, 0, 36)
                textLabel.Name = "Sep2"
                textLabel.Parent = frame
                textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.BackgroundTransparency = 1
                textLabel.AnchorPoint = Vector2.new(0.5, 1)
                textLabel.Position = UDim2.new(0.5, 0, 0, 30)
                textLabel.Size = UDim2.new(1, 0, 0, 36)
                textLabel.Font = Enum.Font.GothamBold
                textLabel.Text = p1
                textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
                textLabel.TextSize = 14
                frame3.Name = "Sep3"
                frame3.Parent = frame
                frame3.BackgroundColor3 = _G.Primary
                frame3.BackgroundTransparency = 0
                frame3.BorderSizePixel = 0
                frame3.AnchorPoint = Vector2.new(0.5, 0.5)
                frame3.Position = UDim2.new(0.5, 0, 0, 25)
                frame3.Size = UDim2.new(0, 39, 0, 3)
                local TextService = game:GetService("TextService")
                frame3.Size = UDim2.new(0, TextService:GetTextSize(textLabel.Text, textLabel.TextSize, textLabel.Font, Vector2.new(math.huge, math.huge)).X * 0.7, 0, 3)
                uICorner.CornerRadius = UDim.new(0, math.huge)
                uICorner.Parent = frame3
            end,
            Line = function(p0)
                local frame = Instance.new("Frame")
                local frame2 = Instance.new("Frame")
                local uIGradient = Instance.new("UIGradient")
                frame.Name = "Linee"
                frame.Parent = scrollingFrame
                frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                frame.BackgroundTransparency = 1
                frame.Position = UDim2.new(0, 0, 0.119999997, 0)
                frame.Size = UDim2.new(1, 0, 0, 20)
                frame2.Name = "Line"
                frame2.Parent = frame
                frame2.BackgroundColor3 = Color3.new(125, 125, 125)
                frame2.BorderSizePixel = 0
                frame2.Position = UDim2.new(0, 0, 0, 10)
                frame2.Size = UDim2.new(1, 0, 0, 1)
                local config = {}
                ColorSequenceKeypoint.new(0, _G.Dark)
                ColorSequenceKeypoint.new(0.4, _G.Primary)
                ColorSequenceKeypoint.new(0.5, _G.Primary)
                ColorSequenceKeypoint.new(0.6, _G.Primary)
                uIGradient.Color = ColorSequence.new(config)
                uIGradient.Parent = frame2
            end,
        }
    end

    return config2
end

local function func_f4e9459d(p0, p1)
    p0.InputBegan:Connect(function(p0)
        if p0.UserInputType ~= Enum.UserInputType.MouseButton1 then

            if p0.UserInputType == Enum.UserInputType.Touch then
                v2 = true
                v4 = p0.Position
                v5 = p1.Position
                p0.Changed:Connect(function(...)
                    if p0.UserInputState == Enum.UserInputState.End then
                        v2 = false
                    end
                end)
            end

            return

        end
    end)
    p0.InputChanged:Connect(function(p0)
        if p0.UserInputType ~= Enum.UserInputType.MouseMovement then

            if p0.UserInputType == Enum.UserInputType.Touch then
                v3 = p0
            end

            return

        end
    end)
    UserInputService.InputChanged:Connect(function(p0)
        if p0 == v3 and v2 then
            func_e2ee5471(p0)
        end
    end)

    return

end

local function func_e2ee5471(p0)
    local v = p0.Position - v4
    TweenService:Create(p1, TweenInfo.new(0.15), {
        Position = UDim2.new(v5.X.Scale, v5.X.Offset + v.X, v5.Y.Scale, v5.Y.Offset + v.Y),
    }):Play()

    return

end

return config
