avatarUtils = {};
local v0 = require(script.Parent.Parent.Parent.Packages._Index.Dash.Dash.splitOn);
avatarUtils.getFaceList = function(v1)
    local v2 = {};
    for _, v4 in pairs(v1) do
        local v5 = v0(v4.Name, "_");
        local v6 = v5[1];
        local v7 = v5[2];
        if v2[v6] == nil then
            v2[v6] = {
                [v7] = v4
            };
        else
            v2[v6][v7] = v4;
        end;
    end;
    return v2;
end;
avatarUtils.getAllAvatars = function()
    local v8 = {};
    for _, v10 in pairs((workspace:GetDescendants())) do
        if v10:IsA("Model") and v10:FindFirstChild("Humanoid") ~= nil then
            table.insert(v8, v10);
        end;
    end;
    return v8;
end;
avatarUtils.checkAvatar = function(v11)
    local v12 = {};
    for _, v14 in v11, nil, nil do
        if v14:FindFirstChild("Humanoid") ~= nil then
            table.insert(v12, v14);
        end;
    end;
    if #v12 ~= 0 then
        return v12;
    else
        return nil;
    end;
end;
return avatarUtils;
