local l_StudioService_0 = game:GetService("StudioService");
local l_Players_0 = game:GetService("Players");
local v2 = require(script.Parent.isCli);
return function()
    local v3 = "";
    if not v2() then
        pcall(function()
            v3 = l_Players_0:GetNameFromUserIdAsync((l_StudioService_0:GetUserId()));
        end);
        return v3;
    else
        return 1;
    end;
end;
