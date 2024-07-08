local _ = game:GetFastString("ToolboxAssetConfigDisabledAudioSharingLearnMoreLink");
local _ = game:GetFastString("ToolboxAssetConfigEnabledAudioSharingLearnMoreLink");
local l_UnifyModelPackagePublish3_0 = game:GetFastFlag("UnifyModelPackagePublish3");
local l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForIXP3");
local l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 = game:GetFastFlag("ToolboxSetMarketplaceModelsAsPackagesForAll");
local l_ToolboxVideoConfigSharing2_0 = game:GetFastFlag("ToolboxVideoConfigSharing2");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxRestrictAssetConfig);
local l_Packages_0 = l_Parent_0.Packages;
local v9 = require(l_Packages_0.Cryo);
local v10 = require(l_Packages_0.Framework);
local v11 = require(l_Packages_0.Roact);
local v12 = require(l_Packages_0.RoactRodux);
local _ = require(l_Parent_0.Core.Types.AssetQuotaTypes);
local v14 = require(l_Parent_0.Core.Types.AssetSubTypes);
local l_formatLocalDateTime_0 = v10.Util.formatLocalDateTime;
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v17 = require(l_Parent_0.Core.ContextServices.IXPContext);
local v18 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Core.Util;
local v21 = require(l_Util_0.DebugFlags);
local v22 = require(l_Util_0.Constants);
local v23 = require(l_Util_0.AssetConfigConstants);
local v24 = require(l_Util_0.AssetConfigUtil);
local v25 = require(l_Parent_0.Core.Util.ToolboxUtilities);
local v26 = require(l_Util_0.LayoutOrderIterator);
local v27 = if not v7() then nil else require(l_Util_0.PublishUtil);
local _ = require(l_Util_0.Urls);
local v29 = require(l_Util_0.sanitizeRichText);
local v30 = nil;
if l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then
    v30 = require(l_Util_0.getIsIXPVariableEnabled);
