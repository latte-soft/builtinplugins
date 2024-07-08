local _ = require(script:FindFirstAncestor("AttenuationCurveEditor").Src.Types);
return {
    setDistanceAttenuation = function(v1, v2)
        v1:SetDistanceAttenuation(v2);
    end, 
    getDistanceAttenuation = function(v3)
        return v3:GetDistanceAttenuation();
    end
};
