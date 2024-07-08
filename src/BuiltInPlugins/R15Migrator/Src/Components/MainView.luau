local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Pane_0 = v1.UI.Pane;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v5 = require(l_script_FirstAncestor_0.Src.Components.MainTabsView);
local v6 = v2.PureComponent:extend("MainView");
v6.render = function(v7)
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        BackgroundTransparency = 1
    }, {
        MainTabs = v2.createElement(v5, {
            OnResetPlugin = v7.props.OnResetPlugin, 
            LayoutOrder = l_LayoutOrderIterator_0.new():getNextOrder()
        })
    });
end;
return v6;
