local l_CollectionService_0 = game:GetService("CollectionService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetIKEnabled);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetIKMode);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetShowTree);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetPinnedParts);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetClipboard);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.ReleaseEditor);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.AttachEditor);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetRootInstance);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.Exporting.LoadAnimation);
local v15 = require(l_script_FirstAncestor_0.Src.Thunks.SortAndSetTracks);
local v16 = require(l_script_FirstAncestor_0.Src.Actions.SetPast);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetFuture);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetLegacyAnimationInstances);
return function(v20, v21)
    return function(v22)
        local v23 = v3.getAnimSaves(v20);
        if #v23 > 0 then
            table.sort(v23, function(v24, v25)
                local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v24.animation);
                local l_l_CollectionService_0_Tags_1 = l_CollectionService_0:GetTags(v25.animation);
                local v28 = l_l_CollectionService_0_Tags_0[1] and tonumber(l_l_CollectionService_0_Tags_0[1]);
                local v29 = l_l_CollectionService_0_Tags_1[1] and tonumber(l_l_CollectionService_0_Tags_1[1]);
                if v28 or v29 then
                    if not v28 or v29 then
                        if not v29 or v28 then
                            return v29 < v28;
                        else
                            return false;
                        end;
                    else
                        return true;
                    end;
                else
                    return v24.animation.Name < v25.animation.Name;
                end;
            end);
            v22:dispatch(v14(v23[1].animation.Name, v23[1].isLegacyAnimSaves, v21));
            return ;
        else
            v22:dispatch(v16({}));
            v22:dispatch(v17({}));
            v22:dispatch(v18({}));
            v22:dispatch(v15({}));
            v22:dispatch(v13(nil));
            return ;
        end;
    end;
end;
