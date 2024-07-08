return function(v0, v1)
    v0 = v0 or {};
    if v1.type == "SetGroupData" then
        return v1.data;
    else
        return v0;
    end;
end;
