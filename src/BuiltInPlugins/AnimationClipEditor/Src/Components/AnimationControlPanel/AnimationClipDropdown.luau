local v0 = newproxy(true);
local v1 = newproxy(true);
local v2 = newproxy(true);
local v3 = newproxy(true);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local v6 = require(l_script_FirstAncestor_0.Packages.Roact);
local v7 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v10 = UDim.new(0, v8.INDENT_PADDING);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v14 = require(l_Actions_0.SetInReviewState);
local v15 = require(l_Actions_0.SetIsDirty);
local v16 = require(l_Actions_0.SetIsLegacyAnimSaves);
local v17 = require(l_Actions_0.SetPlayState);
local v18 = require(l_Actions_0.SetReduceKeyframesDialogMode);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v20 = require(l_Components_0.Toast.ActionToast);
local v21 = require(l_Components_0.AnimationClipMenu);
local v22 = require(l_Components_0.ContextButton);
local v23 = require(l_Components_0.EditEventsDialog.FocusedPrompt);
local v24 = require(l_Components_0.TextEntryPrompt);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v26 = require(l_Thunks_0.Exporting.CreateFromVideoAndImportFBXAnimationUserMayChooseModel);
local v27 = require(l_Thunks_0.Exporting.ImportFBXAnimationUserMayChooseModel);
local v28 = require(l_Thunks_0.Exporting.ImportKeyframeSequence);
local v29 = require(l_Thunks_0.Exporting.ImportLoadedFBXAnimation);
local v30 = require(l_Thunks_0.Exporting.LoadAnimation);
local v31 = require(l_Thunks_0.LoadAnimationData);
local v32 = require(l_Thunks_0.SanitizeAnimation);
local v33 = require(l_Thunks_0.Exporting.SaveAnimation);
local v34 = v6.PureComponent:extend("AnimationClipDropdown");
v34.init = function(v35)
    v35.state = {
        showMenu = false, 
        showSaveAsPrompt = false, 
        showCreateNewPrompt = false, 
        showImportAnimModelChoicePrompt = false, 
        showPromotePrompt = false, 
        overwriteName = nil, 
        loadingName = nil, 
        isActionLegacyAnimSaves = nil, 
        showCreateAnimationFromVideoTutorial = false
    };
    v35.showMenu = function()
        if not v35.props.ReadOnly then
            v35.props.SetPlayState(v8.PLAY_STATE.Pause);
            v35:setState({
                showMenu = true
            });
        end;
    end;
    v35.hideMenu = function()
        v35:setState({
            showMenu = false
        });
    end;
    v35.showOverwritePrompt = function(v36, v37)
        v35:setState({
            overwriteName = v36, 
            isActionLegacyAnimSaves = v37
        });
    end;
    v35.hideOverwritePrompt = function()
        v35:setState({
            overwriteName = v6.None, 
            isActionLegacyAnimSaves = v6.None
        });
    end;
    v35.showSaveAsPrompt = function()
        v35:setState({
            showSaveAsPrompt = true
        });
    end;
    v35.hideSaveAsPrompt = function()
        v35:setState({
            showSaveAsPrompt = false
        });
    end;
    v35.showImportAnimModelChoicePrompt = function()
        v35:setState({
            showImportAnimModelChoicePrompt = true
        });
    end;
    v35.hideImportAnimModelChoicePrompt = function()
        v35:setState({
            showImportAnimModelChoicePrompt = false
        });
    end;
    v35.showReduceKeyframesDialog = function()
        v35.props.SetReduceKeyframesDialogMode(v8.REDUCE_KEYFRAMES_DIALOG_MODE.FromMenu);
    end;
    v35.showCreateNewPrompt = function()
        v35:setState({
            showCreateNewPrompt = true
        });
    end;
    v35.hideCreateNewPrompt = function()
        v35:setState({
            showCreateNewPrompt = false
        });
    end;
    v35.showPromotePrompt = function()
        v35:setState({
            showPromotePrompt = true
        });
    end;
    v35.hidePromotePrompt = function()
        v35:setState({
            showPromotePrompt = false
        });
    end;
    v35.showLoadNewPrompt = function(v38, v39)
        v35:setState({
            loadingName = v38, 
            isActionLegacyAnimSaves = v39
        });
    end;
    v35.hideLoadNewPrompt = function()
        v35:setState({
            loadingName = v6.None, 
            isActionLegacyAnimSaves = v6.None
        });
    end;
    v35.setShowCreateAnimationFromVideoTutorial = function(v40)
        v35:setState({
            showCreateAnimationFromVideoTutorial = v40
        });
    end;
    v35.continueAfterCreateAnimationFromVideoTutorial = function()
        local l_props_0 = v35.props;
        l_props_0.SetInReviewState(false);
        l_props_0.CreateFromVideoAndImportFBXAnimationUserMayChooseModel(l_props_0.Plugin, v35, l_props_0.Analytics);
    end;
    v35.importRequested = function()
        if not v35.props.IsDirty then
            local l_Plugin_0 = v35.props.Plugin;
            v35.props.SetInReviewState(false);
            v35.props.ImportKeyframeSequence(l_Plugin_0, v35.props.Analytics);
            return ;
        else
            v35.showLoadNewPrompt(v1);
            return ;
        end;
    end;
    v35.importFbxRequested = function()
        if not v35.props.IsDirty then
            local l_Plugin_1 = v35.props.Plugin;
            v35.props.SetInReviewState(false);
            v35.props.ImportFBXAnimationUserMayChooseModel(l_Plugin_1, v35, v35.props.Analytics);
            return ;
        else
            v35.showLoadNewPrompt(v2);
            return ;
        end;
    end;
    v35.startAnimationFromVideoFlow = function()
        v35.props.Analytics:report("onAnimationEditorImportVideoCreate");
        v35.setShowCreateAnimationFromVideoTutorial(true);
    end;
    v35.createFromVideoRequested = function()
        if not v35.props.IsDirty then
            v35.props.SetInReviewState(false);
            v35.startAnimationFromVideoFlow();
            return ;
        else
            v35.showLoadNewPrompt(v3);
            return ;
        end;
    end;
    v35.createNew = function()
        if not v35.props.IsDirty then
            v35.props.SetInReviewState(false);
            v35.showCreateNewPrompt();
            return ;
        else
            v35.showLoadNewPrompt(v0);
            return ;
        end;
    end;
    v35.loadNew = function(v44, v45)
        if not v35.props.IsDirty then
            v35.props.SetInReviewState(false);
            v35.props.LoadAnimation(v44, v45, v35.props.Analytics);
            return ;
        else
            v35.showLoadNewPrompt(v44, v45);
            return ;
        end;
    end;
    v35.handleLoadNewPrompt = function()
        local l_props_1 = v35.props;
        local l_state_0 = v35.state;
        local l_loadingName_0 = l_state_0.loadingName;
        local l_isActionLegacyAnimSaves_0 = l_state_0.isActionLegacyAnimSaves;
        local l_Plugin_2 = v35.props.Plugin;
        v35.hideLoadNewPrompt();
        v35.props.SetInReviewState(false);
        if l_loadingName_0 == v0 then
            v35.showCreateNewPrompt();
            return ;
        elseif l_loadingName_0 == v1 then
            l_props_1.ImportKeyframeSequence(l_Plugin_2, l_props_1.Analytics);
            return ;
        elseif l_loadingName_0 == v2 then
            l_props_1.ImportFBXAnimationUserMayChooseModel(l_Plugin_2, v35, l_props_1.Analytics);
            return ;
        elseif l_loadingName_0 == v3 then
            v35.startAnimationFromVideoFlow();
            return ;
        else
            l_props_1.LoadAnimation(l_loadingName_0, l_isActionLegacyAnimSaves_0, l_props_1.Analytics);
            return ;
        end;
    end;
    v35.onSanitizeAnimation = function()
        local l_props_2 = v35.props;
        l_props_2.SanitizeAnimation(l_props_2.Analytics);
    end;
