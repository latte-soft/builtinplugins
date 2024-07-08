local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Hooks.usePluginAction);
return function(v4, v5)
    v2.useEffect(function()
        l_ChangeHistoryService_0:SetEnabled(false);
        return function()
            l_ChangeHistoryService_0:SetEnabled(true);
        end;
    end, {});
    v3("Undo", v4);
    v3("Redo", v5);
end;
