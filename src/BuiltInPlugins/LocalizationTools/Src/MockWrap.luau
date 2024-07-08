local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v5 = require(l_Parent_0.Src.Resources.PluginTheme);
local v6 = require(l_Parent_0.Src.ContextServices.AnalyticsContext);
local v7 = require(l_Parent_0.Src.Util.Analytics);
local v8 = v1.PureComponent:extend("MockPlugin");
local function _()
    return Instance.new("ScreenGui");
end;
local function v19(v10)
    local v12 = {
        GetMouse = function(_)
            return {};
        end
    };
    local function _()
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "MockPluginGui";
        if v10 then
            l_ScreenGui_0.Parent = v10;
        end;
        return l_ScreenGui_0;
    end;
    v12.CreateQWidgetPluginGui = function(_)
        local l_ScreenGui_1 = Instance.new("ScreenGui");
        l_ScreenGui_1.Name = "MockPluginGui";
        if v10 then
            l_ScreenGui_1.Parent = v10;
        end;
        return l_ScreenGui_1;
    end;
    v12.CreateDockWidgetPluginGui = function(_)
        local l_ScreenGui_2 = Instance.new("ScreenGui");
        l_ScreenGui_2.Name = "MockPluginGui";
        if v10 then
            l_ScreenGui_2.Parent = v10;
        end;
        return l_ScreenGui_2;
    end;
    return v12;
end;
v8.init = function(v20, v21)
    v20.plugin = v19(v21.Container);
    v20.target = v21.FocusTarget or Instance.new("ScreenGui");
    v20.store = v2.Store.new(v3, v21.StoreState, {
        v2.thunkMiddleware
    });
    v20.analyticsImpl = v7.mock();
end;
v8.render = function(v22)
    return l_ContextServices_0.provide({
        l_ContextServices_0.API.new(), 
        l_ContextServices_0.Localization.mock(), 
        l_ContextServices_0.Plugin.new(v22.plugin), 
        l_ContextServices_0.Mouse.new({}), 
        v5(true), 
        l_ContextServices_0.Focus.new(v22.target), 
        l_ContextServices_0.Store.new(v22.store), 
        v6.new(v22.analyticsImpl)
    }, v22.props[v1.Children]);
end;
return function(v23, v24)
    return v1.createElement(v8, v24, {
        Element = v23
    });
end;
