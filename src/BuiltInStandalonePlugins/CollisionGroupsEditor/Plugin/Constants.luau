local v0 = UDim2.fromOffset(85, 34);
return {
    CursorGroupName = "StudioSelectable", 
    GroupCountMax = 32, 
    GroupRowHeight = 35, 
    GroupRowWidth = 120, 
    ControlsHeaderButtonWidth = 106, 
    GroupLabelFixedSize = UDim2.fromOffset(120, 35), 
    GroupListRowHeight = 24, 
    GridCellWidth = 85, 
    GridHeaderLabelSize = UDim2.fromOffset(86, 35), 
    GridCellSize = v0, 
    CalculateTableSize = function(v1)
        if v1 == nil then
            return UDim2.fromScale(0, 0);
        else
            return UDim2.fromOffset((1 + v0.X.Offset) * v1 + 1, (1 + v0.Y.Offset) * v1 + 1);
        end;
    end
};
