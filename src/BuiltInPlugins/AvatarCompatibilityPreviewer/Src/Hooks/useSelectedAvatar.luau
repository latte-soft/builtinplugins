local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.isAvatar);
local v2 = require(l_script_FirstAncestor_0.Src.Hooks.useTransformedSelectedInstance);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function()
    return v2(function(v4)
        if v1(v4) then
            return {
                WorldModel = v4
            };
        else
            return nil;
        end;
    end);
end;
