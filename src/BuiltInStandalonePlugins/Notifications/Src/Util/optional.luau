optional = function(v0, ...)
    local l_v0_0 = v0;
    for _, v3 in ipairs({
        ...
    }) do
        if l_v0_0 == nil then
            return nil;
        else
            l_v0_0 = l_v0_0[v3];
        end;
    end;
    return l_v0_0;
end;
return optional;
