local v0 = {
    "rbxassetid://(%d+)", 
    "http[s]?://www.roblox.com/[Aa]sset[/]?%?[Ii][Dd]=(%d+)"
};
return function(v1)
    for _, v3 in v0, nil, nil do
        local v4, v5, v6 = string.find(v1, v3);
        if v4 then
            return v4, v5, v1:sub(v4, v5), (tonumber(v6));
        end;
    end;
    return nil;
end;
