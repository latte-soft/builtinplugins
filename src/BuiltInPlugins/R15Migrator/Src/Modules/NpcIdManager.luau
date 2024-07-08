local l_HttpService_0 = game:GetService("HttpService");
local v1 = {
    Npcs = {}
};
v1.AddNpc = function(v2)
    local v3 = l_HttpService_0:GenerateGUID();
    v1.SetNpcWithId(v2, v3);
    return v3;
end;
v1.SetNpcWithId = function(v4, v5)
    v1.Npcs[v5] = v4;
end;
v1.GetNpcFromId = function(v6)
    return v1.Npcs[v6];
end;
v1.Reset = function()
    v1.Npcs = {};
end;
return v1;
