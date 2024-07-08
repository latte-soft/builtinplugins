local v0 = require(script:FindFirstAncestor("AvatarCompatibilityPreviewer").Packages.React);
local l_status_0, l_result_0 = pcall(function()
    return game:GetService("PlacesService");
end);
return (v0.createContext({
    startPlaySolo = function()
        if not l_status_0 then
            error("Calling startPlaySolo on unmocked PlacesService");
            return ;
        else
            l_result_0:StartPlaySolo();
            return ;
        end;
    end, 
    stopPlaySolo = function()
        if not l_status_0 then
            error("Calling stopPlaySolo on unmocked PlacesService");
            return ;
        else
            l_result_0:StopPlaySolo();
            return ;
        end;
    end
}));
