local l_HttpService_0 = game:GetService("HttpService");
local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local v2 = require(script:FindFirstAncestor("R15Migrator").Packages.Framework).ContextServices.ContextItem:extend("ScriptConversionContext");
v2.new = function(v3)
    local v4 = {};
    setmetatable(v4, v2);
    v4._scripts = {};
    v4._scriptGUIDs = {};
    v4._connections = {};
    v4._scriptDestroyingCallback = v3;
    v4._revertedSources = {};
    return v4;
end;
v2.initConnections = function(v5, v6, v7)
    v5._connections[v7] = v6.AncestryChanged:Connect(function(_, v9)
        if v9 == nil then
            v5._scriptDestroyingCallback(v6);
            v5._connections[v7]:Disconnect();
            v5._connections[v7] = nil;
            v5._scripts[v6] = nil;
            v5._scriptGUIDs[v7] = nil;
        end;
    end);
end;
v2.findScriptGUID = function(v10, v11)
    return v10._scripts[v11];
end;
v2.addOrFindScript = function(v12, v13)
    local v14 = v12:findScriptGUID(v13);
    if not v12:findScriptGUID(v13) then
        v14 = l_HttpService_0:GenerateGUID(true);
        v12._scripts[v13] = v14;
        v12._scriptGUIDs[v14] = v13;
        v12:initConnections(v13, v14);
    end;
    return v14;
end;
v2.closeScriptIfOpen = function(v15, v16)
    local v17 = v15:getScriptInstanceFromGUID(v16);
    if v17 then
        local l_l_ScriptEditorService_0_ScriptDocument_0 = l_ScriptEditorService_0:FindScriptDocument(v17);
        if l_l_ScriptEditorService_0_ScriptDocument_0 then
            l_l_ScriptEditorService_0_ScriptDocument_0:CloseAsync();
        end;
        return ;
    else
        return ;
    end;
end;
v2.setRevertedScriptSource = function(v19, v20)
    v19._revertedSources[v20] = l_ScriptEditorService_0:GetEditorSource((v19:getScriptInstanceFromGUID(v20)));
end;
v2.getRevertedScriptSource = function(v21, v22)
    return v21._revertedSources[v22];
end;
v2.getScriptInstanceFromGUID = function(v23, v24)
    return v23._scriptGUIDs[v24];
end;
return v2;
