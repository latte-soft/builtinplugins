local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v5 = require(l_script_FirstAncestor_0.Src.Actions.SetTracks);
return function(v6, v7, v8)
    return function(v9)
        local v10 = v9:getState();
        local v11 = v1(v10.Status.Tracks);
        local v12 = v4.isChannelAnimation(v10.AnimationData);
        local l_ipairs_0 = ipairs;
        local v14 = v6 or {};
        for _, v16 in l_ipairs_0(v14) do
            local function v17(v18)
                if v12 and v18.Components or v18.Type == v2.TRACK_TYPES.CFrame then
                    v18.Expanded = v7;
                    if not (not v8 or not v18.Components) then
                        for _, v20 in pairs(v18.Components) do
                            v17(v20);
                        end;
                    end;
                end;
            end;
            v17((v3.findTrackEntry(v11, v16)));
        end;
        v9:dispatch(v5(v11));
    end;
end;
