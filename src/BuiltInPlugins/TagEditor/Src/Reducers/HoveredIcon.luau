return function(v0, v1)
    if v1.type == "SetHoveredIcon" then
        return v1.icon;
    else
        return v0;
    end;
end;
