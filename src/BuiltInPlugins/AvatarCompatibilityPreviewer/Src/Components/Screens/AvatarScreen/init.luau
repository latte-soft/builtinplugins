local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_Pane_0 = v2.UI.Pane;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Signal_0 = v2.Util.Signal;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v10 = require(l_script_FirstAncestor_0.Src.Components.AssetPalettes);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Catalog);
local v12 = require(l_script_FirstAncestor_0.Src.Components.ContextStack);
local v13 = require(l_script_FirstAncestor_0.Src.Components.ContextStack_DEPRECATED);
local v14 = require(l_script_FirstAncestor_0.Src.Components.DisambiguationMenuContext);
local v15 = require(l_script_FirstAncestor_0.Src.Components.EditingTools);
local v16 = require(l_script_FirstAncestor_0.Src.Components.PrimaryDummyPreview);
local v17 = require(l_script_FirstAncestor_0.Src.Components.StageSelector);
local v18 = require(l_script_FirstAncestor_0.Src.Components.TabBar);
local v19 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationNotice);
local v20 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v22 = require(script.ContextualSurveyDialogButton);
local v23 = require(script.Stages);
local v24 = require(l_script_FirstAncestor_0.Src.Hooks.useAccessoryWelding);
local v25 = require(l_script_FirstAncestor_0.Src.Hooks.useBodyPartsFromBase);
local v26 = require(l_script_FirstAncestor_0.Src.Hooks.useClothingFromInstances);
local v27 = require(l_script_FirstAncestor_0.Src.Hooks.useCopyPropertyChanges);
local v28 = require(l_script_FirstAncestor_0.Src.Hooks.useDummyFromHumanoidDescription);
local v29 = require(l_script_FirstAncestor_0.Src.Hooks.useMoveAccessoriesAlongsideAttachments);
local v30 = require(l_script_FirstAncestor_0.Src.Hooks.useIncrementedState);
local v31 = require(l_script_FirstAncestor_0.Src.Hooks.useInitialImportController);
local v32 = require(l_script_FirstAncestor_0.Src.Hooks.usePreviewHumanoidDescription);
local v33 = require(l_script_FirstAncestor_0.Src.Hooks.useTrackNewChildrenController);
local v34 = require(l_script_FirstAncestor_0.Src.Hooks.useUntexturedController);
local v35 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v36 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v37 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v38 = require(l_script_FirstAncestor_0.Src.Util.SimpleSerializedStateContext);
local v39 = require(l_script_FirstAncestor_0.Src.Util.getPaletteFromKey);
local v40 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v41 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEditingTools);
local v42 = v41();
local v43 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerPickTabsMenu);
local v44 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerReorganizeCheckFace);
local v45 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerTestWithAssets);
local v46 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local function _(v47)
    return v20[v47][1].Key;
end;
local function v50(v49)
    v31(v49.WorldModel);
    v33(v49.WorldModel);
    if v42 then
        v27(v49.WorldModel, v49.Dummy, v49.UpdateHumanoidDescription);
    end;
