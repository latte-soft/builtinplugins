local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_PivotType_0 = require(l_Parent_0.Src.Util.TerrainEnums).PivotType;
local l_Parent_1 = script.Parent.Parent;
local v7 = require(l_Parent_1.LabeledElementPair);
local v8 = require(l_Parent_1.SingleSelectButtonGroup);
local v9 = v2.PureComponent:extend("PivotSelector");
v9.render = function(v10)
    local l_Localization_0 = v10.props.Localization;
    return v2.createElement(v7, {
        Size = UDim2.new(1, 0, 0, 22), 
        Text = l_Localization_0:getText("BrushSettings", "PivotPosition"), 
        LayoutOrder = v10.props.LayoutOrder
    }, {
        v2.createElement(v8, {
            Size = UDim2.new(0, 141, 0, 22), 
            Selected = v10.props.pivot, 
            Select = v10.props.setPivot, 
            Options = {
                {
                    Text = l_Localization_0:getText("BrushSettings", "BottomPivot"), 
                    Data = l_PivotType_0.Bottom
                }, 
                {
                    Text = l_Localization_0:getText("BrushSettings", "CenterPivot"), 
                    Data = l_PivotType_0.Center
                }, 
                {
                    Text = l_Localization_0:getText("BrushSettings", "TopPivot"), 
                    Data = l_PivotType_0.Top
                }
            }
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v9));
