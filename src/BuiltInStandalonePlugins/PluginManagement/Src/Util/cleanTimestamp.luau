return function(v0)
    local v1 = v0:find("%.");
    if not v1 then
        return v0;
    else
        return v0:sub(1, v1 - 1) .. "Z";
    end;
end;
