local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Tooltip_0 = v4.UI.Tooltip;
local v6 = require(l_Parent_0.Core.Networking.Requests.MakeChangeRequest);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.Urls);
local v10 = require(l_Util_0.Images);
local v11 = require(l_Util_0.Colors);
local v12 = require(l_Util_0.AssetConfigConstants);
local v13 = require(l_Parent_0.Core.Components.InfiniteScrollingFrame);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v16 = v2.PureComponent:extend("OverrideAssetView");
v16.init = function(v17, v18)
    v17.state = {
        selectedAssetId = 0, 
        pageIndex = 1, 
        layoutContentSize = Vector2.new()
    };
    v17.newAssetInfo = {
        assetTypeEnum = v18.assetTypeEnum, 
        instances = v18.instances
    };
    v17.layouterRef = v2.createRef();
    v17.onLayoutContentSizeChange = function(v19)
        v17:setState({
            layoutContentSize = v19.AbsoluteContentSize
        });
    end;
    v17.onAssetActivated = function(v20)
        local l_Id_0 = v20.Asset.Id;
        if l_Id_0 == v17.state.selectedAssetId then
            return ;
        else
            v18.onOverrideAssetSelected(l_Id_0);
            v17.props.makeChangeRequest(v12.OVERRIDE_ASSET_ID, v17.state.selectedAssetId, l_Id_0);
            v17:setState({
                selectedAssetId = l_Id_0
            });
            return ;
        end;
    end;
    v17.requestOverrideAsset = function()
        v18.getOverrideAssets(v17.state.pageIndex);
        v17:setState({
            pageIndex = v17.state.pageIndex + 1
        });
    end;
    v17.DEPRECATED_requestOverrideAsset = function(v22)
        v18.getOverrideAssets(v22);
        if v17.state.pageIndex ~= v22 then
            v17:setState({
                pageIndex = v22
            });
        end;
    end;
end;
v16.createAssets = function(v23, v24, v25)
    local l_assetConfig_0 = v25.assetConfig;
    local v27 = {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, 1), 
            PaddingRight = UDim.new(0, 1), 
            PaddingTop = UDim.new(0, 12)
        }), 
        UIGridLayout = v2.createElement("UIGridLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            CellPadding = UDim2.new(0, 24, 0, 26), 
            CellSize = UDim2.new(0, 150, 0, 198), 
            FillDirectionMaxCells = 4, 
            StartCorner = Enum.StartCorner.TopLeft, 
            [v2.Ref] = v23.layouterRef, 
            [v2.Change.AbsoluteContentSize] = v23.onLayoutContentSizeChange
        })
    };
    local l_filterID_0 = v23.props.filterID;
    local l_selectedAssetId_0 = v23.state.selectedAssetId;
    for v30, v31 in pairs(v24) do
        local l_Id_1 = v31.Asset.Id;
        local v33 = v9.constructAssetThumbnailUrl(l_Id_1, v8.THUMBNAIL_SIZE_LARGE, v8.THUMBNAIL_SIZE_LARGE);
        local v34 = l_selectedAssetId_0 == l_Id_1;
        local _ = true;
        local v36 = true;
        if l_filterID_0 ~= "" then
            v36 = tostring(l_Id_1):find(l_filterID_0, 1, true);
        end;
        v27[l_Id_1] = v36 and v2.createElement("TextButton", {
            Size = v12.OverrideAssetItemSize, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            Text = "", 
            Font = v8.FONT, 
            TextSize = v8.FONT_SIZE_MEDIUM, 
            [v2.Event.Activated] = function(_)
                v23.onAssetActivated(v31);
            end, 
            LayoutOrder = v30
        }, {
            UIListLayout = v2.createElement("UIListLayout"), 
            Border = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, -48), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = v11.WHITE, 
                BorderSizePixel = 1, 
                BorderColor3 = not not v34 and v11.BLUE_PRIMARY or v11.GRAY_3, 
                LayoutOrder = 1
            }, {
                ThumbNail = v2.createElement("ImageLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BorderSizePixel = 1, 
                    BackgroundTransparency = 1, 
                    Image = v33
                }), 
                CheckedIcon = v34 and v2.createElement("ImageLabel", {
                    Position = UDim2.new(0, 4, 0, 4), 
                    Size = UDim2.new(0, 28, 0, 28), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = v10.SELECTED_CHECK, 
                    ImageColor3 = v11.BLUE_PRIMARY
                }), 
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = v31.Asset.Name
                }) or nil
            }), 
            Title = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 48), 
                Text = v31.Asset.Name, 
                Font = v8.FONT, 
                TextColor3 = l_assetConfig_0.textColor, 
                TextSize = v8.FONT_SIZE_MEDIUM, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                BorderSizePixel = 0, 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = v31.Asset.Name
                }) or nil
            })
        });
    end;
    return v27;
end;
v16.render = function(v38)
    local l_props_0 = v38.props;
    local _ = v38.state;
    local l_Stylizer_0 = v38.props.Stylizer;
    return v2.createElement(v13, {
        Size = l_props_0.Size, 
        BackgroundColor3 = l_Stylizer_0.publishAsset.backgroundColor, 
        layouterRef = v38.layouterRef, 
        nextPageFunc = v38.DEPRECATED_requestOverrideAsset, 
        LayoutOrder = l_props_0.LayoutOrder
    }, (v38:createAssets(l_props_0.resultsArray or {}, l_Stylizer_0)));
end;
return v3.connect(nil, function(v42)
    return {
        makeChangeRequest = function(v43, v44, v45)
            v42(v6(v43, v44, v45));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v16)));