end;
v34.render = function(v52)
    local l_Localization_0 = v52.props.Localization;
    local l_props_3 = v52.props;
    local l_state_1 = v52.state;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_AnimationName_0 = l_props_3.AnimationName;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_IsChannelAnimation_0 = l_props_3.IsChannelAnimation;
    local l_dropdownTheme_0 = l_Stylizer_0.dropdownTheme;
    local l_showMenu_0 = l_state_1.showMenu;
    local l_showSaveAsPrompt_0 = l_state_1.showSaveAsPrompt;
    local l_showCreateNewPrompt_0 = l_state_1.showCreateNewPrompt;
    local l_showImportAnimModelChoicePrompt_0 = l_state_1.showImportAnimModelChoicePrompt;
    local l_overwriteName_0 = l_state_1.overwriteName;
    local l_loadingName_1 = l_state_1.loadingName;
    local l_showPromotePrompt_0 = l_state_1.showPromotePrompt;
    local l_IsLegacyAnimSaves_0 = l_props_3.IsLegacyAnimSaves;
    local l_isActionLegacyAnimSaves_1 = l_state_1.isActionLegacyAnimSaves;
    local l_showCreateAnimationFromVideoTutorial_0 = l_state_1.showCreateAnimationFromVideoTutorial;
    local v71 = false;
    if l_showCreateAnimationFromVideoTutorial_0 then
        v71 = game:GetService("AnimationFromVideoCreatorStudioService"):IsAgeRestricted();
        if v71 then
            l_showCreateAnimationFromVideoTutorial_0 = false;
        end;
    end;
    return v6.createElement("ImageButton", {
        Size = UDim2.new(1, -v8.CONTROLS_WIDTH - v8.TIME_DISPLAY_WIDTH, 1, 0), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1, 
        AutoButtonColor = false, 
        LayoutOrder = l_LayoutOrder_0, 
        [v6.Event.Activated] = v52.showMenu
    }, {
        Padding = v6.createElement("UIPadding", {
            PaddingLeft = v10, 
            PaddingRight = v10
        }), 
        AnimationClipLabel = v6.createElement("TextLabel", {
            Size = UDim2.new(1, -v8.TRACKLIST_BUTTON_SIZE - v8.INDENT_PADDING, 1, 0), 
            BackgroundTransparency = 1, 
            Text = l_AnimationName_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextSize = l_dropdownTheme_0.textSize, 
            Font = l_Stylizer_0.font, 
            TextColor3 = l_dropdownTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        ContextButton = v6.createElement(v22, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            OnActivated = v52.showMenu
        }), 
        AnimationClipMenu = v6.createElement(v21, {
            ShowMenu = l_showMenu_0, 
            CurrentAnimation = l_AnimationName_0, 
            IsLegacyAnimSaves = l_IsLegacyAnimSaves_0, 
            IsChannelAnimation = l_IsChannelAnimation_0, 
            OnMenuOpened = v52.hideMenu, 
            OnOverwriteRequested = v52.showOverwritePrompt, 
            OnSaveAsRequested = v52.showSaveAsPrompt, 
            OnCreateNewRequested = v52.createNew, 
            OnLoadRequested = v52.loadNew, 
            OnImportRequested = v52.importRequested, 
            OnImportFbxRequested = v52.importFbxRequested, 
            OnCreateFromVideoRequested = v52.createFromVideoRequested, 
            OnPromoteRequested = v52.showPromotePrompt, 
            OnReduceKeyframesRequested = v52.showReduceKeyframesDialog, 
            OnSanitizeAnimation = v52.onSanitizeAnimation
        }), 
        CreateNewPrompt = l_showCreateNewPrompt_0 and v6.createElement(v24, {
            PromptText = l_Localization_0:getText("Title", "CreateNew"), 
            InputText = l_Localization_0:getText("Dialog", "AnimationName"), 
            Text = l_Localization_0:getText("Title", "DefaultAnimationName"), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_0:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_0:getText("Dialog", "Create"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnTextSubmitted = function(v72)
                v52.hideCreateNewPrompt();
                local v73 = v9.newRigAnimation(v72);
                l_props_3.LoadAnimationData(v73, v52.props.Analytics);
                l_props_3.SetIsDirty(false);
                l_props_3.SetIsLegacyAnimSaves(false);
                l_props_3.Analytics:report("onCreateNewAnimation", v72, if not v73.Metadata then nil else v73.Metadata.Guid);
            end, 
            OnClose = v52.hideCreateNewPrompt
        }), 
        SaveAsPrompt = l_showSaveAsPrompt_0 and v6.createElement(v24, {
            PromptText = l_Localization_0:getText("Title", "SaveAsNew"), 
            InputText = l_Localization_0:getText("Dialog", "AnimationName"), 
            NoticeText = l_Localization_0:getText("Dialog", "SaveLocation"), 
            Text = l_AnimationName_0, 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_0:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_0:getText("Dialog", "Save"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnTextSubmitted = function(v74)
                v52.hideSaveAsPrompt();
                l_props_3.SetIsLegacyAnimSaves(false);
                l_props_3.SaveAnimation(v74, l_props_3.Analytics);
            end, 
            OnClose = v52.hideSaveAsPrompt
        }), 
        ImportAnimModelChoicePrompt = l_showImportAnimModelChoicePrompt_0 and v6.createElement(v20, {
            Text = l_Localization_0:getText("Toast", "AnimationImportModelsDiffer"), 
            ButtonWidth = v8.PROMPT_BUTTON_SIZE.X * 1.5, 
            Buttons = {
                {
                    Key = true, 
                    Text = l_Localization_0:getText("Toast", "AnimationImportUseFBX"), 
                    Style = "Round"
                }, 
                {
                    Key = false, 
                    Text = l_Localization_0:getText("Toast", "AnimationImportUseSelected"), 
                    Style = "Round"
                }
            }, 
            OnButtonClicked = function(v75)
                v52.hideImportAnimModelChoicePrompt();
                v52.props.ImportLoadedFBXAnimation(plugin, v75, v52.props.Analytics);
            end
        }), 
        OverwritePrompt = l_overwriteName_0 and v6.createElement(v23, {
            PromptText = l_Localization_0:getText("Menu", "Overwrite_Migrated", {
                overwriteName = l_overwriteName_0
            }), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_0:getText("Dialog", "No"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_0:getText("Dialog", "Yes"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonClicked = function(v76)
                v52.hideOverwritePrompt();
                if v76 then
                    l_props_3.SetIsLegacyAnimSaves(l_isActionLegacyAnimSaves_1);
                    l_props_3.SaveAnimation(l_overwriteName_0, l_props_3.Analytics);
                end;
            end, 
            OnClose = v52.hideOverwritePrompt
        }), 
        PromotePrompt = not not l_showPromotePrompt_0 and v6.createElement(v23, {
            PromptText = l_Localization_0:getText("Dialog", "PromotePrompt"), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_0:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_0:getText("Dialog", "Confirm"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonClicked = function(v77)
                v52.hidePromotePrompt();
                if v77 then
                    l_props_3.PromoteKeyframeSequence(l_props_3.Analytics);
                end;
            end, 
            OnClose = v52.hidePromotePrompt
        }) or nil, 
        LoadNewPrompt = l_loadingName_1 and v6.createElement(v24, {
            PromptText = l_Localization_0:getText("Title", "ConfirmSave"), 
            InputText = l_Localization_0:getText("Dialog", "AnimationName"), 
            NoticeText = l_Localization_0:getText("Dialog", "SaveLocation"), 
            Text = l_AnimationName_0, 
            Buttons = {
                {
                    Key = "Delete", 
                    Text = l_Localization_0:getText("Dialog", "Delete"), 
                    Style = "Round"
                }, 
                {
                    Key = false, 
                    Text = l_Localization_0:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_0:getText("Dialog", "Save"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonClicked = function(v78)
                if v78 == "Delete" then
                    v52.handleLoadNewPrompt();
                end;
            end, 
            OnTextSubmitted = function(v79)
                l_props_3.SaveAnimation(v79, l_props_3.Analytics);
                v52.handleLoadNewPrompt();
            end, 
            OnClose = v52.hideLoadNewPrompt
        }), 
        CreateAnimationFromVideoTutorial = l_showCreateAnimationFromVideoTutorial_0 and v6.createElement(v23, {
            PromptText = l_Localization_0:getText("AnimationFromVideo", "TutorialText"), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_0:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_0:getText("AnimationFromVideo", "ChooseVideo"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonClicked = function(v80)
                v52.setShowCreateAnimationFromVideoTutorial(false);
                if v80 then
                    v52.continueAfterCreateAnimationFromVideoTutorial();
                end;
            end, 
            OnClose = function()
                v52.setShowCreateAnimationFromVideoTutorial(false);
            end
        }), 
        CreateAnimationFromVideoAgeGate = v71 and v6.createElement(v23, {
            Size = UDim2.new(0, v8.PROMPT_SIZE.Width.Offset, 0, 180), 
            PromptText = l_Localization_0:getText("AnimationFromVideo", "AgeRestricted"), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_0:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }
            }, 
            OnButtonClicked = function()
                v52.setShowCreateAnimationFromVideoTutorial(false);
            end, 
            OnClose = function()
                v52.setShowCreateAnimationFromVideoTutorial(false);
            end
        })
    });
end;
return v7.connect(function(v81, _)
    return {
        Analytics = v81.Analytics, 
        IsDirty = v81.Status.IsDirty, 
        ReadOnly = v81.Status.ReadOnly
    };
end, function(v83)
    return {
        LoadAnimationData = function(v84, v85)
            v83(v31(v84, v85));
        end, 
        LoadAnimation = function(v86, v87, v88)
            v83(v30(v86, v87, v88));
        end, 
        SaveAnimation = function(v89, v90)
            v83(v33(v89, v90));
        end, 
        ImportKeyframeSequence = function(v91, v92)
            v83(v28(v91, v92));
        end, 
        ImportFBXAnimationUserMayChooseModel = function(v93, v94, v95)
            v83(v27(v93, v94, v95));
        end, 
        CreateFromVideoAndImportFBXAnimationUserMayChooseModel = function(v96, v97, v98)
            v83(v26(v96, v97, v98));
        end, 
        ImportLoadedFBXAnimation = function(v99, v100, v101)
            v83(v29(v99, v100, v101));
        end, 
        SanitizeAnimation = function(v102)
            v83(v32(v102));
        end, 
        SetInReviewState = function(v103)
            v83(v14(v103));
        end, 
        SetIsDirty = function(v104)
            v83(v15(v104));
        end, 
        SetIsLegacyAnimSaves = function(v105)
            v83(v16(v105));
        end, 
        SetPlayState = function(v106)
            v83(v17(v106));
        end, 
        SetReduceKeyframesDialogMode = function(v107)
            v83(v18(v107));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Analytics = l_ContextServices_0.Analytics
})(v34)));
