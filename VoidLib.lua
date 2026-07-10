local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local HttpService = game:GetService("HttpService")
local CoreGui = game:GetService("CoreGui")

_G.Theme = _G.Theme or "Zinc"

local Themes = {
    Red = { Primary = Color3.fromRGB(255, 30, 50), Dark = Color3.fromRGB(90, 10, 20) },
    Cyan = { Primary = Color3.fromRGB(40, 230, 255), Dark = Color3.fromRGB(10, 80, 115) },
    Blue = { Primary = Color3.fromRGB(40, 155, 255), Dark = Color3.fromRGB(10, 80, 115) },
    DarkBlue = { Primary = Color3.fromRGB(50, 30, 255), Dark = Color3.fromRGB(20, 10, 90) },
    Green = { Primary = Color3.fromRGB(70, 255, 205), Dark = Color3.fromRGB(20, 90, 90) },
    LightGreen = { Primary = Color3.fromRGB(205, 255, 205), Dark = Color3.fromRGB(70, 90, 70) },
    Purple = { Primary = Color3.fromRGB(205, 125, 255), Dark = Color3.fromRGB(60, 20, 95) },
    Zinc = { Primary = Color3.fromRGB(110, 110, 120), Dark = Color3.fromRGB(20, 20, 30) },
}

local selectedTheme = Themes[_G.Theme] or Themes.Zinc
_G.Primary = selectedTheme.Primary
_G.Dark = selectedTheme.Dark

local VoidLib = {
    Elements = {},
    ThemeObjects = {},
    Connections = {},
    Flags = {},
    Folder = nil,
    SaveCfg = false,
}

function VoidLib.GetIcon(IconName)
    if not IconName or IconName == "" then
        return nil
    end
    if tonumber(IconName) then
        return "rbxassetid://" .. IconName
    end
    if string.match(IconName, "^rbxassetid://") or string.match(IconName, "^https?://") then
        return IconName
    end
    return nil
end

local FloatButton = Instance.new("ImageButton")
FloatButton.Name = "VoidFloatButton"
FloatButton.Parent = CoreGui
FloatButton.Position = UDim2.new(0, 10, 0, 10)
FloatButton.Size = UDim2.new(0, 50, 0, 50)
FloatButton.Draggable = true
FloatButton.BackgroundColor3 = _G.Dark
FloatButton.ImageColor3 = _G.Primary
FloatButton.ImageTransparency = 0.1
FloatButton.BackgroundTransparency = 0.1
FloatButton.Image = "rbxassetid://13940080072"

local FloatStroke = Instance.new("UIStroke")
FloatStroke.Color = _G.Primary
FloatStroke.Thickness = 1
FloatStroke.Transparency = 0
FloatStroke.Parent = FloatButton

local FloatCorner = Instance.new("UICorner")
FloatCorner.CornerRadius = UDim.new(0, 5)
FloatCorner.Parent = FloatButton

local VoidGui = Instance.new("ScreenGui")
VoidGui.Name = "VoidLib"
VoidGui.Parent = CoreGui
VoidGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
VoidGui.Enabled = false

local AlertGui = Instance.new("ScreenGui")
AlertGui.Name = "AlertFrame"
AlertGui.Parent = CoreGui
AlertGui.ZIndexBehavior = Enum.ZIndexBehavior.Global

FloatButton.MouseButton1Click:Connect(function()
    VoidGui.Enabled = not VoidGui.Enabled
end)

function VoidLib:MakeNotification(Config)
    Config = Config or {}
    Config.Name = Config.Name or "Notificação"
    Config.Content = Config.Content or "Teste"
    Config.Image = Config.Image or "rbxassetid://13940080072"
    Config.Time = Config.Time or 3

    spawn(function()
        local OutlineFrame = Instance.new("Frame")
        OutlineFrame.Name = "OutlineFrame"
        OutlineFrame.Parent = AlertGui
        OutlineFrame.ClipsDescendants = true
        OutlineFrame.BackgroundColor3 = _G.Dark
        OutlineFrame.BackgroundTransparency = 0.4
        OutlineFrame.Position = UDim2.new(1, 0, 0, 0)
        OutlineFrame.Size = UDim2.new(0, 212, 0, 72)

        local Frame = Instance.new("Frame")
        Frame.Name = "Frame"
        Frame.Parent = OutlineFrame
        Frame.ClipsDescendants = true
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = _G.Dark
        Frame.BackgroundTransparency = 0.1
        Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        Frame.Size = UDim2.new(0, 200, 0, 60)

        local Image = Instance.new("ImageLabel")
        Image.Name = "Icon"
        Image.Parent = Frame
        Image.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Image.BackgroundTransparency = 1
        Image.Position = UDim2.new(0, 8, 0, 8)
        Image.Size = UDim2.new(0, 45, 0, 45)
        Image.Image = Config.Image

        local Title = Instance.new("TextLabel")
        Title.Parent = Frame
        Title.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Title.BackgroundTransparency = 1
        Title.Position = UDim2.new(0, 55, 0, 14)
        Title.Size = UDim2.new(0, 10, 0, 20)
        Title.Font = Enum.Font.GothamBold
        Title.Text = Config.Name
        Title.TextColor3 = Color3.fromRGB(255, 255, 255)
        Title.TextSize = 16
        Title.TextXAlignment = Enum.TextXAlignment.Left

        local Desc = Instance.new("TextLabel")
        Desc.Parent = Frame
        Desc.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
        Desc.BackgroundTransparency = 1
        Desc.Position = UDim2.new(0, 55, 0, 33)
        Desc.Size = UDim2.new(0, 10, 0, 10)
        Desc.Font = Enum.Font.GothamSemibold
        Desc.TextTransparency = 0.3
        Desc.Text = Config.Content
        Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
        Desc.TextSize = 12
        Desc.TextXAlignment = Enum.TextXAlignment.Left

        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0, 10)
        UICorner.Parent = Frame

        local UICorner2 = Instance.new("UICorner")
        UICorner2.CornerRadius = UDim.new(0, 12)
        UICorner2.Parent = OutlineFrame

        OutlineFrame:TweenPosition(UDim2.new(1, -200, 0, 0), "Out", "Quad", 0.4, true)
        wait(Config.Time)
        OutlineFrame:TweenPosition(UDim2.new(1, 0, 0, 0), "Out", "Quad", 0.5, true)
        wait(0.6)
        OutlineFrame:Destroy()
    end)
end

