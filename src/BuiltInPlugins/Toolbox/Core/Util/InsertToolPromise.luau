local _ = script.Parent.Parent.Parent;
local l_ToolboxEnableAudioGrantDialog_0 = game:GetFastFlag("ToolboxEnableAudioGrantDialog");
local v2 = {};
v2.__index = v2;
v2.INSERT_TO_WORKSPACE = 0;
v2.INSERT_TO_STARTER_PACK = 1;
v2.INSERT_CANCELLED = 2;
v2.new = function(v3, v4, v5)
    local v6 = {
        _onPromptCallback = v3, 
        _onScriptWarningCallback = v4, 
        _onPermissionsGrantCallback = v5, 
        _bindable = Instance.new("BindableEvent"), 
        _waiting = false
    };
    setmetatable(v6, v2);
    return v6;
end;
v2.isWaiting = function(v7)
    return v7._waiting;
end;
v2.destroy = function(v8)
    v8:cancel();
    v8._bindable:Destroy();
end;
v2.insertToWorkspace = function(v9)
    v9._bindable:Fire(v2.INSERT_TO_WORKSPACE);
end;
v2.insertToStarterPack = function(v10)
    v10._bindable:Fire(v2.INSERT_TO_STARTER_PACK);
end;
v2.cancel = function(v11)
    v11._bindable:Fire(v2.INSERT_CANCELLED);
end;
v2.dismissWarningPrompt = function(v12)
    v12._bindable:Fire();
end;
v2.returnResult = function(v13, v14)
    v13._bindable:Fire(v14);
end;
v2.promptPermissionsGrantAndWait = function(v15, v16)
    if l_ToolboxEnableAudioGrantDialog_0 then
        v15._waiting = true;
        v15._onPermissionsGrantCallback(v16);
        local v17 = v15._bindable.Event:Wait();
        v15._waiting = false;
        return v17;
    else
        return false;
    end;
end;
v2.promptScriptWarningAndWait = function(v18, v19)
    v18._waiting = true;
    if v18._onScriptWarningCallback(v19) then
        v18._bindable.Event:Wait();
    end;
    v18._waiting = false;
end;
v2.promptAndWait = function(v20)
    if not v20._waiting then
        v20._waiting = true;
        v20._onPromptCallback();
        local v21 = v20._bindable.Event:Wait();
        v20._waiting = false;
        return v21;
    else
        return v2.INSERT_CANCELLED;
    end;
end;
return v2;
