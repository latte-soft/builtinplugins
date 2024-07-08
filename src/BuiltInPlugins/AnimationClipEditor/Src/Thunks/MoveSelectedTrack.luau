local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedTracks);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.SetSelectedTracks);
local v4 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagSelectFromViewport);
return function(v7)
    return function(v8)
        local l_Status_0 = v8:getState().Status;
        local l_Tracks_0 = l_Status_0.Tracks;
        local l_AnimationData_0 = v8:getState().AnimationData;
        local l_SelectedTracks_0 = l_Status_0.SelectedTracks;
        if l_SelectedTracks_0 and not v4(l_SelectedTracks_0) then
            if v5.isChannelAnimation(l_AnimationData_0) and #l_SelectedTracks_0 > 1 then
                return ;
            else
                local v13 = {};
                local v14 = {};
                for v15, v16 in ipairs(l_Tracks_0) do
                    v14[v16.Name] = v15;
                end;
                local v17 = nil;
                local v18 = nil;
                for _, v20 in ipairs(l_SelectedTracks_0) do
                    local v21 = v14[v20[1]];
                    v17 = not not v17 and math.min(v17, v21) or v21;
                    v18 = not not v18 and math.max(v18, v21) or v21;
                end;
                if v7 > 0 then
                    v7 = math.min(v7, #l_Tracks_0 - v18);
                else
                    v7 = math.max(v7, 1 - v17);
                end;
                for _, v23 in ipairs(l_SelectedTracks_0) do
                    local v24 = v14[v23[1]];
                    if v24 then
                        v13[l_Tracks_0[v24 + v7].Name] = true;
                    end;
                end;
                local v25 = {};
                for v26, _ in pairs(v13) do
                    table.insert(v25, {
                        v26
                    });
                end;
                if not v6() then
                    v8:dispatch(v2(v25));
                    return ;
                else
                    v8:dispatch(v3(v25));
                    return ;
                end;
            end;
        else
            return ;
        end;
    end;
end;
