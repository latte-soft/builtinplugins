local l_StyleKey_0 = require(script:FindFirstAncestor("CompositorDebugger").Packages.Framework).Style.StyleKey;
return {
    TabsHeight = 32, 
    Blend = {
        Padding = {
            Left = 15, 
            Right = 15, 
            Top = 33, 
            Bottom = 15
        }, 
        BorderColor = l_StyleKey_0.MainText, 
        BackgroundColor = l_StyleKey_0.SubBackground2, 
        Dot = {
            Image = "rbxasset://textures/CompositorDebugger/dot.png", 
            Size = UDim2.fromOffset(9, 9), 
            Color = l_StyleKey_0.MainText
        }, 
        Cursor = {
            Image = "rbxasset://textures/CompositorDebugger/cursor.png", 
            Size = UDim2.fromOffset(9, 9), 
            Color = l_StyleKey_0.MainText, 
            Override = l_StyleKey_0.ErrorMain
        }, 
        Reset = {
            Image = "rbxasset://textures/CompositorDebugger/clear.png", 
            Size = UDim2.fromOffset(12, 12), 
            Position = UDim2.new(1, 0, 0, -6), 
            Color = l_StyleKey_0.MainText
        }, 
        Grid = {
            MaxTicks = 10, 
            Intervals = {
                0.05, 
                0.1, 
                0.25, 
                0.5, 
                1
            }, 
            AxisColor = l_StyleKey_0.MainText, 
            GridColor = l_StyleKey_0.MainTextDisabled
        }
    }
};
