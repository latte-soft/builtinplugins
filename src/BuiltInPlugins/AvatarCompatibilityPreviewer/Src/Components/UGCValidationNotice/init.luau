local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(script.StatusIcon);
local v4 = require(script.UGCValidationErrorDialog);
local v5 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Util.localizePlural);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useCreatedByAutoSetup);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupDisablePublish)();
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetryV2);
local l_UI_0 = v1.UI;
local l_Alert_0 = l_UI_0.Alert;
local l_Pane_0 = l_UI_0.Pane;
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v21)
    local v22 = l_Localization_0:use();
    local v23 = l_Stylizer_0:use("UGCValidationNotice");
    local v24 = v2.useContext(v5.Context);
    local v25 = v11(true);
    local v26 = v11(false);
    local v27 = v24.cachedResponses[v21.Avatar];
    local v28 = v27 and v27.ugcValidationResponse;
    local v29 = (v28 == nil and 0 or #v28.errors) + ((v24.canUploadBundles ~= nil and v24.canUploadBundles.type == "notAllowed") and 1 or 0);
    v2.useEffect(function()
        v24.requestCanUploadBundles();
    end, {
        v24.requestCanUploadBundles
    });
    v2.useEffect(function()
        v24.validateBundle(v21.Avatar);
    end, {
        v21.Avatar
    });
    v2.useEffect(function()
        v25.enable();
        v26.disable();
    end, {
        v21.Avatar
    });
    local v30 = if v13 or v14() then v10(v21.Avatar) else false;
    local v31;
    if not v13 then
        v31 = false;
    else
        v31 = false;
        if v28 ~= nil then
            v31 = v29 > 0;
        end;
    end;
    local v32 = v9(v22, "UGCValidation", "WarningLongTitle", v29);
    if v14() then
        local v33, v34 = v12(v21.Avatar, "AutoSetupValidationResultReported", false);
        local v35 = v12(v21.Avatar, v6.ATTRIBUTE_AUTO_SETUP_INPUT_ASSET, nil);
        local v36 = false;
        if v27 ~= nil then
            v36 = v27.completed;
        end;
        local v37 = l_Analytics_0:use();
        local l_v36_0 = v36;
        local l_v33_0 = v33 --[[ copy: 12 -> 18 ]];
        local l_v34_0 = v34 --[[ copy: 13 -> 19 ]];
        local l_v37_0 = v37 --[[ copy: 16 -> 20 ]];
        local l_v35_0 = v35 --[[ copy: 14 -> 21 ]];
        v2.useEffect(function()
            if (not ((not l_v36_0 or l_v33_0) or not v30) and v27 ~= nil) and v28 ~= nil then
                l_v34_0(true);
                if #v28.errors == 0 then
                    l_v37_0:report("autoSetupPassedValidation");
                else
                    l_v37_0:report("autoSetupFailedValidation");
                end;
                l_v37_0:report("autoSetupValidationDuration", v27.duration);
                l_v37_0:report("autoSetupValidationErrorCount", #v28.errors);
                for _, v44 in v28.errors, nil, nil do
                    if v44.error.type == "message" then
                        l_v37_0:report("autoSetupValidationError", l_v35_0, v44.error.message);
                    end;
                end;
            end;
        end, {
            v36
        });
    end;
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v47 = {
        Position = v23.Position, 
        Size = v23.Size
    };
    local v48 = {};
    local v49;
    if not v13 then
        v49 = false;
        if v28 ~= nil then
            v49 = false;
            if v29 > 0 then
                v49 = v25.enabled and v2.createElement(l_Alert_0, {
                    Title = v32, 
                    ShortTitle = v9(v22, "UGCValidation", "WarningShortTitle", v29), 
                    PrimaryAction = {
                        Text = v22:getText("UGCValidation", "WarningAction"), 
                        OnClick = v26.enable
                    }, 
                    OnClose = v25.disable, 
                    Style = "WarningLong"
                });
            end;
        end;
    else
        v49 = (v25.enabled and (v31 or v30)) and v2.createElement(l_Alert_0, {
            Title = if not v30 then v32 else v22:getText("UGCValidation", "WarningTitle_NoPublish"), 
            ShortTitle = if not v30 then v9(v22, "UGCValidation", "WarningShortTitle", v29) else nil, 
            Description = if not not v31 and v30 then v9(v22, "UGCValidation", "WarningDescription_NoPublish", v29) else nil, 
            PrimaryAction = if not v31 then nil else {
                Text = v22:getText("UGCValidation", "WarningAction"), 
                OnClick = v26.enable
            }, 
            OnClose = v25.disable, 
            Style = "WarningLong"
        });
    end;
    v48.Alert = v49;
    v48.StatusIcon = if not (v29 > 0) or v25.enabled then if ((v29 == 0 and v24.canUploadBundles ~= nil) and v27 ~= nil) and v27.completed then v2.createElement(v3, {
        Style = "Success", 
        TooltipText = v22:getText("UGCValidation", "SuccessTooltip")
    }) else nil else v2.createElement(v3, {
        Style = "Failure", 
        TooltipText = v32, 
        OnClick = v26.enable
    });
    v49 = false;
    if v28 ~= nil then
        v49 = false;
        if v29 > 0 then
            v49 = v26.enabled and v2.createElement(v4, {
                Errors = v28.errors, 
                OnClose = v26.disable
            });
        end;
    end;
    v48.FullDetails = v49;
    return l_createElement_0(l_l_Pane_0_0, v47, v48);
end;
