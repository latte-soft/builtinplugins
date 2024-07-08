local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Container_0 = v3.UI.Container;
local v7 = v1.Component:extend(script.Name);
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement(l_Container_0, {}, {
        Label = v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
            LayoutOrder = 1, 
            Text = l_props_0.Localization:getText("General", "SettingsInsufficientPermission"), 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }), {
            Padding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_Stylizer_0.settingsPage.failLabelPaddingX / 2), 
                PaddingRight = UDim.new(0, l_Stylizer_0.settingsPage.failLabelPaddingX / 2)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v7));
