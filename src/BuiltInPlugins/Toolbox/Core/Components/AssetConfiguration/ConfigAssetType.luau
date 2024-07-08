local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local v7 = require(l_Packages_0.UGCValidation);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v11 = require(l_Util_0.Analytics.Analytics);
local v12 = require(l_Util_0.AssetConfigUtil);
local v13 = require(l_Util_0.fixUpPreValidation);
local v14 = require(l_Util_0.Constants);
local v15 = require(l_Util_0.DebugFlags);
local v16 = require(l_Util_0.Images);
local v17 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagAvatarPreviewerAutoSetupDisablePublish);
local v18 = require(l_Util_0.SharedFlags.getFFlagUGCBundleValidationFullBodyErrors);
local v19 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagEnableUGCToolboxFixAccessories);
local v20 = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadingDataSharing);
local v21 = require(l_Util_0.getAllowedAssetTypeEnums);
local v22 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedAssetTextMap);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local v29 = require(l_script_FirstAncestor_0.Core.Actions.SetUploadAssetType);
local v30 = require(l_script_FirstAncestor_0.Core.Actions.SetUploadAssetValidationStatus);
local v31 = require(l_script_FirstAncestor_0.Core.Components.DropdownMenu);
local v32 = require(l_script_FirstAncestor_0.Core.Components.MessageBox.MessageBox);
local l_AssetConfiguration_0 = l_script_FirstAncestor_0.Core.Components.AssetConfiguration;
local v34 = require(l_AssetConfiguration_0.ConfigSectionWrapper);
local v35 = require(l_AssetConfiguration_0.UGCBundleValidation);
local v36 = require(l_AssetConfiguration_0.ValidationStatus);
local v37 = require(l_Util_0.AssetConfigConstants);
local v38 = if not v20() then nil else require(l_AssetConfiguration_0.DataConsentToggle);
game:DefineFastFlag("BodyFirstInAssetsCategory", false);
local v39 = game:DefineFastFlag("DisableSubmitButtonForValidationInInit", false);
local v40 = require(l_Util_0.SharedFlags.getFFlagEnableUGCMissingPartsMessage);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local v42 = require(l_Util_0.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local v43 = require(l_Util_0.SharedFlags.getFFlagEnableUGCForAllChecks);
local v44 = game:DefineFastString("ToolboxConfigAssetTypeAgeIDVerificationLink", "https://en.help.roblox.com/hc/en-us/articles/4407282410644-Age-ID-Verification");
local v45 = game:DefineFastString("ToolboxConfigAssetTypePremiumLink", "https://www.roblox.com/premium/membership");
local v46 = game:DefineFastFlag("ToolboxFixUGCBundleValidationCryoThingy1", false);
local v47 = v5.PureComponent:extend("ConfigAssetType");
local v48 = (v40() or l_EnableUGCBundleUnknownMeshPartFiltering_0) and 18 or nil;
local v49 = not v43() and 0 or 10;
local v50 = not v43() and 24 or 72;
local v51 = {};
if game:GetFastFlag("BodyFirstInAssetsCategory") then
    v51 = {
        v37.UGCBundleTypes.Body, 
        v37.UGCBundleTypes.DynamicHead
    };
end;
local v52 = {
    NONE = "None", 
    BEGIN = "Begin", 
    VALIDATING = "Validating", 
    SUCCESS = "Success", 
    FAILURE = "Failure"
};
local function _(v53)
    return v12.isCatalogAsset(v53) or v12.isUGCBundleType(v53);
end;
local _ = function(v55)
    if v55 then
        local _ = nil;
        if type(v55) == "table" then
            return (table.concat(v55, "\n"));
        else
            return (tostring(v55));
        end;
    else
        return nil;
    end;
end;
v47.init = function(v58, v59)
    v58.dropdownItems = {};
    local v60, v61 = v58:selectedRadioButtonKeyFor(v59.assetTypeEnum);
    v58.state = {
        currentSelectedRadioButtonKey = v60, 
        currentAssetType = v59.assetTypeEnum, 
        dropdownAvatarCategoryIndex = if v60 == "AvatarItem" then v61 else 0, 
        dropdownDevelopmentCategoryIndex = if v60 == "DevelopmentItem" then v61 else 0, 
        validationState = v52.NONE, 
        validationFailureReasons = {}, 
        displayValidationErrorMessages = false
    };
    v58.setAssetCategoryIndex = function(v62)
        if v58.state.currentSelectedRadioButtonKey == "AvatarItem" then
            v58:setState(function()
                return {
                    dropdownAvatarCategoryIndex = v62
                };
            end);
            return ;
        else
            v58:setState(function()
                return {
                    dropdownDevelopmentCategoryIndex = v62
                };
            end);
            return ;
        end;
    end;
    v58.onRadioButtonClicked = function(v63)
        v58:setState(function()
            return {
                currentSelectedRadioButtonKey = v63
            };
        end);
    end;
    v58.openValidationErrorMessageBox = function()
        v58:setState(function()
            return {
                displayValidationErrorMessages = true
            };
        end);
    end;
    v58.onValidationErrorMessageBoxClosed = function()
        v58:setState(function()
            return {
                displayValidationErrorMessages = false
            };
        end);
    end;
    v58.validationCallback = function(v64, v65)
        local l_state_0 = v58.state;
        local l_props_0 = v58.props;
        local v68 = nil;
        if v42() then
            v68 = v12.getAvatarAssetTypeAsString(l_state_0.currentAssetType);
        end;
        if v15.shouldDebugWarnings() then
            assert(l_state_0.validationState == v52.VALIDATING, "Validation state is expected to be `Validating`.");
        end;
        if not v64 then
            if #v65 > 0 then
                warn(l_props_0.Localization:getText("AssetConfig", "AssetConfigOutputErrorHeading", {
                    errorCount = #v65
                }), v65);
            end;
            local v69 = if #v65 > 0 then v65 else {
                l_props_0.Localization:getText("AssetConfig", "ValidationErrorUnknown")
            };
            v58:setState(function()
                return {
                    validationState = v52.FAILURE, 
                    validationFailureReasons = v69
                };
            end);
            if v42() then
                local l_UGCBundleValidationEvent_0 = v11.UGCBundleValidationEvent;
                local l_Failure_0 = v11.Status.Failure;
                local l_v68_0 = v68;
                local v73;
                if v69 then
                    local _ = nil;
                    v73 = if type(v69) == "table" then table.concat(v69, "\n") else tostring(v69);
                else
                    v73 = nil;
                end;
                l_UGCBundleValidationEvent_0(l_Failure_0, l_v68_0, v73);
            end;
        else
            v58:setState(function()
                return {
                    validationState = v52.SUCCESS, 
                    validationFailureReasons = {}
                };
            end);
            if v42() then
                v11.UGCBundleValidationEvent(v11.Status.Success, v68);
            end;
        end;
        if l_props_0.onAssetValidationResultChanged then
            l_props_0.onAssetValidationResultChanged(v64);
        end;
    end;
    if v59.assetTypeEnum ~= nil then
        local l_assetTypeEnum_0 = v59.assetTypeEnum;
        if v12.isCatalogAsset(l_assetTypeEnum_0) or v12.isUGCBundleType(l_assetTypeEnum_0) then
            if not (not v39 or not v59.onAssetValidationResultChanged) then
                v59.onAssetValidationResultChanged(false);
            end;
            task.defer(function()
                v58:setState({
                    validationState = v52.BEGIN
                });
            end);
        end;
    end;
