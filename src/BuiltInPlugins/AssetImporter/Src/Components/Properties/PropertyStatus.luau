local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v2.UI;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Image_0 = l_UI_0.Image;
local v10 = require(l_script_FirstAncestor_0.Src.Resources.StatusLevel);
local v11 = v1.PureComponent:extend("PropertyStatus");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_StatusLevel_0 = l_props_0.StatusLevel;
    local l_StatusMessage_0 = l_props_0.StatusMessage;
    local l_StatusContext_0 = l_props_0.StatusContext;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_IconSize_0 = l_Stylizer_1.PropertyView.IconSize;
    local v21 = true;
    if l_StatusLevel_0 ~= "Error" then
        v21 = l_StatusLevel_0 == v10.Error;
    end;
    return v1.createElement(l_Image_0, {
        Size = UDim2.fromOffset(l_IconSize_0, l_IconSize_0), 
        Style = not not v21 and l_Stylizer_1.ErrorIcon or l_Stylizer_1.WarningIcon, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Tooltip = v1.createElement(l_Tooltip_0, {
            Text = l_Localization_1:getText("Statuses", l_StatusMessage_0, l_StatusContext_0)
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v11));
