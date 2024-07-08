local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Components.ServiceWrapper);
local v5 = require(l_Parent_0.Src.Resources.MakeTheme);
local v6 = require(l_Parent_0.Src.Reducers.MainReducer);
local v7 = require(l_Parent_0.Src.Middleware.MainMiddleware);
local l_Localization_0 = v3.ContextServices.Localization;
local v9 = v1.Component:extend("MockServiceWrapper");
v9.render = function(v10)
    return v1.createElement(v4, {
        localization = v10.props.localization or l_Localization_0.mock(), 
        plugin = {}, 
        focusGui = {}, 
        store = v2.Store.new(v6, v10.props.storeState, v7), 
        theme = v10.props.theme or v5(true)
    }, v10.props[v1.Children]);
end;
return v9;
