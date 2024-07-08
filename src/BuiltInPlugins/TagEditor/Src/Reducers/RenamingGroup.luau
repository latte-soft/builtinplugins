return function(v0, v1)
    if v1.type == "SetRenamingGroup" then
        if not v1.renaming then
            return nil;
        else
            return v1.group;
        end;
    elseif v1.type == "SetRenaming" then
        return nil;
    else
        return v0;
    end;
end;
