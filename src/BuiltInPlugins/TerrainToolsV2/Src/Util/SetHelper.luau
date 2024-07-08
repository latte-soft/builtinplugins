local v0 = require(script.Parent.isProtectedInstance);
return {
    arrayToSet = function(v1)
        local v2 = {};
        for _, v4 in ipairs(v1) do
            v2[v4] = true;
        end;
        return v2;
    end, 
    diff = function(v5, v6)
        local v7 = {};
        for v8 in pairs(v5) do
            if not v6[v8] then
                v7[v8] = true;
            end;
        end;
        return v7;
    end, 
    splitArrayIntoValidSets = function(v9, v10)
        local v11 = {};
        local v12 = {};
        for _, v14 in ipairs(v9) do
            if not v10(v14) then
                v12[v14] = true;
            else
                v11[v14] = true;
            end;
        end;
        return v11, v12;
    end, 
    isAnyInstanceAncestorInSet = function(v15, v16)
        if not v0(v15) then
            while true do
                if not v15 then
                    return false;
                elseif not v16[v15] then
                    v15 = v15.Parent;
                else
                    return true;
                end;
            end;
        else
            return false;
        end;
    end
};
