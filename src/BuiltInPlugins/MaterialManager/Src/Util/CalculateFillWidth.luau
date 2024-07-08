local _ = require(script.Parent.Parent.Parent.Src.Types);
return function(v1, v2, v3)
    local v4 = 0;
    local v5 = 0;
    local v6 = 0;
    for _, v8 in ipairs(v1) do
        v4 = v4 + v8.Offset;
        v5 = v5 + v8.Scale;
        if not (v8.Offset == 0) or v8.Scale ~= 0 then
            v6 = v6 + 1;
        end;
    end;
    if v6 == 0 then
        return UDim.new(1, 0);
    else
        return UDim.new(1 - v5, -((v4 + (v2 or 0) * 2) + (v3 or 0) * (v6 - 1)));
    end;
end;
