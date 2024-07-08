local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v2.PureComponent:extend("AudioRowInsertButtonMetadata");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_OnClick_0 = l_props_0.OnClick;
    local l_itemRow_0 = l_props_0.Stylizer.itemRow;
    return v2.createElement("Frame", {
        Size = UDim2.new(0, 50, 1, 0), 
        LayoutOrder = l_LayoutOrder_0, 
        BackgroundTransparency = 1
    }, {
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Button = v2.createElement("TextButton", {
            TextColor3 = l_itemRow_0.insertButtonTextColor, 
            Font = v4.FONT, 
            TextSize = 15, 
            Text = l_Localization_0:getText("Common", "Insert"), 
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundColor3 = l_itemRow_0.insertButtonColor, 
            [v2.Event.MouseButton1Click] = l_OnClick_0
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