end;
v47.getAvatarItemCategoryErrorsPrimaryText = function(v76)
    local l_props_1 = v76.props;
    local v78 = #v76.state.validationFailureReasons;
    if v78 == 1 then
        return l_props_1.Localization:getText("AssetConfig", "AvatarItemsErrorTextSingular", {
            errorCount = v78
        });
    else
        return l_props_1.Localization:getText("AssetConfig", "AvatarItemsErrorTextPlural", {
            errorCount = v78
        });
    end;
end;
v47.getAvatarItemCategoryErrors = function(v79)
    local l_state_1 = v79.state;
    local v81 = "";
    for _, v83 in l_state_1.validationFailureReasons, nil, nil do
        v81 = table.concat({
            v81, 
            v83, 
            "\n\n"
        });
    end;
    return v81;
end;
v47.selectedRadioButtonKeyFor = function(v84, v85)
    for _, v87 in {
        "AvatarItem", 
        "DevelopmentItem"
    }, nil, nil do
        for v88, v89 in v84:getDropdownItemsFor(v87) do
            if v89.type == v85 then
                return v87, v88;
            end;
        end;
    end;
    return "DevelopmentItem", 0;
end;
v47.isAvatarItemCategorySelected = function(v90)
    return v90.state.currentSelectedRadioButtonKey == "AvatarItem";
