local l_Players_0 = game:GetService("Players");
local l_StudioService_0 = game:GetService("StudioService");
local v2 = require(script.Parent.Parent.Parent.Src.Util.clearPrebakedDescriptionAnimations);
return function(_)
    local l_l_Players_0_HumanoidDescriptionFromUserId_0 = l_Players_0:GetHumanoidDescriptionFromUserId((l_StudioService_0:GetUserId()));
    v2(l_l_Players_0_HumanoidDescriptionFromUserId_0);
    return l_l_Players_0_HumanoidDescriptionFromUserId_0;
end;