end;
local v31 = require(l_Packages_0.Dash);
local l_UI_0 = v10.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LinkText_0 = l_UI_0.LinkText;
local _ = l_UI_0.List;
local l_Pane_0 = l_UI_0.Pane;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_StyleModifier_0 = v10.Util.StyleModifier;
local l_GuiService_0 = game:GetService("GuiService");
local v40 = v11.PureComponent:extend("ConfigCopy");
v40.init = function(v41, v42)
    v41.warningCountdown = 0;
    v41.state = {
        copyWarning = v9.None
    };
    v41.onLearnMoreActivated = function(_, _)
        local l_AssetType_0 = v42.AssetType;
        if not v41.props.CopyEnabled then
            if not v7() or not v27.isRestrictionAppealable(v41.props.publishingRestriction) then
                if not l_ToolboxVideoConfigSharing2_0 then
                    if not v7() then
                        l_GuiService_0:OpenBrowserWindow(v25.getAudioPrivacyLearnMoreUrl());
                        return ;
                    elseif l_AssetType_0 == Enum.AssetType.Audio then
                        l_GuiService_0:OpenBrowserWindow(v25.getAudioPrivacyLearnMoreUrl());
                        return ;
                    else
                        l_GuiService_0:OpenBrowserWindow(v25.getSafetyLearnMoreUrl());
                        return ;
                    end;
                elseif l_AssetType_0 == Enum.AssetType.Video then
                    l_GuiService_0:OpenBrowserWindow(v25.getVideoPrivacyLearnMoreUrl());
                    return ;
                elseif v7() and l_AssetType_0 == Enum.AssetType.Audio then
                    l_GuiService_0:OpenBrowserWindow(v25.getAudioPrivacyLearnMoreUrl());
                    return ;
                elseif not v7() then
                    l_GuiService_0:OpenBrowserWindow(v25.getAudioPrivacyLearnMoreUrl());
                    return ;
                else
                    l_GuiService_0:OpenBrowserWindow(v25.getSafetyLearnMoreUrl());
                    return ;
                end;
            else
                l_GuiService_0:OpenBrowserWindow(v25.getAppealsPortalUrl());
                return ;
            end;
        else
            l_GuiService_0:OpenBrowserWindow(v25.getSafetyLearnMoreUrl());
            return ;
        end;
    end;
    v41.toggleCallback = function()
        local l_AssetType_1 = v42.AssetType;
        local l_props_0 = v41.props;
        local l_CopyOn_0 = l_props_0.CopyOn;
        local l_Localization_0 = l_props_0.Localization;
        local l_IsAssetPublic_0 = l_props_0.IsAssetPublic;
        if not (not (l_AssetType_1 ~= Enum.AssetType.Audio) or l_ToolboxVideoConfigSharing2_0 and l_AssetType_1 == Enum.AssetType.Video) or l_IsAssetPublic_0 then
            l_props_0.ToggleCallback(not l_CopyOn_0);
        else
            v41.warningCountdown = 5;
            v41:setState({
                copyWarning = l_Localization_0:getText("AssetConfigCopy", "MustShare")
            });
        end;
        if l_AssetType_1 == Enum.AssetType.Plugin then
            local l_canChangeSalesStatus_0 = l_props_0.canChangeSalesStatus;
            local l_currentAssetStatus_0 = l_props_0.currentAssetStatus;
            local l_onStatusChange_0 = l_props_0.onStatusChange;
            if l_canChangeSalesStatus_0 then
                l_onStatusChange_0(if not v24.isOnSale(l_currentAssetStatus_0) then v23.ASSET_STATUS.OnSale else v23.ASSET_STATUS.OffSale);
            end;
        end;
    end;
    v41.distributionQuotaPolicy = v25.getAssetConfigDistributionQuotas();
    v41.onQuotaLinkActivated = function()
        local l_AssetType_2 = v41.props.AssetType;
        if l_AssetType_2 then
            local v55 = v41.distributionQuotaPolicy[l_AssetType_2.Name];
            if v55 and v55.link then
                l_GuiService_0:OpenBrowserWindow(v55.link);
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v41.onClickVerifyLink = function()
        l_GuiService_0:OpenBrowserWindow(v25.getVerificationDocumentationUrl());
    end;
    v41.getListBullets = function(v56)
        local l_publishAsset_0 = v41.props.Stylizer.publishAsset;
        local v58 = {};
        for v59, v60 in ipairs(v56) do
            v58[v60] = v11.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v59, 
                Spacing = 10
            }, {
                Bullet = v11.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = "\226\128\162", 
                    TextColor = l_publishAsset_0.verifyTextColor, 
                    TextSize = v22.FONT_SIZE_LARGE
                }), 
                Text = v11.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Text = v60, 
                    TextColor = l_publishAsset_0.verifyTextColor, 
                    TextSize = v22.FONT_SIZE_LARGE
                })
            });
        end;
        return v58;
    end;
end;
v40.didMount = function(v61, _, _)
    if not ((not l_UnifyModelPackagePublish3_0 or v61.props.AssetType ~= Enum.AssetType.Audio and (not l_ToolboxVideoConfigSharing2_0 or v61.props.AssetType ~= Enum.AssetType.Video)) and l_UnifyModelPackagePublish3_0) then
        v61.connection = game:GetService("RunService").Heartbeat:connect(function(v64)
            v61:setState(function(v65)
                if v65.copyWarning ~= v9.None then
                    local l_v61_0 = v61;
                    l_v61_0.warningCountdown = l_v61_0.warningCountdown - v64;
                    if v61.warningCountdown <= 0 then
                        return {
                            copyWarning = v9.None
                        };
                    end;
                end;
            end);
        end);
    end;
    v61:updateDistributionQuotas();
end;
v40.willUnmount = function(v67)
    if v67.connection then
        v67.connection:disconnect();
    end;