end;
v47.onAssetTypeChanged = function(v91)
    local l_props_2 = v91.props;
    local v93 = v91:getAssetCategoryIndex();
    if v93 then
        local v94 = v91.dropdownItems[v93];
        if v94 and v94.type then
            if v94.type ~= v91.state.currentAssetType then
                v91:resetValidation();
            end;
            if l_props_2.onAssetValidationResultChanged then
                l_props_2.onAssetValidationResultChanged(false);
            end;
            v91:setState(function()
                return {
                    currentAssetType = v94.type
                };
            end);
            if l_props_2.onAssetTypeSelected then
                l_props_2.onAssetTypeSelected(v94.type);
            end;
            if not (not v43() or not l_props_2.onCategoryChange) then
                l_props_2.onCategoryChange(v91.state.currentSelectedRadioButtonKey);
            end;
            local l_type_0 = v94.type;
            if v12.isCatalogAsset(l_type_0) or v12.isUGCBundleType(l_type_0) then
                v91:setState(function()
                    return {
                        validationState = v52.BEGIN
                    };
                end);
                return ;
            else
                v91:resetValidation();
                return ;
            end;
        else
            v91:resetValidation();
            v91:setState(function()
                return {
                    currentAssetType = v3.None
                };
            end);
            if l_props_2.onAssetTypeSelected then
                l_props_2.onAssetTypeSelected(v3.None);
            end;
            return ;
        end;
    else
        v91:resetValidation();
        v91:setState(function()
            return {
                currentAssetType = v3.None
            };
        end);
        if l_props_2.onAssetTypeSelected then
            l_props_2.onAssetTypeSelected(v3.None);
        end;
        return ;
    end;
