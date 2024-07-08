local l_Actions_0 = script.Parent.Parent.Parent.Actions;
local v1 = require(l_Actions_0.Common.SetFilenameForGuid);
local v2 = require(l_Actions_0.Common.SetScriptSourceLine);
local v3 = {};
v3.__index = v3;
local function v12(v4, v5)
    local v6 = v5 or game:GetService("CrossDMScriptChangeListener");
    v4._guidNameChangedConnection = v6.GuidNameChanged:Connect(function(v7, v8)
        v4.store:dispatch(v1(v7, v8));
    end);
    v4._guidLineChangedConnection = v6.GuidLineContentsChanged:Connect(function(v9, v10, v11)
        v4.store:dispatch(v2(v9, v10, v11));
    end);
end;
v3.destroy = function(v13)
    if v13._guidNameChangedConnection then
        v13._guidNameChangedConnection:Disconnect();
        v13._guidNameChangedConnection = nil;
    end;
    if v13._guidLineChangedConnection then
        v13._guidLineChangedConnection:Disconnect();
        v13._guidLineChangedConnection = nil;
    end;
end;
v3.new = function(v14, v15)
    local v16 = {
        store = v14
    };
    v12(v16, v15);
    setmetatable(v16, v3);
    return v16;
end;
return v3;
