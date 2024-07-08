local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Rodux);
local l_ContextServices_0 = v1.ContextServices;
local v5 = require(l_Parent_0.Src.ContextItems);
local l_Http_0 = v1.Http;
local l_MockPlugin_0 = v1.TestHelpers.Instances.MockPlugin;
local v8 = require(l_Parent_0.Src.TestHelpers.MockTerrain);
local l_Localization_0 = l_ContextServices_0.Localization;
local v10 = require(l_Parent_0.Src.Reducers.MainReducer);
local v11 = require(l_Parent_0.Src.Resources.PluginTheme);
local v12 = require(l_Parent_0.Src.Resources.makeTheme);
local v13 = require(l_Parent_0.Src.Util.PluginActivationController);
local l_TerrainInterfaces_0 = l_Parent_0.Src.TerrainInterfaces;
local v15 = require(l_TerrainInterfaces_0.TerrainGenerationInstance);
local v16 = require(l_TerrainInterfaces_0.TerrainImporterInstance);
local v17 = require(l_TerrainInterfaces_0.TerrainSeaLevel);
local v18 = require(l_Parent_0.Src.Util.ShorelineController);
local v19 = require(l_Parent_0.Src.Util.SmoothVoxelsController);
local v20 = v2.PureComponent:extend(script.Name);
v20.createMocks = function()
    local v21 = l_MockPlugin_0.new();
    return {
        plugin = v21, 
        mouse = v21:GetMouse(), 
        store = v3.Store.new(v10), 
        theme = v11.mock(), 
        localization = l_Localization_0.mock(), 
        terrain = v8.new(), 
        networking = l_Http_0.Networking.mock()
    };
end;
v20.createMockContextItems = function(v22)
    local v23 = l_ContextServices_0.Analytics.mock();
    return {
        plugin = l_ContextServices_0.Plugin.new(v22.plugin), 
        mouse = l_ContextServices_0.Mouse.new(v22.mouse), 
        store = l_ContextServices_0.Store.new(v22.store), 
        theme = v5.DEPRECATED_Theme.new(v22.theme), 
        devFrameworkThemeItem = v12(true), 
        localization = v22.localization, 
        analytics = v23, 
        networking = v22.networking, 
        terrain = v5.Terrain.new(v22.terrain), 
        pluginActivationController = v13.new(v22.plugin), 
        terrainImporter = v16.new({
            terrain = v22.terrain, 
            localization = v22.localization, 
            analytics = v23, 
            userId = 0
        }), 
        terrainGeneration = v15.new({
            terrain = v22.terrain, 
            localization = v22.localization, 
            analytics = v23
        }), 
        seaLevel = v17.new({
            terrain = v22.terrain, 
            localization = v22.localization
        }), 
        shorelineController = v18.new(v23, v22.plugin, v22.store, v22.terrain, true), 
        smoothVoxelsController = v19.new(v23, v22.plugin, v22.store, v22.terrain, true)
    };
end;
v20.cleanupMocks = function(v24, v25)
    v25.smoothVoxelsController:destroy();
    v25.shorelineController:destroy();
    v25.seaLevel:destroy();
    v25.terrainGeneration:destroy();
    v25.terrainImporter:destroy();
    v25.pluginActivationController:destroy();
    v25.localization:destroy();
    v25.devFrameworkThemeItem:destroy();
    v25.theme:destroy();
    v24.store:destruct();
    v24.plugin:Destroy();
end;
v20.init = function(v26)
    v26.mocks = v20.createMocks();
    v26.mockItems = v20.createMockContextItems(v26.mocks);
end;
v20.willUnmount = function(v27)
    v20.cleanupMocks(v27.mocks, v27.mockItems);
    v27.mocks = {};
    v27.mockItems = {};
end;
v20.render = function(v28)
    return l_ContextServices_0.provide({
        v28.mockItems.plugin, 
        v28.mockItems.mouse, 
        v28.mockItems.store, 
        v28.mockItems.theme, 
        v28.mockItems.localization, 
        v28.mockItems.analytics, 
        v28.mockItems.pluginActivationController, 
        v28.mockItems.terrainImporter, 
        v28.mockItems.terrainGeneration, 
        v28.mockItems.seaLevel, 
        v28.mockItems.shorelineController, 
        v28.mockItems.smoothVoxelsController
    }, {
        WrappedComponent = v2.createFragment(v28.props[v2.Children])
    });
end;
v20.createElementWithMockContext = function(v29, v30, v31)
    local v32 = true;
    if type(v29) ~= "function" then
        v32 = false;
        if type(v29) == "table" then
            v32 = type(v29.render) == "function";
        end;
    end;
    assert(v32, "MockWrapper.createElementWithMockContext passed invalid component");
    return v2.createElement(v20, {
        MyComponent = v2.createElement(v29, v30, v31)
    });
end;
return v20;
