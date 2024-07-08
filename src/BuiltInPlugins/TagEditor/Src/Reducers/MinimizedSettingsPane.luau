return function(v0, v1)
    if v1.type == "SetMinimizedSettingsPane" then
        return v1.minimized;
    elseif v1.type == "SetAssigningGroup" and v1.group ~= nil then
        return true;
    else
        return v0;
    end;
end;
