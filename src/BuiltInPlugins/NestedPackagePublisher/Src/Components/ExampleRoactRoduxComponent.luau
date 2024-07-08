local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_Pane_0 = v3.UI.Pane;
local v10 = require(l_Parent_0.Src.Actions.ExampleAction);
local _ = require(l_Parent_0.Src.Reducers.ExampleReducer);
local v12 = v1.PureComponent:extend("ExampleRoactRoduxComponent");
v12.render = function(_)
    return v1.createElement(l_Pane_0);
end;
return v2.connect(function(v14, _)
    return {
        DefaultStateObject = v14.DefaultStateObject
    };
end, function(v16)
    return {
        dispatchExampleAction = function(v17)
            v16(v10(v17));
        end
    };
end)((l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v12)));
