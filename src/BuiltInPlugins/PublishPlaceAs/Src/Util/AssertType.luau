return {
    assertType = function(v0, v1, v2)
        assert(type(v0) == v1, v2 .. " must be " .. v1 .. ", received (" .. type(v0) .. ")");
    end, 
    assertNullableType = function(v3, v4, v5)
        local v6 = true;
        if type(v3) ~= v4 then
            v6 = type(v3) == "nil";
        end;
        assert(v6, v5 .. " must be " .. v4 .. " or nil, received (" .. type(v3) .. ")");
    end
};
