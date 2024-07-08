local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Actions;
local v2 = require(l_Parent_0.Models.MetaBreakpoint);
local v3 = require(l_Actions_0.BreakpointsWindow.AddBreakpoint);
local v4 = require(l_Actions_0.BreakpointsWindow.ModifyBreakpoint);
local v5 = require(l_Actions_0.BreakpointsWindow.DeleteBreakpoint);
local v6 = require(l_Actions_0.Common.SetFilenameForGuid);
local v7 = {};
v7.__index = v7;
v7.onMetaBreakpointAdded = function(v8, v9)
    v8.store:dispatch(v3(v8.store:getState().Common.currentDebuggerConnectionId, (v2.fromMetaBreakpoint(v9))));
    v8.store:dispatch(v6(v9.Script, ""));
    v8:updateScriptWatcher(v9);
end;
v7.updateScriptWatcher = function(v10, v11)
    for _, v13 in pairs((v11:GetContextBreakpoints())) do
        local l_connectionId_0 = v13.connectionId;
        for _, v16 in ipairs(v13.breakpoints) do
            v10._crossDmScriptChangeListenerService:StartWatchingScriptLine(v16.Script, l_connectionId_0, v16.Line);
        end;
    end;
end;
v7.onMetaBreakpointChanged = function(v17, v18)
    local v19 = v2.fromMetaBreakpoint(v18);
    v17:updateScriptWatcher(v18);
    v17.store:dispatch(v4(v19));
end;
v7.onMetaBreakpointRemoved = function(v20, v21)
    v20.store:dispatch(v5(v21.Id));
end;
local function v31(v22, v23, v24)
    local v25 = v23 or game:GetService("MetaBreakpointManager");
    v22._crossDmScriptChangeListenerService = v24 or game:GetService("CrossDMScriptChangeListener");
    v22._metaBreakpointAddedConnection = v25.MetaBreakpointAdded:Connect(function(v26)
        v22:onMetaBreakpointAdded(v26);
    end);
    v22._metaBreakpointChangedConnection = v25.MetaBreakpointChanged:Connect(function(v27)
        v22:onMetaBreakpointChanged(v27);
    end);
    v22._metaBreakpointSetChangedConnection = v25.MetaBreakpointSetChanged:Connect(function(v28, _)
        v22:onMetaBreakpointChanged(v28);
    end);
    v22._metaBreakpointRemovedConnection = v25.MetaBreakpointRemoved:Connect(function(v30)
        v22:onMetaBreakpointRemoved(v30);
    end);
end;
v7.destroy = function(v32)
    if v32._metaBreakpointAddedConnection then
        v32._metaBreakpointAddedConnection:Disconnect();
        v32._metaBreakpointAddedConnection = nil;
    end;
    if v32._metaBreakpointRemovedConnection then
        v32._metaBreakpointRemovedConnection:Disconnect();
        v32._metaBreakpointRemovedConnection = nil;
    end;
    if v32._metaBreakpointChangedConnection then
        v32._metaBreakpointChangedConnection:Disconnect();
        v32._metaBreakpointChangedConnection = nil;
    end;
    if v32._metaBreakpointSetChangedConnection then
        v32._metaBreakpointSetChangedConnection:Disconnect();
        v32._metaBreakpointSetChangedConnection = nil;
    end;
end;
v7.new = function(v33, v34, v35)
    local v36 = {
        store = v33
    };
    v31(v36, v34, v35);
    setmetatable(v36, v7);
    return v36;
end;
return v7;
