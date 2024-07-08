return function(v0, ...)
    local v1 = {
        ...
    };
    local l_v0_0 = v0;
    for _, v4 in ipairs(v1) do
        if l_v0_0 == nil then
            return nil;
        else
            l_v0_0 = l_v0_0:FindFirstChild(v4);
        end;
    end;
    return l_v0_0;
end;
