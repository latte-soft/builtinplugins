return function(v0)
    local v1, v2 = string.find(v0, "rbxassetid://", 1, true);
    if not v1 then
        local v3, v4 = string.find(v0, "http[s]?://www.roblox.com/asset/%?id=");
        v1 = v3;
        v2 = v4;
        if not v1 then
            v3, v4 = string.find(v0, "rbxgameasset://Audio/", 1, true);
            v1 = v3;
            v2 = v4;
            if not v1 then
                return nil;
            else
                return nil;
            end;
        else
            return v0:sub(v2 + 1);
        end;
    else
        return v0:sub(v2 + 1);
    end;
end;
