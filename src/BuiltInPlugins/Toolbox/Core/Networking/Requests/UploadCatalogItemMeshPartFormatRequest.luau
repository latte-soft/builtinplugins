local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.NetworkError);
local v2 = require(l_Parent_0.Core.Actions.UploadResult);
local l_Util_0 = l_Parent_0.Core.Util;
local v4 = require(l_Util_0.DebugFlags);
local v5 = require(l_Util_0.AssetConfigConstants);
local v6 = require(l_Util_0.SerializeInstances);
local v7 = require(l_Util_0.convertSpecialMeshAccessory);
local v8 = require(l_Parent_0.Core.Networking.Requests.ConfigureItemTagsRequest);
return function(v9, v10, v11, v12, v13, v14, v15)
    return function(v16, v17)
        local function v19(_)
            v16:dispatch(v8(v9, v10, {}, v15));
        end;
        local function v21(v20)
            if v4.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v16:dispatch(v1((tostring(v20))));
            v16:dispatch(v2(false));
        end;
        local function v23(v22)
            v16:dispatch(v1(v22));
            v16:dispatch(v2(false));
        end;
        return v6({
            (v7(v14[1]))
        }, v17.StudioAssetService):andThen(function(v24)
            return v9:uploadCatalogItemFormat(v10, v11.Name, v12, v13, true, v5.AVATAR_MESHPART_ACCESSORY_FORMAT, v24):andThen(v19, v23);
        end, v21);
    end;
end;
