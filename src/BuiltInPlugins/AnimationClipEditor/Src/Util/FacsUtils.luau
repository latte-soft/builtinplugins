local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
return {
    filterFacsTracks = function(v3)
        local v4 = {};
        for _, v6 in pairs(v3) do
            if v6.Type == v1.TRACK_TYPES.Facs then
                table.insert(v4, v6);
            end;
        end;
        return v4;
    end, 
    getUnusedFacs = function(v7)
        local v8 = {};
        for v9, _ in pairs(v1.FacsControlToRegionMap) do
            v8[v9] = {
                Name = v9, 
                Instance = "Root", 
                Type = v1.TRACK_TYPES.Facs
            };
        end;
        for _, v12 in pairs(v7) do
            v8[v12.Name] = nil;
        end;
        v8 = v2.Dictionary.values(v8);
        table.sort(v8, function(v13, v14)
            return v13.Name < v14.Name;
        end);
        return v8;
    end
};
