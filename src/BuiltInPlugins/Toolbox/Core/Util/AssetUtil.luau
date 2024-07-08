local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v2 = require(l_script_FirstAncestor_0.Core.Util.Constants);
return {
    getAssetSize = function(v3)
        local _ = nil;
        if not v1.shouldShowPrices(v3) then
            return (UDim2.new(0, v2.ASSET_WIDTH_NO_PADDING, 0, v2.ASSET_HEIGHT));
        else
            return (UDim2.new(0, v2.ASSET_WIDTH_NO_PADDING, 0, v2.ASSET_HEIGHT + v2.PRICE_HEIGHT));
        end;
    end
};
