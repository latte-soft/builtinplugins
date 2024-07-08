local v0 = require(script.Parent.StringUtil);
local function v4(v1, v2, v3)
    if not v0.MatchBeforeOrAfter(v3, v1, v2, "%w", "%w") then
        if not v0.MatchBeforeAndAfter(v3, v1, v2, "[\"]", "[\"]") then
            if not v0.MatchBeforeAndAfter(v3, v1, v2, "[']", "[']") then
                if not v0.MatchBeforeAndAfter(v3, v1, v2, "[.]", "[[:%s.=,\r\n\t]", false, true) then
                    return false;
                else
                    return true;
                end;
            else
                return true;
            end;
        else
            return true;
        end;
    else
        return false;
    end;
end;
return function(v5, v6, v7, v8, v9)
    local v10 = 1;
    for _, v12 in v7, nil, nil do
        local v13 = nil;
        local v14 = nil;
        while true do
            local v15, v16 = string.find(v5, v12, v10);
            v13 = v15;
            v14 = v16;
            if not (not v13 or not v14) then
                if not (v8 and not v4(v13, v14, v5)) then
                    v9(v13, v14, v12, v5, v6);
                end;
                v10 = v14;
            end;
            if not (not (v13 == nil) or v14 ~= nil) then
                break;
            end;
        end;
        v10 = 1;
    end;
end;
