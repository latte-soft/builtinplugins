local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local v4 = require(l_Parent_0.Packages.Rodux);
local v5 = require(l_Parent_0.Packages.Dash);
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_RunService_0 = game:GetService("RunService");
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_Plugin_0 = l_ContextServices_0.Plugin;
local l_Mouse_0 = l_ContextServices_0.Mouse;
local l_Store_0 = l_ContextServices_0.Store;
local v13 = require(l_Parent_0.Src.Reducers.MainReducer);
local v14 = require(l_Parent_0.Src.Resources.MakeTheme);
local l_SourceStrings_0 = l_Parent_0.Src.Resources.Localization.SourceStrings;
local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.Localization.LocalizedStrings;
local l_Util_0 = l_Parent_0.Src.Util;
local v18 = require(l_Util_0.MakePluginActions);
local v19 = require(l_Util_0.TelemetryGlobals);
local v20 = require(l_Util_0.Telemetry.Path2dToolUsage);
local v21 = require(l_Util_0.Telemetry.TelemetryProtocol);
local _ = require(l_Util_0.Telemetry.TelemetryProtocolTypes);
local l_Components_0 = l_Parent_0.Src.Components;
local v24 = require(l_Components_0.ControlPointEditGui);
local v25 = require(l_Components_0.SelectionListener);
local v26 = require(l_Components_0.PathToolbar);
local v27 = require(l_Components_0.MoveBaseGui);
local v28 = require(l_Components_0.VisualizationGui);
local v29 = require(l_Components_0.AddPointComponent);
local v30 = v2.PureComponent:extend("MainPlugin");
v30.init = function(v31, v32)
    v31.state = {};
    v31.store = v4.Store.new(v13, nil, {
        v4.thunkMiddleware
    }, nil);
    v31.localization = l_ContextServices_0.Localization.new({
        stringResourceTable = l_SourceStrings_0, 
        translationResourceTable = l_LocalizedStrings_0, 
        pluginName = "PathEditor"
    });
    v31.log = function(v33, v34)
        v31.telemetry:logRobloxTelemetryEvent(v33, nil, v5.join({
            placeId = game.PlaceId, 
            studioSid = l_RbxAnalyticsService_0:GetSessionId()
        }, v34));
    end;
    v31.logUsageReport = function()
        if v19:totalCount() > 0 then
            v31.log(v20, {
                selectModeCount = v19.selectModeCount, 
                addPointModeCount = v19.addPointModeCount, 
                addTangentModeCount = v19.addTangentModeCount
            });
            v19:reset();
        end;
    end;
    v31.telemetry = v21.new();
    v31.analytics = l_ContextServices_0.Analytics.new(function()
        return {};
    end, {});
    if not (not game:GetFastFlag("PathEditorRBXTelemetry") or l_RunService_0:IsClient()) then
        game:BindToClose(function()
            v31.logUsageReport();
        end);
    end;
    v31.actions = l_ContextServices_0.PluginActions.new(v32.Plugin, v18(v32.plugin, v31.localization));
end;
v30.render = function(v35)
    local l_Plugin_1 = v35.props.Plugin;
    return l_ContextServices_0.provide({
        l_Plugin_0.new(l_Plugin_1), 
        l_Store_0.new(v35.store), 
        l_Mouse_0.new(l_Plugin_1:getMouse()), 
        v14(), 
        v35.localization, 
        v35.analytics, 
        v35.actions
    }, {
        Portal = v3.createPortal({
            PathEditFolder = v2.createElement("Folder", {
                Name = "PathEditFolder"
            }, {
                ControlPointEditGui = v2.createElement(v24), 
                PathToolbar = v2.createElement(v26), 
                MoveBaseGui = v2.createElement(v27), 
                VisualizationGui = v2.createElement(v28), 
                AddPointComponent = v2.createElement(v29)
            })
        }, l_CoreGui_0), 
        SelectionListener = v2.createElement(v25)
    });
end;
return v30;
