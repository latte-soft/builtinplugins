local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Signal_0 = v1.Util.Signal;
local v4 = require(l_script_FirstAncestor_0.Src.Types);
local l_StudioService_0 = game:GetService("StudioService");
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local v7 = l_ContextItem_0:extend("PluginController");
v7.new = function(v8, v9, v10, v11)
    local v12 = {
        _isMock = v11, 
        _networking = v9, 
        _plugin = v8, 
        _pressedKeys = {}, 
        _user = {
            Id = l_StudioService_0:GetUserId(), 
            Name = v10:getText("Plugin", "PlaceholderUsername"), 
            Scope = v4.Scope.User
        }, 
        OnUsernameFetched = l_Signal_0.new(), 
        OnSelectionChanged = l_Signal_0.new(), 
        OnInputChanged = l_Signal_0.new()
    };
    v12._networking:fetchUsernameAsync(function(v13, v14)
        if not v14 then
            v12._user.Name = v13;
            v12.OnUsernameFetched:Fire(v13);
            return ;
        else
            if v6() then
                warn(v10:getText("PluginErrors", "ErrorFetchUsername"));
            end;
            return ;
        end;
    end);
    setmetatable(v12, v7);
    return v12;
end;
v7.mock = function(v15, v16, v17)
    return v7.new(v15, v16, v17, true);
end;
v7.destroy = function(_)
end;
v7.getPlugin = function(v19)
    return v19._plugin;
end;
v7.addKeyPress = function(v20, v21)
    v20._pressedKeys[v21] = true;
    v20.OnInputChanged:Fire(v20._pressedKeys);
end;
v7.removeKeyPress = function(v22, v23)
    v22._pressedKeys[v23] = nil;
    v22.OnInputChanged:Fire(v22._pressedKeys);
end;
v7.getUser = function(v24)
    return v24._user;
end;
return v7;
