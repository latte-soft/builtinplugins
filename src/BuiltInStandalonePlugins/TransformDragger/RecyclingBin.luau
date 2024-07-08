local v0 = {};
local v1 = {};
local l_HttpService_0 = game:GetService("HttpService");
v0.Recycle = function(_, v4)
    local l_ClassName_0 = v4.ClassName;
    local v6 = v1[l_ClassName_0];
    if not v6 then
        v6 = {};
        v1[l_ClassName_0] = v6;
    end;
    local v7 = l_HttpService_0:GenerateGUID(false);
    v6[v4] = v7;
    delay(5, function()
        if v6[v4] == v7 then
            v6[v4] = nil;
            v4:Destroy();
        end;
    end);
    v4.Parent = nil;
end;
v0.RecycleObjects = function(v8, v9)
    for _, v11 in pairs(v9) do
        v8:Recycle(v11);
    end;
end;
v0.Pull = function(_, v13, v14)
    local v15 = nil;
    local v16 = v1[v13];
    if v16 then
        v15 = next(v16);
        if v15 then
            v16[v15] = nil;
        end;
    end;
    if not v15 then
        v15 = Instance.new(v13);
    end;
    if v14 then
        v15.Parent = v14;
    end;
    return v15;
end;
v0.Allocate = function(v17, v18, v19, v20)
    local v21 = {};
    local v22 = 0;
    for _, v24 in pairs(v20:GetChildren()) do
        if v24:IsA(v18) then
            v22 = v22 + 1;
            if v19 < v22 then
                v17:Recycle(v24);
            else
                v21[v22] = v24;
            end;
        end;
    end;
    while v22 < v19 do
        v22 = v22 + 1;
        v21[v22] = v17:Pull(v18, v20);
    end;
    return v21;
end;
return v0;
