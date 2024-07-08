local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_Signal_0 = v2.Util.Signal;
local v4 = require(l_script_FirstAncestor_0.Src.Context.Signals);
local l_ServiceWrapper_0 = v2.TestHelpers.ServiceWrapper;
local l_ContextServices_0 = v2.ContextServices;
local v7 = require(l_script_FirstAncestor_0.Packages.Roact);
local v8 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v9 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Theme);
local v11 = require(l_script_FirstAncestor_0.Src.Util.MakePluginActions);
local l_Localization_0 = l_ContextServices_0.Localization;
local v13 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local v14 = require(l_script_FirstAncestor_0.Src.Util.CalloutController);
local v15 = require(l_script_FirstAncestor_0.Src.Components.AnimationClipEditor);
local v16 = require(l_script_FirstAncestor_0.Src.Context.MainProvider);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetSnapMode);
local v18 = {};
v18.__index = v18;
local function _()
    local v19 = nil;
    pcall(function()
        local l_ViewSelectorScreenGui_0 = game:GetService("CoreGui").ViewSelectorScreenGui;
        if l_ViewSelectorScreenGui_0 then
            local l_Enabled_0 = l_ViewSelectorScreenGui_0.Enabled;
            local v22 = false;
            v19 = l_Enabled_0;
            l_ViewSelectorScreenGui_0.Enabled = v22;
        end;
    end);
    return v19;
end;
local function _(v24)
    if v24 == nil then
        return ;
    else
        pcall(function()
            game:GetService("CoreGui").ViewSelectorScreenGui.Enabled = v24;
        end);
        return ;
    end;
end;
v18.nextTestId = function(_)
    return l_HttpService_0:GenerateGUID();
end;
v18.createTestStore = function(_)
    local v28 = v8.Store.new(v13, nil, {
        v8.thunkMiddleware
    });
    v28:dispatch(v17(v9.SNAP_MODES.None));
    return v28;
end;
local _ = function()
    return {
        Connect = function(_)
            return {
                Disconnect = function(_)
                end
            };
        end
    };
end;
v18.createMockPlugin = function(v32, _)
    local function _()
        local v34 = Instance.new("ScreenGui", game.CoreGui);
        v34.Name = "PluginMockGui";
        v34.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        return v34;
    end;
    return {
        Activate = function(_, ...)
        end, 
        Name = "MockPlugin", 
        Deactivate = function()
        end, 
        GetMouse = function()
            return {
                Button1Down = {
                    Connect = function(_)
                        return {
                            Disconnect = function(_)
                            end
                        };
                    end
                }
            };
        end, 
        CreateDockWidgetPluginGui = function(_, ...)
            local v40 = Instance.new("ScreenGui", game.CoreGui);
            v40.Name = "PluginMockGui";
            v40.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            local l_v40_0 = v40;
            table.insert(v32.subWindows, l_v40_0);
            return l_v40_0;
        end, 
        CreatePluginAction = function()
            return {
                Triggered = l_Signal_0.new()
            };
        end, 
        CreateQWidgetPluginGui = function(_, ...)
            local v43 = Instance.new("ScreenGui", game.CoreGui);
            v43.Name = "PluginMockGui";
            v43.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            local l_v43_0 = v43;
            table.insert(v32.subWindows, l_v43_0);
            return l_v43_0;
        end
    };
end;
v18.makeContainer = function(_)
    local l_MAIN_TEST_SIZE_0 = v9.MAIN_TEST_SIZE;
    local v47 = Instance.new("ScreenGui", game.CoreGui);
    v47.Name = "PluginMockGui";
    v47.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    local v48 = Instance.new("Frame", v47);
    v48.Name = "RhodiumTests";
    v48.BackgroundTransparency = 1;
    v48.Size = UDim2.new(0, l_MAIN_TEST_SIZE_0.X, 0, l_MAIN_TEST_SIZE_0.Y);
    return v48;
end;
v18.getSubWindow = function(v49, v50)
    local v51 = tick();
    local v52 = v51 + 1;
    while not v49.subWindows[v50] do
        wait();
        if v51 + v52 < tick() then
            error("Test did not spawn a sub-window.");
        end;
    end;
    return v49.subWindows[v50];
end;
v18.getStore = function(v53)
    return v53.store;
end;
v18.getContainer = function(v54)
    return v54.container;
end;
v18.new = function(v55)
    local v56 = {
        localization = l_Localization_0.mock(), 
        theme = v10(true), 
        plugin = v55, 
        subWindows = {}
    };
    setmetatable(v56, v18);
    v56.store = v56:createTestStore();
    v56.mockPlugin = v56:createMockPlugin(v55);
    v56.container = v56:makeContainer();
    v56.analytics = l_ContextServices_0.Analytics.mock();
    v56.pluginActions = l_ContextServices_0.PluginActions.new(v56.mockPlugin, v11(v56.mockPlugin, v56.localization));
    v56.signals = v4.new(v9.SIGNAL_KEYS);
    v56.calloutController = v14.new(l_ServiceWrapper_0.new("CalloutService", true):asService());
    return v56;
end;
v18.run = function(v57, v58)
    local v59 = v7.createElement(v16, {
        theme = v57.theme, 
        localization = v57.localization, 
        store = v57.store, 
        plugin = v57.mockPlugin, 
        focusGui = v57.container.Parent, 
        pluginActions = v57.pluginActions, 
        mouse = v57.mockPlugin:GetMouse(), 
        analytics = v57.analytics, 
        signals = v57.signals, 
        calloutController = v57.calloutController
    }, {
        AnimationClipEditor = v7.createElement(v15)
    });
    local v60 = nil;
    local v61;
    do
        local l_v60_0 = v60;
        pcall(function()
            local l_ViewSelectorScreenGui_1 = game:GetService("CoreGui").ViewSelectorScreenGui;
            if l_ViewSelectorScreenGui_1 then
                local l_Enabled_1 = l_ViewSelectorScreenGui_1.Enabled;
                local v65 = false;
                l_v60_0 = l_Enabled_1;
                l_ViewSelectorScreenGui_1.Enabled = v65;
            end;
        end);
        v61 = l_v60_0;
    end;
    v60 = v7.mount(v59, v57.container);
    local l_status_0, l_result_0 = pcall(function()
        v58(v57);
    end);
    wait();
    v7.unmount(v60);
    if v61 == nil then
        return l_status_0, l_result_0;
    else
        pcall(function()
            game:GetService("CoreGui").ViewSelectorScreenGui.Enabled = v61;
        end);
        return l_status_0, l_result_0;
    end;
end;
v18.destroy = function(v68)
    v68.container.Parent:Destroy();
    v68.theme:destroy();
    v68.store:destruct();
    v68.localization:destroy();
    v68.calloutController:destroy();
    for _, v70 in ipairs(v68.subWindows) do
        v70:Destroy();
    end;
end;
return v18;
