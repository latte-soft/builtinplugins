local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3, v4)
    if v3.palette ~= v4.palette then
        return false;
    elseif v3.item.source ~= v4.item.source then
        return false;
    elseif v3.item.source == v1.SOURCE_BUILTIN and v4.item.source == v1.SOURCE_BUILTIN then
        return v3.item.builtinItem == v4.item.builtinItem;
    elseif v3.item.source == v1.SOURCE_INSTANCE and v4.item.source == v1.SOURCE_INSTANCE then
        return v3.item.instance == v4.item.instance;
    else
        error((("Unknown item source: %*"):format(v3.item.source)));
        return ;
    end;
end;
