local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local v2 = require(l_Util_0.DebugFlags);
local v3 = require(l_Util_0.AssetConfigConstants);
local v4 = require(l_Util_0.SerializeInstances);
local v5 = require(l_Util_0.Analytics.Analytics);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v7 = require(l_Actions_0.NetworkError);
local v8 = require(l_Actions_0.SetCurrentScreen);
local v9 = require(l_Actions_0.UploadResult);
local v10 = require(l_Actions_0.SetAssetId);
local v11 = require(l_Parent_0.Core.Flags.getFFlagToolboxAnimationAPIMigration);
return function(v12)
    return function(v13, v14)
        v13:dispatch(v8(v3.SCREENS.UPLOADING_ASSET));
        local function v16(v15)
            if not v11() then
                if (v15 and tostring(v15) ~= "0") and not v15:find("Error") then
                    v13:dispatch(v10(v15));
                    v13:dispatch(v8(v3.SCREENS.UPLOADING_ASSET));
                    v5.incrementUploadAssetSuccess(v12.assetType);
                    v13:dispatch(v9(true));
                    return ;
                else
                    v13:dispatch(v9(false));
                    v13:dispatch(v7(v15));
                    v5.incrementUploadAssetFailure(v12.assetType);
                    return ;
                end;
            else
                v13:dispatch(v10(v15.assetId));
                v13:dispatch(v8(v3.SCREENS.UPLOADING_ASSET));
                v5.incrementUploadAssetSuccess(v12.assetType);
                v13:dispatch(v9(true));
                return ;
            end;
        end;
        local function v18(v17)
            if v2.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v13:dispatch(v9(false));
            v13:dispatch(v7((tostring(v17))));
            v5.incrementUploadAssetFailure(v12.assetType);
        end;
        local function v20(v19)
            if v2.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v13:dispatch(v9(false));
            v13:dispatch(v7(v19));
            v5.incrementUploadAssetFailure(v12.assetType);
        end;
        return v4(v12.instance, v14.StudioAssetService):andThen(function(v21)
            if not v11() then
                return v12.networkInterface:postUploadAnimation(v12.assetId, v12.name, v12.description, nil, v12.groupId, v21):andThen(v16, v20);
            else
                return v12.networkInterface:postUploadAnimation(v12.assetId, v12.name, v12.description, v12.userId, v12.groupId, v21):andThen(v16, v20);
            end;
        end, v18);
    end;
end;
