local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Dash_0 = v1.Dash;
local l_map_0 = l_Dash_0.map;
local l_some_0 = l_Dash_0.some;
local v11 = v2.PureComponent:extend("TreeViewToolbar");
v11.render = function(v12)
    local l_props_0 = v12.props;
    local l_TreeViewToolbar_0 = l_props_0.Stylizer.TreeViewToolbar;
    local l_Localization_0 = l_props_0.Localization;
    local v17 = l_some_0(l_props_0.Expansion, function(v16)
        return v16 == true;
    end);
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Padding = l_TreeViewToolbar_0.Padding, 
        Size = l_props_0.Size, 
        Spacing = l_TreeViewToolbar_0.Spacing
    }, {
        ExpandCollapseAll = v2.createElement(l_Button_0, {
            LayoutOrder = 1, 
            OnClick = function()
                if l_props_0.OnExpansionChange then
                    l_props_0.OnExpansionChange(l_map_0(l_props_0.Expansion, function()
                        return not v17;
                    end));
                end;
            end, 
            Size = UDim2.new(0, 70, 1, 0), 
            Style = "Round", 
            Text = l_Localization_0:getText("TreeViewToolbar", not v17 and "Expand" or "Collapse")
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
