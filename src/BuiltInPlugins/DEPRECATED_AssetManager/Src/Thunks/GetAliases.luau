local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Cryo);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local v4 = require(l_Parent_0.Src.Thunks.GetAssetResponse);
local v5 = require(l_Parent_0.Src.Util.Screens);
return function(v6, v7, v8, v9)
    local v10 = {
        assets = {}
    };
    local v11 = 1;
    local function v12(v13)
        local v14 = v7 == v5.IMAGES.Path;
        local v15 = v7 == v5.MESHES.Path;
        local v16 = l_enableAudioImport_0() and v7 == v5.AUDIO.Path;
        local v17 = l_enableVideoImport_0() and v7 == v5.VIDEO.Path;
        local v18 = v7 == v5.MODELS.Path;
        local v19 = {
            ["Images/"] = v14, 
            ["Meshes/"] = v15, 
            ["Audio/"] = v16, 
            ["Video/"] = v17, 
            ["Models/"] = v18
        };
        if not ((((v14 or v15) or v16) or v17) or v18) then
            return ;
        else
            return v6.API.Universes.getAliases(game.GameId, v13):makeRequest():andThen(v4(v10, v7, v9, v13, v19)):andThen(function(v20, v21, v22)
                v10 = v20;
                v11 = v21;
                if v22 then
                    return v10, v11;
                else
                    return (v12(v13 + 1));
                end;
            end);
        end;
    end;
    return v12(v8);
end;
