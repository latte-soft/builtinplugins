local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.DraggerSchemaTemplate.DraggerSchema);
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.getHoveringPair);
return function(v4, v5, v6)
    local v7 = v3(v4);
    if v7 ~= nil then
        v4.selection:Set(v7);
    end;
    return v1.dispatchWorldClick(v4, v5, v6);
end;
