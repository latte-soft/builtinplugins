local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = require(script.NetworkingImpl);
local v5 = require(script.NetworkingMock);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrMockContent);
local v8 = l_ContextItem_0:extend("Networking");
v8.new = function(v9)
    local v10 = {
        _isMock = v9, 
        impl = if not v9 then v4 else v5, 
        OnFetchFinished = l_Signal_0.new(), 
        OnFetchProgressChanged = l_Signal_0.new()
    };
    setmetatable(v10, v8);
    return v10;
end;
v8.mock = function()
    return v8.new(true);
end;
v8.destroy = function(_)
end;
v8.fetchUsernameAsync = function(v12, v13)
    v12.impl.fetchUsernameAsync(v13);
end;
v8.fetchGroupsAsync = function(v14, v15, v16)
    v14.impl.fetchGroupsAsync(v15, v16);
end;
v8.fetchAssetsLegacyAsync = function(v17, v18, v19, v20)
    v18.OnFetchFinished = v17.OnFetchFinished;
    v18.OnFetchProgressChanged = v17.OnFetchProgressChanged;
    if not v7() then
        v17.impl.fetchAssetsLegacyAsync(v18, v19, v20);
        return ;
    else
        v5.fetchAssetsLegacyAsync(v18, v19, v20);
        return ;
    end;
end;
v8.getThumbnailUriForScope = function(v21, v22)
    return v21.impl.getThumbnailUriForScope(v22);
end;
v8.getThumbnailForScopeAsync = function(v23, v24, v25)
    v23.impl.getThumbnailForScopeAsync(v24, v25);
end;
v8.getThumbnailForItemAsync = function(v26, v27, v28)
    if not v7() then
        v26.impl.getThumbnailForItemAsync(v27, v28);
        return ;
    else
        v5.getThumbnailForItemAsync(v27, v28);
        return ;
    end;
end;
return v8;
