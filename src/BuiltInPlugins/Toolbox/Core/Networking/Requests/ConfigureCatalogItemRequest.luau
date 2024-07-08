local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.NetworkError);
local v2 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local v3 = require(l_Parent_0.Core.Actions.UploadResult);
local v4 = require(l_Parent_0.Core.Util.DebugFlags);
local v5 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local v6 = require(l_Parent_0.Core.Networking.Requests.ConfigureSalesRequest);
local function _(v7, v8)
    return {
        name = v7, 
        description = v8, 
        genres = {
            "all"
        }
    };
end;
return function(v10, v11, v12, v13, v14, v15, v16, v17, v18, v19)
    return function(v20)
        v12 = string.sub(v12, 1, v5.NAME_CHARACTER_LIMIT);
        v13 = string.sub(v13, 1, v5.DESCRIPTION_CHARACTER_LIMIT);
        v20:dispatch(v2(v5.SCREENS.UPLOADING_ASSET));
        v10:configureCatalogItem(v11, {
            name = v12, 
            description = v13, 
            genres = {
                "all"
            }
        }):andThen(function(_)
            v20:dispatch(v6(v10, v11, v14, v15, v16, v17, v18, v19));
        end, function(v22)
            if v4.shouldDebugWarnings() then
                warn("Lua toolbox: Could not configure catalog item");
            end;
            v20:dispatch(v1({
                responseBody = v22
            }));
            v20:dispatch(v3(false));
        end);
    end;
end;
