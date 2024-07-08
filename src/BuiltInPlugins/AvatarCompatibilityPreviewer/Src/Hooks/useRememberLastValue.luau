local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.shallowEqual);
return function()
    local v3 = v1.useRef(nil);
    return v1.useCallback(function(v4)
        if not (v3.current ~= nil) or not v2(v3.current, v4) then
            v3.current = v4;
            return v4;
        else
            return v3.current;
        end;
    end, {});
end;
