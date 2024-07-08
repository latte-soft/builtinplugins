local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.React);
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("StudioAssetService");
end);
return (v0.createContext({
    showSaveToRoblox = function(...)
        if not l_status_0 then
            error("Calling showSaveToRoblox on unmocked StudioAssetService");
            return ;
        else
            l_result_0:ShowSaveToRoblox(...);
            return ;
        end;
    end, 
    onUGCSubmitCompleted = if not l_status_0 then nil else l_result_0.OnUGCSubmitCompleted
}));
