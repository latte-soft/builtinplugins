local v0 = require(script:FindFirstAncestor("R15Migrator").Packages.Framework);
local l_Networking_0 = v0.Http.Networking;
local l_ContextItem_0 = v0.ContextServices.ContextItem;
local v3 = v0.RobloxAPI.Url.new();
local v4 = l_ContextItem_0:extend("NetworkInterface");
v4.new = function()
    local v5 = {
        _networkImp = l_Networking_0.new({
            isInternal = true
        })
    };
    setmetatable(v5, v4);
    return v5;
end;
v4.httpGetJson = function(v6, v7)
    return v6._networkImp:parseJson((v6._networkImp:handleRetry(v6._networkImp:get(v7), 5)));
end;
local function _(v8, v9, v10, v11)
    return v3.composeUrl(v3.ITEM_CONFIGURATION_URL, "v1/creations/get-assets", {
        assetType = v8, 
        isArchived = false, 
        limit = v9, 
        cursor = v10, 
        groupId = v11
    });
end;
v4.getGroupAnimations = function(v13, v14, v15)
    return v13:httpGetJson((v3.composeUrl(v3.ITEM_CONFIGURATION_URL, "v1/creations/get-assets", {
        assetType = "Animation", 
        isArchived = false, 
        limit = 25, 
        cursor = v14, 
        groupId = v15
    })));
end;
local function v21(v16, v17, v18, v19, v20)
    return v3.composeUrl(v3.APIS_URL, string.format("toolbox-service/v1/inventory/user/%d/%s?", v20, v16), {
        keyword = v19, 
        limit = v17, 
        searchSource = if not v19 then nil else "keyword", 
        cursor = v18
    });
end;
v4.getUserAnimations = function(v22, v23, v24, v25)
    return v22:httpGetJson((v21("animation", 30, v23, v25, v24)));
end;
local function _(v26)
    return v3.composeUrl(v3.DEVELOP_URL, "v2/universes/" .. v26 .. "/configuration");
end;
v4.getAvatarType = function(v28, v29)
    local l_StarterPlayer_0 = v29:GetService("StarterPlayer");
    local l_GameId_0 = v29.GameId;
    if l_GameId_0 == 0 then
        return l_StarterPlayer_0.GameSettingsAvatar;
    else
        local v32 = v28:httpGetJson((v3.composeUrl(v3.DEVELOP_URL, "v2/universes/" .. l_GameId_0 .. "/configuration"))):catch(function()
            return nil;
        end):await();
        if v32 then
            local l_universeAvatarType_0 = v32.responseBody.universeAvatarType;
            if l_universeAvatarType_0 == "MorphToR6" then
                return Enum.GameAvatarType.R6;
            elseif l_universeAvatarType_0 == "MorphToR15" then
                return Enum.GameAvatarType.R15;
            else
                return Enum.GameAvatarType.PlayerChoice;
            end;
        else
            return nil;
        end;
    end;
end;
return v4;