end;
v47.startUGCBundleValidation = function(v96)
    local l_props_3 = v96.props;
    local l_state_2 = v96.state;
    local v99 = nil;
    if v42() then
        v99 = v12.getAvatarAssetTypeAsString(l_state_2.currentAssetType);
        v11.UGCBundleValidationEvent(v11.Status.Start, v99);
    end;
    if #l_props_3.instances ~= 1 then
        v96:setState(function()
            return {
                validationState = v52.FAILURE, 
                validationFailureReasons = {
                    l_props_3.Localization:getText("AssetConfig", "ValidationErrorBadSelectionCount")
                }
            };
        end);
        if v42() then
            v11.UGCBundleValidationEvent(v11.Status.Failure, v99, "Bad Selection Count");
        end;
        return ;
    else
        local v100 = nil;
        if v18() then
            v100 = v96.props.instances[1]:Clone();
            v12.sanitizeForValidation(v100);
        end;
        local function v102(v101)
            if v101.error.type == "message" then
                return v101.error.message;
            elseif v101.error.type == "notFound" then
                return (l_props_3.Localization:getText("AssetConfig", "ValidationErrorItemNotDetected", {
                    itemName = v22(l_props_3.Localization)[v101.assetType]
                }));
            else
                return (error((("Unknown error type: %*"):format(v101.error.type))));
            end;
        end;
        v96.validationPromise = v7.validateBundleReadyForUpload(l_props_3.instances[1], l_props_3.allowedBundleTypeSettings, l_state_2.currentAssetType.rawValue(), function(v103)
            local v104 = {};
            local v105 = {};
            local v106 = {};
            for _, v108 in v103.errors, nil, nil do
                if not v18() then
                    if v108.assetType ~= nil then
                        if v105[v108.assetType] == nil then
                            v105[v108.assetType] = {};
                        end;
                        table.insert(v105[v108.assetType], (v102(v108)));
                    end;
                else
                    local v109 = v102(v108);
                    if v108.assetType == nil then
                        table.insert(v106, v109);
                    else
                        if v105[v108.assetType] == nil then
                            v105[v108.assetType] = {};
                        end;
                        table.insert(v105[v108.assetType], v109);
                    end;
                end;
            end;
            for _, v111 in v103.pieces, nil, nil do
                local v112 = v105[v111.assetType] or {};
                table.insert(v104, {
                    assetType = v111.assetType, 
                    instance = v111.instance, 
                    required = v111.settings.minimumQuantity > 0, 
                    errors = v112, 
                    type = if #v112 > 0 then v36.error else if v111.status == "finished" then v36.success else v36.pending
                });
            end;
            if v18() then
                table.insert(v104, {
                    assetType = nil, 
                    instance = v100, 
                    required = true, 
                    errors = v106, 
                    type = if #v106 > 0 then v36.error else v36.pending
                });
            end;
            v96:setState({
                ugcBundleValidationResults = v104
            });
        end):andThen(function(v113)
            if v18() then
                v96:setState(function(v114)
                    if not (v114.ugcBundleValidationResults ~= nil) or v46 and v114.ugcBundleValidationResults == v3.None then
                        return {};
                    else
                        local v115 = table.clone(v114.ugcBundleValidationResults);
                        local v116 = table.clone(v115[#v115]);
                        assert(v116.assetType == nil, "Expected last validation result to not have an asset type (full body)");
                        if #v116.errors == 0 then
                            v116.type = v36.success;
                        end;
                        v115[#v115] = v116;
                        return {
                            ugcBundleValidationResults = v115
                        };
                    end;
                end);
            end;
            local v117 = {};
            for _, v119 in v113.errors, nil, nil do
                table.insert(v117, (v102(v119)));
            end;
            v96.validationCallback(#v117 == 0, v117);
        end);
        return ;
    end;
end;
v47.resetValidation = function(v120)
    local l_props_4 = v120.props;
    v120:cancelValidationTasks();
    v120:setState(function()
        return {
            validationState = v52.NONE, 
            validationFailureReasons = {}, 
            ugcBundleValidationResults = v3.None
        };
    end);
    if l_props_4.onAssetValidationResultChanged then
        l_props_4.onAssetValidationResultChanged(false);
    end;
end;
v47.cancelValidationTasks = function(v122)
    if v122.validationTask ~= nil then
        task.cancel(v122.validationTask);
        v122.validationTask = nil;
    end;
    if v122.validationPromise ~= nil then
        v122.validationPromise:cancel();
        v122.validationPromise = nil;
    end;
end;
v47.getErrorMessageWithCount = function(v123, v124)
    local l_props_5 = v123.props;
    if v124 == 1 then
        return l_props_5.Localization:getText("AssetConfig", "ValidationErrorSingular", {
            errorCount = v124
        });
    else
        return l_props_5.Localization:getText("AssetConfig", "ValidationErrorPlural", {
            errorCount = v124
        });
    end;
end;
v47.getValidationStatusMessage = function(v126)
    local l_props_6 = v126.props;
    local l_state_3 = v126.state;
    if l_state_3.validationState == v52.VALIDATING then
        return l_props_6.Localization:getText("AssetConfig", "ValidatingInProgress");
    elseif l_state_3.validationState == v52.SUCCESS then
        return l_props_6.Localization:getText("AssetConfig", "ValidationSuccess");
    elseif l_state_3.validationState == v52.FAILURE then
        local v129 = #l_state_3.validationFailureReasons;
        if v129 > 0 then
            return v126:getErrorMessageWithCount(v129);
        else
            return l_props_6.Localization:getText("AssetConfig", "ValidationErrorUnknown");
        end;
    else
        return "";
    end;
end;
v47.getValidationStatusColor = function(v130, v131)
    local l_state_4 = v130.state;
    if l_state_4.validationState == v52.SUCCESS then
        return v131.typeValidation.successResultColor;
    elseif l_state_4.validationState == v52.FAILURE then
        return v131.typeValidation.failureResultColor;
    else
        return v131.TextColor;
    end;
end;
v47.getAssetCategoryIndex = function(v133)
    local l_state_5 = v133.state;
    if l_state_5.currentSelectedRadioButtonKey == "AvatarItem" then
        return l_state_5.dropdownAvatarCategoryIndex;
    else
        return l_state_5.dropdownDevelopmentCategoryIndex;
    end;
end;
v47.getDropdownItemsFor = function(v135, v136, v137)
    local l_props_7 = v135.props;
    local v139 = {};
    if v136 == "AvatarItem" then
        if l_props_7.allowedBundleTypeSettings ~= nil then
            for v140 in l_props_7.allowedBundleTypeSettings, nil, nil do
                local v141 = v12.getUGCBundleTypeFromString(v140);
                table.insert(v139, {
                    name = not v137 and "" or v12.getLocalizedUGCBundleName(v141, v137), 
                    selectable = true, 
                    type = v141
                });
            end;
            if game:GetFastFlag("BodyFirstInAssetsCategory") then
                table.sort(v139, function(v142, v143)
                    return (table.find(v51, v142.type) or math.huge) < (table.find(v51, v143.type) or math.huge);
                end);
            end;
        end;
        local v144 = v21(l_props_7.allowedAssetTypesForRelease);
        if #v144 > 0 then
            for _, v146 in v144, nil, nil do
                table.insert(v139, {
                    name = not v137 and "" or v22(v137)[v146], 
                    selectable = true, 
                    type = v146
                });
            end;
            return v139;
        end;
    else
        local v147 = not v137 and "" or v137:getText("General", "AssetTypeModel");
        local v148 = not v137 and "" or v137:getText("General", "AssetTypeAnimation");
        table.insert(v139, {
            name = v147, 
            selectable = true, 
            type = Enum.AssetType.Model
        });
        table.insert(v139, {
            name = v148, 
            selectable = true, 
            type = Enum.AssetType.Animation
        });
    end;
    return v139;
end;
v47.getDropdownItems = function(v149, v150)
    v149.dropdownItems = v149:getDropdownItemsFor(v149.state.currentSelectedRadioButtonKey, v150);
    return v149.dropdownItems;
end;
if v40() then
    v47.getMissingOptionalPartsMessage = function(v151, v152, v153, v154, v155)
        local l_props_8 = v151.props;
        if v12.isUGCBundleType(v154) then
            local v157 = v12.getOptionalBodyPartsNotFound(v152, v153, v154);
            if not v157 or #v157 <= 0 then
                return nil;
            else
                local v158 = {};
                local v159 = l_LayoutOrderIterator_0.new();
                v158.OptionalPartsMessage = v5.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Font = v14.FONT, 
                    LayoutOrder = v159:getNextOrder(), 
                    Size = UDim2.fromScale(1, 0), 
                    Text = l_props_8.Localization:getText("AssetConfig", "UGCMissingOptionalPartsMessage"), 
                    TextColor = v155.assetConfig.labelTextColor, 
                    TextSize = v14.FONT_SIZE_TITLE, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                });
                for _, v161 in v157, nil, nil do
                    local v162 = v22(l_props_8.Localization)[v161];
                    if v162 ~= nil then
                        v158[v161.Name] = v5.createElement(l_TextLabel_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            BackgroundTransparency = 1, 
                            Font = v14.FONT, 
                            LayoutOrder = v159:getNextOrder(), 
                            Size = UDim2.fromScale(1, 0), 
                            Text = v162, 
                            TextColor = v155.assetConfig.labelTextColor, 
                            TextSize = v14.FONT_SIZE_TITLE, 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center
                        });
                    end;
                end;
                return v158;
            end;
        else
            return nil;
        end;
    end;
end;
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v47.getUnknownMeshPartMessage = function(v163, v164, v165, v166)
        local l_props_9 = v163.props;
        if v12.isUGCBundleType(v165) then
            local v168 = v12.getUnknownMeshPartNames(v164);
            if not v168 or #v168 <= 0 then
                return nil;
            else
                local v169 = {};
                local v170 = l_LayoutOrderIterator_0.new();
                v169.OptionalPartsMessage = v5.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    Font = v14.FONT, 
                    LayoutOrder = v170:getNextOrder(), 
                    Size = UDim2.fromScale(1, 0), 
                    Text = l_props_9.Localization:getText("AssetConfig", "UGCUnknownMeshPartsMessage"), 
                    TextColor = v166.assetConfig.labelTextColor, 
                    TextSize = v14.FONT_SIZE_TITLE, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                });
                for _, v172 in v168, nil, nil do
                    v169[v172] = v5.createElement(l_TextLabel_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1, 
                        Font = v14.FONT, 
                        LayoutOrder = v170:getNextOrder(), 
                        Size = UDim2.fromScale(1, 0), 
                        Text = v172, 
                        TextColor = v166.assetConfig.labelTextColor, 
                        TextSize = v14.FONT_SIZE_TITLE, 
                        TextWrapped = true, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Center
                    });
                end;
                return v169;
            end;
        else
            return nil;
        end;
    end;
