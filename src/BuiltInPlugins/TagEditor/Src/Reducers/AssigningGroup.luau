return function(v0, v1)
    if v1.type == "SetAssigningGroup" then
        return v1.group;
    elseif v1.type ~= "SetTagData" and v1.type ~= "SetGroupData" then
        return nil;
    else
        return v0;
    end;
end;
