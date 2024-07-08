local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_LUAU_ANALYZE_ERROR_0 = require(l_script_FirstAncestor_0.Packages.ReactUtils).LUAU_ANALYZE_ERROR;
local l_ContextServices_0 = v1.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_MaterialPreview_0 = v2.Components.MaterialPreview;
local l_MaterialPreviewGeometryType_0 = v2.Enums.MaterialPreviewGeometryType;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v19 = require(l_Components_0.LoadingButton);
local v20 = require(l_Components_0.Settings.SelectInputSetting);
local v21 = require(l_Components_0.Settings.SliderSetting);
local v22 = require(l_Components_0.Settings.TextSetting);
local v23 = require(l_Components_0.Settings.ToggleButtonSetting);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v25 = require(l_script_FirstAncestor_0.Src.Hooks.useSelectedParts);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v28 = require(l_Util_0.Constants);
local v29 = require(l_Util_0.GeneratedMaterialsContext);
local v30 = require(l_Util_0.GenerationContext);
local v31 = require(l_Util_0.PluginSettingsContext);
local v32 = require(l_Util_0.PreviewContext);
local v33 = require(l_Util_0.SupportedMaterials);
local l_SETTING_GEOMETRY_TYPE_0 = v28.SETTING_GEOMETRY_TYPE;
local function v36(v35)
    return ("%.1f"):format(v35);
