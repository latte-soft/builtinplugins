local _ = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Src.Types);
return function(v1)
    if v1.item.source == "builtin" then
        local v2 = v1.palette.GetBuiltinItemData(v1.item.builtinItem);
        return v2 and v2.accessoryType;
    elseif v1.item.instance:FindFirstChildWhichIsA("WrapLayer", true) == nil then
        return "rigid";
    else
        return "layered";
    end;
end;
