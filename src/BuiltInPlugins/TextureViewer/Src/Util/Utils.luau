return {
    round = function(v0, v1)
        return string.format("%." .. (v1 or 0) .. "f", v0);
    end, 
    doesTextureAliasContainId = function(v2)
        return string.match(v2, "%?id=") or string.match(v2, "rbxassetid://");
    end, 
    parseIdFromTextureAlias = function(v3)
        local v4, v5 = string.find(v3, "?id=");
        if not v5 then
            local v6, v7 = string.find(v3, "rbxassetid://");
            v4 = v6;
            v5 = v7;
            if not v5 then
                return v3;
            else
                return (string.sub(v3, v5 + 1));
            end;
        else
            return (string.sub(v3, v5 + 1));
        end;
    end
};
