local v0 = require(script.Parent.Parent.Parent.Src.Util.ReviewStatus);
return {
    isApprovedAsset = function(v1)
        if not v1.isModerated then
            local v2 = true;
            if v1.reviewStatus ~= v0.Finished then
                v2 = v1.reviewStatus == v0.DoesNotRequire;
            end;
            return v2;
        else
            return false;
        end;
    end, 
    getModerationTooltip = function(v3, v4)
        if v4.reviewStatus == v0.Pending then
            return v3:getText("AssetItem", "PendingModerationTooltip");
        elseif not v4.isModerated then
            return ;
        else
            return v3:getText("AssetItem", "FailedModerationTooltip");
        end;
    end
};
