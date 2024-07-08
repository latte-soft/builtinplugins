local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v4 = require(l_Parent_0.Src.TestHelpers.MockPlugin);
local v5 = require(l_Parent_0.Src.Components.ServiceWrapper);
local v6 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_Localization_0 = l_ContextServices_0.Localization;
local v8 = v1.Component:extend("MockServiceWrapper");
v8.getMockGlobals = function(v9)
    if not v9 then
        v9 = {};
    end;
    local v10 = v9.localization or l_Localization_0.mock();
    local v11 = v9.focusGui or Instance.new("ScreenGui");
    local v12 = v9.plugin or v4.new();
    return {
        focusGui = v11, 
        plugin = v12, 
        localization = v10, 
        theme = v9.theme or require(l_Parent_0.Src.Resources.Theme)(true), 
        mouse = v9.mouse or v12:GetMouse(), 
        store = v2.Store.new(v6, v9.storeState, {
            v2.thunkMiddleware
        })
    };
end;
v8.render = function(v13)
    return v1.createElement(v5, v8.getMockGlobals(v13.props), v13.props[v1.Children]);
end;
return v8;
