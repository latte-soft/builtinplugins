local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
return {
    PruneSelectedTracks = function(v4, v5)
        local v6 = {};
        local v7 = false;
        if v5 then
            for _, v9 in ipairs(v5) do
                if not v1.getTrack(v4, "Root", v9) then
                    v7 = true;
                else
                    table.insert(v6, v9);
                end;
            end;
        end;
        return v6, v7;
    end
};
