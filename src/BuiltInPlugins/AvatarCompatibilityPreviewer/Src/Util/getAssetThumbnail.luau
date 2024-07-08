return function(v0, v1, v2)
    if not (v1 ~= nil) or v2 == nil then
        local v3 = false;
        if v1 == nil then
            v3 = v2 == nil;
        end;
        assert(v3, "Neither width nor height can be empty on their own");
        v1 = 150;
        v2 = 150;
    end;
    return (("rbxthumb://type=Asset&id=%*&w=%*&h=%*"):format(v0, v1, v2));
end;
