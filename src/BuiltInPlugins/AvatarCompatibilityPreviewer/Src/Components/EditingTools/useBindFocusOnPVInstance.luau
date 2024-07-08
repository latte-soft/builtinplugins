local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_DraggerFramework_0.Utility.BoundingBox);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function(v6)
    v3.useEffect(function()
        local v9 = l_Selection_0:AddFocusCallback(v5.FOCUS_CALLBACK_PRIORITIES.Dummy, function()
            local v7, v8 = v4.fromObjects({
                v6
            });
            return v7 - v8 * 0.5, v7 + v8 * 0.5;
        end);
        return function()
            v9:Disconnect();
        end;
    end, {
        v6
    });
end;
