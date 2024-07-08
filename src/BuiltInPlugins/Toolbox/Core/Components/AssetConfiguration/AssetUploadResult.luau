local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_GuiService_0 = game:GetService("GuiService");
local l_HttpService_0 = game:GetService("HttpService");
local l_UpdateAssetUploadResultBundleConfigureLink2_0 = game:GetFastFlag("UpdateAssetUploadResultBundleConfigureLink2");
local l_ChangeAvatarAssetCreatorDashboardLink_0 = game:GetFastFlag("ChangeAvatarAssetCreatorDashboardLink");
game:DefineFastFlag("ToolboxFixSubmitDevelopmentItemWidth", false);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v7 = require(l_Packages_0.Roact);
local v8 = require(l_Packages_0.RoactRodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local v11 = require(l_Util_0.AssetConfigConstants);
local l_PreviewTypes_0 = v11.PreviewTypes;
local v13 = require(l_Util_0.AssetConfigUtil);
local v14 = require(l_Util_0.ToolboxUtilities);
local v15 = require(l_Util_0.Urls);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Core.Components;
local v19 = require(l_Components_0.NavButton);
local l_AssetConfiguration_0 = l_Components_0.AssetConfiguration;
local v21 = require(l_AssetConfiguration_0.AssetThumbnailPreview);
local _ = require(l_AssetConfiguration_0.ReasonFrame);
local v23 = require(l_AssetConfiguration_0.CopyID);
local v24 = require(l_Packages_0.Framework);
local l_LinkText_0 = v24.UI.LinkText;
local l_Pane_0 = v24.UI.Pane;
local l_TextWithInlineLink_0 = v24.UI.TextWithInlineLink;
local l_LayoutOrderIterator_0 = v24.Util.LayoutOrderIterator;
local v29 = require(l_Parent_0.Core.Actions.ClearChange);
local v30 = require(l_Parent_0.Core.Thunks.AssetConfiguration.GoToNextScreen);
local v31 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixAssetConfigResultTranslations);
local v32 = require(l_Util_0.SharedFlags.getFFlagEnableUnknownErrorCreatorDashboardMessage);
local v33 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxHideUrlForAnimations);
local v34 = not game:GetFastFlag("ToolboxFixSubmitDevelopmentItemWidth") and 150 or 225;
local v35 = v7.PureComponent:extend("AssetUploadResult");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
v35.init = function(v37, _)
    v37.state = {
        isLoading = true
    };
    v37.goToNextScreen = function()
        local l_props_0 = v37.props;
        l_props_0.clearChange(v11.OVERRIDE_ASSET_ID);
        l_props_0.goToNextScreen();
    end;
    v37.onClose = function()
        v37.props.onClose();
        game:GetService("StudioAssetService"):FireOnUGCSubmitCompleted(false);
    end;
    if not l_ChangeAvatarAssetCreatorDashboardLink_0 then
        v37.openCreatorDashboard = function()
            local v40 = if not v15 then nil else v15.constructCreatorDashboardAvatarAssetUrl();
            if v40 and v40 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v40);
            end;
        end;
    else
        v37.openCreatorDashboard = function(v41)
            local v42 = if not v15 then nil else v15.constructCreatorDashboardConfigAvatarAssetUrl(v41);
            if v42 and v42 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v42);
            end;
        end;
    end;
    if v32() then
        v37.openCreatorDashboardCreationsPage = function()
            local v43 = v15.constructCreatorDashboardCreationsPageUrl();
            if v43 and v43 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v43);
            end;
        end;
    end;
    if l_UpdateAssetUploadResultBundleConfigureLink2_0 then
        v37.openCreatorDashboardBundle = function(v44)
            local v45 = if not v15 then nil else v15.constructCreatorDashboardBundleConfigureUrl(v44);
            if v45 and v45 ~= "" then
                l_GuiService_0:OpenBrowserWindow(v45);
            end;
        end;
    end;