end;
if v43() then
    v47.getUgcRestrictionsWarningText = function(v173, v174, v175)
        local l_props_10 = v173.props;
        local l_Localization_0 = l_props_10.Localization;
        local v178 = nil;
        local v179 = {};
        local l_canUploadWithUgcRestrictions_0 = l_props_10.canUploadWithUgcRestrictions;
        local l_canUploadWithUgcRestrictionsDenyReason_0 = l_props_10.canUploadWithUgcRestrictionsDenyReason;
        if not v173:isAvatarItemCategorySelected() then
            if not v174 then
                if v175 then
                    v178 = l_Localization_0:getText("AssetConfig", "ModelPublishWarning");
                end;
            else
                return l_Localization_0:getText("AssetConfig", "InsufficientRobuxWarning"), v179;
            end;
        elseif l_canUploadWithUgcRestrictions_0 ~= nil and l_canUploadWithUgcRestrictions_0 == false then
            return if l_canUploadWithUgcRestrictionsDenyReason_0 == "MissingIdVerification" then l_Localization_0:getText("AssetConfig", "UploadDenied_MissingIdVerification_Text") else if l_canUploadWithUgcRestrictionsDenyReason_0 == "MissingPremiumSubscriptionTier" then l_Localization_0:getText("AssetConfig", "UploadDenied_MissingPremiumSubscriptionTier_Text") else l_Localization_0:getText("AssetConfig", "UploadDenied_UnknownError", {
                errorCode = l_canUploadWithUgcRestrictionsDenyReason_0
            }), {
                ["[Age_Verified]"] = {
                    LinkText = l_Localization_0:getText("AssetConfig", "UploadDenied_MissingIdVerification_Link"), 
                    LinkCallback = function()
                        l_BrowserService_0:OpenBrowserWindow(v44);
                    end
                }, 
                ["[Premium_1000_Or_2200_Subscription]"] = {
                    LinkText = l_Localization_0:getText("AssetConfig", "UploadDenied_MissingPremiumSubscriptionTier_Link"), 
                    LinkCallback = function()
                        l_BrowserService_0:OpenBrowserWindow(v45);
                    end
                }
            };
        end;
        return v178, v179;
    end;
