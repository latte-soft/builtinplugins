local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
return v1.createReducer({
    Past = {}, 
    Future = {}, 
    MaxWaypointSize = require(l_script_FirstAncestor_0.Src.Util.Constants).MAX_WAYPOINT_SIZE
}, {
    SetPast = function(v3, v4)
        return v2.Dictionary.join(v3, {
            Past = v4.past
        });
    end, 
    SetFuture = function(v5, v6)
        return v2.Dictionary.join(v5, {
            Future = v6.future
        });
    end, 
    SetMaxWaypointSize = function(v7, v8)
        return v2.Dictionary.join(v7, {
            MaxWaypointSize = v8.maxSize
        });
    end
});
