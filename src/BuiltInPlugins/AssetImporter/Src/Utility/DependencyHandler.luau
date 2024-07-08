local l_assign_0 = require(script:FindFirstAncestor("AssetImporter").Packages.Framework).Dash.assign;
local function v2(v1)
    if not (v1 ~= Enum.NormalId.Top) or v1 == Enum.NormalId.Bottom then
        return {
            Top = true, 
            Bottom = true
        };
    elseif not (v1 ~= Enum.NormalId.Right) or v1 == Enum.NormalId.Left then
        return {
            Right = true, 
            Left = true
        };
    else
        return {
            Front = true, 
            Back = true
        };
    end;
end;
local function v7(v3)
    local v4 = {};
    for _, v6 in pairs(v3) do
        l_assign_0(v4, (v2(v6)));
    end;
    return v4;
end;
local v10 = {
    WorldForward = v7, 
    WorldUp = v7, 
    RigType = function(_, v9)
        if v9:IsAvatar() then
            return {};
        else
            return {
                R15 = true
            };
        end;
    end
};
return function(v11, v12, v13)
    if not v10[v11] then
        return nil;
    else
        return v10[v11](v12, v13);
    end;
end;
