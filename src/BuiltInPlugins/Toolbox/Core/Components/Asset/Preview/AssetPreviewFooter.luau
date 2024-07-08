local l_Packages_0 = script.Parent.Parent.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = l_UI_0.Container;
local l_Pane_0 = l_UI_0.Pane;
local v9 = v1.PureComponent:extend("AssetPreviewFooter");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_TypeId_0 = l_props_0.AssetData.Asset.TypeId;
    local l_Creator_0 = l_props_0.AssetData.Creator;
    local l_Localization_0 = l_props_0.Localization;
    local l_FitMaxWidth_0 = l_props_0.FitMaxWidth;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v17 = l_TypeId_0 == Enum.AssetType.Plugin.Value;
    local v18 = false;
    if l_Creator_0.Id == 1 then
        v18 = l_Creator_0.Type == Enum.CreatorType.User.Value;
    end;
    if not v18 and v17 then
        local _ = if not l_FitMaxWidth_0 then UDim2.fromScale(1, 0) else UDim2.fromOffset(l_FitMaxWidth_0, 0);
        return v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = l_LayoutOrder_0, 
            Size = UDim2.fromScale(1, 0)
        }, {
            Text = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                TextWrapped = true, 
                Size = UDim2.fromScale(1, 0), 
                Style = "Body", 
                TextTransparency = 0.5, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Text = l_Localization_0:getText("AssetPreview", "PluginNotice")
            })
        });
    else
        return nil;
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v9));
