local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v3 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v4 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedEvents);
local v5 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
return function(v8)
    return function(v9)
        if v8 then
            local v10 = v9:getState();
            local v11 = v8.animationData or v9:getState().AnimationData;
            local v12 = v8.selectedEvents or v9:getState().Status.SelectedEvents;
            local l_FrameRate_0 = v10.Status.FrameRate;
            local l_SnapMode_0 = v10.Status.SnapMode;
            if v11 and v11.Events then
                local v15 = v1.Dictionary.join({}, v11);
                v15.Events = v2(v15.Events);
                local l_Events_0 = v15.Events;
                local v17 = v1.Dictionary.keys(v12);
                table.sort(v17);
                local v18 = v8.newTick - v8.pivotTick;
                local l_eventFilters_0 = v8.eventFilters;
                local v20 = v2(v12);
                local v21, v22 = v3.getEventBounds(v15, v12);
                local function v27(v23)
                    local v24 = v23 + v18;
                    if l_SnapMode_0 ~= v6.SNAP_MODES.None then
                        v24 = v7.getNearestFrame(v24, l_FrameRate_0);
                    end;
                    v24 = math.clamp(v24, v23 - v21, v6.MAX_ANIMATION_LENGTH - (v22 - v23));
                    if v23 ~= v24 then
                        if l_eventFilters_0 and next(l_eventFilters_0) then
                            for v25, v26 in l_Events_0.Data[v23], nil, nil do
                                if l_eventFilters_0[v25] then
                                    v3.removeEvent(l_Events_0, v23, v25);
                                    v3.addEvent(l_Events_0, v24, v25, v26);
                                end;
                            end;
                        else
                            v3.moveEvents(l_Events_0, v23, v24);
                        end;
                        v20[v23] = nil;
                        v20[v24] = true;
                    end;
                end;
                if v18 < 0 then
                    for _, v29 in ipairs(v17) do
                        v27(v29);
                    end;
                else
                    for v30 = #v17, 1, -1 do
                        v27(v17[v30]);
                    end;
                end;
                v9:dispatch(v4(v20));
                v9:dispatch(v5(v15));
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
