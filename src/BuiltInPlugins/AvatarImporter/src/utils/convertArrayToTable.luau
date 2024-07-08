return function(v0)
    local v1 = {};
    for _, v3 in ipairs(v0) do
        if v1[v3] ~= nil then
            error("convertArrayToTable: sourceArray should not contain duplicate values");
        else
            v1[v3] = v3;
        end;
    end;
    return v1;
end;
