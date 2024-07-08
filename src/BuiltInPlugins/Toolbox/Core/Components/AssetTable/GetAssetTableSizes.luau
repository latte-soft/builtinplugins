local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v3 = not v2() and 0 or v1.ASSET_ROW.ICON_SIZE + ((not v2() and 0 or v1.ITEM_ROW.LEFT_RIGHT_PADDING) + v1.ASSET_ROW.LEFT_MOST_PADDING);
return function(v4)
    local l_ASSET_ROW_COLUMNS_0 = v1.ASSET_ROW_COLUMNS;
    local v6 = {
        [l_ASSET_ROW_COLUMNS_0.ICON] = UDim2.new(0, v3, 1, 0), 
        [l_ASSET_ROW_COLUMNS_0.NAME] = UDim2.new(0.4, -v3, 1, 0), 
        [l_ASSET_ROW_COLUMNS_0.CREATOR] = UDim2.new(0.2, 0, 1, 0), 
        [l_ASSET_ROW_COLUMNS_0.DATE_UPDATED] = UDim2.new(0.2, 0, 1, 0), 
        [l_ASSET_ROW_COLUMNS_0.DATE_CREATED] = UDim2.new(0.2, 0, 1, 0)
    };
    if v4 < 360 then
        v6[l_ASSET_ROW_COLUMNS_0.NAME] = UDim2.new(0.4, -v3, 1, 0);
        v6[l_ASSET_ROW_COLUMNS_0.CREATOR] = UDim2.new(0.3, 0, 1, 0);
        v6[l_ASSET_ROW_COLUMNS_0.DATE_UPDATED] = UDim2.new(0.3, 0, 1, 0);
        v6[l_ASSET_ROW_COLUMNS_0.DATE_CREATED] = nil;
    end;
    return v6, 360;
end;
