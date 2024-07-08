return function(v0, v1, v2)
    v0 = v0 or 0;
    v1 = v1 or 0;
    if v0 == v1 then
        return nil;
    elseif v2 == Enum.SortDirection.Descending then
        return v0 < v1;
    else
        return v1 < v0;
    end;
end;
