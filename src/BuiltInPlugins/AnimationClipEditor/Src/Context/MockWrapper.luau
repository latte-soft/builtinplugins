local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_ServiceWrapper_0 = v3.TestHelpers.ServiceWrapper;
local l_MockPlugin_0 = v3.TestHelpers.Instances.MockPlugin;
local v7 = require(l_script_FirstAncestor_0.Src.Context.MainProvider);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Theme);
local v9 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local l_Localization_0 = l_ContextServices_0.Localization;
local v11 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v13 = require(l_script_FirstAncestor_0.Src.Util.CalloutController);
local v14 = v1.Component:extend("MockWrapper");
v14.getMockGlobals = function(v15)
    if not v15 then
        v15 = {};
    end;
    local v16 = v15.localization or l_Localization_0.mock();
    local v17 = v15.focusGui or Instance.new("ScreenGui");
    v17.Name = "FocusGuiMock";
    if v15.Container then
        v17.Parent = v15.Container;
    end;
    local v18 = v15.plugin or l_MockPlugin_0.new();
    return {
        focusGui = v17, 
        plugin = v18, 
        localization = v16, 
        theme = v15.theme or v8(true), 
        mouse = v15.mouse or v18:GetMouse(), 
        store = v2.Store.new(v9, v15.storeState, {
            v2.thunkMiddleware
        }), 
        analytics = l_ContextServices_0.Analytics.mock(), 
        pluginActions = l_ContextServices_0.PluginActions.new(v18, {
            {
                id = "rerunLastStory", 
                text = "MOCK"
            }
        }), 
        signals = v11.new(v12.SIGNAL_KEYS), 
        calloutController = v13.new(l_ServiceWrapper_0.new("CalloutService", true):asService())
    };
end;
v14.render = function(v19)
    return v1.createElement(v7, v14.getMockGlobals(v19.props), v19.props[v1.Children]);
end;
return v14;
