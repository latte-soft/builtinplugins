local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_MockPlugin_0 = v3.TestHelpers.Instances.MockPlugin;
local v6 = require(l_Parent_0.Src.Reducers.MainReducer);
local v7 = require(l_Parent_0.Src.Resources.MakeTheme);
local v8 = v1.PureComponent:extend("MockProvider");
v8.createMocks = function()
    local v9 = l_MockPlugin_0.new();
    return {
        plugin = v9, 
        mouse = v9:GetMouse(), 
        store = v2.Store.new(v6), 
        theme = v7(true)
    };
end;
v8.createMockContextItems = function(v10)
    return {
        plugin = l_ContextServices_0.Plugin.new(v10.plugin), 
        mouse = l_ContextServices_0.Mouse.new(v10.mouse), 
        store = l_ContextServices_0.Store.new(v10.store), 
        analytics = l_ContextServices_0.Analytics.mock()
    };
end;
v8.cleanupMocks = function(v11, v12)
    v12.theme:destroy();
    v11.store:destruct();
    v11.plugin:Destroy();
end;
v8.init = function(v13)
    v13.mocks = v8.createMocks();
    v13.mockItems = v8.createMockContextItems(v13.mocks);
end;
v8.render = function(v14)
    return l_ContextServices_0.provide({
        v14.mockItems.plugin, 
        v14.mockItems.mouse, 
        v14.mockItems.store, 
        v14.mockItems.theme, 
        v14.mockItems.analytics
    }, {
        WrappedComponent = v1.createElement("Frame", nil, v14.props[v1.Children])
    });
end;
v8.createElementWithMockContext = function(v15, v16, v17)
    local v18 = true;
    if type(v15) ~= "function" then
        v18 = false;
        if type(v15) == "table" then
            v18 = type(v15.render) == "function";
        end;
    end;
    assert(v18, "MockWrapper.createElementWithMockContext passed invalid component");
    return v1.createElement(v8, {
        MyComponent = v1.createElement(v15, v16, v17)
    });
end;
mockWrap = function(v19, v20, v21)
    return v8.createElementWithMockContext(v19, v20, v21);
end;
return mockWrap;
