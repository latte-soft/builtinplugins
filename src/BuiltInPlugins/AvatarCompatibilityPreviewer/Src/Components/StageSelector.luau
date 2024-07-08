local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Util.TestInExperienceUtil);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useCreatedByAutoSetup);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useCreatedByAutoSetup_DEPRECATED);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v9 = require(l_script_FirstAncestor_0.Src.Components.AvatarSettings);
local v10 = require(l_script_FirstAncestor_0.Src.Components.PlacesServiceContext);
local v11 = require(l_script_FirstAncestor_0.Src.Components.SubmitDialog);
local v12 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup)();
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupDisablePublish);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerTestWithAssets);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetryV2);
local l_UI_0 = v1.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local function v29(v24)
    local v25 = l_Stylizer_0:use("StageSelector");
    local v26 = l_Localization_0:use();
    local v27 = v24.Enabled ~= false;
    local v28 = v2.createElement(l_IconButton_0, {
        AnchorPoint = v24.AnchorPoint, 
        BackgroundColor = if not v24.IsSelected then v25.BackgroundColor else v25.ButtonSelectedBackgroundColor, 
        BackgroundStyle = "SubtleBox", 
        IconColor = if not v27 then v25.IconColorDisabled else v25.IconColor, 
        IconScaleType = Enum.ScaleType.Stretch, 
        IconSize = v25.IconSize, 
        LeftIcon = v24.Icon, 
        LayoutOrder = v24.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v25.ButtonHeight), 
        Padding = 0, 
        Position = v24.Position, 
        TooltipStyle = "NoDelay", 
        TooltipText = v24.Tooltip or v26:getText("Stages", v24.StageText), 
        OnClick = if not v27 then nil else v24.OnClick
    });
    if v27 then
        return v28;
    else
        return v2.createElement(v2.Fragment, {}, {
            IconButton = v28, 
            [("%*_Disabled"):format(v24.StageText)] = v2.createElement("Folder")
        });
    end;
end;
return function(v30)
    local v31 = l_Stylizer_0:use("StageSelector");
    local v32 = l_Localization_0:use();
    local v33 = l_LayoutOrderIterator_0.new();
    local v34 = l_Analytics_0:use();
    local v35 = v2.useContext(v10);
    local v36 = v8(false);
    local v37 = v8(false);
    local v38 = not not v13 and if v14() or v16() then v6(v30.Avatar.WorldModel) else v7(v30.Avatar);
    local v39 = v2.useContext(v12.Context);
    local v40 = true;
    if v39.canUploadBundles ~= nil then
        v40 = v39.canUploadBundles.type ~= "notAllowed";
    end;
    return v2.createElement(l_Pane_0, {
        BackgroundColor = v31.BackgroundColor, 
        Size = UDim2.new(0, v31.Width, 1, 0), 
        ZIndex = 2
    }, {
        Contents = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            CheckBody = v2.createElement(v29, {
                LayoutOrder = v33:getNextOrder(), 
                Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "check_body.png", 
                IsSelected = v30.SelectedStage == "CheckBody", 
                StageText = "CheckBody", 
                OnClick = function()
                    v34:report("setStage", "CheckBody");
                    v30.SetStage("CheckBody");
                end
            }), 
            CheckFace = v2.createElement(v29, {
                LayoutOrder = v33:getNextOrder(), 
                Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "check_face.png", 
                IsSelected = v30.SelectedStage == "CheckFace", 
                StageText = "CheckFace", 
                OnClick = function()
                    v34:report("setStage", "CheckFace");
                    v30.SetStage("CheckFace");
                end
            }), 
            Test = v2.createElement(v29, {
                LayoutOrder = v33:getNextOrder(), 
                Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "test.png", 
                IsSelected = false, 
                StageText = "Test", 
                OnClick = function()
                    v34:report("testInExperience");
                    if not v15() then
                        v5.DEPRECATED_test(v35, v30.Avatar);
                        return ;
                    else
                        v5.test(v35, v30.PreviewDummy);
                        return ;
                    end;
                end
            }), 
            Publish = v2.createElement(v29, {
                LayoutOrder = v33:getNextOrder(), 
                Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "publish.png", 
                IsSelected = false, 
                StageText = not v14() and "Publish" or (v38 and "Publish_AutoSetupDisabled" or "Publish"), 
                Tooltip = if (v39.canUploadBundles ~= nil and v39.canUploadBundles.type == "notAllowed") and (not (v39.canUploadBundles.denyReason ~= "MissingPremiumSubscriptionTier") or v39.canUploadBundles.denyReason == "MissingIdVerification") then v32:getText("StageSelector", (("Publish_Deny_%*"):format(v39.canUploadBundles.denyReason))) else nil, 
                Enabled = if v40 then if v14() then not v38 else nil else false, 
                OnClick = function()
                    if not v13 then
                        v34:report("publish");
                    else
                        v34:report("publish", v38);
                    end;
                    v36.enable();
                end
            })
        }), 
        SettingsButton = v2.createElement(v29, {
            Icon = "rbxassetid://6663675885", 
            IsSelected = false, 
            StageText = "Settings", 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            OnClick = v37.enable
        }), 
        SettingsMenu = v37.enabled and v2.createElement(v9, {
            worldModel = v30.Avatar.WorldModel, 
            close = v37.disable
        }), 
        SubmitDialog = v36.enabled and v2.createElement(v11, {
            close = v36.disable, 
            avatar = v30.Avatar
        })
    });
end;
