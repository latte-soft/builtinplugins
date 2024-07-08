local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v4)
    if table.find(v1.clothing, v4.palette) ~= nil then
        return true;
    elseif v4.item.source ~= v2.SOURCE_INSTANCE then
        return false;
    else
        assert(v4.item.source == v2.SOURCE_INSTANCE, v2.LUAU_ANALYZE_ERROR);
        return v4.item.instance:FindFirstChildWhichIsA("WrapLayer", true) ~= nil;
    end;
end;
