local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Components.SurveyDialog);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useCreatedByAutoSetup);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useCreatedByAutoSetup_DEPRECATED);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v10 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v11 = require(l_script_FirstAncestor_0.Src.Util.findUnderlyingMeshAssetIds);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetry);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupDisablePublish);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupTelemetryV2);
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v17)
    local v18 = l_Analytics_0:use();
    local v19 = l_Stylizer_0:use("ContextualSurveyDialogButton");
    local v20 = if v13() or v14() then v6(v17.Avatar.WorldModel) else v7(v17.Avatar);
    local v21, v22 = v8(v17.Avatar.WorldModel, "completedAutoSetupSurvey", false);
    local v23 = if not v14() then nil else v8(v17.Avatar.WorldModel, v10.ATTRIBUTE_AUTO_SETUP_INPUT_ASSET, nil);
    local v24 = v9(false);
    local v26 = v2.useCallback(function(v25)
        if not v14() then
            if not v12() then
                v18:report("sendAutoSetupSurvey", v25);
            else
                v18:report("sendAutoSetupSurvey", v25, v11(v17.Avatar.WorldModel));
            end;
        else
            v18:report("sendAutoSetupSurvey", v25, v11(v17.Avatar.WorldModel), v23);
        end;
        v22(true);
    end, {});
    if v20 then
        return v2.createElement(v2.Fragment, {}, {
            SurveyDialog = v24.enabled and v2.createElement(v4, {
                close = v24.disable, 
                submitResults = v26
            }), 
            ContextualSurveyDialogButton = not v21 and v2.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0, 1), 
                BackgroundTransparency = 1, 
                Image = v19.Image, 
                Position = v19.Position, 
                Size = v19.Size, 
                [v2.Event.Activated] = v24.enable
            })
        });
    else
        return nil;
    end;
end;
