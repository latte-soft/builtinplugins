local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Button_0 = l_UI_0.Button;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Dialog_0 = l_UI_0.Dialog;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TimeProgressBar_0 = l_UI_0.TimeProgressBar;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local _ = v2.Util.StyleModifier;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local v24 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedMeshParts);
local v25 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v26 = require(l_script_FirstAncestor_0.Src.Util.GenerationsContext);
local v27 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v28 = require(l_script_FirstAncestor_0.Src.Util.setTexture);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_GuiService_0 = game:GetService("GuiService");
local l_Workspace_0 = game:GetService("Workspace");
local v33 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
local v34 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetryIncludeLocalId);
local v35 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorAddFeedback);
local function v38(v36, v37)
    return {
        {
            Id = v25.DROPDOWN_ACTIONS.INSERT, 
            Text = v36:getText("DropdownOptions", "Insert"), 
            OnItemClicked = v37
        }, 
        {
            Id = v25.DROPDOWN_ACTIONS.INVENTORY, 
            Text = v36:getText("DropdownOptions", "Inventory"), 
            OnItemClicked = v37
        }, 
        {
            Id = v25.DROPDOWN_ACTIONS.EXPORT, 
            Text = v36:getText("DropdownOptions", "Export"), 
            OnItemClicked = v37
        }, 
        {
            Id = v25.DROPDOWN_ACTIONS.REMOVE, 
            Text = v36:getText("DropdownOptions", "Remove"), 
            OnItemClicked = v37
        }
    };
end;
local _ = function(v39, v40)
    return v3.useMemo(function()
        if not v39 then
            return nil;
        else
            local l_Model_0 = Instance.new("Model");
            for _, v43 in v39, nil, nil do
                local v44 = v43:Clone();
                if v40 then
                    v28(v44, v40);
                end;
                v44.Parent = l_Model_0;
            end;
            return l_Model_0;
        end;
    end, {
        v39, 
        v40
    });
end;
local function _(v46, v47)
    local l_ViewportSize_0 = v47.ViewportSize;
    return (v46.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(v47.FieldOfView / 2))) * math.min(1, l_ViewportSize_0.X / l_ViewportSize_0.Y))));
end;
local function v57(v50)
    local v51 = l_Localization_0:use();
    local v52 = l_LayoutOrderIterator_0.new();
    local l_startTime_0 = v50.Generation.startTime;
    local v54 = tonumber(v50.Generation.estimatedWaitDurationSeconds);
    local l_previewImage_0 = v50.Generation.previewImage;
    local v56 = l_Stylizer_0:use("GenerationCard");
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = v56.Padding, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Size = UDim2.fromScale(1, 0)
    }, {
        PreviewImage = if not l_previewImage_0 then nil else v3.createElement(l_Image_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v52:getNextOrder(), 
            Size = v56.PreviewImageSize, 
            Image = l_previewImage_0.previewId, 
            Position = UDim2.fromScale(0.5, 0.5)
        }), 
        Content = if not v54 then v3.createElement(l_TextLabel_0, {
            LayoutOrder = v52:getNextOrder(), 
            Size = v56.PromptLabelProgressSize, 
            Text = v50.Generation.prompt, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }) else v3.createElement(l_TimeProgressBar_0, {
            LayoutOrder = v52:getNextOrder(), 
            StartTime = l_startTime_0, 
            TotalTime = v54, 
            Width = v56.ProgressBarWidth
        }), 
        CancelButton = v3.createElement(l_Button_0, {
            LayoutOrder = v52:getNextOrder(), 
            Size = v56.CancelButtonSize, 
            OnClick = v50.OnCancel, 
            Style = v56.CancelButtonStyle, 
            Text = v51:getText("GenerationCard", "Cancel")
        })
    });