end;
v40.didUpdate = function(v68, v69, v70)
    local l_props_1 = v68.props;
    local l_AssetType_3 = l_props_1.AssetType;
    local l_Localization_1 = l_props_1.Localization;
    local v74 = l_Localization_1:getText("AssetConfigCopy", "MustShare");
    local v75 = l_Localization_1:getText("AssetConfigCopy", "PackageCantShareOnCreatorStore");
    if not (l_AssetType_3 ~= Enum.AssetType.Audio) or l_ToolboxVideoConfigSharing2_0 and l_AssetType_3 == Enum.AssetType.Video then
        v68:setState(function(v76)
            local v77 = not l_props_1.IsAssetPublic and v69.IsAssetPublic;
            if (not (not (not l_props_1.IsAudio and (not l_ToolboxVideoConfigSharing2_0 or not l_props_1.IsVideo)) and v76.copyWarning ~= v74) or not v77) or not v69.CopyOn then
                if not (v70.copyWarning ~= v9.None) or not l_props_1.IsAssetPublic then
                    return nil;
                else
                    return {
                        copyWarning = v9.None
                    };
                end;
            else
                v68.warningCountdown = 5;
                return {
                    copyWarning = v74
                };
            end;
        end);
    elseif not (((not (l_props_1.AssetType == Enum.AssetType.Model) or not l_UnifyModelPackagePublish3_0) or l_props_1.isPackageAsset) or l_props_1.isPackageMarketplacePublishAllowed) then
        v68:setState(function(v78)
            if (not (v78.copyWarning ~= v75) or not l_props_1.PackageOn) or v69.PackageOn then
                if (not (v78.copyWarning ~= v9.None) or l_props_1.PackageOn) or not v69.PackageOn then
                    return nil;
                else
                    return {
                        copyWarning = v9.None
                    };
                end;
            else
                return {
                    copyWarning = v75
                };
            end;
        end);
    end;
    if l_AssetType_3 ~= v69.AssetType then
        v68:updateDistributionQuotas();
    end;
end;
v40.updateDistributionQuotas = function(v79)
    local l_networkInterface_0 = v79.props.Network.networkInterface;
    local l_AssetType_4 = v79.props.AssetType;
    if l_AssetType_4 and v79.distributionQuotaPolicy[l_AssetType_4.Name] then
        l_networkInterface_0:getCreatorMarketplaceQuotas(l_AssetType_4, "RateLimitCreatorMarketplaceDistribute"):andThen(function(v82)
            local l_responseBody_0 = v82.responseBody;
            local v85 = if (not not l_responseBody_0 and l_responseBody_0.quotas) and #l_responseBody_0.quotas > 0 then v31.find(l_responseBody_0.quotas, function(v84)
                return v84.duration == "Month";
            end) else nil;
            if not v85 then
                v79:setState({
                    distributionQuota = v11.None
                });
                return ;
            else
                v79:setState({
                    distributionQuota = v85
                });
                return ;
            end;
        end, function(v86)
            v79:setState({
                distributionQuota = {
                    capacity = 0, 
                    usage = 0
                }
            });
            if v21.shouldDebugWarnings() then
                warn("Error fetching asset quotas " .. tostring(v86));
            end;
        end);
        return ;
    else
        v79:setState({
            distributionQuota = v11.None
        });
        return ;
    end;
end;
v40.getDistributionQuotaStatus = function(v87, v88)
    local l_props_2 = v87.props;
    local l_state_0 = v87.state;
    local v91 = true;
    local v92 = nil;
    local l_AssetType_5 = l_props_2.AssetType;
    local v94 = l_AssetType_5 and v87.distributionQuotaPolicy[l_AssetType_5.Name];
    local l_distributionQuota_0 = l_state_0.distributionQuota;
    if not (not v94 or not l_distributionQuota_0) then
        local l_usage_0 = l_distributionQuota_0.usage;
        local l_capacity_0 = l_distributionQuota_0.capacity;
        local v98 = l_distributionQuota_0.expirationTime or "";
        local v99 = v87.props.Localization:getLocale();
        if l_capacity_0 < 1 then
            v91 = false;
            v92 = l_props_2.Localization:getText("AssetConfigSharing", "DistributeCreatorStoreQuotaUnavailable");
            v88 = false;
        elseif l_usage_0 == 0 then
            v92 = l_props_2.Localization:getText("AssetConfigSharing", "DistributeMarketplaceQuotaUnused2", {
                capacity = string.format("%d", l_capacity_0), 
                days = string.format("%d", 30)
            });
        elseif l_capacity_0 <= l_usage_0 then
            v91 = false;
            v92 = l_props_2.Localization:getText("AssetConfigSharing", "DistributeMarketplaceQuotaExhausted1", {
                dateTime = l_formatLocalDateTime_0(v98, "MMM D, h:mmA", v99)
            });
        elseif l_usage_0 > 0 then
            v92 = l_props_2.Localization:getText("AssetConfigSharing", "DistributeMarketplaceQuotaRemaining2", {
                remaining = string.format("%d", l_capacity_0 - l_usage_0), 
                date = l_formatLocalDateTime_0(v98, "MMM D", v99)
            });
        end;
    end;
    return v91, v92, v88;
