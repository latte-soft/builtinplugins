local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v5 = require(l_Parent_0.Src.Resources.MakeTheme);
local v6 = v1.PureComponent:extend("MockPlugin");
local function _()
    return Instance.new("ScreenGui");
end;
local function v17(v8)
    local v10 = {
        GetMouse = function(_)
            return {};
        end
    };
    local function _()
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "MockPluginGui";
        if v8 then
            l_ScreenGui_0.Parent = v8;
        end;
        return l_ScreenGui_0;
    end;
    v10.CreateQWidgetPluginGui = function(_)
        local l_ScreenGui_1 = Instance.new("ScreenGui");
        l_ScreenGui_1.Name = "MockPluginGui";
        if v8 then
            l_ScreenGui_1.Parent = v8;
        end;
        return l_ScreenGui_1;
    end;
    v10.CreateDockWidgetPluginGui = function(_)
        local l_ScreenGui_2 = Instance.new("ScreenGui");
        l_ScreenGui_2.Name = "MockPluginGui";
        if v8 then
            l_ScreenGui_2.Parent = v8;
        end;
        return l_ScreenGui_2;
    end;
    return v10;
end;
v6.init = function(v18, v19)
    v18.plugin = v17(v19.Container);
    v18.target = v19.FocusTarget or Instance.new("ScreenGui");
    v18.store = v2.Store.new(v3, nil, {
        v2.thunkMiddleware
    });
end;
v6.render = function(v20)
    return l_ContextServices_0.provide({
        l_ContextServices_0.Localization.mock(), 
        l_ContextServices_0.Plugin.new(v20.plugin), 
        l_ContextServices_0.Mouse.new({}), 
        v5(), 
        l_ContextServices_0.Focus.new(v20.target), 
        l_ContextServices_0.Store.new(v20.store)
    }, v20.props[v1.Children]);
end;
return function(v21, v22)
    return v1.createElement(v6, v22, {
        Element = v21
    });
end;
