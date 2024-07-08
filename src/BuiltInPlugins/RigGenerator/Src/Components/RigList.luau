local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local v11 = require(l_Parent_0.Src.RigPresets.PresetManifest);
local v12 = v1.PureComponent:extend("RigList");
v12.render = function(v13)
    local l_props_0 = v13.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_OnSelected_0 = l_props_0.OnSelected;
    local v17 = {};
    for v18, v19 in v11, nil, nil do
        v17[v19.Name] = v1.createElement(l_Button_0, {
            Text = l_Localization_1:getText("RigPresetLabel", v19.Name), 
            Style = "Round", 
            LayoutOrder = v18, 
            Size = UDim2.new(1, 0, 0, 26), 
            OnClick = function()
                l_OnSelected_0(v19);
            end
        });
    end;
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Spacing = 6
    }, v17);
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v12));
