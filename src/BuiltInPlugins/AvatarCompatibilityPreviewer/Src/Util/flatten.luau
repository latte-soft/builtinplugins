return function(...)
    local v0 = {};
    for _, v2 in {
        ...
    }, nil, nil do
        table.move(v2, 1, #v2, #v0 + 1, v0);
    end;
    return v0;
end;