end;
v47.didUpdate = function(v182, _, v184)
    local l_props_11 = v182.props;
    local l_state_6 = v182.state;
    if not (l_state_6.currentSelectedRadioButtonKey == v184.currentSelectedRadioButtonKey and l_state_6.dropdownAvatarCategoryIndex == v184.dropdownAvatarCategoryIndex) or l_state_6.dropdownDevelopmentCategoryIndex ~= v184.dropdownDevelopmentCategoryIndex then
        v182:onAssetTypeChanged();
    end;
    if l_state_6.validationState ~= v184.validationState then
        if l_state_6.validationState == v52.BEGIN then
            v182:setState(function()
                return {
                    validationState = v52.VALIDATING
                };
            end);
            return ;
        elseif l_state_6.validationState == v52.VALIDATING then
            if not v12.isUGCBundleType(l_state_6.currentAssetType) then
                v182.validationTask = task.spawn(function()
                    local v193, v194 = v7.validate(if not v19() then l_props_11.instances else (function(v187)
                        local v188 = {};
                        local v189 = v187 or {};
                        for v190, v191 in v189, nil, nil do
                            local v192 = v191:Clone();
                            v13(v192);
                            v188[v190] = v192;
                        end;
                        return v188;
                    end)(l_props_11.instances), l_state_6.currentAssetType);
                    v182.validationCallback(v193, v194);
                end);
            else
                v182:startUGCBundleValidation();
                return ;
            end;
        end;
    end;
end;
v47.willUnmount = function(v195)
    v195:cancelValidationTasks();
