local v0 = require(script.Parent.isAssetIdLike);
return function(v1)
    local v2 = {};
    local v3 = {};
    local v4 = 1;
    while true do
        local v5, v6 = string.find(v1, "%d+", v4);
        if v5 then
            if (v6 - v5) + 1 > 4 then
                local v7 = string.sub(v1, v5, v6);
                if not ((not (string.sub(v1, v5 - 1, v5 - 1) ~= ".") or string.sub(v1, v5 - 13, v5 - 1) ~= "rbxassetid://" and not v0(v7)) or v3[v7]) then
                    v3[v7] = true;
                    table.insert(v2, v7);
                end;
            end;
            v4 = v6 + 1;
        else
            break;
        end;
    end;
    return v2;
end;
