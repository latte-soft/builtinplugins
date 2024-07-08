local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.MaterialFramework);
local v4 = require(l_Parent_0.Packages.React);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local _ = require(l_Parent_0.Packages._Index.DeveloperFramework.DeveloperFramework.Types);
local _ = require(l_Parent_0.Src.Types);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_Pane_0 = v2.UI.Pane;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_withAbsoluteSize_0 = v2.Wrappers.withAbsoluteSize;
local l_StudioServices_0 = v3.Context.StudioServices;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v18 = require(l_Actions_0.ClearSelectedMaterial);
local v19 = require(l_Actions_0.RemoveAllMaterials);
local v20 = require(l_Actions_0.DEPRECATED_RemoveMaterial);
local v21 = require(l_Actions_0.SetBaseMaterial);
local v22 = require(l_Actions_0.SetGenerationError);
local v23 = require(l_Actions_0.SetSelectedMaterial);
local v24 = require(l_Actions_0.SetInitialImageId);
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v26 = require(l_Thunks_0.ApplyMaterial);
local v27 = require(l_Thunks_0.RemoveMaterial);
local v28 = require(l_Thunks_0.UpdateMaterial);
local v29 = require(l_Thunks_0.UploadMaterial);
local l_Components_0 = l_Parent_0.Src.Components;
local v31 = require(l_Components_0.Browser);
local v32 = require(l_Components_0.Header);
local v33 = require(l_Components_0.MaterialView);
local v34 = require(l_Components_0.TextureBrowser);
local v35 = require(l_Components_0.ErrorBox);
local v36 = require(l_Components_0.MaterialVariantProvider);
local v37 = require(l_Parent_0.Src.Controllers.MaterialPreviewController);
local v38 = require(l_Parent_0.Src.Enum.GenerationErrorType);
local v39 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v40 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorSupportVariations2);
local l_join_0 = v1.join;
local v42 = v4.PureComponent:extend("MainView");
v42.init = function(v43)
    local v44, v45 = v4.createBinding(0);
    v43.generationErrorHeightBinding = v44;
    v43.updateGenerationErrorHeightBinding = v45;
    v43.generationErrorRef = v4.createRef();
    v43.changeGenerationErrorHeight = function()
        local l_current_0 = v43.generationErrorRef.current;
        v43.updateGenerationErrorHeightBinding(l_current_0 == nil and 0 or l_current_0.AbsoluteSize.Y);
    end;
end;
v42.didMount = function(v47)
    v47:changeGenerationErrorHeight();
end;
v42.didUpdate = function(v48, v49)
    if v48.props.GenerationErrorType == v38.None and v49.GenerationErrorType ~= v38.None then
        v48.updateGenerationErrorHeightBinding(0);
    end;
end;
v42.render = function(v50)
    local l_props_0 = v50.props;
    local l_MainView_0 = l_props_0.Stylizer.MainView;
    local l_Header_0 = l_props_0.Stylizer.Header;
    local v54 = l_Header_0.Size.Y.Offset + l_Header_0.Padding * 2;
    local l_SelectedMaterial_0 = l_props_0.SelectedMaterial;
    local v56 = l_LayoutOrderIterator_0.new();
    local v57 = v56:getNextOrder();
    local v58 = nil;
    if v39() then
        v58 = function(v59)
            v50.props.dispatchUpdateMaterial(l_join_0(l_SelectedMaterial_0, {
                BaseMaterial = v59
            }));
        end;
    end;
    local v60 = nil;
    if l_props_0.GenerationErrorType ~= v38.None then
        v60 = v4.createElement(l_Pane_0, {
            LayoutOrder = v56:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Padding = {
                Top = l_Header_0.VerticalSpacing - l_MainView_0.ErrorPadding, 
                Bottom = l_Header_0.VerticalSpacing, 
                Left = l_MainView_0.ErrorPadding, 
                Right = l_MainView_0.ErrorPadding
            }, 
            Size = UDim2.new(1, 0, 0, 0), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            ForwardRef = v50.generationErrorRef, 
            [v4.Change.AbsoluteSize] = v50.changeGenerationErrorHeight
        }, {
            v4.createElement(v35, {
                Text = v50:_getErrorMesssage(l_props_0), 
                Padding = l_MainView_0.ErrorInnerPadding, 
                MaxWidth = l_MainView_0.ErrorMaxWidth, 
                Close = v50.props.dispatchCloseError
            })
        });
    end;
    local l_Analytics_1 = l_props_0.Analytics;
    return v4.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Style = "Box", 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Header = v4.createElement(v32, {
            LayoutOrder = v57
        }), 
        GenerationError = v60, 
        TextureBrowserContainer = v4.createElement(l_Pane_0, {
            LayoutOrder = v56:getNextOrder(), 
            Size = v50.generationErrorHeightBinding:map(function(v62)
                return UDim2.new(1, 0, 1, -v54 - v62);
            end)
        }, {
            TextureBrowser = v4.createElement(if not v39() then v34 else v31, {
                DisableHover = if not v39() then nil else l_SelectedMaterial_0 ~= nil, 
                GeneratingImages = l_props_0.GeneratingImages, 
                Materials = l_props_0.Materials, 
                OnMaterialSelected = l_props_0.dispatchSetSelectedMaterial, 
                OnGenerateVariations = v50.props.dispatchGenerateVariations, 
                OnRemove = l_props_0.dispatchRemoveMaterial, 
                OnRemoveAll = l_props_0.dispatchRemoveAllMaterials, 
                SelectedMaterial = l_SelectedMaterial_0, 
                Size = UDim2.new(1, 0, 1, 0)
            }), 
            MaterialView = if not l_SelectedMaterial_0 or v39() then nil else v4.createElement(v33, {
                IsSavingMaterial = l_props_0.IsSavingMaterial, 
                Material = l_SelectedMaterial_0, 
                OnBaseMaterialChanged = not v39() and function(v63)
                    v50.props.dispatchSetBaseMaterial(v63);
                end or v58, 
                OnClose = if not v39() then l_props_0.dispatchClearSelectedMaterial else function()
                    l_props_0.dispatchSetSelectedMaterial(nil);
                end, 
                OnSaveAndApply = function()
                    local l_props_1 = v50.props;
                    l_props_1.MaterialPreviewController:plotWaypoint();
                    if l_SelectedMaterial_0.IsTemporary then
                        l_props_1.dispatchUploadMaterial(l_SelectedMaterial_0, l_Analytics_1);
                    end;
                    l_props_1.MaterialPreviewController:preserveCurrentSelection();
                    l_props_1.dispatchApplyMaterial(l_SelectedMaterial_0, l_props_1.StudioServices);
                end
            }), 
            MaterialVariantProvider = if not v39() then nil else v4.createElement(v36, {
                FolderName = "MaterialGenerator", 
                Materials = l_props_0.Materials
            })
        })
    });
