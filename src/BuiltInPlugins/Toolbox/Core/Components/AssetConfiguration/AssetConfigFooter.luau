local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.ScreenSetup);
local v10 = require(l_Util_0.AssetConfigConstants);
local v11 = require(l_Util_0.AssetConfigUtil);
local l_Util_1 = require(l_Packages_0.Framework).Util;
local l_StyleModifier_0 = require(l_Packages_0.Framework).Util.StyleModifier;
local l_UI_0 = require(l_Packages_0.Framework).UI;
local l_Button_0 = l_UI_0.Button;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local v17 = require(l_Parent_0.Core.Types.ConfigTypes);
local l_Requests_0 = l_Parent_0.Core.Networking.Requests;
local v19 = require(l_Requests_0.ToggleOverrideRequest);
local v20 = require(l_Requests_0.ValidateAnimationRequest);
local v21 = require(l_Parent_0.Core.Components.AssetConfiguration.LinkButton);
local v22 = v2.Component:extend("AssetConfigFooter");
local l_AssetConfigFixBadIdVerifyState_0 = game:GetFastFlag("AssetConfigFixBadIdVerifyState");
local v24 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
local v25 = utf8.char(57346);
v22.init = function(v26, v27)
    v26.hideInvalidAnimationID = true;
    v26.onFlowButtonActivated = function()
        v27.toggleOverride(v26.props.currentTab);
    end;
    v26.state = {
        animationId = ""
    };
    v26.onAnimationIDChanged = function(v28)
        v28 = string.gsub(v28, "[\n\r]", " ");
        if v26.props.validateAnimation then
            v26.props.validateAnimation({
                networkInterface = v26.props.Network.networkInterface, 
                assetId = v28
            });
        end;
        v26:setState({
            animationId = v28
        });
    end;
end;
v22.shouldUpdate = function(v29, v30, v31)
    if v31 ~= v29.state then
        return true;
    else
        if l_AssetConfigFixBadIdVerifyState_0 then
            local l_hideInvalidAnimationID_0 = v29.hideInvalidAnimationID;
            if v31.animationId == "" then
                v29.hideInvalidAnimationID = true;
            else
                v29.hideInvalidAnimationID = v30.validateAnimationSucceeded or tostring(v30.AssetId) == v31.animationId;
            end;
            if l_hideInvalidAnimationID_0 ~= v29.hideInvalidAnimationID then
                return true;
            end;
        end;
        if not l_Util_1.deepEqual(v30, v29.props) then
            return true;
        else
            return false;
        end;
    end;
end;
v22.getUploadFeeWithRobuxIcon = function(v33, v34)
    return v33.props.Localization:getText("AssetConfigFooter", "UploadFeeWithRobuxIcon", {
        price = v25 .. v34
    });