end;
v47.render = function(v196)
    local l_props_12 = v196.props;
    local l_state_7 = v196.state;
    local l_Localization_1 = l_props_12.Localization;
    local l_Stylizer_0 = l_props_12.Stylizer;
    local v201 = l_LayoutOrderIterator_0.new();
    local v202 = l_state_7.validationState == v52.FAILURE;
    local v203 = not v202 and 0 or 24;
    local l_FONT_SIZE_TITLE_0 = v14.FONT_SIZE_TITLE;
    local l_currentAssetType_0 = l_state_7.currentAssetType;
    local v206 = l_currentAssetType_0 == Enum.AssetType.Model;
    local v207 = v12.isUGCBundleType(l_currentAssetType_0);
    local v208 = l_Localization_1:getText("AssetConfig", "AvatarItemsErrorTitle");
    local v209 = l_Localization_1:getText("Common", "Close");
    local v210 = l_Localization_1:getText("General", "ContentType");
    local v211 = not not v17() and not not l_props_12.instances[1]:GetAttribute("RBX_AutoSetupped");
    local v212 = l_Localization_1:getText("AssetConfig", "DevelopmentItem");
    local v213 = if not v17() then l_Localization_1:getText("AssetConfig", "AvatarItem") else l_Localization_1:getText("AssetConfig", not v211 and "AvatarItem" or "AvatarItem_AvatarSetupDisabled");
    local v214 = l_Localization_1:getText("General", "AssetCategory");
    local v215 = nil;
    if not (v43() or not v206) then
        v215 = l_Localization_1:getText("AssetConfig", "ModelPublishWarning");
    end;
    local v216 = if l_props_12.uploadFee > 0 then not l_props_12.canAffordUploadFee else false;
    local v217 = nil;
    if not (v43() or not v216) then
        v217 = l_Localization_1:getText("AssetConfig", "InsufficientRobuxWarning");
    end;
    local l_displayValidationErrorMessages_0 = l_state_7.displayValidationErrorMessages;
    local v219 = l_Localization_1:getText("General", "BodyValidation");
    local v220 = if not v40() then nil else v196:getMissingOptionalPartsMessage(l_props_12.instances[1], l_props_12.allowedBundleTypeSettings, l_currentAssetType_0, l_Stylizer_0);
    local v221 = if not l_EnableUGCBundleUnknownMeshPartFiltering_0 then nil else v196:getUnknownMeshPartMessage(l_props_12.instances[1], l_currentAssetType_0, l_Stylizer_0);
    local v222 = nil;
    local v223 = {};
    if v43() then
        local v224, v225 = v196:getUgcRestrictionsWarningText(v216, v206);
        v222 = v224;
        v223 = v225;
    end;
    return v5.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundColor3 = l_Stylizer_0.typeSelection.background, 
        BackgroundTransparency = 1, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_12.LayoutOrder, 
        Padding = {
            Bottom = 32
        }, 
        Spacing = 30, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        ValidationErrorMessageBox = if not l_displayValidationErrorMessages_0 then nil else v5.createElement(v32, {
            buttons = {
                {
                    Text = v209, 
                    Font = l_Stylizer_0.Font, 
                    TextSize = l_Stylizer_0.TextSize, 
                    action = "yes"
                }
            }, 
            Icon = "rbxasset://textures/ui/ErrorIcon.png", 
            InformativeText = v196:getAvatarItemCategoryErrors(), 
            onButtonClicked = v196.onValidationErrorMessageBoxClosed, 
            onClose = v196.onValidationErrorMessageBoxClosed, 
            Text = v196:getAvatarItemCategoryErrorsPrimaryText(), 
            Title = v208
        }), 
        ContentTypeRadioButtons = v5.createElement(v34, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v201:getNextOrder(), 
            Title = v210
        }, {
            UIListLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, 8), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }), 
            RadioButtons = v5.createElement(l_RadioButtonList_0, {
                Buttons = {
                    {
                        Key = "DevelopmentItem", 
                        Text = v212, 
                        Disabled = false
                    }, 
                    {
                        Key = "AvatarItem", 
                        Text = v213, 
                        Disabled = not not v17() and v211
                    }
                }, 
                FillDirection = Enum.FillDirection.Horizontal, 
                LayoutOrder = 1, 
                OnClick = v196.onRadioButtonClicked, 
                SelectedKey = l_state_7.currentSelectedRadioButtonKey
            }), 
            WarningMessageFrame = if not v43() then nil else v5.createElement(l_Pane_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v50), 
                Spacing = v49, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }, {
                WarningMessageIcon = if v222 ~= nil then v5.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v16.WARNING_ICON, 
                    ImageColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(24, 24)
                }) else nil, 
                WarningMessageText = if v222 ~= nil then v5.createElement(l_TextWithLinks_0, {
                    BackgroundTransparency = 1, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    LayoutOrder = 2, 
                    LinkMap = v223, 
                    Size = UDim2.fromScale(1, 1), 
                    Text = v222, 
                    TextColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    TextProps = {
                        Font = v14.FONT, 
                        TextSize = 24
                    }, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Top
                }) else nil
            }), 
            WarningFrame = if v43() then nil else v5.createElement(l_Pane_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, v50), 
                Spacing = v49, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            }, {
                Icon = if v206 or v216 then v5.createElement("ImageLabel", {
                    BackgroundTransparency = 1, 
                    Image = v16.WARNING_ICON, 
                    ImageColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    LayoutOrder = 1, 
                    Size = UDim2.fromOffset(24, 24)
                }) else nil, 
                ModelWarningText = if not v206 then nil else v5.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v14.FONT, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v215, 
                    TextColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    TextSize = 24, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                }), 
                InsufficientRobuxWarningText = if not v216 then nil else v5.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    BackgroundTransparency = 1, 
                    Font = v14.FONT, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v217, 
                    TextColor3 = l_Stylizer_0.assetConfig.warningColor, 
                    TextSize = 24, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center
                })
            })
        }), 
        AssetCategoryDropDown = v5.createElement(v34, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v201:getNextOrder(), 
            Title = v214
        }, {
            Dropdown = v5.createElement(v31, {
                fontSize = 20, 
                items = v196:getDropdownItems(l_Localization_1), 
                onItemClicked = v196.setAssetCategoryIndex, 
                rowHeight = 24, 
                selectedDropDownIndex = v196:getAssetCategoryIndex(), 
                Size = UDim2.new(0, 400, 0, 40), 
                visibleDropDownCount = 6
            }), 
            ValidationResult = if v202 then nil else v5.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = UDim2.new(0, (400 + v203) + 16, 0, (40 - l_FONT_SIZE_TITLE_0) / 2), 
                Text = v196:getValidationStatusMessage(), 
                TextColor = v196:getValidationStatusColor(l_Stylizer_0), 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            ErrorIconButton = if not v202 then nil else v5.createElement("ImageButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/ErrorIcon.png", 
                ImageColor3 = v196:getValidationStatusColor(l_Stylizer_0), 
                Position = UDim2.new(0, 408, 0, 8), 
                Size = UDim2.fromOffset(24, 24), 
                [v5.Event.Activated] = v196.openValidationErrorMessageBox
            }), 
            ErrorMessageTextButton = if not v202 then nil else v5.createElement("TextButton", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                Font = l_Stylizer_0.Font, 
                Position = UDim2.new(0, (400 + v203) + 16, 0, (40 - l_FONT_SIZE_TITLE_0) / 2), 
                Text = v196:getValidationStatusMessage(), 
                TextColor3 = v196:getValidationStatusColor(l_Stylizer_0), 
                TextSize = v14.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                [v5.Event.Activated] = v196.openValidationErrorMessageBox
            })
        }), 
        ContentTypeBodyValidation = if not not v207 and v196.state.ugcBundleValidationResults ~= v3.None then v5.createElement(v34, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v201:getNextOrder(), 
            Title = v219
        }, {
            ValidationPane = if v40() or l_EnableUGCBundleUnknownMeshPartFiltering_0 then v5.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = 1, 
                Size = UDim2.fromScale(1, 0), 
                Spacing = v48
            }, {
                UGCBundleValidation = v5.createElement(v35, {
                    LayoutOrder = 1, 
                    onClickError = v196.openValidationErrorMessageBox, 
                    validationResults = v196.state.ugcBundleValidationResults
                }), 
                MissingOptionalAccessoriesMsg = if not v220 then nil else v5.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = 2, 
                    Size = UDim2.fromScale(1, 0)
                }, v220), 
                UnknownMeshPartsMsgChildren = if not v221 then nil else v5.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = 3, 
                    Size = UDim2.fromScale(1, 0)
                }, v221)
            }) else v5.createElement(v35, {
                onClickError = v196.openValidationErrorMessageBox, 
                validationResults = v196.state.ugcBundleValidationResults
            })
        }) else nil, 
        DataSharingConsent = if (not not v20() and l_props_12.dataSharingEnabled) and v207 then v5.createElement(v38, {
            LayoutOrder = v201:getNextOrder(), 
            dataSharingToggled = l_props_12.dataSharingToggled, 
            onDataConsentToggleClick = l_props_12.onDataConsentToggleClick
        }) else nil
    });
end;
return v6.connect(function(v226)
    v226 = v226 or {};
    return {
        allowedAssetTypesForRelease = v226.allowedAssetTypesForRelease, 
        allowedBundleTypeSettings = v226.allowedBundleTypeSettings, 
        assetTypeEnum = v226.assetTypeEnum, 
        canAffordUploadFee = v226.canAffordUploadFee or false, 
        instances = v226.instances, 
        uploadFee = v226.uploadFee or 0
    };
end, function(v227)
    return {
        onAssetTypeSelected = function(v228)
            v227(v29(v228));
        end, 
        onAssetValidationResultChanged = function(v229)
            v227(v30(v229));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v47)));