end;
local function v105(v58)
    local v59 = v3.useContext(v26);
    local v60 = l_Localization_0:use();
    local v61 = l_ContextServices_0.Plugin:use():get();
    local v62 = l_LayoutOrderIterator_0.new();
    local v63 = l_LayoutOrderIterator_0.new();
    local v64 = l_Analytics_0:use();
    local v65 = l_Stylizer_0:use("GenerationCard");
    local l_Generation_0 = v58.Generation;
    local l_status_0 = l_Generation_0.status;
    local v68 = nil;
    if l_status_0 == v25.STATUS.COMPLETED then
        v68 = l_Generation_0.prompt or "";
    elseif not l_Generation_0.message then
        if l_Generation_0.errors then
            v68 = l_Generation_0.errors[1];
        end;
    else
        v68 = l_Generation_0.message;
    end;
    local l_textureIds_0 = l_Generation_0.textureIds;
    local l_meshParts_0 = l_Generation_0.meshParts;
    local v75 = v3.useMemo(function()
        if not l_meshParts_0 then
            return nil;
        else
            local l_Model_1 = Instance.new("Model");
            for _, v73 in l_meshParts_0, nil, nil do
                local v74 = v73:Clone();
                if l_textureIds_0 then
                    v28(v74, l_textureIds_0);
                end;
                v74.Parent = l_Model_1;
            end;
            return l_Model_1;
        end;
    end, {
        l_meshParts_0, 
        l_textureIds_0
    });
    local v76 = if not not v35() and l_status_0 == v25.STATUS.COMPLETED then v65.PromptLabelCompletedSize else v65.PromptLabelSize;
    local v90 = v38(v60, function(v77)
        if v77.Id == v25.DROPDOWN_ACTIONS.INSERT then
            local l_Model_2 = Instance.new("Model");
            local v79 = CFrame.new();
            local v80 = Vector3.new();
            for _, v82 in l_meshParts_0, nil, nil do
                local v83 = v82:Clone();
                v83.Parent = l_Model_2;
                if l_Generation_0.textureIds then
                    v28(v83, l_Generation_0.textureIds);
                end;
                if v80.Magnitude < v82.Size.Magnitude then
                    v80 = v82.Size;
                    v79 = v82.CFrame;
                end;
            end;
            l_Model_2.Parent = l_Workspace_0;
            local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
            l_CurrentCamera_0.CameraType = Enum.CameraType.Fixed;
            local l_v80_0 = v80;
            local l_ViewportSize_1 = l_CurrentCamera_0.ViewportSize;
            local v87 = (l_v80_0.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(l_CurrentCamera_0.FieldOfView / 2))) * math.min(1, l_ViewportSize_1.X / l_ViewportSize_1.Y))));
            l_v80_0 = l_CurrentCamera_0.CFrame;
            l_CurrentCamera_0.CFrame = ((l_v80_0 - l_v80_0.Position) + v79.Position) - l_v80_0.LookVector * v87;
            l_CurrentCamera_0.Focus = v79;
            return ;
        elseif v77.Id == v25.DROPDOWN_ACTIONS.INVENTORY then
            l_GuiService_0:OpenBrowserWindow(v25.INVENTORY_URL);
            return ;
        else
            if v77.Id == v25.DROPDOWN_ACTIONS.EXPORT then
                PluginManager():ExportSelection();
                if v33() then
                    local v88 = nil;
                    if v34() then
                        v88 = l_Generation_0.uuid;
                    end;
                    v64:report("ExportGeneratedTexture", l_Generation_0.serverId, l_Generation_0.meshParts, l_Generation_0.prompt, l_Generation_0.seed, l_Generation_0.rotation, l_Generation_0.smartUVUnwrap, l_Generation_0.promptMasking, l_Generation_0.textureIds, v88);
                    return ;
                end;
            elseif v77.Id == v25.DROPDOWN_ACTIONS.REMOVE then
                v59.updateGeneration({
                    action = v25.GENERATION_ACTIONS.REMOVE, 
                    uuid = v58.Generation.uuid
                });
                if v33() then
                    local v89 = nil;
                    if v34() then
                        v89 = l_Generation_0.uuid;
                    end;
                    v64:report("RemoveGeneratedTexture", l_Generation_0.serverId, l_Generation_0.meshParts, l_Generation_0.prompt, l_Generation_0.seed, l_Generation_0.rotation, l_Generation_0.smartUVUnwrap, l_Generation_0.promptMasking, l_Generation_0.textureIds, v89);
                end;
            end;
            return ;
        end;
    end);
    local l_rotation_0 = l_Generation_0.rotation;
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = v65.Padding, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        InstanceView = if not v75 then nil else v3.createElement(l_AssetRenderModel_0, {
            LayoutOrder = v62:getNextOrder(), 
            Model = v75, 
            Size = v65.InstanceViewSize, 
            Static = true, 
            BackgroundColor3 = v65.BackgroundColor, 
            FocusDirection = v3.useMemo(function()
                if not l_rotation_0 then
                    return v25.INITIAL_FOCUS_DIRECTION;
                else
                    return CFrame.fromEulerAnglesYXZ(-math.rad(l_rotation_0.X), -math.rad(l_rotation_0.Y), -math.rad(l_rotation_0.Z)) * v25.INITIAL_FOCUS_DIRECTION;
                end;
            end, {
                l_rotation_0
            }), 
            LightColor = Color3.new(1, 1, 1), 
            LightDirection = -Vector3.new(1, 1, 1)
        }), 
        PromptLabel = v3.createElement(l_TextLabel_0, {
            LayoutOrder = v62:getNextOrder(), 
            Size = v76, 
            Style = l_status_0 == v25.STATUS.FAILED and "Warning" or nil, 
            Text = v68, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }), 
        ThumbsUpButton = if not not v35() and l_status_0 == v25.STATUS.COMPLETED then v3.createElement(l_Button_0, {
            DisableHover = l_Generation_0.accepted ~= nil, 
            LayoutOrder = v62:getNextOrder(), 
            Size = v65.MenuButtonSize, 
            Style = "RoundSubtle", 
            OnClick = function()
                if l_Generation_0.accepted ~= nil then
                    return ;
                else
                    local v92 = table.clone(l_Generation_0);
                    v92.accepted = true;
                    v59.updateGeneration({
                        action = v25.GENERATION_ACTIONS.UPDATE, 
                        uuid = v58.Generation.uuid, 
                        data = v92
                    });
                    if v33() then
                        local v93 = nil;
                        if v34() then
                            v93 = l_Generation_0.uuid;
                        end;
                        v64:report("SendFeedback", l_Generation_0.serverId, l_Generation_0.meshParts, l_Generation_0.prompt, l_Generation_0.seed, l_Generation_0.rotation, l_Generation_0.smartUVUnwrap, l_Generation_0.promptMasking, l_Generation_0.textureIds, v93, true);
                    end;
                    return ;
                end;
            end
        }, {
            Icon = v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = if not l_Generation_0.accepted then v65.ThumbsUpOutlineIcon else v65.ThumbsUpIcon, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(16, 16)
            })
        }) else nil, 
        ThumbsDownButton = if not not v35() and l_status_0 == v25.STATUS.COMPLETED then v3.createElement(l_Button_0, {
            DisableHover = l_Generation_0.accepted ~= nil, 
            LayoutOrder = v62:getNextOrder(), 
            Size = v65.MenuButtonSize, 
            Style = "RoundSubtle", 
            OnClick = function()
                if l_Generation_0.accepted ~= nil then
                    return ;
                else
                    local v94 = table.clone(l_Generation_0);
                    v94.showFeedbackDialog = true;
                    v94.feedbackTable = {
                        promptCheckbox = false, 
                        qualityCheckbox = false, 
                        resolutionCheckbox = false, 
                        looksCheckbox = false, 
                        otherNotes = ""
                    };
                    v59.updateGeneration({
                        action = v25.GENERATION_ACTIONS.UPDATE, 
                        uuid = v58.Generation.uuid, 
                        data = v94
                    });
                    return ;
                end;
            end
        }, {
            Icon = v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = if not (l_Generation_0.accepted ~= nil) or l_Generation_0.accepted then v65.ThumbsDownOutlineIcon else v65.ThumbsDownIcon, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(16, 16)
            })
        }) else nil, 
        Button = v3.createElement(l_Button_0, {
            LayoutOrder = v62:getNextOrder(), 
            Size = v65.MenuButtonSize, 
            Style = "RoundSubtle", 
            OnClick = function()
                if l_status_0 == v25.STATUS.FAILED then
                    v59.updateGeneration({
                        action = v25.GENERATION_ACTIONS.REMOVE, 
                        uuid = v58.Generation.uuid
                    });
                    return ;
                else
                    l_showContextMenu_0(v61, v90);
                    return ;
                end;
            end
        }, {
            Icon = if l_status_0 == v25.STATUS.FAILED then v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/DeveloperFramework/close.png", 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(16, 16), 
                Style = "ColoredWarning"
            }) else v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/StudioSharedUI/MeatballMenu.png", 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(24, 24)
            })
        }), 
        FeedbackFrom = if not not v35() and l_Generation_0.showFeedbackDialog then v3.createElement(l_Dialog_0, {
            Enabled = l_Generation_0.showFeedbackDialog, 
            Size = Vector2.new(600, 400), 
            Title = v60:getText("FeedbackDialog", "Title"), 
            OnClose = function()
                local v95 = table.clone(l_Generation_0);
                v95.showFeedbackDialog = false;
                v59.updateGeneration({
                    action = v25.GENERATION_ACTIONS.UPDATE, 
                    uuid = v58.Generation.uuid, 
                    data = v95
                });
            end
        }, {
            Frame = v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Padding = 16
            }, {
                Title = v3.createElement(l_ExpandablePane_0, {
                    AlwaysExpanded = true, 
                    ContentPadding = 10, 
                    ContentSpacing = 15, 
                    Style = "Title", 
                    Text = v60:getText("FeedbackDialog", "Title"), 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }, {
                    Checkboxes = v3.createElement(l_TitledFrame_0, {
                        Title = v60:getText("FeedbackDialog", "CheckboxTitle"), 
                        LayoutOrder = v63:getNextOrder()
                    }, {
                        PromptCheckbox = v3.createElement(l_Checkbox_0, {
                            Checked = l_Generation_0.feedbackTable.promptCheckbox, 
                            LayoutOrder = v63:getNextOrder(), 
                            Text = v60:getText("FeedbackDialog", "PromptCheckbox"), 
                            OnClick = function()
                                local v96 = table.clone(l_Generation_0);
                                l_Generation_0.feedbackTable.promptCheckbox = not l_Generation_0.feedbackTable.promptCheckbox;
                                v59.updateGeneration({
                                    action = v25.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v58.Generation.uuid, 
                                    data = v96
                                });
                            end
                        }), 
                        QualityCheckbox = v3.createElement(l_Checkbox_0, {
                            Checked = l_Generation_0.feedbackTable.qualityCheckbox, 
                            LayoutOrder = v63:getNextOrder(), 
                            Text = v60:getText("FeedbackDialog", "QualityCheckbox"), 
                            OnClick = function()
                                local v97 = table.clone(l_Generation_0);
                                l_Generation_0.feedbackTable.qualityCheckbox = not l_Generation_0.feedbackTable.qualityCheckbox;
                                v59.updateGeneration({
                                    action = v25.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v58.Generation.uuid, 
                                    data = v97
                                });
                            end
                        }), 
                        ResolutionCheckbox = v3.createElement(l_Checkbox_0, {
                            Checked = l_Generation_0.feedbackTable.resolutionCheckbox, 
                            LayoutOrder = v63:getNextOrder(), 
                            Text = v60:getText("FeedbackDialog", "ResolutionCheckbox"), 
                            OnClick = function()
                                local v98 = table.clone(l_Generation_0);
                                l_Generation_0.feedbackTable.resolutionCheckbox = not l_Generation_0.feedbackTable.resolutionCheckbox;
                                v59.updateGeneration({
                                    action = v25.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v58.Generation.uuid, 
                                    data = v98
                                });
                            end
                        }), 
                        LooksCheckbox = v3.createElement(l_Checkbox_0, {
                            Checked = l_Generation_0.feedbackTable.looksCheckbox, 
                            LayoutOrder = v63:getNextOrder(), 
                            Text = v60:getText("FeedbackDialog", "LooksCheckbox"), 
                            OnClick = function()
                                local v99 = table.clone(l_Generation_0);
                                l_Generation_0.feedbackTable.looksCheckbox = not l_Generation_0.feedbackTable.looksCheckbox;
                                v59.updateGeneration({
                                    action = v25.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v58.Generation.uuid, 
                                    data = v99
                                });
                            end
                        })
                    }), 
                    FreeformText = v3.createElement(l_TitledFrame_0, {
                        Title = v60:getText("FeedbackDialog", "OtherNotesTitle"), 
                        LayoutOrder = v63:getNextOrder()
                    }, {
                        TextInput = v3.createElement(l_TextInput_0, {
                            Size = UDim2.new(1, 0, 0, 120), 
                            MultiLine = true, 
                            MaxLength = 1000, 
                            Text = l_Generation_0.feedbackTable.otherNotes, 
                            OnTextChanged = function(v100)
                                local v101 = table.clone(l_Generation_0);
                                v101.feedbackTable.otherNotes = v100;
                                v59.updateGeneration({
                                    action = v25.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v58.Generation.uuid, 
                                    data = v101
                                });
                            end
                        })
                    })
                }), 
                Separator = v3.createElement(l_Separator_0, {
                    LayoutOrder = 2, 
                    Weight = 5
                }), 
                ButtonPane = v3.createElement(l_Pane_0, {
                    Size = UDim2.new(1, 0, 0, 70), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    Layout = Enum.FillDirection.Horizontal, 
                    Spacing = 10, 
                    LayoutOrder = 3
                }, {
                    CancelButton = v3.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(70, 40), 
                        Style = "Round", 
                        Text = v60:getText("GenerationCard", "Cancel"), 
                        OnClick = function()
                            local v102 = table.clone(l_Generation_0);
                            v102.showFeedbackDialog = false;
                            v59.updateGeneration({
                                action = v25.GENERATION_ACTIONS.UPDATE, 
                                uuid = v58.Generation.uuid, 
                                data = v102
                            });
                        end
                    }), 
                    SubmitButton = v3.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        Size = UDim2.fromOffset(150, 40), 
                        Style = "RoundPrimary", 
                        Text = v60:getText("FeedbackDialog", "SubmitButton"), 
                        OnClick = function()
                            local v103 = table.clone(l_Generation_0);
                            v103.accepted = false;
                            v103.showFeedbackDialog = false;
                            v59.updateGeneration({
                                action = v25.GENERATION_ACTIONS.UPDATE, 
                                uuid = v58.Generation.uuid, 
                                data = v103
                            });
                            if v33() then
                                local v104 = nil;
                                if v34() then
                                    v104 = l_Generation_0.uuid;
                                end;
                                v64:report("SendFeedback", l_Generation_0.serverId, l_Generation_0.meshParts, l_Generation_0.prompt, l_Generation_0.seed, l_Generation_0.rotation, l_Generation_0.smartUVUnwrap, l_Generation_0.promptMasking, l_Generation_0.textureIds, v104, false, l_Generation_0.feedbackTable);
                            end;
                        end
                    })
                })
            })
        }) else nil
    });
