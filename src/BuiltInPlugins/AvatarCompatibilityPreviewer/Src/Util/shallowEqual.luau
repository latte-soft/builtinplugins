return function(v0, v1)
    if v0 == v1 then
        return true;
    elseif typeof(v0) ~= typeof(v1) then
        return false;
    else
        if typeof(v0) == "table" then
            assert(typeof(v1) == "table", "Luau");
            if #v0 ~= #v1 then
                return false;
            else
                for v2 in v0, nil, nil do
                    if v0[v2] ~= v1[v2] then
                        return false;
                    end;
                end;
                for v3 in v1, nil, nil do
                    if v0[v3] ~= v1[v3] then
                        return false;
                    end;
                end;
            end;
        end;
        return true;
    end;
end;
