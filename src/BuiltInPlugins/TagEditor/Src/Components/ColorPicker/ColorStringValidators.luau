return {
    validateHex = function(v0)
        return v0:match("^%s*%#?(%x%x%x%x%x%x)%s*$") ~= nil;
    end, 
    validateRGB = function(v1)
        local v2, v3, v4 = v1:match("^%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*%s*$");
        if not (v2 ~= nil and v3 ~= nil) or v4 == nil then
            return false;
        elseif not (tonumber(v2) <= 255 and tonumber(v3) <= 255) or tonumber(v4) > 255 then
            return false;
        else
            return true;
        end;
    end, 
    validateHSV = function(v5)
        local v6, v7, v8 = v5:match("^%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*,%s*(%d?%d?%d)%s*%s*$");
        if not (v6 ~= nil and v7 ~= nil) or v8 == nil then
            return false;
        elseif tonumber(v6) > 360 then
            return false;
        elseif not (tonumber(v7) <= 100) or tonumber(v8) > 100 then
            return false;
        else
            return true;
        end;
    end
};
