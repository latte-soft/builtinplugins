local l_StudioService_0 = game:GetService("StudioService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetClipboard);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Util.SelectionUtils);
local v8 = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
return function()
    return function(v9)
        local v10 = v9:getState();
        local l_SelectedKeyframes_0 = v10.Status.SelectedKeyframes;
        local l_AnimationData_0 = v10.AnimationData;
        if l_AnimationData_0 and l_SelectedKeyframes_0 then
            local v13 = {};
            for v14, v15 in pairs(l_SelectedKeyframes_0) do
                local v16 = l_AnimationData_0.Instances[v14];
                local v17 = {};
                for v18, v19 in pairs(v15) do
                    local v20 = v16.Tracks[v18];
                    v7.traverse(v19, v20, function(v21, v22, v23)
                        if v21.Selection and v22.Data then
                            local v24 = {
                                TopTrackName = v18, 
                                TopTrackType = v20.Type, 
                                RelPath = v23, 
                                Type = v22.Type, 
                                RotationType = v8.getRotationType(v20), 
                                EulerAnglesOrder = v8.getEulerAnglesOrder(v20), 
                                Data = {}
                            };
                            for v25, _ in pairs(v21.Selection) do
                                local v27 = v22.Data[v25];
                                if v27 then
                                    v24.Data[v25] = v2(v27);
                                end;
                            end;
                            table.insert(v17, v24);
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
                v13[v14] = v17;
            end;
            if not v3(v13) then
                l_StudioService_0:CopyToClipboard("");
            end;
            v9:dispatch(v4(v13, not not v6.isChannelAnimation(l_AnimationData_0) and v5.CLIPBOARD_TYPE.Channels or v5.CLIPBOARD_TYPE.Keyframes));
            return ;
        else
            return ;
        end;
    end;
end;
