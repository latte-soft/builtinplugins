local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Core.Util.Constants);
local v3 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v5 = {
    getAssetsPerRow = function(v4)
        return (math.floor((v4 + v2.BETWEEN_ASSETS_HORIZONTAL_PADDING) / (v2.ASSET_WIDTH_NO_PADDING + v2.BETWEEN_ASSETS_HORIZONTAL_PADDING)));
    end
};
v5.getSwimlaneWidth = function(v6)
    return v5.getAssetsPerRow((v6 - 2 * v2.MAIN_VIEW_PADDING) - v2.SCROLLBAR_PADDING) * (v2.ASSET_WIDTH_NO_PADDING + v2.BETWEEN_ASSETS_HORIZONTAL_PADDING) - v2.BETWEEN_ASSETS_HORIZONTAL_PADDING;
end;
v5.getAssetCellHeightWithPadding = function(v7)
    local l_ASSET_HEIGHT_0 = v2.ASSET_HEIGHT;
    if v7 then
        l_ASSET_HEIGHT_0 = l_ASSET_HEIGHT_0 + v2.PRICE_HEIGHT;
    end;
    return l_ASSET_HEIGHT_0 + v2.BETWEEN_ASSETS_VERTICAL_PADDING;
end;
v5.calculateAssetsHeight = function(v9, v10, v11)
    if not (v9 ~= 0) or v10 == 0 then
        return 0;
    else
        local v12 = v5.getAssetsPerRow(v10);
        if v12 == 0 then
            return 0;
        else
            return (v5.getAssetCellHeightWithPadding(v11) * math.ceil(v9 / v12) - v2.BETWEEN_ASSETS_VERTICAL_PADDING) + v2.ASSET_VOTING_HEIGHT;
        end;
    end;
end;
v5.sliceAssetsFromBounds = function(v13, v14, v15)
    local v16 = {};
    v14 = v14 or 1;
    v15 = math.min(v15 or #v13, #v13);
    if v14 > 0 and v14 <= v15 then
        for v17 = v14, v15 do
            v16[#v16 + 1] = {
                v13[v17], 
                v17
            };
        end;
    end;
    return v16;
end;
v5.calculateRenderBoundsForScrollingFrame = function(v18, v19, v20, v21)
    if v18 then
        local v22 = v5.getAssetsPerRow(v19);
        local v23 = v5.getAssetCellHeightWithPadding(v21);
        local v24 = v18.CanvasPosition.Y - v20;
        local l_Y_0 = v18.AbsoluteSize.Y;
        local l_SCROLLING_FRAME_VIEW_PADDING_0 = v2.SCROLLING_FRAME_VIEW_PADDING;
        v24 = v24 - l_SCROLLING_FRAME_VIEW_PADDING_0;
        l_Y_0 = l_Y_0 + 2 * l_SCROLLING_FRAME_VIEW_PADDING_0;
        local v27 = math.max(math.floor(v24 / v23), 0);
        return v27 * v22 + 1, ((v27 + math.ceil(l_Y_0 / v23)) + 1) * v22;
    else
        return 0, 0;
    end;
end;
v5.calculateMainViewHeaderHeight = function(v28, _, _, _, v32, v33)
    local v34 = 0;
    local v35 = 0;
    if not v3() then
        if v28 then
            v35 = v2.MAIN_VIEW_VERTICAL_PADDING;
            v34 = v34 + v2.SEARCH_TERMS_HEIGHT;
        end;
        return math.max(v34, v2.MAIN_VIEW_NO_HEADER_HEIGHT), v35;
    else
        if not (not v32 and not v28) then
            v34 = v34 + v2.SEARCH_TERMS_HEIGHT;
        end;
        if not (not v28 or not v33) then
            v34 = v34 + v2.MAIN_VIEW_VERTICAL_PADDING;
            v35 = v2.MAIN_VIEW_VERTICAL_PADDING;
        end;
        return math.max(v34, v2.MAIN_VIEW_NO_HEADER_HEIGHT), v35;
    end;
end;
return v5;
