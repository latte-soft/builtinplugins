local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Src.Util.buildHierarchy);
local v3 = {};
if not require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport)() then
    v3.buildSkeletonHierarchy = function(v4, v5)
        local v6 = {};
        for v7, v8 in ipairs(v4) do
            local v9 = v5[v7];
            local v10 = nil;
            if v9 == 0 then
                v6[v8] = {};
            else
                v10 = v4[v9];
                if not v6[v10] then
                    v6[v10] = {
                        v8
                    };
                else
                    table.insert(v6[v10], v8);
                end;
            end;
        end;
        local v11 = v4[1];
        return {
            [v11] = v2(v11, function(v12)
                return v6[v12];
            end)
        };
    end;
    v3.getUnusedSkeletonTracks = function(v13, v14)
        local v15 = {};
        for _, v17 in ipairs(v13) do
            local v18 = true;
            for _, v20 in ipairs(v14) do
                if v20.Name == v17 then
                    v18 = false;
                    break;
                end;
            end;
            if v18 then
                table.insert(v15, {
                    Name = v17, 
                    Instance = "Root", 
                    Type = v1.TRACK_TYPES.CFrame
                });
            end;
        end;
        table.sort(v15, function(v21, v22)
            return v21.Name < v22.Name;
        end);
        return v15;
    end;
    return v3;
else
    return v3;
end;
