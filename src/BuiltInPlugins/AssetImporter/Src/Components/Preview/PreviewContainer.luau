local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_withContext_0 = v3.ContextServices.withContext;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local v9 = require(l_script_FirstAncestor_0.Src.Components.Preview.WorkspacePreview);
local v10 = require(l_script_FirstAncestor_0.Src.Components.Preview.AxisIndicator);
local v11 = require(l_script_FirstAncestor_0.Src.Components.Preview.PreviewControls);
local v12 = require(l_script_FirstAncestor_0.Src.Components.Preview.RigVisualization);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetSettingsChanged);
local v14 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDevFrameworkRenderModelLoadedSignal);
local v16 = require(l_script_FirstAncestor_0.Src.Utility.getAssetPreviewProps);
local v17 = require(l_script_FirstAncestor_0.Src.Utility.getAssetRenderModel);
local v18 = require(l_script_FirstAncestor_0.Src.Utility.loadAnimation);
local v19 = Vector3.new(-1, 1, -1);
local v20 = v1.PureComponent:extend("PreviewContainer");
v20.init = function(v21)
    local l_props_0 = v21.props;
    v21:setState({
        showContext = false
    });
    v21.recenterCamera = false;
    v21.recenterModel = true;
    v21.lastCamCFrame = CFrame.identity;
    v21.previewProps = v16(l_props_0.PreviewInstance, l_props_0.ImportTree, l_props_0.SelectedImportItem.Id == "0", v21.state.showContext);
    v21.camera = Instance.new("Camera");
    v21.onClickCenterCamera = function()
        local v23 = v17(v21.props.PreviewInstance):GetExtentsSize().Magnitude * 0.8;
        local l_Unit_0 = v19.Unit;
        v21.camera.Focus = CFrame.identity;
        v21.camera.CFrame = CFrame.new(v23 * l_Unit_0, v21.camera.Focus.Position);
    end;
    v21.onClickToggleContext = function()
        v21:setState({
            showContext = not v21.state.showContext
        });
    end;
    v21.onClickRigVisualization = function()
        local l_props_1 = v21.props;
        l_props_1.ImportTree.RigVisualization = not l_props_1.ImportTree.RigVisualization;
        if l_props_1.SelectedImportItem then
            l_props_1.UpdatePreviewInstance((l_props_1.SelectedImportItem:GetPreview()));
        end;
    end;
    v21.isRigVisualized = function()
        local l_props_2 = v21.props;
        return not not l_props_2.ImportTree.RigVisualization and l_props_2.SelectedImportItem:IsA("RootImportData") or l_props_2.SelectedImportItem:IsA("JointImportData");
    end;
    v21.loadAnimationIntoViewport = function(v27)
        if v21.props.SelectedImportItem:IsA("AnimationImportData") then
            local v28 = nil;
            do
                local l_v28_0 = v28;
                l_v28_0 = v27.AncestryChanged:connect(function(_, v31)
                    if not (not v31 or not v31:IsDescendantOf(game)) then
                        l_v28_0:Disconnect();
                        local l_v27_FirstChildWhichIsA_0 = v27:FindFirstChildWhichIsA("KeyframeSequence", true);
                        if l_v27_FirstChildWhichIsA_0 then
                            v18(v27, l_v27_FirstChildWhichIsA_0);
                        end;
                    end;
                end);
            end;
        end;
    end;
end;
v20.handleCameraTransition = function(v33, v34, v35)
    local l_SelectedImportItem_0 = v33.props.SelectedImportItem;
    local l_SelectedImportItem_1 = v34.SelectedImportItem;
    if not (not (l_SelectedImportItem_0:IsA("RootImportData") or l_SelectedImportItem_0:IsA("MeshImportData")) and not l_SelectedImportItem_0:IsA("GroupImportData")) then
        v33.lastCamCFrame = v33.camera.CFrame;
    end;
    v33.previewProps = v16(v34.PreviewInstance, v34.ImportTree, v34.SelectedImportItem.Id == "0", v35.showContext);
    if not (l_SelectedImportItem_1:IsA("RootImportData") or l_SelectedImportItem_1:IsA("MeshImportData")) and not l_SelectedImportItem_1:IsA("GroupImportData") then
        v33.recenterCamera = true;
        return ;
    else
        v33.camera.CFrame = v33.lastCamCFrame;
        v33.recenterCamera = false;
        return ;
    end;
