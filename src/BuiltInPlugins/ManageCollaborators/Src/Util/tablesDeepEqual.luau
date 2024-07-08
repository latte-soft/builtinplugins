local function v0(v1, v2)
    if typeof(v1) ~= typeof(v2) then
        return false;
    elseif #v1 ~= #v2 then
        return false;
    else
        for v3, v4 in pairs(v2) do
            if typeof(v4) ~= typeof(v1[v3]) then
                return false;
            end;
        end;
        for v5, v6 in pairs(v1) do
            if typeof(v6) ~= typeof(v2[v5]) then
                return false;
            elseif typeof(v6) == "table" then
                if not v0(v6, v2[v5]) then
                    return false;
                end;
            elseif v6 ~= v2[v5] then
                return false;
            end;
        end;
        return true;
    end;
end;
return v0;