end;
v42._getErrorMesssage = function(_, v66)
    local l_GenerationErrorType_0 = v66.GenerationErrorType;
    local l_Localization_1 = v66.Localization;
    if l_GenerationErrorType_0 == v38.CustomMessage then
        return v66.GenerationErrorMessage or l_Localization_1:getText("Errors", "UnknownGenerationError");
    elseif l_GenerationErrorType_0 == v38.NoSession then
        return l_Localization_1:getText("Errors", "NoSession");
    elseif l_GenerationErrorType_0 == v38.ServerError500 then
        return l_Localization_1:getText("Errors", "ServerError500");
    elseif l_GenerationErrorType_0 == v38.ServerError504 then
        return l_Localization_1:getText("Errors", "ServerError504");
    elseif l_GenerationErrorType_0 == v38.TextFullyFiltered then
        return l_Localization_1:getText("Errors", "TextFullyFiltered");
    elseif l_GenerationErrorType_0 == v38.NoSelectedMaterial then
        return l_Localization_1:getText("Errors", "NoSelectedMaterial");
    elseif l_GenerationErrorType_0 == v38.FailedToGenerateMaps then
        return l_Localization_1:getText("Errors", "FailedToGenerateMaps");
    elseif l_GenerationErrorType_0 == v38.TooManyRequests then
        return l_Localization_1:getText("Errors", "TooManyRequests");
    elseif l_GenerationErrorType_0 == v38.AccountingFailedDecrement then
        return l_Localization_1:getText("Errors", "AccountingFailedDecrement");
    elseif l_GenerationErrorType_0 == v38.FailedToSetImage then
        return l_Localization_1:getText("Errors", "FailedToSetImage");
    elseif l_GenerationErrorType_0 == v38.Unknown then
        return l_Localization_1:getText("Errors", "UnknownGenerationError");
    else
        error("Unknown errorType");
        return ;
    end;
end;
v42 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    MaterialPreviewController = if not v39() then v37 else nil, 
    StudioServices = l_StudioServices_0, 
    Stylizer = l_Stylizer_0
})(v42);
local function v71(v69, _)
    return {
        GeneratingImages = v69.AppStateReducer.generatingImages, 
        GenerationErrorType = v69.AppStateReducer.generationError.generationErrorType, 
        GenerationErrorMessage = v69.AppStateReducer.generationError.message, 
        IsSavingMaterial = v69.AppStateReducer.isSavingMaterial, 
        Materials = v69.MaterialsReducer.materials, 
        SelectedMaterial = v69.MaterialsReducer.selectedMaterial
    };
end;
local function v82(v72)
    return {
        dispatchClearSelectedMaterial = not v39() and function()
            v72(v18());
        end or nil, 
        dispatchCloseError = function()
            v72(v22(v38.None, nil));
        end, 
        dispatchGenerateVariations = function(v73)
            if v40() then
                v72(v24(v73.Textures.ColorMap));
                return ;
            else
                return ;
            end;
        end, 
        dispatchRemoveAllMaterials = function()
            v72(v19());
        end, 
        dispatchRemoveMaterial = function(v74)
            if not v39() then
                v72(v20(v74));
                return ;
            else
                v72(v27(v74));
                return ;
            end;
        end, 
        dispatchSetBaseMaterial = not v39() and function(v75)
            v72(v21(v75));
        end or nil, 
        dispatchSetSelectedMaterial = function(v76)
            v72(v23(v76));
        end, 
        dispatchUpdateMaterial = if not v39() then nil else function(v77)
            v72(v28(v77));
        end, 
        dispatchUploadMaterial = function(v78, v79)
            v72(v29(v78, v79));
        end, 
        dispatchApplyMaterial = function(v80, v81)
            v72(v26(v80, v81));
        end
    };
end;
if not v39() then
    return v5.connect(v71, v82)(v42);
else
    return l_withAbsoluteSize_0(v5.connect(v71, v82)(v42));
end;
