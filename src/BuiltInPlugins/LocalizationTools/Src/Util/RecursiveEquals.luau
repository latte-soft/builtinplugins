local function v0(v1, v2)
    if type(v1) ~= type(v2) then
        return false;
    elseif type(v1) ~= "table" then
        return v1 == v2;
    else
        for v3, v4 in pairs(v1) do
            if not v0(v4, v2[v3]) then
                return false;
            end;
        end;
        for v5, v6 in pairs(v2) do
            if not v0(v6, v1[v5]) then
                return false;
            end;
        end;
        return true;
    end;
end;
return v0;
