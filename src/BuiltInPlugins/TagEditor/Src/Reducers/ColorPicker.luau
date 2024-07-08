return function(v0, v1)
    if v1.type == "ToggleColorPicker" then
        return v1.tag;
    else
        return v0;
    end;
end;
