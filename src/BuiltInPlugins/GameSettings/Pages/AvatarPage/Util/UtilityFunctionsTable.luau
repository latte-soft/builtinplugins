return {
    immutableSetExistingDictionaryEntry = function(v0, v1, v2)
        local v3 = {};
        for v4, v5 in pairs(v0) do
            if v4 == v1 then
                v3[v4] = v2;
            else
                v3[v4] = v5;
            end;
        end;
        return v3;
    end, 
    countDictionaryKeys = function(v6)
        local v7 = 0;
        for _, _ in pairs(v6) do
            v7 = v7 + 1;
        end;
        return v7;
    end
};
