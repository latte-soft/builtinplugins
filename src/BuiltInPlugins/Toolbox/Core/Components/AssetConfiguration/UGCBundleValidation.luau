local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedAssetTextMap);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v5 = require(l_Util_0.Images);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.AssetConfigUtil);
local l_UI_0 = v1.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local v13 = require(l_Util_0.SharedFlags.getFFlagEnableUGCMissingPartsMessage);
local v14 = require(l_Util_0.SharedFlags.getFFlagUGCBundleValidationFullBodyErrors);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v18 = require(l_script_FirstAncestor_0.Core.Components.AssetConfiguration.ValidationStatus);
local v19 = not v13() and 16 or 22;
local v20 = if not v13() then nil else 8;
local v21 = if not v13() then nil else 18;
local function v28(v22)
    assert(#v22:GetChildren() > 0, "Folder from limb validation did not have any instances");
    local l_Model_0 = Instance.new("Model");
    for v24, v25 in v22:GetChildren() do
        local v26 = v25:Clone();
        if v24 == 1 then
            local l_v26_0 = v26;
            if not l_v26_0:IsA("BasePart") then
                l_v26_0 = v26:FindFirstChildWhichIsA("BasePart");
            end;
            l_Model_0.PrimaryPart = l_v26_0;
        end;
        v26.Parent = l_Model_0;
    end;
    return l_Model_0;
end;
local function _(v29)
    local l_Model_1 = Instance.new("Model");
    local v31 = v29:Clone();
    local l_v31_0 = v31;
    if not l_v31_0:IsA("BasePart") then
        l_v31_0 = v31:FindFirstChildWhichIsA("BasePart");
    end;
    l_Model_1.PrimaryPart = l_v31_0;
    v31.Parent = l_Model_1;
    return l_Model_1;
end;
local v34 = v2.PureComponent:extend("UGCBundleValidation");
v34.render = function(v35)
    local l_props_0 = v35.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_ugcBundleValidation_0 = l_props_0.Stylizer.ugcBundleValidation;
    local v39 = if not l_props_0.validationResults then {} else l_props_0.validationResults;
    local v40 = l_props_0.Localization:getText("AssetConfig", "UGCPublishWarning");
    local v41 = {};
    local v42 = l_LayoutOrderIterator_0.new();
    table.insert(v41, v2.createElement(l_Pane_0, {
        AutomaticSize = if not v13() then nil else Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = -1, 
        Size = if not v13() then UDim2.new(1, 0, 0, v19) else UDim2.fromScale(1, 0), 
        Spacing = if not v13() then nil else v20, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Icon = v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v5.WARNING_ICON, 
            ImageColor3 = l_ugcBundleValidation_0.warningColor, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v19, v19)
        }), 
        UGCWarningText = v2.createElement("TextLabel", {
            AutomaticSize = if not v13() then Enum.AutomaticSize.XY else Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = v6.FONT, 
            LayoutOrder = 2, 
            Size = if not v13() then UDim2.new(1, 0, 1, 0) else UDim2.fromScale(1, 0), 
            Text = v40, 
            TextColor3 = l_ugcBundleValidation_0.warningColor, 
            TextSize = v19, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    }));
    for v43, v44 in v39, nil, nil do
        local v45 = assert(l_ugcBundleValidation_0.validationStyles[v44.type], "No validation style for validation result type");
        local v46 = nil;
        if not v7.AssetTypeRequiresFolderForUpload(v44.assetType) then
            local l_instance_0 = v44.instance;
            if l_instance_0 then
                local l_instance_1 = v44.instance;
                local l_Model_2 = Instance.new("Model");
                local v50 = l_instance_1:Clone();
                local l_v50_0 = v50;
                if not l_v50_0:IsA("BasePart") then
                    l_v50_0 = v50:FindFirstChildWhichIsA("BasePart");
                end;
                l_Model_2.PrimaryPart = l_v50_0;
                v50.Parent = l_Model_2;
                l_instance_0 = l_Model_2;
            end;
            v46 = l_instance_0;
        else
            v46 = v44.instance and v28(v44.instance);
        end;
        local v52 = nil;
        v52 = if not v14() then assert(v3(l_props_0.Localization)[v44.assetType], "Couldn't find localized text for asset type") else if v44.assetType == nil then l_Localization_0:getText("AssetConfig", "ValidationFullBody") else assert(v3(l_props_0.Localization)[v44.assetType], "Couldn't find localized text for asset type");
        table.insert(v41, v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v43, 
            Size = UDim2.fromScale(1, 0), 
            Spacing = 5
        }, {
            Preview = v2.createElement(l_Pane_0, {
                BackgroundColor = l_ugcBundleValidation_0.previewBackgroundColor, 
                LayoutOrder = v42:getNextOrder(), 
                Size = UDim2.fromOffset(l_ugcBundleValidation_0.previewSize, l_ugcBundleValidation_0.previewSize)
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }), 
                PreviewModel = if not not v44.instance and v46.PrimaryPart ~= nil then v2.createElement(l_AssetRenderModel_0, {
                    FocusDirection = v46.PrimaryPart.CFrame.LookVector, 
                    Model = v46, 
                    ShouldMuteModelSounds = true, 
                    Static = true
                }) else v2.createElement(l_Image_0, {
                    Image = v5.PLACEHOLDER_ICON, 
                    ImageColor3 = l_ugcBundleValidation_0.placeholderIconColor
                })
            }), 
            AssetName = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v42:getNextOrder(), 
                Text = if not v44.required then v52 else v52 .. "*", 
                TextSize = l_ugcBundleValidation_0.nameTextSize, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(l_ugcBundleValidation_0.nameMinWidth, 0)
                })
            }), 
            ValidationArea = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v42:getNextOrder(), 
                Layout = Enum.FillDirection.Horizontal, 
                OnClick = if v44.type == v18.error then l_props_0.onClickError else nil, 
                Spacing = 5
            }, {
                ValidationIcon = v2.createElement(l_Image_0, {
                    Image = assert(v5.UGCValidationStatus[v44.type], "No icon for validation result type"), 
                    ImageColor3 = v45.iconColor, 
                    LayoutOrder = v42:getNextOrder(), 
                    Size = UDim2.fromOffset(l_ugcBundleValidation_0.validationIconSize, l_ugcBundleValidation_0.validationIconSize)
                }), 
                ValidationText = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v42:getNextOrder(), 
                    Text = if v44.type == v18.success then l_Localization_0:getText("AssetConfig", "ValidationSuccess") else if v44.type == v18.pending then l_Localization_0:getText("AssetConfig", "ValidatingInProgress") else if v44.type == v18.error then l_Localization_0:getText("AssetConfig", #v44.errors == 1 and "ValidationErrorSingular" or "ValidationErrorPlural", {
                        errorCount = #v44.errors
                    }) else error((("Unknown validation result type \"%*\""):format(v44.type))), 
                    TextColor = v45.textColor
                })
            })
        }));
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        Spacing = not v13() and 5 or v21
    }, v41);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v34));
