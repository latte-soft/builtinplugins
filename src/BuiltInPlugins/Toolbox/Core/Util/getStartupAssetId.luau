local l_StudioService_0 = game:GetService("StudioService");
local v1 = require(script.Parent.isCli);
return function()
    if not v1() then
        return l_StudioService_0:getStartupAssetId();
    else
        return "";
    end;
end;
