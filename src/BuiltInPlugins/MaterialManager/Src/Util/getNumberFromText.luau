return function(v0)
    if utf8.len(v0) == 0 then
        return nil;
    else
        local v1 = tonumber(v0);
        if v1 and v1 > 0 then
            return v1;
        else
            return nil;
        end;
    end;
end;
