local v0 = require(script:FindFirstAncestor("Toolbox").Core.Util.AssetConfigConstants);
return function(v1)
    return {
        [v0.ASSET_STATUS.ReviewPending] = v1:getText("General", "StatusReviewPending"), 
        [v0.ASSET_STATUS.Moderated] = v1:getText("General", "StatusModerated"), 
        [v0.ASSET_STATUS.ReviewApproved] = v1:getText("General", "StatusReviewApproved"), 
        [v0.ASSET_STATUS.OnSale] = v1:getText("General", "StatusOnSale"), 
        [v0.ASSET_STATUS.OffSale] = v1:getText("General", "StatusOffSale"), 
        [v0.ASSET_STATUS.DelayedRelease] = v1:getText("General", "StatusDelayedRelease"), 
        [v0.ASSET_STATUS.Free] = v1:getText("General", "Free")
    };
end;
