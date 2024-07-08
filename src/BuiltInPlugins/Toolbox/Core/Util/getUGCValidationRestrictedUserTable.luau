local l_StudioService_0 = game:GetService("StudioService");
local _ = require(script.Parent.Parent.Parent.Core.Types.UGCValidationTypes);
return function()
    return {
        {
            creatorType = "User", 
            id = l_StudioService_0:GetUserId()
        }
    };
end;
