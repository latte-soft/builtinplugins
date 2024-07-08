return function(v0)
    local v1 = tonumber(v0:match("://(%d+)")) or tonumber(v0:match("(%d+)"));
    if not v1 then
        return nil;
    else
        return v1;
    end;
end;
