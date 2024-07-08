local l_StyleKey_0 = require(script:FindFirstAncestor("CompositorDebugger").Packages.Framework).Style.StyleKey;
return {
    FieldNameHeight = 32, 
    LegendHeight = 32, 
    BorderColor = l_StyleKey_0.MainText, 
    BorderWidth = 1, 
    BackgroundColor = l_StyleKey_0.SubBackground2, 
    GraphColors = {
        number = {
            l_StyleKey_0.DialogMainButton
        }, 
        Vector2 = {
            Color3.new(0.75, 0, 0), 
            Color3.new(0, 0.75, 0)
        }, 
        Vector3 = {
            Color3.new(0.75, 0, 0), 
            Color3.new(0, 0.75, 0), 
            Color3.new(0, 0, 0.75)
        }
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
        GridColor = l_StyleKey_0.MainTextDisabled, 
        Margin = 0.05
    }, 
    Padding = 15, 
    ScaleWidth = 50
};
