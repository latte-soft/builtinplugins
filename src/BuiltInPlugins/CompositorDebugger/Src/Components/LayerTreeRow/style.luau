local v0 = require(script:FindFirstAncestor("CompositorDebugger").Packages.Framework);
local l_StyleKey_0 = v0.Style.StyleKey;
local l_StyleModifier_0 = v0.Util.StyleModifier;
return {
    Arrow = {
        Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
        Size = 12, 
        ExpandedOffset = Vector2.new(24, 0), 
        CollapsedOffset = Vector2.new(12, 0), 
        Color = l_StyleKey_0.MainText
    }, 
    Filter = {
        Image = "rbxasset://textures/CompositorDebugger/eye.png", 
        Size = UDim2.fromOffset(12, 12), 
        ActiveColor = l_StyleKey_0.MainText, 
        ActiveTransparency = 0, 
        InactiveColor = l_StyleKey_0.MainText, 
        InactiveTransparency = 1
    }, 
    Detach = {
        Image = "rbxasset://textures/CompositorDebugger/clear.png", 
        Size = UDim2.fromOffset(12, 12)
    }, 
    Border = l_StyleKey_0.SubBackground, 
    Background = l_StyleKey_0.MainBackground, 
    Indent = 17, 
    [l_StyleModifier_0.Hover] = {
        Background = l_StyleKey_0.ButtonHover, 
        Filter = {
            Image = "rbxasset://textures/CompositorDebugger/eye.png", 
            Size = UDim2.fromOffset(12, 12), 
            ActiveColor = l_StyleKey_0.MainText, 
            ActiveTransparency = 0, 
            InactiveColor = l_StyleKey_0.MainTextDisabled, 
            InactiveTransparency = 0
        }
    }, 
    [l_StyleModifier_0.Selected] = {
        Background = l_StyleKey_0.ActionSelected, 
        Filter = {
            Image = "rbxasset://textures/CompositorDebugger/eye.png", 
            Size = UDim2.fromOffset(12, 12), 
            ActiveColor = l_StyleKey_0.MainText, 
            ActiveTransparency = 0, 
            InactiveColor = l_StyleKey_0.MainTextDisabled, 
            InactiveTransparency = 0
        }
    }, 
    ColumnWidths = {
        Tree = 250, 
        Weight = 40, 
        Timestamp = 100
    }, 
    Spacing = 5, 
    Padding = {
        Top = 1, 
        Bottom = 1, 
        Left = 0, 
        Right = 0
    }, 
    ActiveLayer = l_StyleKey_0.MainText, 
    InactiveLayer = l_StyleKey_0.MainTextDisabled, 
    TimeBar = {
        Active = l_StyleKey_0.DialogMainButtonSelected, 
        Inactive = l_StyleKey_0.MainTextDisabled, 
        Background = l_StyleKey_0.Button, 
        Border = l_StyleKey_0.Border
    }, 
    Font = {
        TopLayer = Enum.Font.SourceSansBold, 
        RegularLayer = Enum.Font.SourceSans
    }, 
    Colors = {
        Client = Color3.fromHex("349AD5"), 
        Server = Color3.fromHex("00CC67")
    }, 
    Icons = {
        Blend1D = {
            Image = "rbxasset://textures/CompositorDebugger/blend1d.png", 
            Size = UDim2.fromOffset(12, 12)
        }, 
        Blend2D = {
            Image = "rbxasset://textures/CompositorDebugger/blend2d.png", 
            Size = UDim2.fromOffset(12, 12)
        }, 
        BlendSpace = {
            Image = "rbxasset://textures/CompositorDebugger/blend2d.png", 
            Size = UDim2.fromOffset(12, 12)
        }, 
        ClipLayer = {
            Image = "rbxasset://textures/CompositorDebugger/clip.png", 
            Size = UDim2.fromOffset(12, 12)
        }, 
        Default = {
            Image = "rbxasset://textures/CompositorDebugger/default.png", 
            Size = UDim2.fromOffset(12, 12)
        }, 
        SelectLayer = {
            Image = "rbxasset://textures/CompositorDebugger/select.png", 
            Size = UDim2.fromOffset(12, 12)
        }, 
        SequenceLayer = {
            Image = "rbxasset://textures/CompositorDebugger/sequence.png", 
            Size = UDim2.fromOffset(12, 12)
        }
    }
};
