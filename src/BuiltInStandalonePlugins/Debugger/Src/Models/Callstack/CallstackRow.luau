return {
    new = function()
        return {
            frameColumn = "", 
            functionColumn = "", 
            lineColumn = "", 
            sourceColumn = ""
        };
    end, 
    fromData = function(v0)
        return {
            frameColumn = v0.frameColumn, 
            functionColumn = v0.functionColumn, 
            lineColumn = v0.lineColumn, 
            sourceColumn = v0.sourceColumn
        };
    end, 
    ICON_FRAME_TOP = {
        LeftIcon = {
            Image = "rbxasset://textures/Debugger/debugger_arrow.png", 
            Size = UDim2.new(0, 14, 0, 14)
        }, 
        Value = ""
    }, 
    ICON_CURRENT_FRAME = {
        LeftIcon = {
            Image = "rbxasset://textures/Debugger/debugger_arrow_curve_left.png", 
            Size = UDim2.new(0, 14, 0, 14)
        }, 
        Value = ""
    }
};
