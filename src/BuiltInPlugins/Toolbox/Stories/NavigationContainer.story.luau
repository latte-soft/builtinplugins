local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Core.Components.Home.NavigationContainer);
local v3 = require(l_Parent_0.Stories.ToolboxStoryWrapper);
return {
    name = "NavigationContainer", 
    summary = "A container that hosts all of the navigation routes.", 
    story = function()
        return v1.createElement(v3, {}, {
            Container = v1.createElement(v2)
        });
    end
};
