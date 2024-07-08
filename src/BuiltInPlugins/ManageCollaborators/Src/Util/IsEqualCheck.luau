local function _(v0)
    return next(v0) == nil;
end;
return function(v2, v3)
    if not (v2 ~= nil) or v3 == nil then
        return v2 == v3;
    elseif (next(v2) == nil) ~= (next(v3) == nil) then
        return false;
    else
        local v4 = true;
        for v5, v6 in pairs(v2) do
            if v3[v5] ~= v6 then
                v4 = false;
                break;
            end;
        end;
        for v7, v8 in pairs(v3) do
            if v2[v7] ~= v8 then
                return false;
            end;
        end;
        return v4;
    end;
end;
