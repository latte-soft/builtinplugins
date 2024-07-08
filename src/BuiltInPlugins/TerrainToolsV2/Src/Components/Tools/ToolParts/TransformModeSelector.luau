local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Pane_0 = v1.UI.Pane;
local v6 = require(l_Parent_0.Src.Util.TerrainEnums);
local v7 = require(script.Parent.SingleSelectButtonGroup);
local v8 = v2.PureComponent:extend("TransformMode");
v8.render = function(v9)
    local l_Localization_0 = v9.props.Localization;
    local _ = v9.props.LayoutOrder;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Size = UDim2.fromScale(1, 0)
    }, {
        ButtonGroup = v2.createElement(v7, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.fromScale(0.5, 0), 
            Size = UDim2.new(0, 141, 0, 22), 
            Selected = v9.props.TransformMode, 
            Select = v9.props.SetTransformMode, 
            Options = {
                {
                    Text = l_Localization_0:getText("RegionSettings", "Select"), 
                    Data = v6.TransformMode.Select
                }, 
                {
                    Text = l_Localization_0:getText("RegionSettings", "Transform"), 
                    Data = v6.TransformMode.Transform
                }
            }
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v8));