end;
return function(v51)
    local v52 = l_Stylizer_0:use("AvatarScreen");
    local v53 = l_Stylizer_0:use("StageSelector");
    local v54 = v3.useContext(v37);
    local v55 = v3.useContext(v38);
    local v56 = v23[v55.stage];
    local l_WorldModel_0 = v51.Avatar.WorldModel;
    local v58, v59 = v3.useState(v56.tabs[1]);
    assert(v58 ~= nil, "Current stage didn't have a tab");
    local v60, v61 = v3.useState(v20[v58][1].Key);
    local v63 = v1.find(v20[v58], function(v62)
        return v62.Key == v60;
    end);
    v3.useEffect(function()
        if v44() and table.find(v56.tabs, v58) ~= nil then
            return ;
        else
            local v64 = v56.tabs[1];
            v59(v64);
            v61(v20[v64][1].Key);
            return ;
        end;
    end, {
        v56
    });
    local v70 = v3.useCallback(function(v65)
        local _, v67 = v39(v65);
        assert(v67 ~= nil, "Selecting palette that doesn't exist");
        v61(v65);
        v59(v67);
        for v68, v69 in v23, nil, nil do
            if table.find(v69.tabs, v67) ~= nil then
                v55.setStage(v68);
                return ;
            end;
        end;
        error((("Invalid stage for %* (in %*)"):format(v65, v67)));
    end, {
        v55.setStage
    });
    local v71, v72 = v3.useState({});
    local v73, v74 = v3.useState(0);
    local v75 = v28(l_WorldModel_0, (v32(v51.Avatar, {
        v73
    })));
    v25(v75, l_WorldModel_0);
    v26(v75);
    v34(v75, v55.isTextured);
    v24(v75);
    if v42 then
        v29(v75);
    end;
    local v76 = v3.useRef(l_Signal_0.new());
    assert(v76.current ~= nil, v36.LUAU_ANALYZE_ERROR);
    local v77 = v3.useCallback(function()
        v76.current:Fire();
    end, {});
    local v78 = v30();
    local v79 = l_LayoutOrderIterator_0.new();
    local v82 = {
        AvatarScreen = v3.createElement(l_Pane_0, {}, {
            StageSelect = v3.createElement(v17, {
                SelectedStage = v55.stage, 
                SetStage = v55.setStage, 
                Avatar = v51.Avatar, 
                PreviewDummy = if not v45() then nil else v75
            }), 
            Contents = v3.createElement(l_Pane_0, {
                Position = UDim2.fromOffset(v53.Width, 0), 
                Size = UDim2.new(1, -v53.Width, 1, 0)
            }, {
                Tabs = v3.createElement(l_Pane_0, {
                    Position = UDim2.fromOffset(0, v52.Tabs.VerticalOffset), 
                    Size = UDim2.new(1, 0, 0, v52.Tabs.Height), 
                    Layout = Enum.FillDirection.Vertical
                }, {
                    TabBar = v3.createElement(v18, {
                        LayoutOrder = v79:getNextOrder(), 
                        Tabs = v56.tabs, 
                        SelectedTab = v58, 
                        SetSelectedTab = function(v80)
                            v59(v80);
                            v61(v20[v80][1].Key);
                        end
                    }), 
                    AssetPalettes = v3.createElement(v10, {
                        LayoutOrder = if not v43() then nil else v79:getNextOrder(), 
                        SelectedTab = v58, 
                        SelectedPalette = v60, 
                        SetSelectedPalette = v61, 
                        ScrollingFrameProps = if not v43() then {
                            LayoutOrder = v79:getNextOrder()
                        } else nil
                    })
                }), 
                Contents = v3.createElement(l_Pane_0, {
                    AnchorPoint = Vector2.new(0, 1), 
                    Position = UDim2.fromScale(0, 1), 
                    Size = UDim2.new(1, 0, 1, -v52.Tabs.Height)
                }, {
                    CatalogContainer = v63 and v3.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundColor3 = v52.AssetPalettes.BackgroundColor, 
                        Size = UDim2.new(0, v52.AssetPalettes.Width, 1, 0)
                    }, {
                        CatalogContainer = v3.createElement(l_Pane_0, {
                            Size = UDim2.new(1, -v52.AssetPalettes.SeparatorWidth, 1, 0)
                        }, {
                            Catalog = v3.createElement(v11, {
                                Palette = v63
                            })
                        }), 
                        Separator = v3.createElement(l_Pane_0, {
                            AnchorPoint = Vector2.new(1, 0), 
                            BackgroundColor3 = v52.AssetPalettes.SeparatorColor, 
                            Position = UDim2.fromScale(1, 0), 
                            Size = UDim2.new(0, v52.AssetPalettes.SeparatorWidth, 1, 0)
                        })
                    }), 
                    Preview = v3.createElement(l_Pane_0, {
                        AnchorPoint = Vector2.new(1, 0), 
                        Position = UDim2.fromScale(1, 0), 
                        Size = UDim2.new(1, not v63 and 0 or -v52.AssetPalettes.Width, 1, 0)
                    }, {
                        DummyPreview = v3.createElement(v16, {
                            Dummy = v75, 
                            Avatar = v51.Avatar, 
                            RevertToDefault = function()
                                if l_WorldModel_0 == nil then
                                    return ;
                                else
                                    v54.removeAllEquippedItems();
                                    return ;
                                end;
                            end, 
                            ResetCameraSignal = v76.current
                        }), 
                        UGCValidationNotice = v3.createElement(v19, {
                            Avatar = l_WorldModel_0
                        }), 
                        if v55.stage == "CheckBody" then v3.createElement(v23.CheckBody.render, {
                            Avatar = v51.Avatar, 
                            Dummy = v75, 
                            SelectedTab = v58
                        }) else if v55.stage == "CheckFace" then v3.createElement(v23.CheckFace.render, {
                            Avatar = v51.Avatar, 
                            Dummy = v75, 
                            SelectedTab = v58
                        }) else error((("Unknown stage %*"):format(v55.stage))), 
                        ContextualSurveyDialogButton = v40() and v3.createElement(v22, {
                            Avatar = v51.Avatar
                        })
                    })
                })
            })
        }), 
        InitialImport = v3.createElement(v50, {
            WorldModel = l_WorldModel_0, 
            Dummy = v75, 
            UpdateHumanoidDescription = function()
                v74(function(v81)
                    return v81 + 1;
                end);
            end
        }), 
        [v36.EDITING_TOOLS_GUI_NAMES.EditingToolbar] = v41() and v3.createElement(v15, {
            worldModel = l_WorldModel_0
        })
    };
    if not v46() then
        if not v40() then
            return v3.createElement(v13, {
                providers = {
                    {
                        provider = v35.Provider, 
                        value = {
                            openPalette = v70, 
                            resetCamera = v77, 
                            stage = v56, 
                            dummyPreviewLocked = v78.amount > 0, 
                            incrementDummyPreviewLock = v78.increment, 
                            decrementDummyPreviewLock = v78.decrement
                        }
                    }, 
                    {
                        provider = v14.Provider
                    }
                }
            }, v82);
        else
            return v3.createElement(v12, {
                providers = {
                    v3.createElement(v35.Provider, {
                        openPalette = 3, 
                        value = {
                            openPalette = v70, 
                            focusedAttachments = if not v42 then nil else v71, 
                            setFocusedAttachments = if not v42 then nil else v72, 
                            dummyPreviewLocked = v78.amount > 0, 
                            incrementDummyPreviewLock = v78.increment, 
                            decrementDummyPreviewLock = v78.decrement, 
                            resetCamera = v77, 
                            stage = v56
                        }
                    }), 
                    v3.createElement(v14.Provider)
                }
            }, v82);
        end;
    else
        return v3.createElement(v12, {
            providers = {
                v3.createElement(v9.Provider, {
                    openPalette = v70, 
                    resetCamera = v77, 
                    stage = v56, 
                    selectedAvatar = l_WorldModel_0
                }), 
                v3.createElement(v14.Provider)
            }
        }, v82);
    end;
end;
