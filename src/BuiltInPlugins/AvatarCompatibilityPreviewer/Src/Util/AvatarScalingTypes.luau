local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = {};
local function _(v4)
    return v4;
end;
v3.types = {
    Classic = {
        BodyTypeScale = 0, 
        BodyProportionScale = 0, 
        GuessMaxHeight = 5.25
    }, 
    ProportionsSlender = {
        BodyTypeScale = 1, 
        BodyProportionScale = 1, 
        GuessMaxHeight = 5.625
    }, 
    ProportionsNormal = {
        BodyTypeScale = 1, 
        BodyProportionScale = 0, 
        GuessMaxHeight = math.huge
    }
};
v3.allAvatarPartScaleTypeValueObjects = function(v6)
    local v7 = {};
    for _, v9 in v1.LIMBS, nil, nil do
        local l_v6_FirstChild_0 = v6:FindFirstChild(v9);
        assert(l_v6_FirstChild_0 ~= nil, "Avatar must have all limbs");
        local l_AvatarPartScaleType_0 = l_v6_FirstChild_0:FindFirstChild("AvatarPartScaleType");
        if not (not (l_AvatarPartScaleType_0 ~= nil) or not l_AvatarPartScaleType_0:IsA("StringValue")) then
            local v12 = false;
            if l_AvatarPartScaleType_0 ~= nil then
                v12 = l_AvatarPartScaleType_0:IsA("StringValue");
            end;
            assert(v12, v1.LUAU_ANALYZE_ERROR);
            table.insert(v7, l_AvatarPartScaleType_0);
        end;
    end;
    return v7;
end;
v3.setAvatarPartScaleTypeValueObjects = function(v13, v14)
    for _, v16 in v1.LIMBS, nil, nil do
        local l_v13_FirstChild_0 = v13:FindFirstChild(v16);
        assert(l_v13_FirstChild_0 ~= nil, "Avatar must have all limbs");
        local l_AvatarPartScaleType_1 = l_v13_FirstChild_0:FindFirstChild("AvatarPartScaleType");
        if l_AvatarPartScaleType_1 == nil then
            local l_StringValue_0 = Instance.new("StringValue");
            l_StringValue_0.Name = "AvatarPartScaleType";
            l_StringValue_0.Value = v14;
            l_StringValue_0.Parent = l_v13_FirstChild_0;
        elseif l_AvatarPartScaleType_1:IsA("StringValue") then
            local v20 = false;
            if l_AvatarPartScaleType_1 ~= nil then
                v20 = l_AvatarPartScaleType_1:IsA("StringValue");
            end;
            assert(v20, v1.LUAU_ANALYZE_ERROR);
            l_AvatarPartScaleType_1.Value = v14;
        end;
    end;
end;
return v3;
