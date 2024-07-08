local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.Background);
local v4 = require(l_script_FirstAncestor_0.Src.Components.ModelPreview);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v8 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local v9 = require(l_script_FirstAncestor_0.Src.Util.filterDescendants);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local l_UI_0 = v1.UI;
local l_Alert_0 = l_UI_0.Alert;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetupDisablePublish);
local v21 = game:DefineFastFlag("AvatarPreviewerAutoSetupBetterPivot", false);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSetUpResetCameraButton);
local function v23()
    return {
        fov = 70
    };
end;
local function _(v24)
    if v24 == "ErrorMultipleBodies" then
        return false;
    elseif v24 == "ErrorSourceFail" then
        return true;
    else
        return v8(v24);
    end;
end;
return function(v26)
    local v27 = l_Localization_0:use();
    local v28 = l_Stylizer_0:use("AutoSetupScreen");
    assert(v26.autoSetupState.type ~= "none", v5.LUAU_ANALYZE_ERROR);
    local v30 = v2.useMemo(function()
        local l_target_0 = v26.autoSetupState.target;
        assert(#l_target_0.bodies > 0, "Received empty bodies list from auto setup state");
        return l_target_0.bodies[1];
    end, {
        v26.autoSetupState.target
    });
    local v33 = v2.useMemo(function()
        local l_Model_0 = Instance.new("Model");
        local v32 = v30:Clone();
        if v21 then
            v32.PivotOffset = CFrame.new();
        end;
        v32.Parent = l_Model_0;
        l_Model_0.PrimaryPart = v32;
        v9(v32);
        return l_Model_0;
    end, {
        v30
    });
    local v34 = v10(false);
    v2.useEffect(function()
        if v26.autoSetupState.type == "error" then
            v34.enable();
        end;
    end, {
        v26.autoSetupState
    });
    v2.useEffect(function()
        if v26.autoSetupState.type ~= "inAutoSetup" then
            v33.PrimaryPart.CFrame = CFrame.new(v33.PrimaryPart.Position) * v30.CFrame.Rotation;
            return ;
        else
            local v35 = task.spawn(function()
                while true do
                    v33.PrimaryPart.CFrame = v33.PrimaryPart.CFrame * CFrame.Angles(0, ((task.wait() * v28.SpinRate) * 2) * 3.141592653589793, 0);
                end;
            end);
            return function()
                task.cancel(v35);
            end;
        end;
    end, {
        v26.autoSetupState, 
        v33
    });
    local v36 = v10(false);
    local v37 = l_LayoutOrderIterator_0.new();
    local l_createElement_0 = v2.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v40 = {};
    local v42 = {
        Background = v2.createElement(v3), 
        ModelPreview = v2.createElement(l_Pane_0, {
            ZIndex = v37:getNextOrder()
        }, v2.createElement(v4, {
            Model = v33, 
            GetCameraModifications = v23, 
            ShowResetCameraButton = not not v22() or nil
        })), 
        CancelDialog = v2.createElement(l_StyledDialog_0, {
            Style = "AcceptCancel", 
            Enabled = v36.enabled, 
            Modal = true, 
            Resizable = false, 
            Title = v27:getText("AvatarScreen", "CancelPromptTitle"), 
            MinContentSize = Vector2.new(300, 50), 
            Buttons = {
                {
                    Key = "yes", 
                    Text = v27:getText("AvatarScreen", "CancelPromptYes")
                }, 
                {
                    Key = "no", 
                    Text = v27:getText("AvatarScreen", "CancelPromptNo")
                }
            }, 
            OnButtonPressed = function(v41)
                if v41 == "yes" then
                    v26.cancelAutoSetup();
                end;
                v36.disable();
            end, 
            OnClose = v36.disable
        }, {
            Text = v2.createElement(l_TextLabel_0, {
                Text = v27:getText("AvatarScreen", "CancelPromptConfirmText"), 
                TextWrapped = true
            })
        })
    };
    local l_createElement_1 = v2.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v45 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        ZIndex = v37:getNextOrder()
    };
    local v46 = {
        Padding = v2.createElement("UIPadding", {
            PaddingLeft = v28.AlertPaddingHorizontal, 
            PaddingRight = v28.AlertPaddingHorizontal, 
            PaddingTop = v28.AlertPaddingVertical
        })
    };
    local v47;
    if not (v26.autoSetupState.type == "error") or not v34.enabled then
        if v20() and v26.autoSetupState.type == "hasSelection" then
            v47 = v2.createElement(l_Alert_0, {
                Title = v27:getText("AvatarScreen", "AutoSetupStartTitle"), 
                Description = v27:getText("AvatarScreen", "AutoSetupStartDescription"), 
                Style = "Warning", 
                OnClose = v34.disable
            });
        else
            v47 = false;
            if v26.autoSetupState.type == "inAutoSetup" then
                v47 = v2.createElement(l_Alert_0, {
                    Title = v27:getText("AvatarScreen", "AutoSetupInProgressTitle"), 
                    Description = v27:getText("AvatarScreen", "AutoSetupInProgressDescription") .. (v26.autoSetupState.eta == nil and "" or "\n" .. v27:getText("AvatarScreen", "AutoSetupETA", {
                        eta = math.ceil(v26.autoSetupState.eta)
                    })), 
                    PrimaryAction = {
                        Text = v27:getText("AvatarScreen", "AutoSetupInProgressActionText"), 
                        OnClick = v36.enable
                    }
                });
            end;
        end;
    else
        v47 = v2.createElement(l_Alert_0, {
            Title = v27:getText("AvatarScreen", "AutoSetupErrorTitle"), 
            Description = v27:getText("AvatarScreen", v26.autoSetupState.error), 
            Style = "Error", 
            OnClose = v34.disable
        });
    end;
    v46.Alert = v47;
    v42.ErrorAlert = l_createElement_1(l_l_Pane_0_1, v45, v46);
    if v26.autoSetupState.type ~= "hasSelection" then
        l_createElement_1 = false;
        if v26.autoSetupState.type == "error" then
            l_l_Pane_0_1 = v26.autoSetupState.error;
            l_createElement_1 = l_l_Pane_0_1 ~= "ErrorMultipleBodies" and (l_l_Pane_0_1 == "ErrorSourceFail" and true or v8(l_l_Pane_0_1));
            if not l_createElement_1 then
                goto label0;
            end;
        else
            goto label0;
        end;
    end;
    l_createElement_1 = v2.createElement(l_Pane_0, {
        AnchorPoint = Vector2.new(1, 1), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = v28.ControlsPosition, 
        ZIndex = v37:getNextOrder()
    }, {
        Start = v2.createElement(l_IconButton_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            OnClick = v26.startAutoSetup, 
            Style = "PrimaryBrand", 
            Text = v27:getText("AvatarScreen", "StartAutoSetup"), 
            ZIndex = 2
        })
    });
    ::label0::;
    v42.Controls = l_createElement_1;
    return l_createElement_0(l_l_Pane_0_0, v40, v42);
end;
