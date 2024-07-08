local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Rodux);
local _ = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Networking_0 = v4.Http.Networking;
local l_TestHelpers_0 = v4.TestHelpers;
local l_ContextServices_0 = v4.ContextServices;
local v8 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryContext);
local v9 = require(l_Parent_0.Src.Contexts.Telemetry.TelemetryProtocol);
local _ = require(l_Parent_0.Src.Contexts.Telemetry.Types);
local v11 = require(l_Parent_0.Src.Testing.createMockPluginGui);
local v12 = require(l_Parent_0.Src.Util.createStore);
local v13 = require(l_Parent_0.Src.Util.recordChange);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local _ = require(l_Parent_0.Src.Thunks.Types);
local _ = require(l_Parent_0.Src.Types);
local v17 = {};
v17.__index = v17;
v17.new = function()
    local v18 = l_TestHelpers_0.Instances.MockPlugin.new("StyleEditor");
    local v19 = l_Networking_0.mock();
    local v20 = v9.new();
    local v21 = l_ContextServices_0.Localization.mock();
    return (setmetatable({
        _destroyed = false, 
        plugin = v18, 
        localization = v21, 
        networking = v19, 
        telemetry = v20, 
        focus = l_ContextServices_0.Focus.new((v11())), 
        store = v12({
            Plugin = v18, 
            Localization = v21, 
            Networking = v19, 
            Telemetry = v20, 
            recordChange = v13(l_ChangeHistoryService_0)
        })
    }, v17.__index));
end;
v17.provide = function(v22, v23)
    assert(v22._destroyed == false, "cannot use MockContext after it is destroyed");
    assert(type(v23) == "table", "expected children to be a table");
    return l_TestHelpers_0.provideMockContext({
        l_ContextServices_0.Plugin.new(v22.plugin), 
        l_ContextServices_0.Store.new(v22.store), 
        l_ContextServices_0.Mouse.new(v22.plugin:GetMouse()), 
        v8.new(v22.telemetry), 
        v22.localization, 
        v22.focus, 
        v14(true)
    }, v23);
end;
v17.destroy = function(v24)
    assert(v24._destroyed == false, "cannot use MockContext after it is destroyed");
    v24._destroyed = true;
    v24.focus:get():Destroy();
    v24.plugin:Destroy();
    v24.localization:destroy();
    v24.focus:destroy();
    v24.store:destruct();
end;
return v17;