end;
v40.render = function(v100)
    local l_Stylizer_0 = v100.props.Stylizer;
    local l_props_3 = v100.props;
    local l_state_1 = v100.state;
    local l_Title_0 = l_props_3.Title;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_AssetType_6 = l_props_3.AssetType;
    local l_CopyOn_1 = l_props_3.CopyOn;
    local l_CopyEnabled_0 = l_props_3.CopyEnabled;
    local l_IsAssetPublic_1 = l_props_3.IsAssetPublic;
    local l_isVerified_0 = l_props_3.isVerified;
    local l_verificationSupportedTypes_0 = l_props_3.verificationSupportedTypes;
    local l_copyWarning_0 = l_state_1.copyWarning;
    local l_publishAsset_1 = l_Stylizer_0.publishAsset;
    local v114 = not l_isVerified_0 and #l_verificationSupportedTypes_0 > 0;
    local v115 = nil;
    if not (not l_AssetType_6 or not l_CopyEnabled_0) then
        local v116 = nil;
        local v117, v118, v119 = v100:getDistributionQuotaStatus(v114);
        v116 = v117;
        v115 = v118;
        v114 = v119;
        if not v116 then
            l_CopyEnabled_0 = l_CopyOn_1;
        end;
    end;
    local v120 = if not not (l_ToolboxSetMarketplaceModelsAsPackagesForAll_0 or l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 and v30(l_props_3.IXP, "MarketplaceModelsAsPackages", "MarketplaceModelsAsPackagesEnabled")) and l_AssetType_6 == Enum.AssetType.Model then l_props_3.Localization:getText("AssetConfigCopy", "DistributeToCreatorStoreAsPackageWarning") else nil;
    local v121 = v115 and v115 ~= "";
    local v122 = nil;
    local v123 = nil;
    local v124 = nil;
    if not l_isVerified_0 then
        v121 = false;
    end;
    v122 = l_props_3.Localization:getText("AssetConfigSharing", "VerifyYourAccount");
    local _ = nil;
    if v115 then
        v124 = l_props_3.Localization:getText("AssetConfigSharing", "VerifyCurrentLimit", {
            quotaText = "<font color=\"#" .. v29(l_publishAsset_1.quotaTextColor:ToHex()) .. "\">" .. v29(v115) .. "</font>" or ""
        });
    end;
    v123 = v100.getListBullets({
        l_props_3.Localization:getText("AssetConfigSharing", "VerifyReason1"), 
        (l_props_3.Localization:getText("AssetConfigSharing", "VerifyReason2CreatorStore"))
    });
    local l_Localization_2 = l_props_3.Localization;
    local v127 = l_Localization_2:getText("AssetConfigCopy", "DistributeAgreement");
    local v128 = l_Localization_2:getText("General", "LearnMore");
    local v129 = if not v7() then nil else v27.getDisplayTextForRestriction(l_props_3.publishingRestriction, l_Localization_2);
    if v7() and v129 ~= nil then
        v127 = v129 or "";
        if v27.isRestrictionAppealable(v100.props.publishingRestriction) then
            v128 = l_Localization_2:getText("AssetConfigCopy", "SubmitAppeal");
        end;
    end;
    local v130 = l_copyWarning_0 ~= v9.None;
    if not (l_AssetType_6 ~= Enum.AssetType.Audio) or l_ToolboxVideoConfigSharing2_0 and l_AssetType_6 == Enum.AssetType.Video then
        l_Localization_2 = l_props_3.Localization;
        if not l_IsAssetPublic_1 then
            v127 = l_Localization_2:getText("AssetConfigCopy", "TemporarilyDisabledMessageOnCreatorStore");
            v114 = false;
        else
            v127 = l_Localization_2:getText("AssetConfigCopy", "DistributeAgreement");
        end;
    end;
    local v131 = v26.new();
    return v11.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 54), 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIListLayout = v11.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 0)
        }), 
        Title = v11.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v23.TITLE_GUTTER_WIDTH, 0, 40), 
            Text = l_Title_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            TextSize = v22.FONT_SIZE_TITLE, 
            TextColor3 = l_publishAsset_1.titleTextColor, 
            TextWrapped = true, 
            Font = v22.FONT, 
            LayoutOrder = 1
        }), 
        RightFrame = v11.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -v23.TITLE_GUTTER_WIDTH, 0, 0), 
            LayoutOrder = 2
        }, {
            UIPadding = v11.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 25), 
                PaddingLeft = UDim.new(0, 0), 
                PaddingRight = UDim.new(0, 0), 
                PaddingTop = UDim.new(0, 0)
            }), 
            UIListLayout = v11.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 0)
            }), 
            ToggleButtonContainer = v11.createElement(l_Pane_0, {
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v131:getNextOrder(), 
                Padding = {
                    Bottom = 10
                }, 
                Size = UDim2.new(1, 0, 0, 34), 
                Spacing = 10, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                ToggleButton = v11.createElement(l_ToggleButton_0, {
                    Disabled = not l_CopyEnabled_0, 
                    LayoutOrder = 1, 
                    OnClick = v100.toggleCallback, 
                    Selected = l_CopyOn_1, 
                    Size = UDim2.new(0, 40, 0, 24)
                }), 
                ErrorText = if not v130 then nil else v11.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Font = v22.FONT, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    Text = l_copyWarning_0, 
                    TextWrapped = true, 
                    TextColor3 = l_Stylizer_0.assetConfig.errorColor, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextSize = v22.FONT_SIZE_LARGE
                })
            }), 
            VerifyNotice = if not v114 then nil else v11.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v131:getNextOrder(), 
                Padding = {
                    Top = 5, 
                    Bottom = 5
                }
            }, {
                VerifyNoticeHeader = v11.createElement(l_LinkText_0, {
                    Text = v122, 
                    OnClick = v100.onClickVerifyLink, 
                    LayoutOrder = v131:getNextOrder()
                }), 
                VerifyReasonList = v11.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = v131:getNextOrder(), 
                    Padding = {
                        Left = 10
                    }
                }, v123), 
                CurrentLimitText = if not v115 then nil else v11.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v131:getNextOrder(), 
                    Padding = {
                        Left = 15
                    }
                }, {
                    Text = v11.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        RichText = true, 
                        Text = v124, 
                        TextColor = l_publishAsset_1.verifyTextColor, 
                        TextSize = v22.FONT_SIZE_LARGE
                    })
                })
            }), 
            DistributeToMarketplace = if not v120 then nil else v11.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v131:getNextOrder(), 
                Padding = {
                    Top = 5, 
                    Bottom = 5
                }
            }, {
                DistributeToMarketplaceMessage = v11.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v22.FONT, 
                    Text = v120, 
                    TextWrapped = true, 
                    TextSize = v22.FONT_SIZE_LARGE, 
                    TextColor3 = l_publishAsset_1.distributionQuotaTextColor, 
                    LayoutOrder = 1
                })
            }), 
            QuotaInfo = if not v115 then nil else v11.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Layout = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                LayoutOrder = v131:getNextOrder(), 
                Padding = {
                    Top = 5, 
                    Bottom = 5
                }
            }, {
                QuotaMessage = if not v121 then nil else v11.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v22.FONT, 
                    Text = v115, 
                    TextWrapped = true, 
                    TextSize = v22.FONT_SIZE_LARGE, 
                    TextColor3 = l_publishAsset_1.distributionQuotaTextColor, 
                    LayoutOrder = 1
                })
            }), 
            TipsLabel = v11.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v127, 
                StyleModifier = l_StyleModifier_0.Disabled, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextSize = v22.FONT_SIZE_LARGE, 
                LayoutOrder = v131:getNextOrder()
            }), 
            LinkButton = if v25.hideAssetConfigDistributeLearnMoreLink() then nil else v11.createElement(l_LinkText_0, {
                LayoutOrder = v131:getNextOrder(), 
                OnClick = v100.onLearnMoreActivated, 
                Text = v128
            })
        })
    });
end;
return v12.connect(function(v132, _)
    local v134 = (v132 or {}).publishingRequirements or {};
    local v135 = v134.verification or {};
    return {
        isVerified = not not v135 and v135.isVerified, 
        verificationSupportedTypes = if not v135 then {} else v135.supportedTypes or {}, 
        isPackageMarketplacePublishAllowed = v14.contains(if not l_UnifyModelPackagePublish3_0 then {} else (v134.publishing or {}).allowedSubTypes or {}, v14.Package)
    };
end, nil)((l_withContext_0({
    IXP = if not l_ToolboxSetMarketplaceModelsAsPackagesForIXP3_0 then nil else v17, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v18
})(v40)));
