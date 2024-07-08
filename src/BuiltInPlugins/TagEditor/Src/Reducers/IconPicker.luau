return function(v0, v1)
    if v1.type == "ToggleIconPicker" then
        return v1.tag;
    else
        return v0;
    end;
end;
