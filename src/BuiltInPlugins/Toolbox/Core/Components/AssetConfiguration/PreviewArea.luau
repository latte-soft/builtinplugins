local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v6 = require(l_AssetConfiguration_0.SideTabs);
local v7 = require(l_AssetConfiguration_0.AssetThumbnailPreview);
local v8 = require(l_AssetConfiguration_0.ImagePicker);
local l_Util_0 = l_Parent_0.Core.Util;
local v10 = require(l_Util_0.LayoutOrderIterator);
local v11 = require(l_Util_0.Constants);
local v12 = require(l_Util_0.Urls);
local v13 = require(l_Util_0.AssetConfigConstants);
local v14 = require(l_Parent_0.Core.Localization.getLocalizedAssetStatusMap);
local v15 = require(l_Parent_0.Core.Components.ImageWithDefault);
local v16 = require(l_Parent_0.Core.Networking.Requests.GetAssetConfigThumbnailStatusRequest);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v19 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v20 = v2.PureComponent:extend("PreviewArea");
local l_UseDefaultThumbnailForAnimation_0 = game:GetFastFlag("UseDefaultThumbnailForAnimation");
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 = v11.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE;
v20.init = function(v24, _)
    v24.baseFrameRef = v2.createRef();
    v24.layouterRef = v2.createRef();
end;
v20.didMount = function(v26)
    local l_props_0 = v26.props;
    if l_props_0.ScreenFlowType == v13.FLOW_TYPE.EDIT_FLOW and l_props_0.PreviewType == v13.PreviewTypes.ImagePicker then
        l_props_0.getThumbnailStatus(l_props_0.Network.networkInterface, l_props_0.AssetId);
    end;
