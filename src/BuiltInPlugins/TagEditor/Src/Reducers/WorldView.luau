return function(v0, v1)
    v0 = v0 or false;
    if v1.type == "ToggleWorldView" then
        return v1.enabled;
    else
        return v0;
    end;
end;
