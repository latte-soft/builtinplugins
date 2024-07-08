local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_Tabs_0 = require(l_Parent_0.Packages.Framework).UI.Tabs;
local v4 = require(l_Parent_0.Src.Models.Watch.TableTab);
local v5 = require(l_Parent_0.Src.Actions.Watch.SetTab);
local v6 = v1.PureComponent:extend("Tabs");
v6.render = function(v7)
    local l_props_0 = v7.props;
    return v1.createElement(l_Tabs_0, {
        Tabs = l_props_0.Tabs, 
        SelectedTab = l_props_0.selectedTab, 
        OnTabSelected = l_props_0.onTabSelected, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_props_0.Size, 
        AutomaticSize = Enum.AutomaticSize.X
    });
end;
return (v2.connect(function(v9, v10)
    return {
        selectedTab = v9.Watch.currentTab == v4.Variables and v10.Tabs[1] or v10.Tabs[2]
    };
end, function(v11)
    return {
        onTabSelected = function(v12)
            return v11(v5(v12.Key));
        end
    };
end)(v6));