end;
local function v52(v46, v47, v48)
    local _ = nil;
    if v46 == v11.FLOW_TYPE.UPLOAD_FLOW then
        if not v13.isCatalogAsset(v48) then
            local v50 = v14.getCreatorMarketplaceWebBaseUrl();
            if not v50 then
                return (string.format("%slibrary/%s/", l_ContentProvider_0.BaseUrl, l_HttpService_0:urlEncode(v47)));
            else
                return (string.format("%sasset/%s", v50, l_HttpService_0:urlEncode(v47)));
            end;
        else
            return l_ContentProvider_0.BaseUrl .. "catalog/" .. v47;
        end;
    elseif not v13.isCatalogAsset(v48) then
        local v51 = v14.getCreatorMarketplaceWebBaseUrl();
        if not v51 then
            return (string.format("%slibrary/%s/", l_ContentProvider_0.BaseUrl, l_HttpService_0:urlEncode(v47)));
        else
            return (string.format("%sasset/%s", v51, l_HttpService_0:urlEncode(v47)));
        end;
    else
        return l_ContentProvider_0.BaseUrl .. "catalog/" .. v47;
    end;
end;
local _ = function(v53)
    local v54 = {};
    for _, v56 in pairs(v53) do
        table.insert(v54, v56);
    end;
    return v54;