end;
v20.willUpdate = function(v38, v39, v40)
    v38:handleCameraTransition(v39, v40);
end;
v20.didUpdate = function(v41, v42)
    if v41.props.SelectedImportItem ~= v42.SelectedImportItem then
        v41.onClickCenterCamera();
    end;
end;
v20.render = function(v43)
    local l_props_3 = v43.props;
    local l_Stylizer_1 = l_props_3.Stylizer;
    local l_Sizes_0 = l_Stylizer_1.Sizes;
    return v1.createElement(l_Pane_0, {
        LayoutOrder = l_props_3.LayoutOrder, 
        Size = UDim2.new(1, 0, l_Sizes_0.PreviewRatio, 0)
    }, {
        WorkspacePreviewContainer = v1.createElement(l_Pane_0, {
            ZIndex = 1
        }, {
            WorkspacePreview = v1.createElement(v9, {
                Model = v43.previewProps.workspacePreview, 
                ReferenceCamera = v43.camera, 
                Offset = v43.previewProps.insertContextOffset
            })
        }), 
        PreviewControls = v1.createElement(v11, {
            InsertContextCallback = v43.onClickToggleContext, 
            ResetCameraCallback = v43.onClickCenterCamera, 
            ShouldShowWorkspaceToggle = l_props_3.SelectedImportItem:IsA("RootImportData") and l_props_3.SelectedImportItem.InsertInWorkspace, 
            ShouldShowRigVisualizationToggle = l_props_3.SelectedImportItem:IsA("RootImportData") and l_props_3.AssetImportSession:isAvatar(), 
            VisualizeRigCallback = v43.onClickRigVisualization
        }), 
        PreviewRenderContainer = v1.createElement(l_Pane_0, {
            ZIndex = 2
        }, {
            PreviewRender = v1.createElement(l_AssetRenderModel_0, {
                Model = v43.previewProps.model, 
                InitialDistance = v43.previewProps.initDist, 
                Camera = v43.camera, 
                FocusDirection = v19, 
                RecenterCameraOnUpdate = v43.recenterCamera, 
                RecenterModelOnUpdate = v43.recenterModel, 
                OnViewModelLoaded = if not v15() then nil else v43.loadAnimationIntoViewport, 
                Ambient = l_Stylizer_1.PreviewWindow.Lighting.Ambient, 
                LightColor = l_Stylizer_1.PreviewWindow.Lighting.Color, 
                LightDirection = l_Stylizer_1.PreviewWindow.Lighting.Direction
            })
        }), 
        RigVisualization = if not v43.isRigVisualized() then nil else v1.createElement(l_Pane_0, {
            ZIndex = 3
        }, {
            v1.createElement(v12, {
                PreviewInstance = l_props_3.PreviewInstance, 
                Camera = v43.camera, 
                AssetImportSession = l_props_3.AssetImportSession, 
                SelectedImportItem = l_props_3.SelectedImportItem
            })
        }), 
        AxisIndicatorContainer = v1.createElement(l_Pane_0, {
            Size = UDim2.new(0, l_Sizes_0.IndicatorSize, 0, l_Sizes_0.IndicatorSize), 
            Position = UDim2.new(1, l_Sizes_0.IndicatorOffset, 1, l_Sizes_0.IndicatorOffset), 
            AnchorPoint = Vector2.new(1, 1), 
            ZIndex = 4
        }, {
            AxisIndicator = v1.createElement(v10, {
                ReferenceCamera = v43.camera
            })
        })
    });
end;
return v2.connect(function(v47)
    return {
        AssetImportSession = v47.Preview.assetImportSession, 
        ImportTree = v47.Preview.importTree, 
        PreviewInstance = v47.Preview.previewInstance, 
        SelectedImportItem = v47.Preview.selectedImportItem
    };
end, function(v48)
    return {
        SetSettingsChanged = function(v49)
            v48(v13(v49));
        end, 
        UpdatePreviewInstance = function(v50)
            v48(v14(v50));
        end
    };
end)((l_withContext_0({
    Stylizer = l_Stylizer_0
})(v20)));
