return function(v0, v1)
    if v1.type == "OpenGroupMenu" then
        return v1.group;
    elseif v1.type == "OpenTagMenu" then
        return nil;
    elseif v1.type == "MoveTagSelectionUpOrDown" then
        return nil;
    else
        return v0;
    end;
end;