end;
local v37 = v33.getNames();
return function(v38)
    assert(v24(), "Expected FFlagMaterialGeneratorNewUI to be true");
    local v39 = v3.useContext(v32);
    local l_selectedMaterial_0 = v39.selectedMaterial;
    if l_selectedMaterial_0 then
        assert(l_selectedMaterial_0 ~= nil, l_LUAU_ANALYZE_ERROR_0);
        local l_setSelectedMaterial_0 = v39.setSelectedMaterial;
        local _, v43 = v3.useState(0);
        local v44, v45 = v3.useState(false);
        local v46 = v3.useContext(v29);
        local l_hasBaseMaterial_0 = v46.hasBaseMaterial;
        local l_markHasBaseMaterial_0 = v46.markHasBaseMaterial;
        local v49 = v46.getMaterialStatus(l_selectedMaterial_0);
        local l_uploadMaterialVariant_0 = v3.useContext(v30).uploadMaterialVariant;
        local v51 = if not l_hasBaseMaterial_0(l_selectedMaterial_0) then nil else l_selectedMaterial_0.BaseMaterial.Name;
        local v52 = l_Localization_0:use();
        local v53 = nil;
        if v44 then
            v53 = v52:getText("Editor", "BaseMaterialNotSetError");
        end;
        v3.useEffect(function()
            local v55 = l_selectedMaterial_0.Changed:Connect(function()
                v43(function(v54)
                    return v54 + 1;
                end);
            end);
            return function()
                v55:Disconnect();
            end;
        end, {
            l_selectedMaterial_0
        });
        local v57 = v3.useCallback(function(v56)
            l_selectedMaterial_0.StudsPerTile = v56;
        end, {
            l_selectedMaterial_0
        });
        local v59 = v3.useCallback(function(v58)
            l_selectedMaterial_0.Name = v58;
        end, {
            l_selectedMaterial_0
        });
        local v60 = v3.useCallback(function()
            if l_selectedMaterial_0.MaterialPattern == Enum.MaterialPattern.Regular then
                l_selectedMaterial_0.MaterialPattern = Enum.MaterialPattern.Organic;
                return ;
            else
                l_selectedMaterial_0.MaterialPattern = Enum.MaterialPattern.Regular;
                return ;
            end;
        end, {
            l_selectedMaterial_0
        });
        local v62 = v3.useCallback(function(v61)
            l_selectedMaterial_0.BaseMaterial = Enum.Material[v61];
            l_markHasBaseMaterial_0(l_selectedMaterial_0);
            v45(false);
        end, {
            l_selectedMaterial_0, 
            l_markHasBaseMaterial_0
        });
        local v63 = v25();
        local l_applySelectedMaterial_0 = v39.applySelectedMaterial;
        local v65 = v3.useCallback(function()
            if l_hasBaseMaterial_0(l_selectedMaterial_0) then
                l_uploadMaterialVariant_0(l_selectedMaterial_0);
                l_applySelectedMaterial_0();
                return ;
            else
                v45(true);
                return ;
            end;
        end, {
            l_selectedMaterial_0, 
            l_hasBaseMaterial_0, 
            l_uploadMaterialVariant_0, 
            l_applySelectedMaterial_0
        });
        local _ = v3.useCallback(function()
            if l_selectedMaterial_0 then
            end;
        end, {
            l_selectedMaterial_0
        });
        local v67 = v49 == "Uploaded";
        local v68 = v49 == "Uploading";
        local v69 = v3.useMemo(function()
            if v63 and #v63 > 0 then
                return v52:getText("Editor", "SaveAndApplyVariant");
            else
                return v52:getText("Editor", "Upload");
            end;
        end, {
            v63
        });
        local v70 = l_Stylizer_0:use("Editor");
        local l_LabelWidth_0 = v70.LabelWidth;
        local v72 = v3.useContext(v31);
        local v73 = v72.getSetting(l_SETTING_GEOMETRY_TYPE_0);
        local v74 = nil;
        if v73 then
            v74 = l_MaterialPreviewGeometryType_0.fromRawValue(v73);
        end;
        local v75 = l_ContextServices_0.Plugin.use():get();
        local v77 = v3.useCallback(function()
            local v76 = {
                {
                    Checked = v74 == l_MaterialPreviewGeometryType_0.Plane, 
                    Text = v52:getText("Browser", "PlanePreview"), 
                    Enabled = true, 
                    OnItemClicked = function()
                        v72.setSetting(l_SETTING_GEOMETRY_TYPE_0, (l_MaterialPreviewGeometryType_0.Plane.rawValue()));
                    end
                }, 
                {
                    Checked = v74 == l_MaterialPreviewGeometryType_0.Sphere, 
                    Text = v52:getText("Browser", "SpherePreview"), 
                    Enabled = true, 
                    OnItemClicked = function()
                        v72.setSetting(l_SETTING_GEOMETRY_TYPE_0, (l_MaterialPreviewGeometryType_0.Sphere.rawValue()));
                    end
                }
            };
            task.spawn(function()
                l_showContextMenu_0(v75, v76);
            end);
        end, {
            v74
        });
        local v78 = l_LayoutOrderIterator_0.new();
        return v3.createElement(l_Pane_0, {
            LayoutOrder = v38.LayoutOrder, 
            Size = v38.Size, 
            Style = "Box"
        }, {
            ScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
                AutomaticCanvasSize = Enum.AutomaticSize.Y
            }, {
                CloseButton = v3.createElement(l_Button_0, {
                    AnchorPoint = Vector2.new(1, 0), 
                    Position = UDim2.new(1, -2, 0, 2), 
                    Size = v70.CloseButtonSize, 
                    Style = "Close", 
                    OnClick = function()
                        l_setSelectedMaterial_0(nil);
                    end, 
                    ZIndex = 1000
                }), 
                KeyboardListener = v3.createElement(l_KeyboardListener_0, {
                    OnKeyPressed = function(_, v80)
                        if v80[Enum.KeyCode.Escape] then
                            l_setSelectedMaterial_0(nil);
                        end;
                    end
                }), 
                Content = v3.createElement(l_Pane_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Layout = Enum.FillDirection.Vertical
                }, {
                    PreviewPane = v3.createElement(l_Pane_0, {
                        BackgroundColor = v70.PreviewBackgroundColor, 
                        LayoutOrder = v78:getNextOrder(), 
                        Size = UDim2.new(1, 0, 0, v70.PreviewHeight)
                    }, {
                        Preview = v3.createElement(l_MaterialPreview_0, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            BackgroundColor = v70.PreviewBackgroundColor, 
                            DisableHover = true, 
                            DisableZoom = true, 
                            Material = l_selectedMaterial_0, 
                            MaterialPreviewGeometryType = v74, 
                            OnRightClick = v77, 
                            Position = UDim2.fromScale(0.5, 0), 
                            Size = UDim2.fromOffset(v70.PreviewHeight, v70.PreviewHeight)
                        })
                    }), 
                    SettingsPane = v3.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        LayoutOrder = v78:getNextOrder()
                    }, {
                        Settings = v3.createElement(l_Pane_0, {
                            AnchorPoint = Vector2.new(0.5, 0), 
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Layout = Enum.FillDirection.Vertical, 
                            LayoutOrder = v78:getNextOrder(), 
                            Padding = v70.SettingsPadding, 
                            Position = UDim2.fromScale(0.5, 0), 
                            Size = UDim2.fromOffset(300, 0), 
                            Spacing = v70.SettingSpacing
                        }, {
                            StudsPerTileSetting = v3.createElement(v21, {
                                LabelWidth = l_LabelWidth_0, 
                                LayoutOrder = v78:getNextOrder(), 
                                Min = v28.STUDS_PER_TILE_MIN, 
                                Max = v28.STUDS_PER_TILE_MAX, 
                                OnFormatValue = v36, 
                                OnValueChanged = v57, 
                                ShowValueLabel = false, 
                                Size = v70.StudsPerTileSettingSize, 
                                SnapIncrement = v28.STUDS_PER_TILE_SNAP_INCREMENT, 
                                Text = v52:getText("Editor", "StudsPerTile"), 
                                Value = l_selectedMaterial_0.StudsPerTile
                            }), 
                            MaterialPatternSetting = v3.createElement(v23, {
                                LayoutOrder = v78:getNextOrder(), 
                                LabelWidth = l_LabelWidth_0, 
                                OnValueChanged = v60, 
                                Text = v52:getText("Editor", "MaterialPattern"), 
                                UseCheckbox = true, 
                                CheckboxLabel = v52:getText("Editor", "MaterialPatternOrganic"), 
                                Value = l_selectedMaterial_0.MaterialPattern == Enum.MaterialPattern.Organic
                            }), 
                            NameSetting = v3.createElement(v22, {
                                LayoutOrder = v78:getNextOrder(), 
                                LabelWidth = l_LabelWidth_0, 
                                MaxLength = v28.INSTANCE_NAME_MAX_LENGTH, 
                                OnValueChanged = v59, 
                                Text = v52:getText("Editor", "Name"), 
                                Value = l_selectedMaterial_0.Name
                            }), 
                            BaseMaterial = v3.createElement(v20, {
                                Items = v37, 
                                LayoutOrder = v78:getNextOrder(), 
                                LabelWidth = l_LabelWidth_0, 
                                OnValueChanged = v62, 
                                PlaceholderText = v52:getText("Editor", "BaseMaterialPlaceholderText"), 
                                Text = v52:getText("Editor", "BaseMaterial"), 
                                ErrorText = v53, 
                                Value = v51
                            })
                        })
                    }), 
                    UploadAndApplyButton = if v67 then nil else v3.createElement(v19, {
                        LayoutOrder = v78:getNextOrder(), 
                        Size = v70.UploadAndApplyButtonSize, 
                        Text = v69, 
                        isLoading = v68, 
                        onClick = v65
                    }), 
                    ApplyButton = if not v67 then nil else v3.createElement(l_IconButton_0, {
                        AutomaticSize = Enum.AutomaticSize.X, 
                        BackgroundColor = v70.ApplyButtonBackgroundColor, 
                        LayoutOrder = v78:getNextOrder(), 
                        LeftIcon = v70.ApplyButtonIcon, 
                        OnClick = l_applySelectedMaterial_0, 
                        Size = v70.ApplyButtonSize, 
                        Text = v52:getText("Editor", "ApplyVariant")
                    })
                })
            })
        });
    else
        return nil;
    end;
end;
