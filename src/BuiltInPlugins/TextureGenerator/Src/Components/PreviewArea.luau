local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local _ = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local _ = l_ContextServices_0.Stylizer;
local l_UI_0 = v4.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local v20 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedMeshParts);
local l_Stylizer_1 = v4.Style.Stylizer;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v25 = require(l_Util_0.Constants);
local v26 = require(l_Util_0.createHashFromMeshParts);
local v27 = require(l_Util_0.fetchAndSetQuotas);
local v28 = require(l_Util_0.GenerationsContext);
local v29 = require(l_Util_0.PreviewsContext);
local v30 = require(l_Util_0.OptionsContext);
local v31 = require(l_script_FirstAncestor_0.Src.Flags.getFIntTextureGeneratorMaxConcurrentGenerations);
local v32 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
local v33 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorPreviewAreaEnableSky);
local v34 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetryIncludeLocalId);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v37(v36)
    return v3.createElement(l_Pane_0, {
        Size = v36.Size, 
        LayoutOrder = v36.LayoutOrder
    }, {
        BackButton = v3.createElement(l_Button_0, {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(32, 32), 
            OnClick = v36.OnBackButtonClick, 
            Style = "Round"
        }, {
            Icon = v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/StudioSharedUI/Undo.png", 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(16, 16), 
                Style = "Colored"
            })
        }), 
        SaveButton = v3.createElement(l_Button_0, {
            LayoutOrder = 2, 
            AnchorPoint = Vector2.new(1, 0.5), 
            OnClick = v36.OnGenerateButtonClick, 
            Position = UDim2.fromScale(1, 0.5), 
            Size = v36.Style.GenerateButtonSize, 
            Style = v36.Style.GenerateButtonStyle, 
            StyleModifier = if v36.Enabled then nil else l_StyleModifier_0.Disabled, 
            Text = v36.GenerateButtonText
        }, {
            QuotaTooltip = v3.createElement(l_Tooltip_0, {
                Text = v36.QuotaTooltipText, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
return function(v38)
    local v39 = l_Analytics_0:use();
    local v40 = l_Localization_0:use();
    local v41 = v20();
    local v42 = v3.useContext(v28);
    local v43 = v3.useContext(v29);
    local v44 = v3.useContext(v30);
    local v45 = v40:getText("PreviewArea", "SaveApply");
    local v46 = string.format(v40:getText("General", "QuotaTooltip"), v42.quota, v42.total, v42.total);
    local l_prompt_0 = v38.PreviewData.prompt;
    local v48, v49 = v3.useState(1);
    local v50 = v38.PreviewData.allPreviews[v48];
    local v51 = #v38.PreviewData.allPreviews;
    local v53 = v3.useCallback(function()
        v49(function(v52)
            return v52 % v51 + 1;
        end);
    end, {
        v51
    });
    local v56 = v3.useCallback(function()
        v49(function(v54)
            local v55 = v54 - 1;
            if v55 == 0 then
                return v51;
            else
                return v55;
            end;
        end);
    end, {
        v51
    });
    v3.useEffect(function()
        v49(1);
    end, {
        v38.PreviewData.uuid
    });
    local v58 = v2.find(v38.PreviewData.allPreviews, function(v57)
        return v57.status == v25.STATUS.COMPLETED;
    end) ~= nil;
    local v59 = false;
    if v50 ~= nil then
        v59 = v50.status == v25.STATUS.COMPLETED;
    end;
    local v64 = v3.useMemo(function()
        local l_meshParts_0 = v38.PreviewData.meshParts;
        if not l_meshParts_0 then
            return nil;
        else
            local l_Model_0 = Instance.new("Model");
            for _, v63 in l_meshParts_0, nil, nil do
                v63:Clone().Parent = l_Model_0;
            end;
            return l_Model_0;
        end;
    end, {
        v38.PreviewData.meshParts
    });
    local v66 = v3.useMemo(function()
        local l_rotation_0 = v38.PreviewData.rotation;
        return CFrame.fromEulerAnglesYXZ(-math.rad(l_rotation_0.X), -math.rad(l_rotation_0.Y), -math.rad(l_rotation_0.Z)) * v25.INITIAL_FOCUS_DIRECTION;
    end, {
        v38.PreviewData.rotation
    });
    local v70 = v3.useMemo(function()
        local v67 = 0;
        for _, v69 in v42.generations, nil, nil do
            if v69.status == v25.STATUS.PENDING then
                v67 = v67 + 1;
            end;
        end;
        if v31() <= v67 then
            return true;
        else
            return false;
        end;
    end, {
        v42.generations
    });
    local v71, v72 = v3.useState(false);
    v3.useEffect(function()
        v72(v58 and not v70);
    end, {
        v58, 
        v70
    });
    v3.useEffect(function()
        if not (not (v38.PreviewData.previewUrlCount == 4) or v38.PreviewData.imageFailed < 2) or v38.PreviewData.previewUrlCount == 3 and v38.PreviewData.imageFailed >= 1 then
            v43.addError(v26(v41), "ImageFailed", v40:getText("EntryArea", "ErrorAlertTitle"), v40:getText("PreviewArea", "ImageFailed"), "error");
            v43.removePreview(v38.PreviewData.uuid);
        end;
    end, {
        v38.PreviewData.imageFailed, 
        v38.PreviewData.previewUrlCount
    });
    local v73 = v3.useCallback(function()
        v43.removePreview(v38.PreviewData.uuid);
        l_TextureGenerationService_0:CancelGenerationRequest(v38.PreviewData.uuid);
    end, {
        v38.PreviewData.uuid, 
        v43.removePreview
    });
    local v78 = v3.useCallback(function()
        if not (not v32() or v34()) then
            v39:report("GeneratedTexture", v38.PreviewData.serverId, v41, v38.PreviewData.prompt, v38.PreviewData.seed, v38.PreviewData.rotation, v44.smartUVUnwrap, v44.promptMasking, nil);
        end;
        v72(false);
        local l_status_0, l_result_0 = pcall(function()
            return l_TextureGenerationService_0:GenerateTexture(v38.PreviewData.uuid);
        end);
        if not (typeof(l_result_0) == "string") or l_result_0 ~= v25.MAX_GENERATIONS_MESSAGE then
            v43.removePreview(v38.PreviewData.uuid);
        end;
        v72(true);
        local v76 = nil;
        if not l_status_0 then
            v76 = {
                uuid = v38.PreviewData.uuid, 
                status = v25.STATUS.FAILED, 
                errors = {
                    l_result_0
                }
            };
        else
            v76 = l_result_0;
            v76.startTime = tick();
        end;
        v76.previewImage = v38.PreviewData.allPreviews[1];
        v76.meshParts = v41;
        v76.partGroup = l_TextureGenerationService_0:CreatePartGroup(v41);
        v76.rotation = v38.PreviewData.rotation;
        v76.seed = v38.PreviewData.seed;
        v76.prompt = v38.PreviewData.prompt;
        v76.smartUVUnwrap = v44.smartUVUnwrap;
        v76.promptMasking = v44.promptMasking;
        local v77 = v26(v41);
        v42.updateGeneration({
            action = v25.GENERATION_ACTIONS.UPDATE, 
            uuid = v76.uuid, 
            data = v76
        });
        v42.updateModelToGenerations({
            action = v25.GENERATION_ACTIONS.ADD, 
            hash = v77, 
            uuid = v76.uuid
        });
        if not (not v32() or not v34()) then
            v39:report("GeneratedTexture", v38.PreviewData.serverId, v41, v76.prompt, v76.seed, v76.rotation, v76.smartUVUnwrap, v76.promptMasking, v76.uuid);
        end;
        v27(v42, v43);
    end, {
        v41, 
        v42.updateGeneration, 
        v42.updateModelToGenerations, 
        v43.removePreview, 
        v44.smartUVUnwrap, 
        v38.PreviewData
    });
    local v79 = l_LayoutOrderIterator_0.new();
    local v80 = l_Stylizer_1:use("PreviewArea");
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        LayoutOrder = v38.LayoutOrder, 
        Padding = v80.Padding, 
        Size = v80.Size, 
        Style = "Box"
    }, {
        PreviewLabel = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = 1, 
            RichText = true, 
            Size = v80.PreviewLabelSize, 
            Text = v40:getText("General", "Preview"), 
            Style = v80.PreviewLabelStyle, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Display = v3.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = 2, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v80.Size
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 8)
            }), 
            ImageContainer = v3.createElement(l_Pane_0, {
                BackgroundColor3 = Color3.new(0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                ZIndex = v79:getNextOrder()
            }, {
                Corner = v3.createElement("UICorner"), 
                Image = if not v59 then nil else v3.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = v50.previewId
                }, {
                    UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint")
                }), 
                AssetRenderModel = if v59 then nil else v3.createElement(l_AssetRenderModel_0, {
                    BackgroundColor3 = v80.BackgroundColor, 
                    DisablePan = v80.DisablePan, 
                    DisableZoom = v80.DisableZoom, 
                    LayoutOrder = v79:getNextOrder(), 
                    Model = v64, 
                    Static = true, 
                    FocusDirection = v66, 
                    LightColor = Color3.new(0, 0, 0), 
                    LightDirection = Vector3.new(1, 1, 1), 
                    EnableSky = not not v33() or nil
                }), 
                LoadingIndicator = if v59 then nil else v3.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            }), 
            Controls = v58 and v3.createElement(l_Pane_0, {
                ZIndex = v79:getNextOrder()
            }, {
                PreviousButton = v3.createElement(l_IconButton_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    LeftIcon = v80.LeftIcon, 
                    Position = UDim2.new(0, 8, 0.5, 0), 
                    Style = "PreviewAreaImageRotateButton", 
                    OnClick = v56
                }), 
                NextButton = v3.createElement(l_IconButton_0, {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    LeftIcon = v80.RightIcon, 
                    Position = UDim2.new(1, -8, 0.5, 0), 
                    Style = "PreviewAreaImageRotateButton", 
                    OnClick = v53
                })
            })
        }), 
        PreviewActionArea = v3.createElement(l_Pane_0, {
            LayoutOrder = 4, 
            Padding = 10, 
            Size = UDim2.new(1, 0, 0, 140)
        }, {
            TextInput = v3.createElement(l_TextInput_0, {
                BottomComponent = v37, 
                BottomComponentProps = {
                    Enabled = v71, 
                    OnBackButtonClick = v73, 
                    GenerateButtonText = v45, 
                    OnGenerateButtonClick = v78, 
                    QuotaTooltipText = v46, 
                    Size = UDim2.new(1, 0, 0, 32), 
                    Style = v80
                }, 
                Disabled = true, 
                MultiLine = true, 
                Text = l_prompt_0, 
                Size = UDim2.new(1, 0, 0, 120)
            })
        })
    });
end;