function VoidLib:MakeWindow(WindowConfig)
    WindowConfig = WindowConfig or {}
    WindowConfig.Name = WindowConfig.Name or "Void Library"
    WindowConfig.ConfigFolder = WindowConfig.ConfigFolder or WindowConfig.Name
    WindowConfig.SaveConfig = WindowConfig.SaveConfig or false
    WindowConfig.HidePremium = WindowConfig.HidePremium or false
    WindowConfig.IntroEnabled = WindowConfig.IntroEnabled or true
    WindowConfig.IntroText = WindowConfig.IntroText or "Void Library"
    WindowConfig.CloseCallback = WindowConfig.CloseCallback or function() end
    WindowConfig.ShowIcon = WindowConfig.ShowIcon or false
    WindowConfig.Icon = WindowConfig.Icon or "rbxassetid://8834748103"
    WindowConfig.IntroIcon = WindowConfig.IntroIcon or "rbxassetid://13940080072"

    VoidLib.Folder = WindowConfig.ConfigFolder
    VoidLib.SaveCfg = WindowConfig.SaveConfig

    if WindowConfig.SaveConfig then
        if not isfolder(WindowConfig.ConfigFolder) then
            makefolder(WindowConfig.ConfigFolder)
        end
    end

    local FirstTab = true
    local Minimized = false
    local UIHidden = false

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "Main"
    MainFrame.Parent = VoidGui
    MainFrame.ClipsDescendants = true
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = _G.Dark
    MainFrame.BackgroundTransparency = 0.1
    MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainFrame.Size = UDim2.new(0, 524, 0, 332)

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Color = _G.Primary
    MainStroke.Thickness = 1
    MainStroke.Transparency = 0
    MainStroke.Parent = MainFrame

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 5)
    MainCorner.Parent = MainFrame

    local DragButton = Instance.new("Frame")
    DragButton.Name = "DragButton"
    DragButton.Parent = MainFrame
    DragButton.Position = UDim2.new(1, 5, 1, 5)
    DragButton.AnchorPoint = Vector2.new(1, 1)
    DragButton.Size = UDim2.new(0, 15, 0, 15)
    DragButton.BackgroundColor3 = _G.Primary
    DragButton.BackgroundTransparency = 0.1
    DragButton.ZIndex = 10

    local DragCorner = Instance.new("UICorner")
    DragCorner.CornerRadius = UDim.new(0, 99)
    DragCorner.Parent = DragButton

    local TopBar = Instance.new("Frame")
    TopBar.Name = "Top"
    TopBar.Parent = MainFrame
    TopBar.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    TopBar.Size = UDim2.new(1, 0, 0, 40)
    TopBar.BackgroundTransparency = 1

    local TopCorner = Instance.new("UICorner")
    TopCorner.CornerRadius = UDim.new(0, 5)
    TopCorner.Parent = TopBar

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "ttittles"
    TitleLabel.Parent = TopBar
    TitleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Position = UDim2.new(0, 15, 0.5, 0)
    TitleLabel.AnchorPoint = Vector2.new(0, 0.5)
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = WindowConfig.Name .. " |"
    TitleLabel.TextSize = 15
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Size = UDim2.new(0, 1, 0, 25)

    local TextService = game:GetService("TextService")
    TitleLabel.Size = UDim2.new(0, TextService:GetTextSize(TitleLabel.Text, TitleLabel.TextSize, TitleLabel.Font, Vector2.new(math.huge, math.huge)).X, 0, 25)

    local PatchLabel = Instance.new("TextLabel")
    PatchLabel.Name = "patch"
    PatchLabel.Parent = TitleLabel
    PatchLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PatchLabel.BackgroundTransparency = 1
    PatchLabel.Position = UDim2.new(1, 5, 0.5, 0)
    PatchLabel.Size = UDim2.new(0, 1, 0, 25)
    PatchLabel.Font = Enum.Font.Gotham
    PatchLabel.AnchorPoint = Vector2.new(0, 0.5)
    PatchLabel.Text = "v1.0"
    PatchLabel.TextSize = 15
    PatchLabel.TextColor3 = _G.Primary
    PatchLabel.Size = UDim2.new(0, TextService:GetTextSize(PatchLabel.Text, PatchLabel.TextSize, PatchLabel.Font, Vector2.new(math.huge, math.huge)).X, 0, 25)

    local HideButton = Instance.new("ImageButton")
    HideButton.Name = "Hide"
    HideButton.Parent = TopBar
    HideButton.BackgroundColor3 = _G.Primary
    HideButton.BackgroundTransparency = 1
    HideButton.AnchorPoint = Vector2.new(1, 0.5)
    HideButton.Position = UDim2.new(1, -10, 0.5, 0)
    HideButton.Size = UDim2.new(0, 25, 0, 25)
    HideButton.Image = "rbxassetid://7743878857"
    HideButton.ImageTransparency = 0
    HideButton.ImageColor3 = Color3.fromRGB(245, 245, 245)

    local HideCorner = Instance.new("UICorner")
    HideCorner.CornerRadius = UDim.new(0, 3)
    HideCorner.Parent = HideButton

    HideButton.MouseButton1Click:Connect(function()
        VoidGui.Enabled = false
        UIHidden = true
        VoidLib:MakeNotification({
            Name = "Interface Oculta",
            Content = "Pressione Shift Direito para reabrir",
            Time = 3
        })
        WindowConfig.CloseCallback()
    end)

    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == Enum.KeyCode.RightShift and UIHidden then
            VoidGui.Enabled = true
        end
    end)

    UserInputService.InputBegan:Connect(function(Input)
        if Input.KeyCode == Enum.KeyCode.Insert then
            VoidGui.Enabled = not VoidGui.Enabled
        end
    end)

    local SepBot = Instance.new("Frame")
    SepBot.Name = "SepBot"
    SepBot.Parent = TopBar
    SepBot.BackgroundColor3 = _G.Primary
    SepBot.BackgroundTransparency = 0
    SepBot.BorderSizePixel = 0
    SepBot.AnchorPoint = Vector2.new(0.5, 1)
    SepBot.Position = UDim2.new(0.5, 0, 1, 0)
    SepBot.Size = UDim2.new(1, 0, 0, 1)

    local TabFrame = Instance.new("Frame")
    TabFrame.Name = "Tab"
    TabFrame.Parent = MainFrame
    TabFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    TabFrame.Position = UDim2.new(0, 8, 0, 45)
    TabFrame.BackgroundTransparency = 1
    TabFrame.Size = UDim2.new(0, 148, 0, 275)

    local TabScroll = Instance.new("ScrollingFrame")
    TabScroll.Name = "ScrollTab"
    TabScroll.Parent = TabFrame
    TabScroll.Active = true
    TabScroll.BackgroundColor3 = Color3.fromRGB(0, 10, 250)
    TabScroll.Position = UDim2.new(0, 0, 0, 0)
    TabScroll.BackgroundTransparency = 1
    TabScroll.Size = UDim2.new(1, 0, 1, 0)
    TabScroll.ScrollBarThickness = 0
    TabScroll.ScrollingDirection = Enum.ScrollingDirection.Y

    local TabCorner = Instance.new("UICorner")
    TabCorner.Parent = TabFrame
    TabCorner.CornerRadius = UDim.new(0, 5)

    local TabList = Instance.new("UIListLayout")
    TabList.Name = "PLL"
    TabList.Parent = TabScroll
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 2)

    local TabPadding = Instance.new("UIPadding")
    TabPadding.Name = "PPD"
    TabPadding.Parent = TabScroll

    local PageFrame = Instance.new("Frame")
    PageFrame.Name = "Page"
    PageFrame.Parent = MainFrame
    PageFrame.BackgroundColor3 = _G.Dark
    PageFrame.Position = UDim2.new(0, 166, 0, 45)
    PageFrame.Size = UDim2.new(0, 350, 0, 275)
    PageFrame.BackgroundTransparency = 1

    local PageCorner = Instance.new("UICorner")
    PageCorner.Parent = PageFrame
    PageCorner.CornerRadius = UDim.new(0, 3)

    local MainPage = Instance.new("Frame")
    MainPage.Name = "MainPage"
    MainPage.Parent = PageFrame
    MainPage.ClipsDescendants = true
    MainPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MainPage.BackgroundTransparency = 1
    MainPage.Size = UDim2.new(1, 0, 1, 0)

    local PageFolder = Instance.new("Folder")
    PageFolder.Name = "PageList"
    PageFolder.Parent = MainPage

    local PageLayout = Instance.new("UIPageLayout")
    PageLayout.Parent = PageFolder
    PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageLayout.EasingDirection = Enum.EasingDirection.InOut
    PageLayout.EasingStyle = Enum.EasingStyle.Quad
    PageLayout.FillDirection = Enum.FillDirection.Vertical
    PageLayout.Padding = UDim.new(0, 10)
    PageLayout.TweenTime = 0
    PageLayout.GamepadInputEnabled = false
    PageLayout.ScrollWheelInputEnabled = false
    PageLayout.TouchInputEnabled = false

    local Dragging = false
    local DragInput = nil
    local MousePos = nil
    local FramePos = nil

    DragButton.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
            Dragging = true
            MousePos = Input.Position
            FramePos = MainFrame.Position
            Input.Changed:Connect(function()
                if Input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    DragButton.InputChanged:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch then
            DragInput = Input
        end
    end)

    UserInputService.InputChanged:Connect(function(Input)
        if Input == DragInput and Dragging then
            local Delta = Input.Position - MousePos
            MainFrame.Position = UDim2.new(FramePos.X.Scale, FramePos.X.Offset + Delta.X, FramePos.Y.Scale, FramePos.Y.Offset + Delta.Y)
        end
    end)

    local function CreateElement(ElementName, ElementFunction)
        VoidLib.Elements[ElementName] = function(...)
            return ElementFunction(...)
        end
    end

    local function MakeElement(ElementName, ...)
        return VoidLib.Elements[ElementName](...)
    end

    local function SetProps(Element, Props)
        for Property, Value in pairs(Props) do
            Element[Property] = Value
        end
        return Element
    end

    local function SetChildren(Element, Children)
        for _, Child in pairs(Children) do
            Child.Parent = Element
        end
        return Element
    end

    local function AddConnection(Signal, Function)
        local SignalConnect = Signal:Connect(Function)
        table.insert(VoidLib.Connections, SignalConnect)
        return SignalConnect
    end

    local function Round(Number, Factor)
        local Result = math.floor(Number / Factor + (math.sign(Number) * 0.5)) * Factor
        if Result < 0 then Result = Result + Factor end
        return Result
    end

    local function PackColor(Color)
        return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
    end

    local function UnpackColor(Color)
        return Color3.fromRGB(Color.R, Color.G, Color.B)
    end

    local function LoadCfg(Config)
        local Data = HttpService:JSONDecode(Config)
        for Flag, Value in pairs(Data) do
            if VoidLib.Flags[Flag] then
                spawn(function()
                    if VoidLib.Flags[Flag].Type == "Colorpicker" then
                        VoidLib.Flags[Flag]:Set(UnpackColor(Value))
                    else
                        VoidLib.Flags[Flag]:Set(Value)
                    end
                end)
            end
        end
    end

    local function SaveCfg(Name)
        local Data = {}
        for Flag, Element in pairs(VoidLib.Flags) do
            if Element.Save then
                if Element.Type == "Colorpicker" then
                    Data[Flag] = PackColor(Element.Value)
                else
                    Data[Flag] = Element.Value
                end
            end
        end
        writefile(VoidLib.Folder .. "/" .. Name .. ".txt", HttpService:JSONEncode(Data))
    end

    local WhitelistedMouse = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3, Enum.UserInputType.Touch}
    local BlacklistedKeys = {Enum.KeyCode.Unknown, Enum.KeyCode.W, Enum.KeyCode.A, Enum.KeyCode.S, Enum.KeyCode.D, Enum.KeyCode.Up, Enum.KeyCode.Left, Enum.KeyCode.Down, Enum.KeyCode.Right, Enum.KeyCode.Slash, Enum.KeyCode.Tab, Enum.KeyCode.Backspace, Enum.KeyCode.Escape}

    local function CheckKey(Table, Key)
        for _, v in pairs(Table) do
            if v == Key then
                return true
            end
        end
        return false
    end

    CreateElement("Corner", function(Scale, Offset)
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(Scale or 0, Offset or 10)
        return Corner
    end)

    CreateElement("Stroke", function(Color, Thickness)
        local Stroke = Instance.new("UIStroke")
        Stroke.Color = Color or Color3.fromRGB(255, 255, 255)
        Stroke.Thickness = Thickness or 1
        return Stroke
    end)

    CreateElement("List", function(Scale, Offset)
        local List = Instance.new("UIListLayout")
        List.SortOrder = Enum.SortOrder.LayoutOrder
        List.Padding = UDim.new(Scale or 0, Offset or 0)
        return List
    end)

    CreateElement("Padding", function(Bottom, Left, Right, Top)
        local Padding = Instance.new("UIPadding")
        Padding.PaddingBottom = UDim.new(0, Bottom or 4)
        Padding.PaddingLeft = UDim.new(0, Left or 4)
        Padding.PaddingRight = UDim.new(0, Right or 4)
        Padding.PaddingTop = UDim.new(0, Top or 4)
        return Padding
    end)

    CreateElement("TFrame", function()
        local Frame = Instance.new("Frame")
        Frame.BackgroundTransparency = 1
        return Frame
    end)

    CreateElement("Frame", function(Color)
        local Frame = Instance.new("Frame")
        Frame.BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255)
        Frame.BorderSizePixel = 0
        return Frame
    end)

    CreateElement("RoundFrame", function(Color, Scale, Offset)
        local Frame = Instance.new("Frame")
        Frame.BackgroundColor3 = Color or Color3.fromRGB(255, 255, 255)
        Frame.BorderSizePixel = 0
        local Corner = Instance.new("UICorner")
        Corner.CornerRadius = UDim.new(Scale or 0, Offset or 10)
        Corner.Parent = Frame
        return Frame
    end)

    CreateElement("Button", function()
        local Button = Instance.new("TextButton")
        Button.Text = ""
        Button.AutoButtonColor = false
        Button.BackgroundTransparency = 1
        Button.BorderSizePixel = 0
        return Button
    end)

    CreateElement("ScrollFrame", function(Color, Width)
        local ScrollFrame = Instance.new("ScrollingFrame")
        ScrollFrame.BackgroundTransparency = 1
        ScrollFrame.MidImage = "rbxassetid://7445543667"
        ScrollFrame.BottomImage = "rbxassetid://7445543667"
        ScrollFrame.TopImage = "rbxassetid://7445543667"
        ScrollFrame.ScrollBarImageColor3 = Color or Color3.fromRGB(255, 255, 255)
        ScrollFrame.BorderSizePixel = 0
        ScrollFrame.ScrollBarThickness = Width or 4
        ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
        return ScrollFrame
    end)

    CreateElement("Image", function(ImageID)
        local Image = Instance.new("ImageLabel")
        Image.Image = ImageID
        Image.BackgroundTransparency = 1
        local iconData = VoidLib.GetIcon(ImageID)
        if iconData then
            Image.Image = iconData
        end
        return Image
    end)

    CreateElement("ImageButton", function(ImageID)
        local Image = Instance.new("ImageButton")
        Image.Image = ImageID
        Image.BackgroundTransparency = 1
        return Image
    end)

    CreateElement("Label", function(Text, TextSize, Transparency)
        local Label = Instance.new("TextLabel")
        Label.Text = Text or ""
        Label.TextColor3 = Color3.fromRGB(240, 240, 240)
        Label.TextTransparency = Transparency or 0
        Label.TextSize = TextSize or 15
        Label.Font = Enum.Font.Gotham
        Label.RichText = true
        Label.BackgroundTransparency = 1
        Label.TextXAlignment = Enum.TextXAlignment.Left
        return Label
    end)

    local function GetElementFunction(ItemParent)
        local ElementFunction = {}

        function ElementFunction:AddLabel(Text)
            local Frame = Instance.new("Frame")
            Frame.Name = "LabelFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 30)
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Label = Instance.new("TextLabel")
            Label.Name = "Content"
            Label.Parent = Frame
            Label.Size = UDim2.new(1, -12, 1, 0)
            Label.Position = UDim2.new(0, 12, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamBold
            Label.Text = Text or ""
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 15
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local Func = {}
            function Func:Set(NewText)
                Label.Text = NewText
            end
            return Func
        end

        function ElementFunction:AddParagraph(TitleText, ContentText)
            local Frame = Instance.new("Frame")
            Frame.Name = "ParagraphFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 30)
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Title = Instance.new("TextLabel")
            Title.Name = "Title"
            Title.Parent = Frame
            Title.Size = UDim2.new(1, -12, 0, 14)
            Title.Position = UDim2.new(0, 12, 0, 10)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamBold
            Title.Text = TitleText or "Título"
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 15
            Title.TextXAlignment = Enum.TextXAlignment.Left

            local Content = Instance.new("TextLabel")
            Content.Name = "Content"
            Content.Parent = Frame
            Content.Size = UDim2.new(1, -24, 0, 0)
            Content.Position = UDim2.new(0, 12, 0, 26)
            Content.BackgroundTransparency = 1
            Content.Font = Enum.Font.GothamSemibold
            Content.Text = ContentText or "Conteúdo"
            Content.TextColor3 = Color3.fromRGB(200, 200, 200)
            Content.TextSize = 13
            Content.TextWrapped = true
            Content.TextXAlignment = Enum.TextXAlignment.Left

            AddConnection(Content:GetPropertyChangedSignal("Text"), function()
                Content.Size = UDim2.new(1, -24, 0, Content.TextBounds.Y)
                Frame.Size = UDim2.new(1, 0, 0, Content.TextBounds.Y + 35)
            end)

            local Func = {}
            function Func:Set(NewTitle, NewContent)
                Title.Text = NewTitle or Title.Text
                Content.Text = NewContent or Content.Text
            end
            return Func
        end

        function ElementFunction:AddButton(ButtonConfig)
            ButtonConfig = ButtonConfig or {}
            ButtonConfig.Name = ButtonConfig.Name or "Botão"
            ButtonConfig.Callback = ButtonConfig.Callback or function() end
            ButtonConfig.Icon = ButtonConfig.Icon or "rbxassetid://10723375250"

            local Frame = Instance.new("Frame")
            Frame.Name = "ButtonFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 36)
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Label = Instance.new("TextLabel")
            Label.Name = "Content"
            Label.Parent = Frame
            Label.Size = UDim2.new(1, -12, 1, 0)
            Label.Position = UDim2.new(0, 15, 0, 0)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = ButtonConfig.Name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local Icon = Instance.new("ImageLabel")
            Icon.Name = "Icon"
            Icon.Parent = Frame
            Icon.Size = UDim2.new(0, 15, 0, 15)
            Icon.Position = UDim2.new(1, -25, 0.5, 0)
            Icon.AnchorPoint = Vector2.new(0.5, 0.5)
            Icon.BackgroundTransparency = 1
            Icon.Image = ButtonConfig.Icon
            Icon.ImageTransparency = 0.2
            Icon.ImageColor3 = Color3.fromRGB(245, 245, 245)

            local Click = Instance.new("TextButton")
            Click.Name = "Click"
            Click.Parent = Frame
            Click.Size = UDim2.new(1, 0, 1, 0)
            Click.BackgroundTransparency = 1
            Click.Text = ""

            Click.MouseEnter:Connect(function()
                TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.6}):Play()
            end)

            Click.MouseLeave:Connect(function()
                TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8}):Play()
            end)

            Click.MouseButton1Click:Connect(function()
                TweenService:Create(Frame, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.4}):Play()
                spawn(function()
                    ButtonConfig.Callback()
                end)
                task.wait(0.1)
                TweenService:Create(Frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8}):Play()
            end)

            local Func = {}
            function Func:Set(NewText)
                Label.Text = NewText
            end
            return Func
        end

        function ElementFunction:AddToggle(ToggleConfig)
            ToggleConfig = ToggleConfig or {}
            ToggleConfig.Name = ToggleConfig.Name or "Interruptor"
            ToggleConfig.Default = ToggleConfig.Default or false
            ToggleConfig.Callback = ToggleConfig.Callback or function() end
            ToggleConfig.Color = ToggleConfig.Color or _G.Primary
            ToggleConfig.Flag = ToggleConfig.Flag or nil
            ToggleConfig.Save = ToggleConfig.Save or false

            local Toggle = {Value = ToggleConfig.Default, Save = ToggleConfig.Save, Type = "Toggle"}

            local Frame = Instance.new("Frame")
            Frame.Name = "ToggleFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 46)
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Title = Instance.new("TextLabel")
            Title.Name = "Title"
            Title.Parent = Frame
            Title.Size = UDim2.new(1, -60, 0, 30)
            Title.Position = UDim2.new(0, 15, 0.5, ToggleConfig.Description and -5 or 0)
            Title.AnchorPoint = Vector2.new(0, 0.5)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamSemibold
            Title.Text = ToggleConfig.Name
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 13
            Title.TextXAlignment = Enum.TextXAlignment.Left

            local Desc = Instance.new("TextLabel")
            Desc.Name = "Description"
            Desc.Parent = Frame
            Desc.Size = UDim2.new(1, -60, 0, 16)
            Desc.Position = UDim2.new(0, 15, 0, 22)
            Desc.BackgroundTransparency = 1
            Desc.Font = Enum.Font.Gotham
            Desc.Text = ToggleConfig.Description or ""
            Desc.TextColor3 = Color3.fromRGB(200, 200, 200)
            Desc.TextSize = 10
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.Visible = ToggleConfig.Description ~= nil

            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Parent = Frame
            ToggleFrame.Size = UDim2.new(0, 35, 0, 20)
            ToggleFrame.Position = UDim2.new(1, -10, 0.5, 0)
            ToggleFrame.AnchorPoint = Vector2.new(1, 0.5)
            ToggleFrame.BackgroundColor3 = _G.Dark
            ToggleFrame.BackgroundTransparency = 1

            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(0, 10)
            ToggleCorner.Parent = ToggleFrame

            local ToggleButton = Instance.new("TextButton")
            ToggleButton.Name = "ToggleImage"
            ToggleButton.Parent = ToggleFrame
            ToggleButton.Size = UDim2.new(1, 0, 1, 0)
            ToggleButton.BackgroundColor3 = _G.Dark
            ToggleButton.BackgroundTransparency = 0
            ToggleButton.Text = ""
            ToggleButton.AutoButtonColor = false

            local ToggleStroke = Instance.new("UIStroke")
            ToggleStroke.Color = _G.Primary
            ToggleStroke.Thickness = 1
            ToggleStroke.Transparency = 0
            ToggleStroke.Parent = ToggleFrame

            local ToggleCorner2 = Instance.new("UICorner")
            ToggleCorner2.CornerRadius = UDim.new(0, 10)
            ToggleCorner2.Parent = ToggleButton

            local Circle = Instance.new("Frame")
            Circle.Name = "Circle"
            Circle.Parent = ToggleButton
            Circle.Size = UDim2.new(0, 14, 0, 14)
            Circle.Position = UDim2.new(0, 3, 0.5, 0)
            Circle.AnchorPoint = Vector2.new(0, 0.5)
            Circle.BackgroundColor3 = _G.Primary
            Circle.BackgroundTransparency = 0

            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(0, 10)
            CircleCorner.Parent = Circle

            local Click = Instance.new("TextButton")
            Click.Name = "Click"
            Click.Parent = Frame
            Click.Size = UDim2.new(1, 0, 1, 0)
            Click.BackgroundTransparency = 1
            Click.Text = ""

            function Toggle:Set(Value)
                Toggle.Value = Value
                if Value then
                    ToggleStroke.Thickness = 0
                    Circle:TweenPosition(UDim2.new(0, 18, 0.5, 0), "Out", "Sine", 0.2, true)
                    TweenService:Create(Circle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = _G.Dark}):Play()
                    TweenService:Create(ToggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = ToggleConfig.Color}):Play()
                else
                    ToggleStroke.Thickness = 1
                    Circle:TweenPosition(UDim2.new(0, 3, 0.5, 0), "Out", "Sine", 0.2, true)
                    TweenService:Create(Circle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = ToggleConfig.Color}):Play()
                    TweenService:Create(ToggleButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = _G.Dark}):Play()
                end
                ToggleConfig.Callback(Toggle.Value)
            end

            Click.MouseButton1Click:Connect(function()
                Toggle:Set(not Toggle.Value)
                if ToggleConfig.Save and VoidLib.SaveCfg then
                    SaveCfg(game.GameId)
                end
            end)

            Toggle:Set(Toggle.Value)

            if ToggleConfig.Flag then
                VoidLib.Flags[ToggleConfig.Flag] = Toggle
            end
            return Toggle
        end

        function ElementFunction:AddSlider(SliderConfig)
            SliderConfig = SliderConfig or {}
            SliderConfig.Name = SliderConfig.Name or "Controle"
            SliderConfig.Min = SliderConfig.Min or 0
            SliderConfig.Max = SliderConfig.Max or 100
            SliderConfig.Increment = SliderConfig.Increment or 1
            SliderConfig.Default = SliderConfig.Default or 50
            SliderConfig.Callback = SliderConfig.Callback or function() end
            SliderConfig.ValueName = SliderConfig.ValueName or ""
            SliderConfig.Color = SliderConfig.Color or _G.Primary
            SliderConfig.Flag = SliderConfig.Flag or nil
            SliderConfig.Save = SliderConfig.Save or false

            local Slider = {Value = SliderConfig.Default, Save = SliderConfig.Save, Type = "Slider"}
            local Dragging = false

            local Frame = Instance.new("Frame")
            Frame.Name = "SliderFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 45)
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = Frame
            Label.Size = UDim2.new(1, -100, 0, 30)
            Label.Position = UDim2.new(0, 15, 0.5, 0)
            Label.AnchorPoint = Vector2.new(0, 0.5)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = SliderConfig.Name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local ValueBox = Instance.new("TextBox")
            ValueBox.Name = "ValueBox"
            ValueBox.Parent = Frame
            ValueBox.Size = UDim2.new(0, 35, 0, 15)
            ValueBox.Position = UDim2.new(1, -10, 0.5, -10)
            ValueBox.AnchorPoint = Vector2.new(1, 0.5)
            ValueBox.BackgroundColor3 = _G.Dark
            ValueBox.BackgroundTransparency = 0.1
            ValueBox.Font = Enum.Font.Code
            ValueBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            ValueBox.TextSize = 9
            ValueBox.Text = tostring(SliderConfig.Default)
            ValueBox.TextTransparency = 0.1
            ValueBox.ClearTextOnFocus = false
            ValueBox.TextXAlignment = Enum.TextXAlignment.Center

            local ValueCorner = Instance.new("UICorner")
            ValueCorner.CornerRadius = UDim.new(0, 3)
            ValueCorner.Parent = ValueBox

            local Bar = Instance.new("Frame")
            Bar.Name = "Bar"
            Bar.Parent = Frame
            Bar.Size = UDim2.new(0, 100, 0, 4)
            Bar.Position = UDim2.new(1, -10, 0.5, 10)
            Bar.AnchorPoint = Vector2.new(1, 0.5)
            Bar.BackgroundColor3 = _G.Primary
            Bar.BackgroundTransparency = 0.8

            local BarCorner = Instance.new("UICorner")
            BarCorner.CornerRadius = UDim.new(0, 5)
            BarCorner.Parent = Bar

            local BarFill = Instance.new("Frame")
            BarFill.Name = "BarFill"
            BarFill.Parent = Bar
            BarFill.Size = UDim2.new((SliderConfig.Default - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min), 0, 0, 4)
            BarFill.BackgroundColor3 = _G.Dark
            BarFill.BackgroundTransparency = 0

            local FillCorner = Instance.new("UICorner")
            FillCorner.CornerRadius = UDim.new(0, 5)
            FillCorner.Parent = BarFill

            local Circle = Instance.new("Frame")
            Circle.Name = "Circle"
            Circle.Parent = BarFill
            Circle.Size = UDim2.new(0, 13, 0, 13)
            Circle.Position = UDim2.new(1, 0, 0, -5)
            Circle.AnchorPoint = Vector2.new(0.5, 0)
            Circle.BackgroundColor3 = _G.Dark

            local CircleCorner = Instance.new("UICorner")
            CircleCorner.CornerRadius = UDim.new(0, 100)
            CircleCorner.Parent = Circle

            local function UpdateSlider(Value)
                Value = math.clamp(Round(Value, SliderConfig.Increment), SliderConfig.Min, SliderConfig.Max)
                Slider.Value = Value
                local Scale = (Value - SliderConfig.Min) / (SliderConfig.Max - SliderConfig.Min)
                BarFill.Size = UDim2.new(Scale, 0, 0, 4)
                Circle.Position = UDim2.new(Scale, 0, 0, -5)
                ValueBox.Text = tostring(Value) .. " " .. SliderConfig.ValueName
                SliderConfig.Callback(Value)
            end

            Bar.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                    local Scale = math.clamp((Input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
                    UpdateSlider(SliderConfig.Min + (Scale * (SliderConfig.Max - SliderConfig.Min)))
                end
            end)

            Circle.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = true
                end
            end)

            Bar.InputEnded:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = false
                end
            end)

            Circle.InputEnded:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    Dragging = false
                end
            end)

            UserInputService.InputChanged:Connect(function(Input)
                if Dragging and (Input.UserInputType == Enum.UserInputType.MouseMovement or Input.UserInputType == Enum.UserInputType.Touch) then
                    local Scale = math.clamp((Input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
                    UpdateSlider(SliderConfig.Min + (Scale * (SliderConfig.Max - SliderConfig.Min)))
                    if SliderConfig.Save and VoidLib.SaveCfg then
                        SaveCfg(game.GameId)
                    end
                end
            end)

            ValueBox.FocusLost:Connect(function()
                local num = tonumber(ValueBox.Text)
                if num then
                    UpdateSlider(num)
                else
                    ValueBox.Text = tostring(Slider.Value) .. " " .. SliderConfig.ValueName
                end
            end)

            UpdateSlider(SliderConfig.Default)

            if SliderConfig.Flag then
                VoidLib.Flags[SliderConfig.Flag] = Slider
            end
            return Slider
        end

        function ElementFunction:AddDropdown(DropdownConfig)
            DropdownConfig = DropdownConfig or {}
            DropdownConfig.Name = DropdownConfig.Name or "Menu"
            DropdownConfig.Options = DropdownConfig.Options or {}
            DropdownConfig.Default = DropdownConfig.Default or ""
            DropdownConfig.Callback = DropdownConfig.Callback or function() end
            DropdownConfig.Flag = DropdownConfig.Flag or nil
            DropdownConfig.Save = DropdownConfig.Save or false

            local Dropdown = {Value = DropdownConfig.Default, Options = DropdownConfig.Options, Buttons = {}, Toggled = false, Type = "Dropdown", Save = DropdownConfig.Save}
            local MaxElements = 5

            if not table.find(Dropdown.Options, Dropdown.Value) then
                Dropdown.Value = "..."
            end

            local Frame = Instance.new("Frame")
            Frame.Name = "DropdownFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 40)
            Frame.ClipsDescendants = false
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Title = Instance.new("TextLabel")
            Title.Name = "Title"
            Title.Parent = Frame
            Title.Size = UDim2.new(1, -120, 0, 30)
            Title.Position = UDim2.new(0, 15, 0, 5)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamSemibold
            Title.Text = DropdownConfig.Name
            Title.TextColor3 = Color3.fromRGB(255, 255, 255)
            Title.TextSize = 13
            Title.TextXAlignment = Enum.TextXAlignment.Left

            local SelectButton = Instance.new("TextButton")
            SelectButton.Name = "SelectButton"
            SelectButton.Parent = Frame
            SelectButton.Size = UDim2.new(0, 100, 0, 30)
            SelectButton.Position = UDim2.new(1, -5, 0, 5)
            SelectButton.AnchorPoint = Vector2.new(1, 0)
            SelectButton.BackgroundColor3 = _G.Dark
            SelectButton.BackgroundTransparency = 0.1
            SelectButton.Font = Enum.Font.GothamMedium
            SelectButton.Text = " " .. (Dropdown.Value or "Selecionar")
            SelectButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            SelectButton.TextSize = 9
            SelectButton.TextXAlignment = Enum.TextXAlignment.Left
            SelectButton.ClipsDescendants = true

            local SelectCorner = Instance.new("UICorner")
            SelectCorner.CornerRadius = UDim.new(0, 5)
            SelectCorner.Parent = SelectButton

            local DropdownContainer = Instance.new("Frame")
            DropdownContainer.Name = "DropdownContainer"
            DropdownContainer.Parent = Frame
            DropdownContainer.Size = UDim2.new(1, -10, 0, 0)
            DropdownContainer.Position = UDim2.new(0, 5, 0, 40)
            DropdownContainer.BackgroundColor3 = _G.Dark
            DropdownContainer.BackgroundTransparency = 0
            DropdownContainer.ClipsDescendants = true
            DropdownContainer.Visible = false

            local ContainerCorner = Instance.new("UICorner")
            ContainerCorner.CornerRadius = UDim.new(0, 5)
            ContainerCorner.Parent = DropdownContainer

            local DropdownScroll = Instance.new("ScrollingFrame")
            DropdownScroll.Name = "DropdownScroll"
            DropdownScroll.Parent = DropdownContainer
            DropdownScroll.Size = UDim2.new(1, 0, 0, 80)
            DropdownScroll.Position = UDim2.new(0, 0, 0, 10)
            DropdownScroll.BackgroundTransparency = 1
            DropdownScroll.ScrollBarThickness = 3
            DropdownScroll.ScrollingDirection = Enum.ScrollingDirection.Y
            DropdownScroll.CanvasSize = UDim2.new(0, 0, 0, 0)

            local ScrollPadding = Instance.new("UIPadding")
            ScrollPadding.PaddingLeft = UDim.new(0, 10)
            ScrollPadding.PaddingRight = UDim.new(0, 10)
            ScrollPadding.Parent = DropdownScroll

            local ScrollList = Instance.new("UIListLayout")
            ScrollList.Parent = DropdownScroll
            ScrollList.SortOrder = Enum.SortOrder.LayoutOrder
            ScrollList.Padding = UDim.new(0, 1)

            local function AddOptions(Options)
                for _, Option in pairs(Options) do
                    local OptionButton = Instance.new("TextButton")
                    OptionButton.Name = "Option"
                    OptionButton.Parent = DropdownScroll
                    OptionButton.Size = UDim2.new(1, 0, 0, 30)
                    OptionButton.BackgroundColor3 = _G.Primary
                    OptionButton.BackgroundTransparency = 1
                    OptionButton.Font = Enum.Font.GothamSemibold
                    OptionButton.Text = tostring(Option)
                    OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
                    OptionButton.TextSize = 11
                    OptionButton.TextTransparency = 0.5
                    OptionButton.TextXAlignment = Enum.TextXAlignment.Left

                    local Padding = Instance.new("UIPadding")
                    Padding.PaddingLeft = UDim.new(0, 8)
                    Padding.Parent = OptionButton

                    local OptionCorner = Instance.new("UICorner")
                    OptionCorner.CornerRadius = UDim.new(0, 5)
                    OptionCorner.Parent = OptionButton

                    local Selection = Instance.new("Frame")
                    Selection.Name = "Selection"
                    Selection.Parent = OptionButton
                    Selection.Size = UDim2.new(0, 3, 0.4, 0)
                    Selection.Position = UDim2.new(0, -8, 0.5, 0)
                    Selection.AnchorPoint = Vector2.new(0, 0.5)
                    Selection.BackgroundColor3 = _G.Primary
                    Selection.BackgroundTransparency = 1

                    local SelectionCorner = Instance.new("UICorner")
                    SelectionCorner.CornerRadius = UDim.new(0, 999)
                    SelectionCorner.Parent = Selection

                    OptionButton.MouseEnter:Connect(function()
                        TweenService:Create(OptionButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0, BackgroundTransparency = 0.8}):Play()
                        TweenService:Create(Selection, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    end)

                    OptionButton.MouseLeave:Connect(function()
                        TweenService:Create(OptionButton, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.5, BackgroundTransparency = 1}):Play()
                        TweenService:Create(Selection, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    end)

                    OptionButton.MouseButton1Click:Connect(function()
                        Dropdown:Set(tostring(Option))
                        if DropdownConfig.Save and VoidLib.SaveCfg then
                            SaveCfg(game.GameId)
                        end
                    end)

                    Dropdown.Buttons[tostring(Option)] = OptionButton
                end
                DropdownScroll.CanvasSize = UDim2.new(0, 0, 0, ScrollList.AbsoluteContentSize.Y)
            end

            function Dropdown:Refresh(Options, Delete)
                if Delete then
                    for _, btn in pairs(Dropdown.Buttons) do
                        btn:Destroy()
                    end
                    table.clear(Dropdown.Options)
                    table.clear(Dropdown.Buttons)
                end
                Dropdown.Options = Options
                AddOptions(Dropdown.Options)
            end

            function Dropdown:Set(Value)
                if not table.find(Dropdown.Options, Value) then
                    Dropdown.Value = "..."
                    SelectButton.Text = " ..."
                    return
                end
                Dropdown.Value = Value
                SelectButton.Text = " " .. Value
                for _, btn in pairs(Dropdown.Buttons) do
                    TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    TweenService:Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.5}):Play()
                    local sel = btn:FindFirstChild("Selection")
                    if sel then
                        TweenService:Create(sel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    end
                end
                if Dropdown.Buttons[Value] then
                    TweenService:Create(Dropdown.Buttons[Value], TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8}):Play()
                    TweenService:Create(Dropdown.Buttons[Value], TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
                    local sel = Dropdown.Buttons[Value]:FindFirstChild("Selection")
                    if sel then
                        TweenService:Create(sel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
                    end
                end
                DropdownConfig.Callback(Dropdown.Value)
            end

            SelectButton.MouseButton1Click:Connect(function()
                Dropdown.Toggled = not Dropdown.Toggled
                if Dropdown.Toggled then
                    DropdownContainer.Visible = true
                    DropdownContainer.Size = UDim2.new(1, -10, 0, 100)
                    Frame.Size = UDim2.new(1, 0, 0, 145)
                else
                    DropdownContainer.Size = UDim2.new(1, -10, 0, 0)
                    DropdownContainer.Visible = false
                    Frame.Size = UDim2.new(1, 0, 0, 40)
                end
            end)

            Dropdown:Refresh(Dropdown.Options, false)
            Dropdown:Set(Dropdown.Value)

            if DropdownConfig.Flag then
                VoidLib.Flags[DropdownConfig.Flag] = Dropdown
            end
            return Dropdown
        end

        function ElementFunction:AddBind(BindConfig)
            BindConfig = BindConfig or {}
            BindConfig.Name = BindConfig.Name or "Atalho"
            BindConfig.Default = BindConfig.Default or Enum.KeyCode.Unknown
            BindConfig.Hold = BindConfig.Hold or false
            BindConfig.Callback = BindConfig.Callback or function() end
            BindConfig.Flag = BindConfig.Flag or nil
            BindConfig.Save = BindConfig.Save or false

            local Bind = {Value = BindConfig.Default, Binding = false, Type = "Bind", Save = BindConfig.Save}
            local Holding = false

            local Frame = Instance.new("Frame")
            Frame.Name = "BindFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 36)
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = Frame
            Label.Size = UDim2.new(1, -100, 0, 1)
            Label.Position = UDim2.new(0, 15, 0.5, 0)
            Label.AnchorPoint = Vector2.new(0, 0.5)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = BindConfig.Name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local BindBox = Instance.new("TextButton")
            BindBox.Name = "BindBox"
            BindBox.Parent = Frame
            BindBox.Size = UDim2.new(0, 60, 0, 24)
            BindBox.Position = UDim2.new(1, -10, 0.5, 0)
            BindBox.AnchorPoint = Vector2.new(1, 0.5)
            BindBox.BackgroundColor3 = _G.Dark
            BindBox.BackgroundTransparency = 0.1
            BindBox.Font = Enum.Font.GothamBold
            BindBox.Text = BindConfig.Default.Name or "Nenhum"
            BindBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            BindBox.TextSize = 11
            BindBox.TextXAlignment = Enum.TextXAlignment.Center

            local BoxCorner = Instance.new("UICorner")
            BoxCorner.CornerRadius = UDim.new(0, 4)
            BoxCorner.Parent = BindBox

            function Bind:Set(Key)
                Bind.Binding = false
                Bind.Value = Key
                BindBox.Text = Key.Name or tostring(Key)
            end

            Bind:Set(BindConfig.Default)

            BindBox.MouseButton1Click:Connect(function()
                if Bind.Binding then return end
                Bind.Binding = true
                BindBox.Text = "..."
            end)

            UserInputService.InputBegan:Connect(function(Input)
                if UserInputService:GetFocusedTextBox() then return end
                if (Input.KeyCode == Bind.Value or Input.UserInputType == Bind.Value) and not Bind.Binding then
                    if BindConfig.Hold then
                        Holding = true
                        BindConfig.Callback(Holding)
                    else
                        BindConfig.Callback()
                    end
                elseif Bind.Binding then
                    local Key
                    pcall(function()
                        if not CheckKey(BlacklistedKeys, Input.KeyCode) then
                            Key = Input.KeyCode
                        end
                    end)
                    pcall(function()
                        if CheckKey(WhitelistedMouse, Input.UserInputType) and not Key then
                            Key = Input.UserInputType
                        end
                    end)
                    Key = Key or Bind.Value
                    Bind:Set(Key)
                    if BindConfig.Save and VoidLib.SaveCfg then
                        SaveCfg(game.GameId)
                    end
                end
            end)

            UserInputService.InputEnded:Connect(function(Input)
                if Input.KeyCode == Bind.Value or Input.UserInputType == Bind.Value then
                    if BindConfig.Hold and Holding then
                        Holding = false
                        BindConfig.Callback(Holding)
                    end
                end
            end)

            if BindConfig.Flag then
                VoidLib.Flags[BindConfig.Flag] = Bind
            end
            return Bind
        end

        function ElementFunction:AddTextbox(TextboxConfig)
            TextboxConfig = TextboxConfig or {}
            TextboxConfig.Name = TextboxConfig.Name or "Caixa de texto"
            TextboxConfig.Default = TextboxConfig.Default or ""
            TextboxConfig.TextDisappear = TextboxConfig.TextDisappear or false
            TextboxConfig.Callback = TextboxConfig.Callback or function() end

            local Frame = Instance.new("Frame")
            Frame.Name = "TextboxFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 35)
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = Frame
            Label.Size = UDim2.new(1, -100, 0, 1)
            Label.Position = UDim2.new(0, 15, 0.5, 0)
            Label.AnchorPoint = Vector2.new(0, 0.5)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = TextboxConfig.Name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local TextBox = Instance.new("TextBox")
            TextBox.Name = "TextBox"
            TextBox.Parent = Frame
            TextBox.Size = UDim2.new(0, 80, 0, 25)
            TextBox.Position = UDim2.new(1, -5, 0.5, 0)
            TextBox.AnchorPoint = Vector2.new(1, 0.5)
            TextBox.BackgroundColor3 = _G.Dark
            TextBox.BackgroundTransparency = 0.1
            TextBox.Font = Enum.Font.GothamSemibold
            TextBox.Text = TextboxConfig.Default or ""
            TextBox.TextColor3 = Color3.fromRGB(225, 225, 225)
            TextBox.TextSize = 11
            TextBox.ClipsDescendants = true
            TextBox.ClearTextOnFocus = false

            local BoxCorner = Instance.new("UICorner")
            BoxCorner.CornerRadius = UDim.new(0, 5)
            BoxCorner.Parent = TextBox

            TextBox.FocusLost:Connect(function()
                TextboxConfig.Callback(TextBox.Text)
                if TextboxConfig.TextDisappear then
                    TextBox.Text = ""
                end
            end)

            return TextBox
        end

        function ElementFunction:AddColorpicker(ColorpickerConfig)
            ColorpickerConfig = ColorpickerConfig or {}
            ColorpickerConfig.Name = ColorpickerConfig.Name or "Seletor de cor"
            ColorpickerConfig.Default = ColorpickerConfig.Default or Color3.fromRGB(255, 255, 255)
            ColorpickerConfig.Callback = ColorpickerConfig.Callback or function() end
            ColorpickerConfig.Flag = ColorpickerConfig.Flag or nil
            ColorpickerConfig.Save = ColorpickerConfig.Save or false

            local ColorH, ColorS, ColorV = 1, 1, 1
            local Colorpicker = {Value = ColorpickerConfig.Default, Toggled = false, Type = "Colorpicker", Save = ColorpickerConfig.Save}

            local Frame = Instance.new("Frame")
            Frame.Name = "ColorpickerFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 38)
            Frame.BackgroundColor3 = _G.Primary
            Frame.BackgroundTransparency = 0.8

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 5)
            Corner.Parent = Frame

            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = Frame
            Label.Size = UDim2.new(1, -50, 0, 1)
            Label.Position = UDim2.new(0, 15, 0.5, 0)
            Label.AnchorPoint = Vector2.new(0, 0.5)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = ColorpickerConfig.Name
            Label.TextColor3 = Color3.fromRGB(255, 255, 255)
            Label.TextSize = 13
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local ColorBox = Instance.new("Frame")
            ColorBox.Name = "ColorBox"
            ColorBox.Parent = Frame
            ColorBox.Size = UDim2.new(0, 24, 0, 24)
            ColorBox.Position = UDim2.new(1, -12, 0.5, 0)
            ColorBox.AnchorPoint = Vector2.new(1, 0.5)
            ColorBox.BackgroundColor3 = ColorpickerConfig.Default

            local BoxCorner = Instance.new("UICorner")
            BoxCorner.CornerRadius = UDim.new(0, 4)
            BoxCorner.Parent = ColorBox

            local BoxStroke = Instance.new("UIStroke")
            BoxStroke.Color = _G.Primary
            BoxStroke.Thickness = 1
            BoxStroke.Parent = ColorBox

            local Container = Instance.new("Frame")
            Container.Name = "Container"
            Container.Parent = Frame
            Container.Size = UDim2.new(1, 0, 0, 0)
            Container.Position = UDim2.new(0, 0, 0, 38)
            Container.BackgroundTransparency = 1
            Container.ClipsDescendants = true
            Container.Visible = false

            local ColorPicker = Instance.new("ImageLabel")
            ColorPicker.Name = "ColorPicker"
            ColorPicker.Parent = Container
            ColorPicker.Size = UDim2.new(1, -25, 1, 0)
            ColorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ColorPicker.Image = "rbxassetid://4155801252"
            ColorPicker.ScaleType = Enum.ScaleType.Fit

            local PickerCorner = Instance.new("UICorner")
            PickerCorner.CornerRadius = UDim.new(0, 5)
            PickerCorner.Parent = ColorPicker

            local HuePicker = Instance.new("Frame")
            HuePicker.Name = "HuePicker"
            HuePicker.Parent = Container
            HuePicker.Size = UDim2.new(0, 20, 1, 0)
            HuePicker.Position = UDim2.new(1, -20, 0, 0)

            local HueGradient = Instance.new("UIGradient")
            HueGradient.Rotation = 270
            HueGradient.Color = ColorSequence.new{
                ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
                ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
                ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
                ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
                ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
                ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
                ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
            }
            HueGradient.Parent = HuePicker

            local HueCorner = Instance.new("UICorner")
            HueCorner.CornerRadius = UDim.new(0, 5)
            HueCorner.Parent = HuePicker

            local ColorSelection = Instance.new("ImageLabel")
            ColorSelection.Name = "ColorSelection"
            ColorSelection.Parent = ColorPicker
            ColorSelection.Size = UDim2.new(0, 18, 0, 18)
            ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            ColorSelection.BackgroundTransparency = 1
            ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            ColorSelection.ScaleType = Enum.ScaleType.Fit

            local HueSelection = Instance.new("ImageLabel")
            HueSelection.Name = "HueSelection"
            HueSelection.Parent = HuePicker
            HueSelection.Size = UDim2.new(0, 18, 0, 18)
            HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
            HueSelection.BackgroundTransparency = 1
            HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
            HueSelection.ScaleType = Enum.ScaleType.Fit

            local function UpdateColorPicker()
                ColorBox.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
                ColorPicker.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                Colorpicker:Set(ColorBox.BackgroundColor3)
                ColorpickerConfig.Callback(ColorBox.BackgroundColor3)
                if ColorpickerConfig.Save and VoidLib.SaveCfg then
                    SaveCfg(game.GameId)
                end
            end

            local function UpdatePicker()
                HueSelection.Position = UDim2.new(0.5, 0, 1 - ColorH, 0)
                ColorSelection.Position = UDim2.new(ColorS, 0, 1 - ColorV, 0)
            end

            function Colorpicker:Set(Value)
                Colorpicker.Value = Value
                ColorH, ColorS, ColorV = Color3.toHSV(Value)
                ColorBox.BackgroundColor3 = Value
                ColorPicker.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)
                UpdatePicker()
                ColorpickerConfig.Callback(Value)
            end

            local ColorInput
            local HueInput

            ColorPicker.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if ColorInput then ColorInput:Disconnect() end
                    ColorInput = RunService.RenderStepped:Connect(function()
                        local X = math.clamp((Mouse.X - ColorPicker.AbsolutePosition.X) / ColorPicker.AbsoluteSize.X, 0, 1)
                        local Y = math.clamp((Mouse.Y - ColorPicker.AbsolutePosition.Y) / ColorPicker.AbsoluteSize.Y, 0, 1)
                        ColorS, ColorV = X, 1 - Y
                        UpdateColorPicker()
                    end)
                end
            end)

            ColorPicker.InputEnded:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if ColorInput then ColorInput:Disconnect() end
                end
            end)

            HuePicker.InputBegan:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if HueInput then HueInput:Disconnect() end
                    HueInput = RunService.RenderStepped:Connect(function()
                        local Y = math.clamp((Mouse.Y - HuePicker.AbsolutePosition.Y) / HuePicker.AbsoluteSize.Y, 0, 1)
                        ColorH = 1 - Y
                        UpdateColorPicker()
                    end)
                end
            end)

            HuePicker.InputEnded:Connect(function(Input)
                if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
                    if HueInput then HueInput:Disconnect() end
                end
            end)

            local Click = Instance.new("TextButton")
            Click.Name = "Click"
            Click.Parent = Frame
            Click.Size = UDim2.new(1, 0, 1, 0)
            Click.BackgroundTransparency = 1
            Click.Text = ""

            Click.MouseButton1Click:Connect(function()
                Colorpicker.Toggled = not Colorpicker.Toggled
                if Colorpicker.Toggled then
                    Container.Visible = true
                    Container.Size = UDim2.new(1, -10, 0, 110)
                    Frame.Size = UDim2.new(1, 0, 0, 148)
                else
                    Container.Size = UDim2.new(1, 0, 0, 0)
                    Container.Visible = false
                    Frame.Size = UDim2.new(1, 0, 0, 38)
                end
            end)

            Colorpicker:Set(Colorpicker.Value)

            if ColorpickerConfig.Flag then
                VoidLib.Flags[ColorpickerConfig.Flag] = Colorpicker
            end
            return Colorpicker
        end

        function ElementFunction:AddSection(SectionConfig)
            SectionConfig = SectionConfig or {}
            SectionConfig.Name = SectionConfig.Name or "Seção"

            local Frame = Instance.new("Frame")
            Frame.Name = "SectionFrame"
            Frame.Parent = ItemParent
            Frame.Size = UDim2.new(1, 0, 0, 26)
            Frame.BackgroundTransparency = 1

            local Label = Instance.new("TextLabel")
            Label.Name = "Label"
            Label.Parent = Frame
            Label.Size = UDim2.new(1, -12, 0, 16)
            Label.Position = UDim2.new(0, 0, 0, 3)
            Label.BackgroundTransparency = 1
            Label.Font = Enum.Font.GothamSemibold
            Label.Text = SectionConfig.Name
            Label.TextColor3 = Color3.fromRGB(200, 200, 200)
            Label.TextSize = 14
            Label.TextXAlignment = Enum.TextXAlignment.Left

            local Holder = Instance.new("Frame")
            Holder.Name = "Holder"
            Holder.Parent = Frame
            Holder.Size = UDim2.new(1, 0, 1, -24)
            Holder.Position = UDim2.new(0, 0, 0, 23)
            Holder.BackgroundTransparency = 1

            local HolderList = Instance.new("UIListLayout")
            HolderList.Parent = Holder
            HolderList.SortOrder = Enum.SortOrder.LayoutOrder
            HolderList.Padding = UDim.new(0, 6)

            local SectionFunc = {}
            local Elements = GetElementFunction(Holder)

            for Name, Func in pairs(Elements) do
                SectionFunc[Name] = Func
            end

            AddConnection(HolderList:GetPropertyChangedSignal("AbsoluteContentSize"), function()
                Frame.Size = UDim2.new(1, 0, 0, HolderList.AbsoluteContentSize.Y + 31)
                Holder.Size = UDim2.new(1, 0, 0, HolderList.AbsoluteContentSize.Y)
            end)

            return SectionFunc
        end

        return ElementFunction
    end

    local function LoadSequence()
        VoidGui.Enabled = false
        local Logo = Instance.new("ImageLabel")
        Logo.Parent = VoidGui
        Logo.AnchorPoint = Vector2.new(0.5, 0.5)
        Logo.Position = UDim2.new(0.5, 0, 0.4, 0)
        Logo.Size = UDim2.new(0, 28, 0, 28)
        Logo.BackgroundTransparency = 1
        Logo.Image = WindowConfig.IntroIcon
        Logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
        Logo.ImageTransparency = 1

        local Text = Instance.new("TextLabel")
        Text.Parent = VoidGui
        Text.Size = UDim2.new(1, 0, 1, 0)
        Text.AnchorPoint = Vector2.new(0.5, 0.5)
        Text.Position = UDim2.new(0.5, 19, 0.5, 0)
        Text.BackgroundTransparency = 1
        Text.Font = Enum.Font.GothamBold
        Text.Text = WindowConfig.IntroText
        Text.TextColor3 = Color3.fromRGB(255, 255, 255)
        Text.TextSize = 14
        Text.TextTransparency = 1
        Text.TextXAlignment = Enum.TextXAlignment.Center

        TweenService:Create(Logo, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0, Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
        task.wait(0.8)
        TweenService:Create(Logo, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, -(Text.TextBounds.X / 2), 0.5, 0)}):Play()
        task.wait(0.3)
        TweenService:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
        task.wait(2)
        TweenService:Create(Text, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
        VoidGui.Enabled = true
        Logo:Destroy()
        Text:Destroy()
    end

    if WindowConfig.IntroEnabled then
        LoadSequence()
    else
        VoidGui.Enabled = true
    end

    local TabFunction = {}
    function TabFunction:MakeTab(TabConfig)
        TabConfig = TabConfig or {}
        TabConfig.Name = TabConfig.Name or "Aba"
        TabConfig.Icon = TabConfig.Icon or ""
        TabConfig.PremiumOnly = TabConfig.PremiumOnly or false

        local TabButton = Instance.new("TextButton")
        TabButton.Name = TabConfig.Name .. "Server"
        TabButton.Parent = TabScroll
        TabButton.Text = ""
        TabButton.Size = UDim2.new(1, 0, 0, 35)
        TabButton.BackgroundColor3 = _G.Primary
        TabButton.BackgroundTransparency = 1
        TabButton.Font = Enum.Font.GothamSemibold
        TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabButton.TextSize = 12

        local Selector = Instance.new("Frame")
        Selector.Name = "SelectedTab"
        Selector.Parent = TabButton
        Selector.Size = UDim2.new(0, 3, 0, 0)
        Selector.Position = UDim2.new(0, 0, 0.5, 0)
        Selector.AnchorPoint = Vector2.new(0, 0.5)
        Selector.BackgroundColor3 = _G.Primary
        Selector.BackgroundTransparency = 0
        Selector.ZIndex = 4

        local SelectorCorner = Instance.new("UICorner")
        SelectorCorner.CornerRadius = UDim.new(0, 100)
        SelectorCorner.Parent = Selector

        local TabIcon = Instance.new("ImageLabel")
        TabIcon.Name = "IDK"
        TabIcon.Parent = TabButton
        TabIcon.Size = UDim2.new(0, 15, 0, 15)
        TabIcon.Position = UDim2.new(0, 7, 0.5, 0)
        TabIcon.AnchorPoint = Vector2.new(0, 0.5)
        TabIcon.BackgroundTransparency = 1
        TabIcon.ImageTransparency = 0.3
        local iconData = VoidLib.GetIcon(TabConfig.Icon)
        TabIcon.Image = iconData or TabConfig.Icon or ""

        local TabTitle = Instance.new("TextLabel")
        TabTitle.Name = "Title"
        TabTitle.Parent = TabButton
        TabTitle.Size = UDim2.new(0, 100, 0, 30)
        TabTitle.Position = UDim2.new(0, 30, 0.5, 0)
        TabTitle.AnchorPoint = Vector2.new(0, 0.5)
        TabTitle.BackgroundTransparency = 1
        TabTitle.Font = Enum.Font.GothamSemibold
        TabTitle.Text = TabConfig.Name
        TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        TabTitle.TextSize = 13
        TabTitle.TextTransparency = 0.4
        TabTitle.TextXAlignment = Enum.TextXAlignment.Left

        local TabCorner = Instance.new("UICorner")
        TabCorner.CornerRadius = UDim.new(0, 5)
        TabCorner.Parent = TabButton

        local Container = Instance.new("ScrollingFrame")
        Container.Name = TabConfig.Name .. "_Page"
        Container.Parent = PageFolder
        Container.Size = UDim2.new(1, 0, 1, 0)
        Container.BackgroundTransparency = 1
        Container.ScrollBarThickness = 0
        Container.ScrollingDirection = Enum.ScrollingDirection.Y
        Container.CanvasSize = UDim2.new(0, 0, 0, 0)

        local ContainerList = Instance.new("UIListLayout")
        ContainerList.Parent = Container
        ContainerList.SortOrder = Enum.SortOrder.LayoutOrder
        ContainerList.Padding = UDim.new(0, 3)

        local ContainerPadding = Instance.new("UIPadding")
        ContainerPadding.Parent = Container
        ContainerPadding.PaddingTop = UDim.new(0, 5)
        ContainerPadding.PaddingBottom = UDim.new(0, 5)
        ContainerPadding.PaddingLeft = UDim.new(0, 5)
        ContainerPadding.PaddingRight = UDim.new(0, 5)

        local function UpdateContainerSize()
            Container.CanvasSize = UDim2.new(0, 0, 0, ContainerList.AbsoluteContentSize.Y + 10)
        end

        AddConnection(ContainerList:GetPropertyChangedSignal("AbsoluteContentSize"), UpdateContainerSize)

        TabButton.MouseButton1Click:Connect(function()
            for _, btn in pairs(TabScroll:GetChildren()) do
                if btn:IsA("TextButton") then
                    TweenService:Create(btn, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
                    local sel = btn:FindFirstChild("SelectedTab")
                    if sel then
                        TweenService:Create(sel, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 3, 0, 0)}):Play()
                    end
                    local icon = btn:FindFirstChild("IDK")
                    if icon then
                        TweenService:Create(icon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0.4}):Play()
                    end
                    local title = btn:FindFirstChild("Title")
                    if title then
                        TweenService:Create(title, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0.4}):Play()
                    end
                end
            end

            TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8}):Play()
            TweenService:Create(Selector, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 3, 0, 15)}):Play()
            TweenService:Create(TabIcon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
            TweenService:Create(TabTitle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()

            for _, page in pairs(PageFolder:GetChildren()) do
                if page.Name == TabConfig.Name .. "_Page" then
                    PageLayout:JumpTo(page)
                end
            end
        end)

        if FirstTab then
            FirstTab = false
            TweenService:Create(TabButton, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.8}):Play()
            TweenService:Create(Selector, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Size = UDim2.new(0, 3, 0, 15)}):Play()
            TweenService:Create(TabIcon, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
            TweenService:Create(TabTitle, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
            PageLayout:JumpToIndex(1)
        end

        local ElementFunc = {}
        local Elements = GetElementFunction(Container)

        for Name, Func in pairs(Elements) do
            ElementFunc[Name] = Func
        end

        if TabConfig.PremiumOnly then
            for _, child in pairs(Container:GetChildren()) do
                if child:IsA("UIListLayout") or child:IsA("UIPadding") then
                    child:Destroy()
                end
            end

            local PremiumFrame = Instance.new("Frame")
            PremiumFrame.Parent = Container
            PremiumFrame.Size = UDim2.new(1, 0, 1, 0)
            PremiumFrame.BackgroundTransparency = 1

            local PremiumIcon = Instance.new("ImageLabel")
            PremiumIcon.Parent = PremiumFrame
            PremiumIcon.Size = UDim2.new(0, 18, 0, 18)
            PremiumIcon.Position = UDim2.new(0, 15, 0, 15)
            PremiumIcon.BackgroundTransparency = 1
            PremiumIcon.Image = "rbxassetid://3610239960"
            PremiumIcon.ImageTransparency = 0.4

            local PremiumTitle = Instance.new("TextLabel")
            PremiumTitle.Parent = PremiumFrame
            PremiumTitle.Size = UDim2.new(1, -38, 0, 14)
            PremiumTitle.Position = UDim2.new(0, 38, 0, 18)
            PremiumTitle.BackgroundTransparency = 1
            PremiumTitle.Font = Enum.Font.GothamSemibold
            PremiumTitle.Text = "Acesso não autorizado"
            PremiumTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
            PremiumTitle.TextSize = 14
            PremiumTitle.TextTransparency = 0.4
            PremiumTitle.TextXAlignment = Enum.TextXAlignment.Left

            local PremiumImage = Instance.new("ImageLabel")
            PremiumImage.Parent = PremiumFrame
            PremiumImage.Size = UDim2.new(0, 56, 0, 56)
            PremiumImage.Position = UDim2.new(0, 84, 0, 110)
            PremiumImage.BackgroundTransparency = 1
            PremiumImage.Image = "rbxassetid://4483345875"

            local PremiumLabel = Instance.new("TextLabel")
            PremiumLabel.Parent = PremiumFrame
            PremiumLabel.Size = UDim2.new(1, -150, 0, 14)
            PremiumLabel.Position = UDim2.new(0, 150, 0, 112)
            PremiumLabel.BackgroundTransparency = 1
            PremiumLabel.Font = Enum.Font.GothamBold
            PremiumLabel.Text = "Recursos Premium"
            PremiumLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            PremiumLabel.TextSize = 14
            PremiumLabel.TextXAlignment = Enum.TextXAlignment.Left

            local PremiumDesc = Instance.new("TextLabel")
            PremiumDesc.Parent = PremiumFrame
            PremiumDesc.Size = UDim2.new(1, -200, 0, 14)
            PremiumDesc.Position = UDim2.new(0, 150, 0, 138)
            PremiumDesc.BackgroundTransparency = 1
            PremiumDesc.Font = Enum.Font.Gotham
            PremiumDesc.Text = "Esta parte do script é exclusiva para usuários Premium."
            PremiumDesc.TextColor3 = Color3.fromRGB(200, 200, 200)
            PremiumDesc.TextSize = 12
            PremiumDesc.TextTransparency = 0.4
            PremiumDesc.TextWrapped = true
            PremiumDesc.TextXAlignment = Enum.TextXAlignment.Left
        end

        return ElementFunc
    end

    function VoidLib:Init()
        if VoidLib.SaveCfg then
            pcall(function()
                if isfile(VoidLib.Folder .. "/" .. game.GameId .. ".txt") then
                    LoadCfg(readfile(VoidLib.Folder .. "/" .. game.GameId .. ".txt"))
                    VoidLib:MakeNotification({
                        Name = "Configuração",
                        Content = "Configuração carregada automaticamente.",
                        Time = 3
                    })
                end
            end)
        end
    end

    function VoidLib:Destroy()
        VoidGui:Destroy()
        AlertGui:Destroy()
        FloatButton:Destroy()
        for _, Connection in pairs(VoidLib.Connections) do
            pcall(function() Connection:Disconnect() end)
        end
    end

    function VoidLib:ToggleUi()
        VoidGui.Enabled = not VoidGui.Enabled
    end

    return TabFunction
end

return VoidLib
