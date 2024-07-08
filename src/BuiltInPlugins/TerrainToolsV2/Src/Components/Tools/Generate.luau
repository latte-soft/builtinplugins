local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local v7 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_ToolParts_0 = script.Parent.ToolParts;
local v9 = require(l_ToolParts_0.BiomeSettingsFragment);
local v10 = require(l_ToolParts_0.ButtonGroup);
local v11 = require(l_ToolParts_0.MapSettingsWithPreview);
local v12 = require(l_ToolParts_0.OtherGenerateSettings);
local _ = require(l_ToolParts_0.RegionFragment);
local v14 = require(l_ToolParts_0.Panel);
local v15 = require(l_Parent_0.Src.Components.ProgressDialog);
local v16 = require(l_ToolParts_0.RegionFragment);
local _ = require(l_ToolParts_0.VolumeDragger);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v19 = require(l_Actions_0.ApplyToolAction);
local v20 = require(l_Actions_0.ChangePosition);
local v21 = require(l_Actions_0.ChangeSelection);
local v22 = require(l_Actions_0.ChangeSize);
local v23 = require(l_Actions_0.SetBiomeSelection);
local v24 = require(l_Actions_0.SetBiomeSize);
local v25 = require(l_Actions_0.SetHaveCaves);
local v26 = require(l_Actions_0.SetSeed);
local v27 = require(l_Actions_0.SetSnapToVoxels);
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v29 = v2.PureComponent:extend(script.Name);
v29.init = function(v30)
    v30.warnings = {};
    v30.state = {
        mapSettingsValid = true
    };
    v30.selectBiome = function(v31)
        v30.props.dispatchSetBiomeSelection(v31, not v30.props.biomeSelection[v31]);
    end;
    v30.onBiomeSizeChanged = function(v32)
        local v33 = tonumber(v32);
        if v33 and v33 > 0 then
            v30.props.dispatchSetBiomeSize(v32);
        end;
    end;
    v30.updateGenerateProps = function()
        local l_props_0 = v30.props;
        v30.props.TerrainGeneration:updateSettings({
            position = l_props_0.position, 
            size = l_props_0.size, 
            biomeSelection = l_props_0.biomeSelection, 
            biomeSize = l_props_0.biomeSize, 
            haveCaves = l_props_0.haveCaves, 
            seed = l_props_0.seed
        });
    end;
    v30.setMapSettingsValidated = function(v35)
        v30:setState({
            mapSettingsValid = v35
        });
    end;
    v30.onSeedFocusLost = function(_, v37)
        v30.props.dispatchSetSeed(v37);
    end;
    v30.tryGenerate = function()
        for v38, v39 in pairs(v30.warnings) do
            if v39 then
                warn(v38 .. " is invalid.");
                return ;
            end;
        end;
        v30.updateGenerateProps();
        v30.props.TerrainGeneration:startGeneration();
    end;
    v30.onGenerationPauseRequested = function()
        v30.props.TerrainGeneration:togglePauseGeneration();
    end;
    v30.onGenerationCancelRequested = function()
        v30.props.TerrainGeneration:cancelGeneration();
    end;
    v30.onRegionChanged = function(v40, v41)
        local l_props_1 = v30.props;
        local l_Position_0 = v40.Position;
        l_props_1.dispatchChangePosition({
            X = l_Position_0.X, 
            Y = l_Position_0.Y, 
            Z = l_Position_0.Z
        });
        l_props_1.dispatchChangeSize({
            X = v41.X, 
            Y = v41.Y, 
            Z = v41.Z
        });
    end;
    v30.setWarnings = function(v44)
        v30.warnings = v44;
    end;
end;
v29.didUpdate = function(v45)
    v45.updateGenerateProps();
end;
v29.didMount = function(v46)
    v46.updateGenerateProps();
