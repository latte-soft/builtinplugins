return function(v0, v1, v2)
    local v3 = not v0 and 0 or 1;
    local v4 = not v1 and 0 or 1;
    if v3 == v4 then
        return nil;
    elseif v2 == Enum.SortDirection.Descending then
        return v3 < v4;
    else
        return v4 < v3;
    end;
end;
