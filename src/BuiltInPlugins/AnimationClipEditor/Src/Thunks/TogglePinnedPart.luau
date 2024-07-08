local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetPinnedParts);
return function(v3)
    return function(v4)
        local v5 = v1.Dictionary.join(v4:getState().Status.PinnedParts);
        if v5[v3] ~= nil then
            v5[v3] = not v5[v3];
        else
            v5[v3] = true;
        end;
        v4:dispatch(v2(v5));
    end;
end;
