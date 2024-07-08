local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local v2 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v4 = require(l_Actions_0.NetworkError);
local v5 = require(l_Actions_0.SetCurrentScreen);
local v6 = require(l_Actions_0.UploadResult);
local v7 = require(l_Parent_0.Core.Networking.Requests.TrySaveSalesThumbnailAssetMediaRequest);
return function(v8)
    return function(v9)
        v9:dispatch(v5(v2.SCREENS.UPLOADING_ASSET));
        return v8.networkInterface:patchAsset(v8.assetId, v8.name, v8.description, v8.genres, v8.commentOn, v8.copyOn, v8.locale, v8.localName, v8.localDescription, v8.isConvertMarketplaceModelsToPackageEnabled):andThen(function(_)
            v9:dispatch(v7(v8));
        end, function(v11)
            if v1.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v9:dispatch(v4(v11));
            v9:dispatch(v6(false));
        end);
    end;
end;
