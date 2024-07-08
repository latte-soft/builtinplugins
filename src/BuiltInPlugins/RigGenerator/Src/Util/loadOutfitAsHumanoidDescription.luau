local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.clearPrebakedDescriptionAnimations);
local v2 = game:DefineFastFlag("RigBuilderBlockyScalesFix", false);
local v3 = Color3.new(0.5, 0.5, 0.5);
local function _(v4)
    v4.HeadColor = v3;
    v4.LeftArmColor = v3;
    v4.LeftLegColor = v3;
    v4.RightArmColor = v3;
    v4.RightLegColor = v3;
    v4.TorsoColor = v3;
end;
return function(v6)
    local v7 = nil;
    if not v2 then
        v7 = if v6 == 0 then Instance.new("HumanoidDescription") else l_Players_0:GetHumanoidDescriptionFromOutfitId(v6);
    elseif v6 == 0 then
        v7 = Instance.new("HumanoidDescription");
        v7.BodyTypeScale = 0;
        v7.ProportionScale = 0;
    else
        v7 = l_Players_0:GetHumanoidDescriptionFromOutfitId(v6);
    end;
    v1(v7);
    local l_v7_0 = v7;
    l_v7_0.HeadColor = v3;
    l_v7_0.LeftArmColor = v3;
    l_v7_0.LeftLegColor = v3;
    l_v7_0.RightArmColor = v3;
    l_v7_0.RightLegColor = v3;
    l_v7_0.TorsoColor = v3;
    return v7;
end;
