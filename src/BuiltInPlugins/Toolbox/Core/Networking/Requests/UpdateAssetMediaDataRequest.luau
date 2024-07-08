local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.Analytics.Analytics);
local v3 = require(l_Util_0.DebugFlags);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local _ = require(l_Parent_0.Core.Types.AssetMediaTypes);
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Framework);
local v8 = require(l_Packages_0.Dash);
local l_append_0 = v8.append;
local l_findIndex_0 = v8.findIndex;
local l_join_0 = v8.join;
local l_map_0 = v8.map;
local l_Promise_0 = v7.Util.Promise;
return function(v14, v15, v16, v17)
    return function(v18)
        local l_ThumbnailIdsToRemove_0 = v16.ThumbnailIdsToRemove;
        local l_ThumbnailFilesToAdd_0 = v16.ThumbnailFilesToAdd;
        local l_ThumbnailOrderToChange_0 = v16.ThumbnailOrderToChange;
        local v22 = {
            Delete = {}, 
            Upload = {}, 
            SetOrder = true, 
            OverallSuccess = true
        };
        local v25 = l_map_0(l_ThumbnailIdsToRemove_0, function(v23)
            return v14:deleteAssetMedia(v15, v23):andThen(function()
                v22.Delete[v23] = true;
            end):catch(function(v24)
                if v3.shouldDebugWarnings() then
                    warn("Could not delete asset media id:", v23, "for asset id:", v15, "error:", v24);
                end;
                v22.Delete[v23] = false;
                v22.OverallSuccess = false;
                v18:dispatch(v4(v24));
            end);
        end);
        local v32 = l_map_0(l_ThumbnailFilesToAdd_0, function(v26)
            return v14:postUploadAssetMedia(v15, v26):andThen(function(v27)
                local l_v26_TemporaryId_0 = v26:GetTemporaryId();
                local l_targetId_0 = v27.targetId;
                l_ThumbnailOrderToChange_0 = l_join_0(l_ThumbnailOrderToChange_0, {
                    [l_findIndex_0(l_ThumbnailOrderToChange_0, function(v30)
                        return v30 == l_v26_TemporaryId_0;
                    end)] = l_targetId_0
                });
                v22.Upload[l_targetId_0] = true;
            end):catch(function(v31)
                if v3.shouldDebugWarnings() then
                    warn("Could not upload asset media:", v26, "for asset id:", v15, "error:", v31);
                end;
                v22.Upload[v26:GetTemporaryId()] = false;
                v22.OverallSuccess = false;
                v18:dispatch(v4(v31));
            end);
        end);
        local function v34()
            return v14:postSetAssetMediaOrder(v15, l_ThumbnailOrderToChange_0):andThen(function()
                v22.SetOrder = true;
                v2.AssetMediaItemsUpdated(v15, v17.Value, l_ThumbnailOrderToChange_0);
            end):catch(function(v33)
                if v3.shouldDebugWarnings() then
                    warn("Could not set order for asset media:", l_ThumbnailOrderToChange_0, "for asset id:", v15, "error:", v33);
                end;
                v22.SetOrder = false;
                v22.OverallSuccess = false;
                v18:dispatch(v4(v33));
            end);
        end;
        local v35 = l_append_0(v25, v32);
        local v36 = nil;
        if #v35 == 0 then
            v36 = if #l_ThumbnailOrderToChange_0 == 0 then l_Promise_0.resolve() else v34();
        else
            local v37 = l_Promise_0.all(v35);
            v36 = if #l_ThumbnailOrderToChange_0 == 0 then v37 else v37:andThen(function()
                if v22.OverallSuccess then
                    v34();
                end;
            end);
        end;
        return v36:andThen(function()
            return v22;
        end);
    end;
end;
