local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Src.Util.exhaustiveMatch);
local function v8(v1, v2, v3)
    local v4 = 1;
    local l_v1_0 = v1;
    while true do
        local v6 = (v4 + l_v1_0) // 2;
        local v7 = v2((v3(v6)));
        if v7 == "equal" then
            return v6;
        else
            assert(v7 ~= "equal", "Luau");
            if v4 == l_v1_0 then
                return nil;
            elseif v7 == "smaller" then
                v4 = v6 + 1;
            elseif v7 == "bigger" then
                l_v1_0 = v6 - 1;
            else
                v0(v7);
            end;
        end;
    end;
end;
return function(v9, v10, v11)
    local v12 = v8(v9, v10, v11);
    if v12 == nil then
        return {};
    else
        assert(v12 ~= nil, "Luau");
        local v13 = {
            v12
        };
        for v14 = v12 - 1, 1, -1 do
            if v10(v11(v14)) == "equal" then
                table.insert(v13, v14);
            else
                break;
            end;
        end;
        for v15 = v12 + 1, v9 do
            if v10(v11(v15)) == "equal" then
                table.insert(v13, v15);
            else
                break;
            end;
        end;
        return v13;
    end;
end;
