local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_Localization_0 = require(l_Parent_0.Packages.Framework).ContextServices.Localization;
local v4 = require(l_Parent_0.Src.Reducers.MainReducer);
local v5 = require(l_Parent_0.Src.TestHelpers.MockDraftsService);
local v6 = require(l_Parent_0.Src.TestHelpers.MockPlugin);
local v7 = require(l_Parent_0.Src.Resources.MakeTheme);
local v8 = require(l_Parent_0.Src.Components.ServiceWrapper);
local v9 = v1.Component:extend("MockServiceWrapper");
v9.render = function(v10)
    return v1.createElement(v8, {
        draftsService = v10.props.draftsService or v5.new(v5.TestCases.DEFAULT), 
        localization = v10.props.localization or l_Localization_0.mock(), 
        plugin = v10.props.plugin or v6.new(), 
        store = v2.Store.new(v4, v10.props.storeState, {
            v2.thunkMiddleware
        }), 
        theme = v10.props.theme or v7(true)
    }, v10.props[v1.Children]);
end;
return v9;
