local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Pane_0 = v1.UI.Pane;
local l_ContextServices_0 = v1.ContextServices;
local v5 = require(l_script_FirstAncestor_0.Src.Components.ReplaceRevertButtons);
local v6 = v2.PureComponent:extend("AnimationConversionPaneFooter");
v6.render = function(v7)
    local l_props_0 = v7.props;
    local l_Size_0 = l_props_0.Size;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement(l_Pane_0, {
        Size = l_Size_0, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
        VerticalAlignment = Enum.VerticalAlignment.Bottom, 
        Spacing = l_Stylizer_0.Spacing, 
        Padding = l_Stylizer_0.Padding
    }, {
        Buttons = v2.createElement(v5)
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