end;
v22.render = function(v35)
    local l_props_0 = v35.props;
    local l_state_0 = v35.state;
    local l_Stylizer_0 = v35.props.Stylizer;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_TryPublish_0 = l_props_0.TryPublish;
    local l_TryCancel_0 = l_props_0.TryCancel;
    local l_footer_0 = l_Stylizer_0.footer;
    local l_CanSave_0 = l_props_0.CanSave;
    local l_screenFlowType_0 = l_props_0.screenFlowType;
    local l_assetTypeEnum_0 = l_props_0.assetTypeEnum;
    local l_currentTab_0 = l_props_0.currentTab;
    local l_validateAnimationSucceeded_0 = l_props_0.validateAnimationSucceeded;
    local v49 = l_validateAnimationSucceeded_0 or l_state_0.animationId == "";
    if l_AssetConfigFixBadIdVerifyState_0 then
        v49 = v35.hideInvalidAnimationID;
    end;
    local v50 = v9.queryParam(l_screenFlowType_0, l_assetTypeEnum_0, v9.keys.SHOW_OVERRIDE_BUTTON);
    local v51 = nil;
    v51 = if not v17:isOverride(l_currentTab_0) then l_props_0.Localization:getText("AssetConfigFooter", "Override") else l_props_0.Localization:getText("AssetConfigFooter", "NewAsset");
    local v52 = false;
    if l_assetTypeEnum_0 == Enum.AssetType.Animation then
        v52 = v17:isOverride(l_currentTab_0);
    end;
    local v53 = v52 and v10.FLOW_TYPE.DOWNLOAD_FLOW == l_props_0.screenFlowType;
    local v54 = l_props_0.AssetId or l_state_0.animationID;
    local v55 = false;
    local l_l_CanSave_0_0 = l_CanSave_0;
    if v53 then
        if l_CanSave_0 then
            if not l_validateAnimationSucceeded_0 then
                l_l_CanSave_0_0 = false;
            end;
        else
            l_l_CanSave_0_0 = l_validateAnimationSucceeded_0;
        end;
        if v54 then
            v55 = utf8.len(v54) > 32;
        end;
    end;
    local v57 = nil;
    v57 = if not v24() then l_props_0.Localization:getText("Common", "Submit") else l_props_0.Localization:getText("Common", "Save");
    local v58 = v11.isCatalogAsset(l_assetTypeEnum_0) or v11.isUGCBundleType(l_assetTypeEnum_0);
    if not (not (l_screenFlowType_0 == v10.FLOW_TYPE.UPLOAD_FLOW) or not v58) then
        if not l_props_0.isUploadFeeEnabled then
            if l_props_0.isUploadFeeEnabled == nil then
                l_l_CanSave_0_0 = false;
            end;
        else
            if l_props_0.uploadFee > 0 then
                v57 = v35:getUploadFeeWithRobuxIcon(l_props_0.uploadFee);
            end;
            if not l_props_0.canAffordUploadFee then
                l_l_CanSave_0_0 = false;
            end;
        end;
    end;
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_footer_0.backgroundColor, 
        BorderColor3 = l_footer_0.borderColor, 
        BorderSizePixel = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingTop = UDim.new(0, 0)
        }), 
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        AnimationIdBox = v53 and v2.createElement("Frame", {
            Size = UDim2.new(0, 160, 0, 40), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            TextField = v2.createElement(l_DEPRECATED_TextInput_0, {
                ForceOnTextChange = true, 
                OnTextChanged = v35.onAnimationIDChanged, 
                PlaceholderText = l_props_0.Localization:getText("AssetConfigAnimation", "AnimationID"), 
                Size = UDim2.new(1, 0, 1, 0), 
                Style = not v55 and "FilledRoundedBorder" or "FilledRoundedRedBorder", 
                Text = not not v54 and tostring(v54) or nil
            })
        }), 
        InvalidAnimationLabel = (v53 and not v49) and v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v8.FONT, 
            Text = l_props_0.Localization:getText("AssetConfigAnimation", "InvalidAnimationID"), 
            TextColor3 = l_Stylizer_0.redText, 
            TextSize = v8.FONT_SIZE_MEDIUM, 
            Size = UDim2.new(0, 96, 1, 0), 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            LayoutOrder = 2
        }), 
        CancelButton = v2.createElement(l_Button_0, {
            LayoutOrder = 4, 
            OnClick = l_TryCancel_0, 
            Style = "Round", 
            Size = UDim2.new(0, 140, 0, 40), 
            Text = l_props_0.Localization:getText("General", "SearchOptionsCancel")
        }), 
        PublishButton = v2.createElement(l_Button_0, {
            LayoutOrder = 5, 
            OnClick = function()
                if l_l_CanSave_0_0 then
                    l_TryPublish_0(v35.state.animationId);
                end;
            end, 
            Style = "RoundPrimary", 
            StyleModifier = not l_l_CanSave_0_0 and l_StyleModifier_0.Disabled or nil, 
            Size = UDim2.new(0, 140, 0, 40), 
            Text = v57
        }), 
        ToggleOverrideButton = v50 and v2.createElement(v21, {
            Size = UDim2.new(1, -328, 0, 20), 
            Text = v51, 
            TextSize = v8.FONT_SIZE_MEDIUM, 
            Font = v8.FONT, 
            onActivated = v35.onFlowButtonActivated, 
            LayoutOrder = 1
        })
    });
end;
return v3.connect(function(v59, _)
    v59 = v59 or {};
    return {
        currentTab = v59.currentTab, 
        instances = v59.instances, 
        screenFlowType = v59.screenFlowType, 
        assetTypeEnum = v59.assetTypeEnum, 
        isUploadFeeEnabled = v59.isUploadFeeEnabled, 
        uploadFee = v59.uploadFee, 
        canAffordUploadFee = v59.canAffordUploadFee, 
        validateAnimationSucceeded = v59.validateAnimationSucceeded
    };
end, function(v61)
    return {
        toggleOverride = function(v62)
            v61(v19(v62));
        end, 
        validateAnimation = function(v63)
            v61(v20(v63));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v6
})(v22)));