end;
v35.render = function(v58)
    local l_props_1 = v58.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_networkError_0 = l_props_1.networkError;
    local v62 = l_props_1.screenFlowType == v11.FLOW_TYPE.UPLOAD_FLOW and v13.isCatalogAsset(l_props_1.assetTypeEnum);
    local v63 = v13.getPreviewType(l_props_1.assetTypeEnum, l_props_1.instances);
    local v64 = v63 == l_PreviewTypes_0.ModelPreview;
    local v65 = true;
    if v63 ~= l_PreviewTypes_0.Thumbnail then
        v65 = v63 == l_PreviewTypes_0.ImagePicker;
    end;
    local l_networkTable_0 = l_props_1.networkTable;
    local v67 = {};
    for _, v69 in pairs(l_networkTable_0) do
        table.insert(v67, v69);
    end;
    local _ = v67;
    l_networkTable_0 = l_props_1.uploadSucceeded;
    v67 = not l_networkTable_0;
    local v71 = if not l_UnifyModelPackagePublish3_0 then nil else l_props_1.isPackageAsset;
    local v72 = v13.isCatalogAsset(l_props_1.assetTypeEnum);
    local v73 = l_networkTable_0 and v72;
    local v74 = not l_networkTable_0 and v72 or not v72;
    local v75 = not l_networkTable_0 and v72 or not v71;
    local v76 = nil;
    if l_props_1.hasSubsequent then
        v73 = false;
        v75 = false;
        v74 = false;
        v76 = true;
    end;
    local v77 = 72 + v10.FONT_SIZE_MEDIUM;
    local v78 = v13.isCatalogAsset(l_props_1.assetTypeEnum) or v13.isUGCBundleType(l_props_1.assetTypeEnum);
    local v79 = nil;
    if not (v78 or not l_props_1.uploadSucceeded) then
        v79 = v52(l_props_1.screenFlowType, l_props_1.assetId or 0, l_props_1.assetTypeEnum);
    end;
    local v80 = v15.constructCreatorStoreConfigurationUrl(l_props_1.assetId or 0);
    local v81 = if not v33() then not v78 else v13.isCreatorStoreAssetNotIncludingAnimation(l_props_1.assetTypeEnum) and not v78;
    local v82 = l_LayoutOrderIterator_0.new();
    local v83 = nil;
    if v31() then
        v83 = if not l_props_1.uploadSucceeded then l_props_1.Localization:getText("AssetUploadResult", "SubmissionFailed") else l_props_1.Localization:getText("AssetUploadResult", "SubmissionSucceeded");
    end;
    return v7.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundColor3 = l_Stylizer_0.uploadResult.background, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Size = l_props_1.Size
    }, {
        ModelPreview = v64 and v7.createElement(v21, {
            title = l_props_1.assetName or nil, 
            titleHeight = 24, 
            titlePadding = 12, 
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 186)
        }), 
        ThumbnailPreview = v65 and v7.createElement("ImageLabel", {
            Position = UDim2.new(0.5, -75, 0, 48), 
            Size = UDim2.new(0, 150, 0, 150), 
            Image = v13.getResultThumbnail(l_props_1.assetId, l_props_1.iconFile), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }), 
        CopyID = l_networkTable_0 and v7.createElement(v23, {
            YPos = 240, 
            AssetId = l_props_1.assetId
        }), 
        LoadingResultSuccess = l_networkTable_0 and v7.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 279), 
            Size = UDim2.new(1, 0, 1, -279), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 5)
            }), 
            Title = v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, -200, 0, 0), 
                Size = UDim2.new(0, 400, 0, 36), 
                Text = if not v31() then l_props_1.uploadSucceeded and "Successfully submitted" or "Submission failed" else v83, 
                Font = v10.FONT, 
                TextColor3 = l_Stylizer_0.uploadResult.greenText, 
                TextSize = v10.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                LayoutOrder = 1
            }), 
            ReasonFrame = false, 
            Rows = v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 400, 0, 72), 
                Position = UDim2.new(0.5, -200, 0, 49), 
                LayoutOrder = 3
            }, {
                UIListLayout = v7.createElement("UIListLayout", {
                    Padding = UDim.new(0, 12), 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ModerationMessage = v62 and v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = not v31() and "Asset has been added to moderation queue." or l_props_1.Localization:getText("AssetUploadResult", "AddedToModerationQueueMessage"), 
                    TextColor3 = l_Stylizer_0.uploadResult.text, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 0
                }), 
                CreatorStoreConfigurationText = if not v81 then nil else v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = l_props_1.Localization:getText("AssetUploadResult", "CreatorStoreConfigurationMessage"), 
                    TextColor3 = l_Stylizer_0.uploadResult.text, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 1
                }), 
                CreatorStoreConfigurationLink = if not v81 then nil else v7.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = v80, 
                    TextColor3 = l_Stylizer_0.uploadResult.link, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 2, 
                    [v7.Event.Activated] = function()
                        l_GuiService_0:OpenBrowserWindow(v80);
                    end
                }), 
                ToolboxText = if v78 then nil else v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = not v31() and "You may find your asset in Toolbox or on web:" or l_props_1.Localization:getText("AssetUploadResult", "WebsiteUrlNoticeMessage"), 
                    TextColor3 = l_Stylizer_0.uploadResult.text, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 3
                }), 
                ToolboxLink = if v78 then nil else v7.createElement("TextButton", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    Text = v79, 
                    TextColor3 = l_Stylizer_0.uploadResult.link, 
                    TextSize = v10.FONT_SIZE_MEDIUM, 
                    Size = UDim2.new(1, 0, 0, 24), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    LayoutOrder = 4, 
                    [v7.Event.Activated] = function()
                        l_GuiService_0:OpenBrowserWindow(v79);
                    end
                }), 
                CreatorDashboardMsg = if not v78 then nil else v7.createElement(l_TextWithInlineLink_0, {
                    OnLinkClicked = (not not game:GetFastFlag("UpdateAssetUploadResultBundleConfigureLink2") and v13.isUGCBundleType(l_props_1.assetTypeEnum)) and function()
                        v58.openCreatorDashboardBundle(l_props_1.assetId);
                    end or (l_ChangeAvatarAssetCreatorDashboardLink_0 and function()
                        v58.openCreatorDashboard(l_props_1.assetId);
                    end or v58.openCreatorDashboard), 
                    Text = l_props_1.Localization:getText("AssetUploadResult", "CreatorDashboardMessage", {
                        creatorDashboardLink = v10.CREATOR_DASHBOARD_LINK_PLACEHOLDER
                    }), 
                    LinkText = l_props_1.Localization:getText("General", "CreatorDashboard"), 
                    LinkPlaceholder = v10.CREATOR_DASHBOARD_LINK_PLACEHOLDER, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    MaxWidth = 400, 
                    TextProps = {
                        Font = v10.FONT, 
                        TextColor3 = l_Stylizer_0.uploadResult.text, 
                        TextSize = v10.FONT_SIZE_TITLE, 
                        TextXAlignment = Enum.TextXAlignment.Center
                    }, 
                    LayoutOrder = 5
                })
            })
        }), 
        LoadingResultFailure = v67 and v7.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 279), 
            Size = UDim2.new(1, 0, 1, -279), 
            BackgroundTransparency = 1
        }, {
            Title = if v32() then nil else v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v10.FONT, 
                Position = UDim2.new(0.5, -200, 0, 0), 
                Size = UDim2.new(0, 400, 0, 36), 
                Text = not v31() and "Submission failed" or l_props_1.Localization:getText("AssetUploadResult", "SubmissionFailed"), 
                TextColor3 = l_Stylizer_0.uploadResult.redText, 
                TextSize = v10.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            Reason = if v32() then nil else v7.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Font = v10.FONT, 
                Position = UDim2.new(0.5, -200, 0, 49), 
                Size = UDim2.new(0, 400, 0, 72), 
                Text = l_networkError_0 and l_networkError_0.responseBody, 
                TextWrapped = true, 
                TextColor3 = l_Stylizer_0.uploadResult.text, 
                TextSize = v10.FONT_SIZE_MEDIUM, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            ReasonTextFrame = if not v32() then nil else v7.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 1, 
                Padding = 8, 
                Size = UDim2.new(1, 0, 0, 0), 
                Spacing = 12
            }, {
                Title = v7.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Font = v10.FONT, 
                    LayoutOrder = 1, 
                    Position = UDim2.new(0.5, -200, 0, 0), 
                    Size = UDim2.new(0, 400, 0, 36), 
                    Text = not v31() and "Submission failed" or l_props_1.Localization:getText("AssetUploadResult", "SubmissionFailed"), 
                    TextColor3 = l_Stylizer_0.uploadResult.redText, 
                    TextSize = v10.FONT_SIZE_TITLE, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                ReasonWithDashboardLink = v7.createElement(l_TextWithInlineLink_0, {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    LayoutOrder = 3, 
                    LinkPlaceholder = v10.CREATOR_DASHBOARD_LINK_PLACEHOLDER, 
                    LinkText = v58.props.Localization:getText("General", "CreatorDashboard"), 
                    MaxWidth = 400, 
                    OnLinkClicked = v58.openCreatorDashboardCreationsPage, 
                    Text = l_networkError_0 and l_networkError_0.responseBody, 
                    TextProps = {
                        Font = v10.FONT, 
                        TextColor3 = l_Stylizer_0.uploadResult.text, 
                        TextSize = v10.FONT_SIZE_MEDIUM, 
                        TextXAlignment = Enum.TextXAlignment.Center, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    }
                })
            })
        }), 
        Footer = v7.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 1, -v77), 
            Size = UDim2.new(1, 0, 0, v77)
        }, {
            UIListLayout = v7.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, 10), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            SubmitButton = if not v73 then nil else v7.createElement(v19, {
                AutomaticSize = Enum.AutomaticSize.X, 
                LayoutOrder = v82:getNextOrder(), 
                onClick = v58.goToNextScreen, 
                Size = UDim2.new(0, v34, 0, 32), 
                titleText = l_props_1.Localization:getText("AssetUploadResult", "SubmitAsDevelopmentItem")
            }), 
            NextButton = if not v76 then nil else v7.createElement(v19, {
                AutomaticSize = Enum.AutomaticSize.X, 
                LayoutOrder = v82:getNextOrder(), 
                onClick = v58.onClose, 
                Size = UDim2.new(0, 200, 0, 32), 
                titleText = l_props_1.Localization:getText("AssetUploadResult", "NextSubmit")
            }), 
            CloseLink = if not v73 then nil else v7.createElement(l_LinkText_0, {
                LayoutOrder = v82:getNextOrder(), 
                OnClick = v58.onClose, 
                Text = l_props_1.Localization:getText("AssetUploadResult", "Close")
            }), 
            CloseButton = if not v74 then nil else v7.createElement(v19, {
                LayoutOrder = v82:getNextOrder(), 
                onClick = v58.onClose, 
                Size = UDim2.new(0, 120, 0, 32), 
                titleText = l_props_1.Localization:getText("AssetUploadResult", "Close")
            }), 
            LinkText = if not v75 then nil else v7.createElement(l_LinkText_0, {
                LayoutOrder = 1, 
                OnClick = v58.goToNextScreen, 
                Text = l_props_1.Localization:getText("AssetUploadResult", "Back")
            })
        })
    });
end;
return v8.connect(function(v84, _)
    v84 = v84 or {};
    return {
        assetId = v84.assetId, 
        assetName = not not v84.changed and v84.changed.AssetConfigName or v84.assetName, 
        uploadSucceeded = v84.uploadSucceeded, 
        instances = v84.instances, 
        networkError = v84.networkError, 
        screenFlowType = v84.screenFlowType, 
        assetConfigData = v84.assetConfigData, 
        assetTypeEnum = v84.assetTypeEnum, 
        thumbnailStatus = v84.thumbnailStatus, 
        networkTable = v84.networkTable or {}, 
        iconFile = v84.iconFile, 
        isPackageAsset = if not l_UnifyModelPackagePublish3_0 then nil else v84.isPackageAsset, 
        hasSubsequent = v84.hasSubsequent
    };
end, function(v86)
    return {
        clearChange = function(v87)
            v86(v29(v87));
        end, 
        goToNextScreen = function()
            v86(v30());
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v35)));