end;
return function(v106)
    local v107 = l_Stylizer_0:use("GenerationCard");
    local v108 = v3.useContext(v26);
    local v109 = v27:use():get();
    local v110 = l_Analytics_0:use();
    local l_status_1 = v106.Generation.status;
    local v113 = v3.useCallback(function()
        l_TextureGenerationService_0:CancelGenerationRequest(v106.Generation.uuid);
        v108.updateGeneration({
            action = v25.GENERATION_ACTIONS.REMOVE, 
            uuid = v106.Generation.uuid
        });
        if v33() then
            local v112 = nil;
            if v34() then
                v112 = v106.Generation.uuid;
            end;
            v110:report("CancelTextureGeneration", v106.Generation.serverId or "", v106.Generation.meshParts, v106.Generation.prompt, v106.Generation.seed, v106.Generation.rotation, v106.Generation.smartUVUnwrap, v106.Generation.promptMasking, v112);
        end;
    end, {
        v106.Generation, 
        v108.updateGeneration
    });
    local v114 = v24();
    local v130 = v3.useCallback(function()
        if l_status_1 ~= v25.STATUS.COMPLETED then
            return ;
        elseif next(v114) ~= nil and v108.selected ~= v106.Generation.uuid then
            v108.setSelected(v106.Generation.uuid);
            for _, v116 in v114, nil, nil do
                v28(v116, v106.Generation.textureIds);
            end;
            return ;
        elseif next(v114) ~= nil and v108.selected == v106.Generation.uuid then
            v108.setSelected(nil);
            for _, v118 in v114, nil, nil do
                v28(v118, "");
            end;
            return ;
        else
            if next(v114) == nil and v108.selected ~= v106.Generation.uuid then
                local v119 = nil;
                local v120 = CFrame.new();
                local v121 = Vector3.new();
                local v122 = false;
                for _, v124 in v106.Generation.meshParts, nil, nil do
                    local l_SurfaceAppearance_0 = v124:FindFirstChildOfClass("SurfaceAppearance");
                    if l_SurfaceAppearance_0 then
                        v119 = l_SurfaceAppearance_0.ColorMap;
                    end;
                    if v121.Magnitude < v124.Size.Magnitude then
                        v121 = v124.Size;
                        v120 = v124.CFrame;
                    end;
                    if v124:IsDescendantOf(l_Workspace_0) then
                        v122 = true;
                    end;
                end;
                if v122 and v119 == v106.Generation.textureIds then
                    assert(v119, "No texture ID found");
                    v108.setSelected(v106.Generation.uuid);
                    v109:Set(v106.Generation.meshParts);
                    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                    l_CurrentCamera_1.CameraType = Enum.CameraType.Fixed;
                    local l_v121_0 = v121;
                    local l_ViewportSize_2 = l_CurrentCamera_1.ViewportSize;
                    local v129 = (l_v121_0.Magnitude / 2) / math.sin((math.atan(math.tan((math.rad(l_CurrentCamera_1.FieldOfView / 2))) * math.min(1, l_ViewportSize_2.X / l_ViewportSize_2.Y))));
                    l_v121_0 = l_CurrentCamera_1.CFrame;
                    l_CurrentCamera_1.CFrame = ((l_v121_0 - l_v121_0.Position) + v120.Position) - l_v121_0.LookVector * v129;
                    l_CurrentCamera_1.Focus = v120;
                end;
            end;
            return ;
        end;
    end, {
        l_status_1, 
        v114, 
        v108.selected, 
        v108.setSelected
    });
    local v131, v132 = v3.useState(0);
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v106.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, (math.max(v131, 46))), 
        Style = "CornerBox", 
        OnClick = v130
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 3)
        }), 
        Contents = v3.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Style = "CornerBox", 
            Size = UDim2.new(1, -2, 0, 0)
        }, {
            UIStroke = v3.createElement("UIStroke", {
                Thickness = 1, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = if l_status_1 == v25.STATUS.FAILED then v107.ErrorStrokeColor else if v108.selected == v106.Generation.uuid then v107.SelectedStrokeColor else v107.StrokeColor
            }, {
                Corner = v3.createElement("UICorner")
            }), 
            Generation = if l_status_1 == v25.STATUS.PENDING then v3.createElement(v57, {
                Generation = v106.Generation, 
                OnCancel = v113, 
                SetHeight = v132
            }) else v3.createElement(v105, {
                Generation = v106.Generation, 
                SetHeight = v132
            })
        })
    });
end;