end;
v20.render = function(v28)
    local l_props_1 = v28.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Localization_0 = l_props_1.Localization;
    local l_TabItems_0 = l_props_1.TabItems;
    local l_CurrentTab_0 = l_props_1.CurrentTab;
    local l_AssetStatus_0 = l_props_1.AssetStatus;
    local l_AssetId_0 = l_props_1.AssetId;
    local l_AssetTypeEnum_0 = l_props_1.AssetTypeEnum;
    local l_TotalWidth_0 = l_props_1.TotalWidth;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_OnTabSelect_0 = l_props_1.OnTabSelect;
    local l_ChooseThumbnail_0 = l_props_1.ChooseThumbnail;
    local l_IconFile_0 = l_props_1.IconFile;
    local l_PreviewType_0 = l_props_1.PreviewType;
    local l_thumbnailStatus_0 = l_props_1.thumbnailStatus;
    local v44 = if not l_EnableUGCBundleUnknownMeshPartFiltering_0 then nil else l_props_1.AllowedBundleTypeSettings;
    local v45;
    if not (not l_OnTabSelect_0 or not l_TabItems_0) then
        v45 = true;
        if not (#l_TabItems_0 <= 1) then
            goto label0;
        end;
    end;
    v45 = false;
    ::label0::;
    local l_previewArea_0 = l_Stylizer_0.previewArea;
    local v47 = nil;
    if l_AssetId_0 and l_PreviewType_0 == v13.PreviewTypes.Thumbnail then
        v47 = v12.constructAssetThumbnailUrl(l_AssetId_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0);
    end;
    local v48 = l_Localization_0:getText("AssetConfigPreview", "MaxSize", {
        maxDimensionsX = tostring(512), 
        maxDimensionsY = tostring(512)
    });
    local v49 = v10.new();
    local l_l_UseDefaultThumbnailForAnimation_0_0 = l_UseDefaultThumbnailForAnimation_0;
    if l_l_UseDefaultThumbnailForAnimation_0_0 then
        l_l_UseDefaultThumbnailForAnimation_0_0 = false;
        if l_AssetTypeEnum_0 == Enum.AssetType.Animation then
            l_l_UseDefaultThumbnailForAnimation_0_0 = not v47;
        end;
    end;
    local l_createElement_0 = v2.createElement;
    local v52 = "Frame";
    local v53 = {
        Size = UDim2.new(0, l_TotalWidth_0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_previewArea_0.backgroundColor, 
        BorderSizePixel = 0, 
        [v2.Ref] = v28.baseFrameRef, 
        LayoutOrder = l_LayoutOrder_0
    };
    local v54 = {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20), 
            [v2.Ref] = v28.layouterRef
        })
    };
    local v55 = false;
    if l_PreviewType_0 == v13.PreviewTypes.ImagePicker then
        v55 = v2.createElement(v8, {
            Size = UDim2.new(0, 150, 0, 150), 
            AssetId = l_AssetId_0, 
            ThumbnailStatus = l_thumbnailStatus_0, 
            ChooseThumbnail = l_ChooseThumbnail_0, 
            IconFile = l_IconFile_0, 
            LayoutOrder = v49:getNextOrder()
        });
    end;
    v54.ImagePicker = v55;
    v55 = false;
    if l_PreviewType_0 == v13.PreviewTypes.Thumbnail then
        v55 = v2.createElement(v15, {
            Size = UDim2.new(0, 150, 0, 150), 
            BackgroundTransparency = 1, 
            LayoutOrder = v49:getNextOrder(), 
            Image = if not l_l_UseDefaultThumbnailForAnimation_0_0 then v47 else "rbxasset://textures/StudioToolbox/Animation.png", 
            defaultImage = ""
        });
    end;
    v54.Thumbnail = v55;
    v55 = false;
    if l_PreviewType_0 == v13.PreviewTypes.ModelPreview then
        v55 = v2.createElement(v7, {
            Size = UDim2.new(0, 150, 0, 150), 
            ShowTitle = false, 
            LayoutOrder = v49:getNextOrder(), 
            AssetType = if not l_EnableUGCBundleUnknownMeshPartFiltering_0 then nil else l_AssetTypeEnum_0, 
            AllowedBundleTypeSettings = if not l_EnableUGCBundleUnknownMeshPartFiltering_0 then nil else v44
        });
    end;
    v54.AssetThumbnailPreview = v55;
    v55 = false;
    if l_PreviewType_0 ~= v13.PreviewTypes.ImagePicker then
        v55 = v2.createElement;
        local v56 = "Frame";
        local v57 = {
            Size = UDim2.new(1, 0, 0, 50), 
            BackgroundTransparency = 1, 
            LayoutOrder = v49:getNextOrder()
        };
        local v58 = {};
        local v59 = false;
        if l_AssetId_0 ~= nil then
            v59 = v2.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 25), 
                BackgroundTransparency = 1, 
                TextColor3 = l_previewArea_0.selectedColor, 
                Text = l_Localization_0:getText("General", "PreviewAreaAssetID", {
                    assetId = tostring(l_AssetId_0)
                }), 
                Font = v11.FONT, 
                TextSize = v11.FONT_SIZE_MEDIUM, 
                TextWrapped = false, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            });
        end;
        v58.AssetIdLabel = v59;
        v59 = false;
        if l_AssetStatus_0 ~= nil then
            v59 = false;
            if v13.ASSET_STATUS.Unknown ~= l_AssetStatus_0 then
                v59 = v2.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 0, 25), 
                    Position = UDim2.new(0, 0, 0, 25), 
                    BackgroundTransparency = 1, 
                    TextColor3 = l_previewArea_0.textColor, 
                    Text = l_Localization_0:getText("General", "PreviewAreaStatus", {
                        assetStatus = v14(l_Localization_0)[l_AssetStatus_0]
                    }), 
                    Font = v11.FONT, 
                    TextSize = v11.FONT_SIZE_MEDIUM, 
                    TextWrapped = false, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Top
                });
            end;
        end;
        v58.AssetStatusLabel = v59;
        v55 = v55(v56, v57, v58);
    end;
    v54.AssetInfo = v55;
    v55 = false;
    if l_PreviewType_0 == v13.PreviewTypes.ImagePicker then
        v55 = v2.createElement("Frame", {
            Size = UDim2.new(0, 192, 0, 120), 
            BackgroundTransparency = 1, 
            LayoutOrder = v49:getNextOrder()
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            Container = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 54), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                FormatLabel = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 176, 0, 54), 
                    Position = UDim2.new(0, 10, 0, 0), 
                    BackgroundTransparency = 1, 
                    Text = v48, 
                    Font = v11.FONT, 
                    TextSize = v11.FONT_SIZE_MEDIUM, 
                    TextColor3 = l_previewArea_0.textColor, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            }), 
            Container2 = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 54), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                ProcessLabel = v2.createElement("TextLabel", {
                    Size = UDim2.new(0, 176, 0, 54), 
                    Position = UDim2.new(0, 10, 0, 0), 
                    BackgroundTransparency = 1, 
                    Text = l_Localization_0:getText("AssetConfigPreview", "Process"), 
                    Font = v11.FONT, 
                    TextSize = v11.FONT_SIZE_MEDIUM, 
                    TextColor3 = l_previewArea_0.textColor, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 2
                })
            })
        });
    end;
    v54.Guide = v55;
    v54.TabArea = v45 and v2.createElement("Frame", {
        Size = UDim2.new(1, 10, 1, -200), 
        BackgroundTransparency = 1, 
        LayoutOrder = v49:getNextOrder()
    }, {
        SideTabs = v45 and v2.createElement(v6, {
            Size = UDim2.new(1, 0, 1, 0), 
            ItemHeight = 48, 
            Items = l_TabItems_0, 
            CurrentTab = l_CurrentTab_0, 
            ItemClickCallBack = l_OnTabSelect_0, 
            SelectParentRef = v28.baseFrameRef
        })
    });
    return l_createElement_0(v52, v53, v54);
end;
return v3.connect(function(v60, _)
    return {
        thumbnailStatus = (v60 or {}).thumbnailStatus
    };
end, function(v62)
    return {
        getThumbnailStatus = function(v63, v64)
            v62(v16(v63, v64));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v19
})(v20)));
