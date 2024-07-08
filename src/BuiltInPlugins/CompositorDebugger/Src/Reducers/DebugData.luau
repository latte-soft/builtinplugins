local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_Dash_0 = require(l_script_FirstAncestor_0.Packages.Framework).Dash;
local l_join_0 = l_Dash_0.join;
local _ = l_Dash_0.None;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v7 = require(l_Actions_0.SetFrameBuffer);
local v8 = require(l_Actions_0.SetOverrides);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local _ = require(l_Util_0.CircularBuffer);
local _ = require(l_Util_0.debugFlags);
return (v1.createReducer({
    FrameBuffer = nil, 
    Overrides = {}
}, {
    [v7.name] = function(v12, v13)
        return l_join_0(v12, {
            FrameBuffer = v13.frameBuffer
        });
    end, 
    [v8.name] = function(v14, v15)
        return l_join_0(v14, {
            Overrides = v15.overrides
        });
    end
}));
