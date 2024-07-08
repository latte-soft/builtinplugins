local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local l_Packages_0 = l_Parent_0.Packages;
local v4 = require(l_Packages_0.Framework);
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local l_ToolboxVideoConfigSharing2_0 = game:GetFastFlag("ToolboxVideoConfigSharing2");
local _ = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableFiatFully);
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local v11 = game:DefineFastFlag("ToolboxDeleteForAnimationsOnly", false);
local v12 = require(l_Packages_0.Roact);
local v13 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local _ = l_UI_0.MultiImagePickerWrapper;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local _ = l_UI_0.BulletList;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local v24 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local l_map_0 = require(l_Packages_0.Dash).map;
local v26 = require(l_Util_0.createAssetMediaMetadata);
local v27 = require(l_Util_0.LayoutOrderIterator);
local v28 = require(l_Util_0.AssetConfigConstants);
local v29 = require(l_Util_0.AssetConfigUtil);
local v30 = require(l_Util_0.Constants);
local v31 = require(l_Parent_0.Core.Util.Images);
local v32 = require(l_Parent_0.Core.Localization.getLocalizedAssetTextMap);
local v33 = require(l_Util_0.ToolboxUtilities);
local _ = require(l_Util_0.FiatTempConstants);
local v35 = require(l_Util_0.Urls);
local l_AssetConfiguration_0 = l_Parent_0.Core.Components.AssetConfiguration;
local v37 = require(l_AssetConfiguration_0.ConfigTextField);
local v38 = require(l_AssetConfiguration_0.ConfigAccess);
local v39 = require(l_AssetConfiguration_0.ConfigDeleteLocal);
local v40 = require(l_AssetConfiguration_0.ConfigGenre);
local _ = require(l_AssetConfiguration_0.ConfigCopy);
local v42 = require(l_AssetConfiguration_0.ConfigPackage);
local v43 = require(l_AssetConfiguration_0.ConfigAssetType);
local v44 = require(l_AssetConfiguration_0.ConfigComment);
local v45 = require(l_AssetConfiguration_0.ConfigSharing);
local _ = require(l_AssetConfiguration_0.ConfigSectionWrapper);
local v47 = require(l_AssetConfiguration_0.CatalogTags.TagsComponent);
local v48 = require(l_AssetConfiguration_0.Header);
local _ = require(l_AssetConfiguration_0.PriceComponent);
local _ = require(l_AssetConfiguration_0.FiatPriceComponent);
local _ = require(l_Parent_0.Core.Types.MarketplaceFiatServiceTypes);
local _ = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadingDataSharing);
local v53 = require(l_Parent_0.Core.Actions.SetFieldError);
local _ = require(l_Parent_0.Core.Util.PageInfoHelper);
local v55 = v12.PureComponent:extend("PublishAsset");
v55.init = function(v56, v57)
    v56.state = {
        maxDropdownPosition = 0
    };
    v56.baseFrameRef = v12.createRef();
    v56.listLayoutRef = v12.createRef();
    v56.tagsRef = v12.createRef();
    v56.genreRef = v12.createRef();
    v56.onClickConfigurePriceUrl = function()
        l_GuiService_0:OpenBrowserWindow(v33.getMarketplaceAssetConfigUrl(v56.props.assetId));
    end;
    if v10() then
        v56.onClickOnboardLink = function()
            l_GuiService_0:OpenBrowserWindow(v33.getMarketplaceOnboardingUrl());
        end;
    end;
    v56.refreshCanvas = function()
        if not (not v56.baseFrameRef.current or not v56.listLayoutRef.current) then
            v56.baseFrameRef.current.CanvasSize = UDim2.new(v57.Size.X.Scale, v57.Size.X.Offset, 0, (math.max(v56.listLayoutRef.current.AbsoluteContentSize.y + 48, v56.state.maxDropdownPosition)));
        end;
    end;
    v56.updateMaxDropdownPosition = function(v58, v59)
        if v58.current and v59 > 0 then
            local v60 = ((v58.current.AbsolutePosition.Y + v56.baseFrameRef.current.CanvasPosition.Y) + -v56.baseFrameRef.current.AbsolutePosition.Y) - 24;
            local v61 = (((v60 + 24) + v58.current.AbsoluteSize.Y) + v59) + 24;
            spawn(function()
                if v56.state.maxDropdownPosition < v61 then
                    v56:setState({
                        maxDropdownPosition = v61
                    });
                    v56.refreshCanvas();
                end;
                v56:bumpCanvas(v60, v61);
            end);
        end;
    end;
