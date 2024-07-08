local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.DraggerFramework.Utility.BoundingBox);
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.getBoundingBox);
local v4 = {};
v4.__index = v4;
v4.new = function(v5)
    return (setmetatable({
        _draggerContext = v5
    }, v4));
end;
v4.isEmpty = function(_)
    return false;
end;
v4.getBoundingBox = function(v7)
    if #v7._draggerContext.selectedPoints == 0 then
        local l_Pivot_0 = v7._draggerContext.worldModel:GetPivot();
        return l_Pivot_0, v1.fromObjects({
            v7._draggerContext.worldModel
        }, l_Pivot_0);
    else
        return v3(v7._draggerContext);
    end;
end;
v4.getLocalBoundingBox = function(_)
    error("getLocalBoundingBox is not supported");
end;
v4.doesContainItem = function(v10, v11)
    return table.find(v10._selection, v11) ~= nil;
end;
v4.isDynamic = function(_)
    return false;
end;
return v4;
