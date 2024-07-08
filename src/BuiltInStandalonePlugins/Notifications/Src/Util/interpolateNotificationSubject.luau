return function(v0, v1)
    if not v0 then
        return "";
    elseif not v1 then
        return v0;
    else
        return v0:gsub("{(.-)}", v1);
    end;
end;
