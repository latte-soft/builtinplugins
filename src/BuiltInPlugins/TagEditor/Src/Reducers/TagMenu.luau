local v0 = require(script.Parent.Parent.Parent.Packages.Dash);
return function(v1, v2)
    v1 = v1 or nil;
    local v3 = if v1 ~= nil then v1.TagMenu else nil;
    if v2.type == "OpenTagMenu" then
        return v2.tag;
    elseif v2.type == "OpenGroupMenu" then
        return nil;
    elseif v2.type == "MoveTagSelectionUpOrDown" and #v1.TagData > 0 then
        if v3 ~= nil then
            local v5 = v0.findIndex(v1.TagData, function(v4)
                return v4.Name == v3;
            end);
            if v5 == nil then
                return v3;
            else
                return v1.TagData[if not v2.isDown then v5 + (v5 > 1 and -1 or 0) else v5 + (v5 < #v1.TagData and 1 or 0)].Name;
            end;
        else
            return v1.TagData[1].Name;
        end;
    else
        return v3;
    end;
end;
