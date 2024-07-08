local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v4 = require(l_Actions_0.NetworkError);
local v5 = require(l_Actions_0.SetCurrentScreen);
local v6 = require(l_Actions_0.UploadResult);
local v7 = require(l_Actions_0.SetAssetId);
local v8 = require(l_Parent_0.Core.Util.SerializeInstances);
return function(v9, v10, v11, v12)
    return function(v13, v14)
        local function v17(v15)
            local l_responseBody_0 = v15.responseBody;
            v13:dispatch(v5(v2.SCREENS.UPLOADING_ASSET));
            v13:dispatch(v7(l_responseBody_0));
            v13:dispatch(v6(true));
        end;
        local function v19(v18)
            if v1.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v13:dispatch(v5(v2.SCREENS.UPLOAD_ASSET_RESULT));
            v13:dispatch(v4((tostring(v18))));
            v13:dispatch(v6(false));
        end;
        local function v21(v20)
            if v1.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v13:dispatch(v5(v2.SCREENS.UPLOAD_ASSET_RESULT));
            v13:dispatch(v4(v20.responseBody));
            v13:dispatch(v6(false));
        end;
        return v8(v12, v14.StudioAssetService):andThen(function(v22)
            return v9:postOverrideAsset(v10, v11, v22):andThen(v17, v21);
        end, v19);
    end;
end;
