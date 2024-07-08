return function(v0, v1)
    if v0.Changed[v1] ~= nil then
        return v0.Changed[v1];
    else
        return v0.Current[v1];
    end;
end;
