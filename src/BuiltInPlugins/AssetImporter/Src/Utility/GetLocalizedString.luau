return function(v0, v1, v2, v3)
    local v4 = v0:getText(v1, v2, v3);
    if v4:sub(-#v2) == v2 then
        return nil;
    else
        return v4;
    end;
end;
