local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local l_Models_0 = l_Parent_0.Src.Models;
local v5 = require(l_Actions_0.BreakpointsWindow.AddBreakpoint);
local v6 = require(l_Actions_0.BreakpointsWindow.DeleteBreakpoint);
local v7 = require(l_Actions_0.BreakpointsWindow.ModifyBreakpoint);
local v8 = require(l_Actions_0.BreakpointsWindow.SetBreakpointSortState);
local v9 = require(l_Actions_0.BreakpointsWindow.BreakpointColumnFilter);
local _ = require(l_Models_0.MetaBreakpoint);
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
return v1.createReducer({
    BreakpointIdsInDebuggerConnection = {}, 
    MetaBreakpoints = {}, 
    SortDirection = nil, 
    ColumnIndex = nil, 
    listOfEnabledColumns = {}
}, {
    [v5.name] = function(v12, v13)
        if not ((not v12.BreakpointIdsInDebuggerConnection or not v12.BreakpointIdsInDebuggerConnection[v13.debuggerConnectionId]) or not v12.BreakpointIdsInDebuggerConnection[v13.debuggerConnectionId][v13.metaBreakpoint.id]) then
            assert(false);
        end;
        return v2.Dictionary.join(v12, {
            BreakpointIdsInDebuggerConnection = v2.Dictionary.join(v12.BreakpointIdsInDebuggerConnection, {
                [v13.debuggerConnectionId] = v2.Dictionary.join(not not v12.BreakpointIdsInDebuggerConnection and v12.BreakpointIdsInDebuggerConnection[v13.debuggerConnectionId] or {}, {
                    [v13.metaBreakpoint.id] = v13.metaBreakpoint.id
                })
            })
        }, {
            MetaBreakpoints = v2.Dictionary.join(v12.MetaBreakpoints, {
                [v13.metaBreakpoint.id] = v13.metaBreakpoint
            })
        });
    end, 
    [v7.name] = function(v14, v15)
        assert(v14.BreakpointIdsInDebuggerConnection);
        assert(v14.MetaBreakpoints[v15.metaBreakpoint.id]);
        return v2.Dictionary.join(v14, {
            MetaBreakpoints = v2.Dictionary.join(v14.MetaBreakpoints, {
                [v15.metaBreakpoint.id] = v15.metaBreakpoint
            })
        });
    end, 
    [v8.name] = function(v16, v17)
        return v2.Dictionary.join(v16, {
            SortDirection = v17.sortDirection, 
            ColumnIndex = v17.columnIndex
        });
    end, 
    [v6.name] = function(v18, v19)
        if not (v18.MetaBreakpoints and v18.MetaBreakpoints[v19.metaBreakpointId]) then
            assert(false);
        end;
        local v20 = l_deepCopy_0(v18.MetaBreakpoints);
        v20[v19.metaBreakpointId] = nil;
        local v21 = l_deepCopy_0(v18.BreakpointIdsInDebuggerConnection);
        for _, v23 in pairs(v21) do
            v23[v19.metaBreakpointId] = nil;
        end;
        return v2.Dictionary.join(v18, {
            BreakpointIdsInDebuggerConnection = v21
        }, {
            MetaBreakpoints = v20
        });
    end, 
    [v9.name] = function(v24, v25)
        return v2.Dictionary.join(v24, {
            listOfEnabledColumns = v25.listOfEnabledColumns
        });
    end
});