end;
v29.render = function(v47)
    local l_props_2 = v47.props;
    local l_Localization_0 = l_props_2.Localization;
    local l_position_0 = l_props_2.position;
    local l_size_0 = l_props_2.size;
    local l_biomeSelection_0 = l_props_2.biomeSelection;
    local l_biomeSize_0 = l_props_2.biomeSize;
    local l_haveCaves_0 = l_props_2.haveCaves;
    local l_seed_0 = l_props_2.seed;
    local l_selectBiome_0 = v47.selectBiome;
    local _ = l_props_2.snapToVoxels;
    local l_transform_0 = l_props_2.transform;
    local v59 = l_props_2.TerrainGeneration:isGenerating();
    return v2.createFragment({
        MapSettingsWithPreview = if l_TerrainEditorOverhaul_0 then nil else v2.createElement(v11, {
            toolName = l_props_2.toolName, 
            LayoutOrder = 1, 
            Position = l_position_0, 
            Size = l_size_0, 
            OnPositionChanged = l_props_2.dispatchChangePosition, 
            OnSizeChanged = l_props_2.dispatchChangeSize, 
            SetMapSettingsValid = v47.setMapSettingsValidated, 
            SetWarnings = v47.setWarnings
        }), 
        RegionSettings = if (not not l_TerrainEditorOverhaul_0 and l_transform_0) and l_size_0 then v2.createElement(v14, {
            Padding = UDim.new(0, 12), 
            LayoutOrder = 1, 
            isSubsection = false, 
            Title = l_Localization_0:getText("SelectionSettings", "SelectionSettings")
        }, {
            Region = v2.createElement(v16, {
                HideWireframe = true, 
                LayoutOrder = 1, 
                SetRegion = function(v60, v61)
                    l_props_2.dispatchChangeSelection(v60, v61);
                end, 
                Size = l_size_0, 
                SourceSize = l_size_0, 
                SourceTransform = l_transform_0, 
                Transform = l_transform_0, 
                ToolName = l_props_2.toolName
            })
        }) else nil, 
        MaterialSettings = v2.createElement(v14, {
            Title = l_Localization_0:getText("MaterialSettings", "MaterialSettings"), 
            LayoutOrder = 2
        }, {
            BiomeSettingsFragment = v2.createElement(v9, {
                LayoutOrder = 1, 
                biomeSelection = l_biomeSelection_0, 
                selectBiome = l_selectBiome_0, 
                biomeSize = l_biomeSize_0, 
                setBiomeSize = l_props_2.dispatchSetBiomeSize, 
                haveCaves = l_haveCaves_0, 
                setHaveCaves = l_props_2.dispatchSetHaveCaves
            })
        }), 
        OtherSettings = v2.createElement(v12, {
            LayoutOrder = 3, 
            seed = l_seed_0, 
            setSeed = l_props_2.dispatchSetSeed
        }), 
        GenerateButtonFrame = v2.createElement(v10, {
            LayoutOrder = 4, 
            Buttons = {
                {
                    Key = "Generate", 
                    Name = l_Localization_0:getText("Generate", "ButtonGenerate"), 
                    Active = v47.state.mapSettingsValid and not v59, 
                    OnClicked = v47.tryGenerate
                }
            }, 
            Style = if not l_TerrainEditorOverhaul_0 then nil else "RoundPrimary"
        }), 
        ProgressDialog = v59 and v2.createElement(v15, {
            Title = l_Localization_0:getText("Generate", "GenerateProgressTitle"), 
            SubText = l_Localization_0:getText("Generate", "GenerateVoxels"), 
            Progress = not not v59 and l_props_2.TerrainGeneration:getProgress() or 0, 
            IsPaused = not not v59 and (l_props_2.TerrainGeneration:isPaused() or false), 
            OnPauseButtonClicked = v47.onGenerationPauseRequested, 
            OnCancelButtonClicked = v47.onGenerationCancelRequested
        })
    });
end;
return v3.connect(function(v62, _)
    return {
        toolName = v7.ToolId.Generate, 
        biomeSelection = v62.GenerateTool.biomeSelection, 
        biomeSize = v62.GenerateTool.biomeSize, 
        haveCaves = v62.GenerateTool.haveCaves, 
        position = if not l_TerrainEditorOverhaul_0 then v62.GenerateTool.position else v62.Tools.SelectionTransform.Position, 
        seed = v62.GenerateTool.seed, 
        size = if not l_TerrainEditorOverhaul_0 then v62.GenerateTool.size else v62.Tools.SelectionSize, 
        snapToVoxels = if not l_TerrainEditorOverhaul_0 then nil else v62.Tools.SnapToVoxels, 
        transform = if not l_TerrainEditorOverhaul_0 then nil else v62.Tools.SelectionTransform
    };
end, function(v64)
    local function _(v65)
        v64(v19("GenerateTool", v65));
    end;
    return {
        dispatchSetBiomeSelection = function(v67, v68)
            v64(v19("GenerateTool", (v23(v67, v68))));
        end, 
        dispatchSetBiomeSize = function(v69)
            v64(v19("GenerateTool", (v24(v69))));
        end, 
        dispatchSetHaveCaves = function(v70)
            v64(v19("GenerateTool", (v25(v70))));
        end, 
        dispatchChangePosition = function(v71)
            v64(v19("GenerateTool", (v20(v71))));
        end, 
        dispatchSetSeed = function(v72)
            v64(v19("GenerateTool", (v26(v72))));
        end, 
        dispatchSetSnapToVoxels = function(v73)
            v64(v27(v73));
        end, 
        dispatchChangeSize = function(v74)
            v64(v19("GenerateTool", (v22(v74))));
        end, 
        dispatchChangeSelection = function(v75, v76)
            v64(v21(v75, v76));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    TerrainGeneration = v6.TerrainGeneration
})(v29)));
