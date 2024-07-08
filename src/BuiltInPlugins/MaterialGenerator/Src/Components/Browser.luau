local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v2.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_MaterialGrid_0 = v3.Components.MaterialGrid;
local l_MaterialPreviewGeometryType_0 = v3.Enums.MaterialPreviewGeometryType;
local v14 = require(l_script_FirstAncestor_0.Src.Components.PromptGroupFooter);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v18 = require(l_Util_0.Constants);
local v19 = require(l_Util_0.GeneratedMaterialsContext);
local v20 = require(l_Util_0.GenerationContext);
local v21 = require(l_Util_0.PluginSettingsContext);
local v22 = require(l_Util_0.PreviewContext);
local v23 = require(l_Util_0.getAllMaterialVariants);
local v24 = require(l_Util_0.getSampleCount);
local l_SETTING_GEOMETRY_TYPE_0 = v18.SETTING_GEOMETRY_TYPE;
local l_SETTING_GEOMETRY_TYPE_DEFAULT_0 = v18.SETTING_GEOMETRY_TYPE_DEFAULT;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v28)
    assert(v15(), "Expected FFlagMaterialGeneratorNewUI to be true");
    local v29 = v4.useContext(v19);
    local l_promptGroups_0 = v29.promptGroups;
    local l_removeMaterial_0 = v29.removeMaterial;
    local l_removeAllMaterials_0 = v29.removeAllMaterials;
    local v33 = v4.useContext(v20);
    local l_lastGeneratedPromptText_0 = v33.lastGeneratedPromptText;
    local l_isGenerating_0 = v33.isGenerating;
    local v36 = l_ContextServices_0.Plugin.use():get();
    local v37 = l_Localization_0:use();
    local v38 = v4.useContext(v21);
    local v39 = v38.getSetting(l_SETTING_GEOMETRY_TYPE_0);
    local v40 = nil;
    if not v39 then
        v38.setSetting(l_SETTING_GEOMETRY_TYPE_0, l_SETTING_GEOMETRY_TYPE_DEFAULT_0);
    else
        v40 = l_MaterialPreviewGeometryType_0.fromRawValue(v39);
    end;
    local v41 = v4.useContext(v22);
    local l_selectedMaterial_0 = v41.selectedMaterial;
    local l_setSelectedMaterial_0 = v41.setSelectedMaterial;
    local v46 = v4.useCallback(function(v44)
        local v45 = {
            {
                Text = v37:getText("Browser", "Remove"), 
                Enabled = v44 ~= nil, 
                OnItemClicked = function()
                    if v44 and l_selectedMaterial_0 == v44.Material then
                        l_setSelectedMaterial_0(nil);
                    end;
                    if v44 then
                        l_removeMaterial_0(v44.Material);
                    end;
                end
            }, 
            {
                Text = v37:getText("Browser", "RemoveAll"), 
                Enabled = #l_promptGroups_0 > 0, 
                OnItemClicked = function()
                    l_setSelectedMaterial_0(nil);
                    l_removeAllMaterials_0();
                end
            }, 
            {
                ShowSeparator = true
            }, 
            {
                Checked = v40 == l_MaterialPreviewGeometryType_0.Plane, 
                Text = v37:getText("Browser", "PlanePreview"), 
                Enabled = true, 
                OnItemClicked = function()
                    v38.setSetting(l_SETTING_GEOMETRY_TYPE_0, (l_MaterialPreviewGeometryType_0.Plane.rawValue()));
                end
            }, 
            {
                Checked = v40 == l_MaterialPreviewGeometryType_0.Sphere, 
                Text = v37:getText("Browser", "SpherePreview"), 
                Enabled = true, 
                OnItemClicked = function()
                    v38.setSetting(l_SETTING_GEOMETRY_TYPE_0, (l_MaterialPreviewGeometryType_0.Sphere.rawValue()));
                end
            }
        };
        task.spawn(function()
            l_showContextMenu_0(v36, v45);
        end);
    end, {
        l_selectedMaterial_0, 
        l_promptGroups_0, 
        v40, 
        l_removeMaterial_0, 
        l_removeAllMaterials_0
    });
    local v47 = v24();
    local v51 = v4.useMemo(function()
        local v48 = {};
        if l_isGenerating_0 then
            for _ = 1, v47 do
                table.insert(v48, {
                    Loading = true
                });
            end;
        end;
        v1.append(v48, v1.map(v23(l_promptGroups_0), function(v50)
            return {
                Id = v50, 
                Loading = false, 
                Material = v50
            };
        end));
        return v48;
    end, {
        l_promptGroups_0, 
        l_isGenerating_0
    });
    local v52 = l_Stylizer_0:use("Browser");
    return v4.createElement(l_Pane_0, {
        LayoutOrder = v28.LayoutOrder, 
        Size = v28.Size
    }, {
        Grid = v4.createElement(l_MaterialGrid_0, {
            CellGroups = v4.useMemo(function()
                local v54 = v1.map(l_promptGroups_0, function(v53)
                    return {
                        CellCount = #v53.materialVariants, 
                        Text = v53.filteredPromptText or v53.promptText
                    };
                end);
                if l_isGenerating_0 then
                    local v55 = l_promptGroups_0[1];
                    if v55 and v55.promptText == l_lastGeneratedPromptText_0 then
                        local v56 = v54[1];
                        v56.CellCount = v56.CellCount + v47;
                        return v54;
                    else
                        table.insert(v54, 1, {
                            CellCount = v47, 
                            Text = l_lastGeneratedPromptText_0
                        });
                    end;
                end;
                return v54;
            end, {
                l_promptGroups_0, 
                l_isGenerating_0, 
                l_lastGeneratedPromptText_0
            }), 
            CellGroupHeader = v1.join(v52.CellGroupHeader, {
                HeaderComponent = v14
            }), 
            Items = v51, 
            MaterialPreviewGeometryType = v40, 
            OnClick = function(v57)
                l_setSelectedMaterial_0(v57.Material);
            end, 
            OnRenderItemChildren = v4.useCallback(function(v58)
                if v29.getMaterialStatus(v58.Material) == "Uploaded" then
                    return {
                        StatusIcon = v4.createElement(l_Image_0, {
                            BackgroundTransparency = 1, 
                            Image = "rbxasset://textures/MaterialGenerator/material_uploaded.png", 
                            ImageColor3 = v52.StatusIconImageColor, 
                            Position = v52.StatusIconPosition, 
                            Size = v52.StatusIconSize
                        })
                    };
                else
                    return nil;
                end;
            end, {
                v29
            }), 
            OnRightClick = v46, 
            Padding = v52.Padding, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            SelectedItemId = l_selectedMaterial_0, 
            ShowGridLabels = false
        })
    });
end;
