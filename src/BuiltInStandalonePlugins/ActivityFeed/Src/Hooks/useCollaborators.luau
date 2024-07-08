local v0 = require(script.Parent.Parent.Parent.Packages.React);
local function v8(v1)
    local v2 = {};
    local l_status_0, _ = pcall(function()
        v2 = v1:GetCollaboratorsList();
    end);
    local v5 = if l_status_0 then {} else {};
    for _, v7 in pairs(v2) do
        table.insert(v5, v7.UserId);
    end;
    return v5;
end;
return function()
    local v9 = v0.useMemo(function()
        return game:GetService("CollaboratorsService");
    end, {});
    local v10, v11 = v0.useState({});
    v0.useEffect(function()
        v11((v8(v9)));
        local v12 = v9.CollaboratorInstanceCreatedSignal:Connect(function()
            v11((v8(v9)));
        end);
        local v13 = v9.CollaboratorInstanceDestroyedSignal:Connect(function()
            v11((v8(v9)));
        end);
        return function()
            v12:Disconnect();
            v13:Disconnect();
        end;
    end, {});
    return v10;
end;
