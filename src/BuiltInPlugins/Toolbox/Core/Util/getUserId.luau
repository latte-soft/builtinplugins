local l_StudioService_0 = game:GetService("StudioService");
local v1 = require(script.Parent.isCli);
return function()
    local v2 = 0;
    if not v1() then
        pcall(function()
            v2 = l_StudioService_0:GetUserId();
        end);
        return v2;
    else
        return 1;
    end;
end;
