local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v2.join;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.SessionStats.PluginFocusEnd);
local v6 = require(l_Actions_0.SessionStats.PluginFocusStart);
local v7 = require(l_Actions_0.SessionStats.SetSessionStartTimestamp);
local v8 = require(l_Actions_0.SessionStats.TrackButtonPress);
local _ = require(l_Parent_0.Src.Types);
return v1.createReducer({
    SessionStartTimestamp = 0, 
    TotalPluginFocusTimeSeconds = 0, 
    PluginFocusPeriodStartTimestamp = nil, 
    PluginFocusEndWithoutStartCount = 0, 
    ButtonPressCounts = {}
}, {
    [v8.name] = function(v10, v11)
        return l_join_0(v10, {
            ButtonPressCounts = l_join_0(v10.ButtonPressCounts, {
                [v11.buttonId] = (v10.ButtonPressCounts[v11.buttonId] or 0) + 1
            })
        });
    end, 
    [v7.name] = function(v12, v13)
        return l_join_0(v12, {
            SessionStartTimestamp = v13.startTimestamp
        });
    end, 
    [v6.name] = function(v14, v15)
        return l_join_0(v14, {
            PluginFocusPeriodStartTimestamp = v15.focusStartTimestamp
        });
    end, 
    [v5.name] = function(v16, v17)
        local l_PluginFocusEndWithoutStartCount_0 = v16.PluginFocusEndWithoutStartCount;
        local v19 = 0;
        if not v16.PluginFocusPeriodStartTimestamp then
            l_PluginFocusEndWithoutStartCount_0 = l_PluginFocusEndWithoutStartCount_0 + 1;
        else
            v19 = v17.focusEndTimestamp - v16.PluginFocusPeriodStartTimestamp;
        end;
        return l_join_0(v16, {
            PluginFocusPeriodStartTimestamp = v2.None, 
            TotalPluginFocusTimeSeconds = v16.TotalPluginFocusTimeSeconds + v19, 
            PluginFocusEndWithoutStartCount = l_PluginFocusEndWithoutStartCount_0
        });
    end
});
