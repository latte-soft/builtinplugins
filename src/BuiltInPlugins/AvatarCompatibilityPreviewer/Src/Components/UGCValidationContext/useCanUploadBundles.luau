local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.useAssertNeverChanges);
return function(v4)
    v3(v4);
    local v5, v6 = v1.useState(nil);
    local v7 = v1.useRef(false);
    return v5, (v1.useCallback(function()
        if not v7.current then
            v7.current = true;
            task.spawn(function()
                v6(v4());
            end);
            return ;
        else
            return ;
        end;
    end, {}));
end;
