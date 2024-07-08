local l_Selection_0 = game:GetService("Selection");
local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.SaveAnimation);
local v5 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v7, v8)
    return function(v9)
        local v10 = v9:getState();
        local l_AnimationData_0 = v10.AnimationData;
        local l_IsLegacyAnimSaves_0 = v10.Status.IsLegacyAnimSaves;
        local l_RootInstance_0 = v10.Status.RootInstance;
        if l_AnimationData_0 and l_RootInstance_0 then
            local l_Name_0 = l_AnimationData_0.Metadata.Name;
            v9:dispatch(v4(l_Name_0, v8));
            local v15, v16 = v3.getAnimSavesFolder(l_RootInstance_0);
            if l_IsLegacyAnimSaves_0 then
                v15 = v16;
            end;
            local v17 = v15 and v15:FindFirstChild(l_Name_0);
            if not (not v15 or not v17) then
                local v18 = nil;
                do
                    local l_v18_0 = v18;
                    l_v18_0 = l_Selection_0.SelectionChanged:Connect(function(_)
                        l_v18_0:Disconnect();
                        v7:get():SaveSelectedToRoblox();
                    end);
                    local v21 = false;
                    local v22 = nil;
                    v21 = v5.hasFacsData(l_AnimationData_0);
                    v22 = if not v5.isChannelAnimation(l_AnimationData_0) then v6.ANIMATION_TYPE.KeyframeSequence else v6.ANIMATION_TYPE.CurveAnimation;
                    local l_FirstChild_0 = l_RobloxPluginGuiService_0:FindFirstChild("AnimationClipEditor"):FindFirstChild(v6.ANIMATION_UPLOAD_SUCCESS_EVENT_NAME);
                    local v24 = nil;
                    v24 = l_FirstChild_0.Event:Connect(function(v25, v26)
                        v8:report("onExportAnimation", v21, v22, v25, if not l_AnimationData_0.Metadata then nil else l_AnimationData_0.Metadata.Guid);
                        if v26 then
                            v17:Destroy();
                        end;
                        v24:Disconnect();
                    end);
                    l_Selection_0:Set({
                        v17
                    });
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
