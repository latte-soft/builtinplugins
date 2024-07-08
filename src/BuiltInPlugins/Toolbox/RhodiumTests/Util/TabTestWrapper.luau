local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Core.Components.TabSet);
local v3 = v1.PureComponent:extend("TabTestWrapper");
v3.init = function(v4)
    v4.state = {
        currentTab = "Marketplace"
    };
    v4.changeTab = function(v5)
        v4:setState(function()
            return {
                currentTab = v5
            };
        end);
    end;
end;
v3.render = function(v6, _)
    return v1.createElement(v2, {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(), 
        CurrentWidth = 565.5, 
        CurrentTab = v6.state.currentTab, 
        Tabs = {
            [1] = {
                Image = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                Key = "Marketplace", 
                Text = "Marketplace"
            }, 
            [2] = {
                Image = "rbxasset://textures/StudioToolbox/Tabs/Shop.png", 
                Key = "Inventory", 
                Text = "Inventory"
            }
        }, 
        onTabSelected = v6.changeTab
    });
end;
return v3;