end;
v55.bumpCanvas = function(v62, v63, v64)
    if v62.baseFrameRef.current then
        local l_current_0 = v62.baseFrameRef.current;
        local l_Y_0 = l_current_0.CanvasPosition.Y;
        local l_Y_1 = l_current_0.AbsoluteSize.Y;
        if v63 < l_Y_0 then
            l_current_0.CanvasPosition = Vector2.new(0, (math.max(0, v63)));
            return ;
        elseif l_Y_0 + l_Y_1 < v64 then
            l_current_0.CanvasPosition = Vector2.new(0, (math.max(0, v64 - l_Y_1)));
        end;
    end;
end;
v55.render = function(v68)
    local l_Stylizer_0 = v68.props.Stylizer;
    local l_props_0 = v68.props;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_allowCopy_0 = l_props_0.allowCopy;
    local l_allowSelectPrivate_0 = l_props_0.allowSelectPrivate;
    local l_name_0 = l_props_0.name;
    local l_description_0 = l_props_0.description;
    local l_tags_0 = l_props_0.tags;
    local l_owner_0 = l_props_0.owner;
    local l_genres_0 = l_props_0.genres;
    local l_copyOn_0 = l_props_0.copyOn;
    local l_allowComment_0 = l_props_0.allowComment;
    local l_commentOn_0 = l_props_0.commentOn;
    local l_deleteLocal_0 = l_props_0.deleteLocal;
    local v84 = if not l_UnifyModelPackagePublish3_0 then nil else l_props_0.allowPackage;
    local v85 = if not l_UnifyModelPackagePublish3_0 then nil else l_props_0.packageOn;
    local v86 = if not l_UnifyModelPackagePublish3_0 then nil else l_props_0.packageWarningText;
    local l_assetTypeEnum_0 = l_props_0.assetTypeEnum;
    local l_isAssetPublic_0 = l_props_0.isAssetPublic;
    local _ = v28.additionalImages.MaxThumbnails;
    local v90 = l_assetTypeEnum_0 == Enum.AssetType.Audio;
    local v91 = l_assetTypeEnum_0 == Enum.AssetType.Video;
    local v92 = l_assetTypeEnum_0 == Enum.AssetType.Model;
    local v93 = l_assetTypeEnum_0 == Enum.AssetType.Plugin;
    local v94 = l_assetTypeEnum_0 == Enum.AssetType.Animation;
    local _ = if not l_UnifyModelPackagePublish3_0 then nil else l_props_0.isPackageAsset;
    local v96 = v29.isCreatorStoreAssetNotIncludingAnimation(l_assetTypeEnum_0);
    local v97 = if typeof(l_props_0.assetId) == "number" then v35.constructCreatorStoreConfigurationUrl(l_props_0.assetId) else v33.getCreatorDashboardBaseUrl();
    local l_onNameChange_0 = l_props_0.onNameChange;
    local l_onDescChange_0 = l_props_0.onDescChange;
    local l_onTagsChange_0 = l_props_0.onTagsChange;
    local l_onOwnerSelected_0 = l_props_0.onOwnerSelected;
    local l_onCategoryChange_0 = l_props_0.onCategoryChange;
    local l_onGenreSelected_0 = l_props_0.onGenreSelected;
    local l_onSharingChanged_0 = l_props_0.onSharingChanged;
    local _ = l_props_0.toggleCopy;
    local l_toggleComment_0 = l_props_0.toggleComment;
    local v107 = if not l_UnifyModelPackagePublish3_0 then nil else l_props_0.togglePackage;
    local l_toggleDeleteLocal_0 = l_props_0.toggleDeleteLocal;
    local v109 = if not v6() then nil else l_props_0.canUploadWithUgcRestrictions;
    local v110 = if not v6() then nil else l_props_0.canUploadWithUgcRestrictionsDenyReason;
    local l_publishingRequirements_0 = l_props_0.publishingRequirements;
    local v112 = if not v9() then nil else l_props_0.publishingRestriction;
    local v113 = if not l_publishingRequirements_0 then nil else l_publishingRequirements_0.verification;
    local _ = not not v113 and if v113.supportedTypes then #v113.supportedTypes ~= 0 else false;
    local _ = (v113 and v113.isVerified) and v93;
    local l_displayOwnership_0 = l_props_0.displayOwnership;
    local l_displayGenre_0 = l_props_0.displayGenre;
    local _ = l_props_0.displayCopy;
    local v119 = if not l_UnifyModelPackagePublish3_0 then nil else l_props_0.displayPackage;
    local l_displayComment_0 = l_props_0.displayComment;
    local v121 = if not v93 then l_props_0.displayAssetType else false;
    local l_displayTags_0 = l_props_0.displayTags;
    local l_displaySharing_0 = l_props_0.displaySharing;
    local l_displayAssetTypeSelection_0 = l_props_0.displayAssetTypeSelection;
    local _ = if not v93 then nil else l_props_0.allowedAssetTypesForRelease;
    local _ = l_props_0.allowedAssetTypesForFree;
    local v127 = if not v93 then nil else l_props_0.newAssetStatus;
    local _ = if not v93 then nil else l_props_0.currentAssetStatus;
    local _ = if not v93 then nil else l_props_0.onStatusChange;
    local _ = if not v93 then nil else l_props_0.price;
    local _ = if not v93 then nil else l_props_0.minPrice;
    local _ = if not v93 then nil else l_props_0.maxPrice;
    local _ = if not v93 then nil else l_props_0.feeRate;
    local _ = if not v93 then nil else l_props_0.isPriceValid;
    local _ = if not v93 then nil else l_props_0.onPriceChange;
    local v136 = if not v93 then nil else v29.isReadyForSale(v127) or v29.isBuyableMarketplaceAsset(l_assetTypeEnum_0);
    local l_maximumItemTagsPerItem_0 = l_props_0.maximumItemTagsPerItem;
    local v138 = nil;
    local v139 = nil;
    local l_Localization_0 = l_props_0.Localization;
    if not (((not v90 and (not l_ToolboxVideoConfigSharing2_0 or not v91) or l_isAssetPublic_0) or not l_copyOn_0) or l_UnifyModelPackagePublish3_0) then
        v138 = l_Localization_0:getText("AssetConfigCopy", "MustShare");
    end;
    if v92 then
        v139 = l_Localization_0:getText("AssetConfig", "ModelPublishWarning");
    end;
    local v141 = v27.new();
    local l_publishAsset_0 = l_Stylizer_0.publishAsset;
    local v143 = 80;
    if not l_allowCopy_0 then
        v143 = v143 + 60;
    end;
    local v144 = {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        [v12.Ref] = v68.baseFrameRef
    };
    local v145 = nil;
    if not l_props_0.assetMediaMetadataArray then
        if l_props_0.assetMediaIds ~= nil then
            v145 = l_map_0(l_props_0.assetMediaIds, function(v146)
                return v26.from(v146, true, true);
            end);
        end;
    else
        v145 = l_props_0.assetMediaMetadataArray;
    end;
    local v147 = nil;
    v147 = if not v9() then if v93 then v136 else l_allowCopy_0 else if v93 then v136 and v112 == nil else l_allowCopy_0;
    return v12.createElement(v24, v144, {
        Padding = v12.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24)
        }), 
        UIListLayout = v12.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0), 
            [v12.Change.AbsoluteContentSize] = v68.refreshCanvas or function(v148)
                if v68.baseFrameRef.current then
                    v68.baseFrameRef.current.CanvasSize = UDim2.new(l_Size_0.X.Scale, l_Size_0.X.Offset, 0, v148.AbsoluteContentSize.y + 48);
                end;
            end, 
            [v12.Ref] = v68.listLayoutRef
        }), 
        ModelWarningFrame = if not l_displayAssetTypeSelection_0 and v92 then v12.createElement(l_Pane_0, {
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v141:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, v30.FONT_SIZE_TITLE), 
            Padding = {
                Bottom = 30
            }, 
            Spacing = 5, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            Icon = v12.createElement("ImageLabel", {
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                Image = v31.WARNING_ICON, 
                ImageColor3 = l_publishAsset_0.warningIconColor, 
                Size = UDim2.fromOffset(24, 24)
            }), 
            WarningText = v12.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Font = v30.FONT, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = v139, 
                TextWrapped = true, 
                TextColor3 = l_Stylizer_0.assetConfig.warningColor, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = v30.FONT_SIZE_TITLE
            })
        }) else nil, 
        Header = if not v93 then nil else v12.createElement(v48, {
            LayoutOrder = v141:getNextOrder(), 
            Title = l_Localization_0:getText("AssetConfig", "PublishPluginHeader")
        }), 
        Title = v12.createElement(v37, {
            Title = l_Localization_0:getText("General", "Title"), 
            TotalHeight = 100, 
            MaxCount = v28.NAME_CHARACTER_LIMIT, 
            TextChangeCallBack = l_onNameChange_0, 
            TextContent = l_name_0, 
            ErrorCallback = function(v149)
                v68.props.setFieldError(v28.FIELD_NAMES.Title, v149);
            end, 
            LayoutOrder = v141:getNextOrder()
        }), 
        Description = v12.createElement(v37, {
            BottomRightText = l_Localization_0:getText("AssetConfigDescription", "AddRobloxLinks"), 
            Title = l_Localization_0:getText("General", "Description"), 
            TotalHeight = 180, 
            MaxCount = v28.DESCRIPTION_CHARACTER_LIMIT, 
            TextChangeCallBack = l_onDescChange_0, 
            TextContent = l_description_0, 
            ErrorCallback = function(v150)
                v68.props.setFieldError(v28.FIELD_NAMES.Description, v150);
            end, 
            LayoutOrder = v141:getNextOrder()
        }), 
        AssetTypeSelection = if not l_displayAssetTypeSelection_0 then nil else v12.createElement(v43, {
            LayoutOrder = v141:getNextOrder(), 
            onCategoryChange = l_onCategoryChange_0, 
            canUploadWithUgcRestrictions = if not v6() then nil else v109, 
            canUploadWithUgcRestrictionsDenyReason = if not v6() then nil else v110, 
            dataSharingEnabled = l_props_0.dataSharingEnabled, 
            dataSharingToggled = l_props_0.dataSharingToggled, 
            onDataConsentToggleClick = l_props_0.onDataConsentToggleClick
        }), 
        Creator = if not not l_displayAssetTypeSelection_0 and l_displayOwnership_0 then v12.createElement(v38, {
            LayoutOrder = v141:getNextOrder(), 
            onDropDownSelect = l_onOwnerSelected_0, 
            owner = l_owner_0, 
            Title = l_Localization_0:getText("General", "Ownership"), 
            TotalHeight = 70
        }) else nil, 
        AssetType = v121 and v12.createElement(l_TitledFrame_0, {
            Title = l_Localization_0:getText("General", "AssetType"), 
            LayoutOrder = v141:getNextOrder()
        }, {
            Label = v12.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                TextColor3 = l_publishAsset_0.textColor, 
                Font = v30.FONT, 
                TextSize = v30.FONT_SIZE_TITLE, 
                Text = v32(l_Localization_0)[l_assetTypeEnum_0], 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            })
        }), 
        Tags = l_displayTags_0 and v12.createElement(v47, {
            tags = l_tags_0, 
            onTagsChange = l_onTagsChange_0, 
            maximumItemTagsPerItem = l_maximumItemTagsPerItem_0, 
            Title = l_Localization_0:getText("General", "Tags"), 
            AssetTypeEnum = l_assetTypeEnum_0, 
            LayoutOrder = v141:getNextOrder(), 
            setDropdownHeight = function(v151)
                v68.updateMaxDropdownPosition(v68.tagsRef, v151);
            end, 
            [v12.Ref] = v68.tagsRef
        }), 
        Ownership = if not l_displayAssetTypeSelection_0 and l_displayOwnership_0 then v12.createElement(v38, {
            Title = l_Localization_0:getText("General", "Ownership"), 
            owner = l_owner_0, 
            TotalHeight = 70, 
            onDropDownSelect = l_onOwnerSelected_0, 
            LayoutOrder = v141:getNextOrder()
        }) else nil, 
        Genre = l_displayGenre_0 and v12.createElement(v40, {
            Title = l_Localization_0:getText("General", "Genre"), 
            genres = l_genres_0, 
            TotalHeight = 70, 
            onDropDownSelect = l_onGenreSelected_0, 
            LayoutOrder = v141:getNextOrder(), 
            setDropdownHeight = function(v152)
                v68.updateMaxDropdownPosition(v68.genreRef, v152);
            end, 
            [v12.Ref] = v68.genreRef
        }), 
        DividerBase = (l_displayGenre_0 or v96) and v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v141:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 20)
        }, {
            Separator = v12.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
        }), 
        Sharing = if not l_displaySharing_0 then nil else v12.createElement(v45, {
            AssetId = l_props_0.assetId, 
            AssetType = l_assetTypeEnum_0, 
            AllowSelectPrivate = l_allowSelectPrivate_0, 
            LayoutOrder = v141:getNextOrder(), 
            IsAssetPublic = l_isAssetPublic_0, 
            OnSelected = l_onSharingChanged_0
        }), 
        SharingDivider = if not l_displaySharing_0 then nil else v12.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v141:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 20)
        }, {
            Separator = v12.createElement(l_Separator_0, {
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
        }), 
        CreatorStoreConfigurationFrame = if not v96 then nil else v12.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v141:getNextOrder(), 
            Padding = {
                Top = 20
            }
        }, {
            CreatorStoreConfigurationText = v12.createElement(l_TextLabel_0, {
                Text = l_props_0.Localization:getText("AssetUploadResult", "CreatorStoreConfigurationMessage"), 
                TextColor3 = l_Stylizer_0.uploadResult.text, 
                TextSize = v30.FONT_SIZE_LARGE, 
                Size = UDim2.new(1, 0, 0, 24), 
                LayoutOrder = v141:getNextOrder()
            }), 
            CreatorStoreConfigurationLink = v12.createElement(l_LinkText_0, {
                Text = v97, 
                TextColor3 = l_Stylizer_0.uploadResult.link, 
                TextSize = v30.FONT_SIZE_LARGE, 
                Size = UDim2.new(1, 0, 0, 24), 
                LayoutOrder = v141:getNextOrder(), 
                OnClick = function()
                    l_GuiService_0:OpenBrowserWindow(v97);
                end
            })
        }), 
        Package = if not not l_UnifyModelPackagePublish3_0 and v119 then v12.createElement(v42, {
            Title = l_Localization_0:getText("General", "Package"), 
            TotalHeight = 80, 
            PackageEnabled = v84, 
            PackageOn = v85, 
            PackageWarningText = v86, 
            ToggleCallback = v107, 
            LayoutOrder = v141:getNextOrder()
        }) else nil, 
        Comment = l_displayComment_0 and v12.createElement(v44, {
            Title = l_Localization_0:getText("General", "Comments"), 
            TotalHeight = 80, 
            CommentEnabled = l_allowComment_0, 
            CommentOn = l_commentOn_0, 
            ToggleCallback = l_toggleComment_0, 
            LayoutOrder = v141:getNextOrder()
        }), 
        DeleteLocal = (not v11 or v94) and v12.createElement(v39, {
            Title = l_Localization_0:getText("General", "DeleteLocal"), 
            TotalHeight = 80, 
            DeleteLocal = l_deleteLocal_0, 
            ToggleCallback = l_toggleDeleteLocal_0, 
            LayoutOrder = v141:getNextOrder()
        })
    });
end;
return v13.connect(function(v153)
    v153 = v153 or {};
    return {
        publishingRequirements = v153.publishingRequirements, 
        assetMediaIds = v153.assetMediaIds, 
        assetMediaMetadataArray = v153.assetMediaMetadataArray, 
        sellerStatusData = if not v10() then nil else v153.sellerStatusData
    };
end, function(v154)
    return {
        setFieldError = function(v155, v156)
            v154(v53(v28.SIDE_TABS.General, v155, v156));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v55)));
