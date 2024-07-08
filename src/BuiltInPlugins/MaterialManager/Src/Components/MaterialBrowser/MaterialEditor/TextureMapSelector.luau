local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Controllers_0 = l_Parent_0.Src.Controllers;
local v7 = require(l_Controllers_0.ImportAssetHandler);
local v8 = require(l_Controllers_0.GeneralServiceController);
local v9 = require(l_Parent_0.Src.Components.MaterialBrowser.MaterialEditor.LabeledElement);
local v10 = require(l_Parent_0.Src.Components.PromptSelectorWithPreview);
local v11 = require(l_Parent_0.Src.Resources.Constants.getErrorTypes)();
local v12 = v1.PureComponent:extend("TextureMapSelector");
v12.init = function(v13)
    v13.state = {
        importAsset = {}, 
        uploading = false
    };
    v13.errorMessage = nil;
    v13.checkIsMounted = function()
        return v13._isMounted;
    end;
    v13.setImportAsset = function(v14, v15)
        if v13.checkIsMounted() then
            if not (not v14 or not v15) and (not v13.errorMessage or v13.errorMessage == "") then
                v13:setState({
                    importAsset = {
                        file = v14, 
                        tempId = v15
                    }
                });
                return ;
            else
                v13:setState({
                    importAsset = {}
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v13.clearTextureMap = function()
        local l_props_0 = v13.props;
        l_props_0.GeneralServiceController:setTextureMap(l_props_0.PBRMaterial, l_props_0.MapType, "");
        v13.setImportAsset(nil);
    end;
    v13.setUploading = function(v17)
        if v13.checkIsMounted() then
            v13:setState({
                uploading = v17
            });
            return ;
        else
            return ;
        end;
    end;
    v13.updateTextureMap = function(v18, v19, v20)
        local l_props_1 = v13.props;
        l_props_1.GeneralServiceController:setTextureMap(l_props_1.PBRMaterial, l_props_1.MapType, v18);
        l_props_1.Analytics:report(v19);
        v13.errorMessage = v20;
        v13.setImportAsset(nil);
        v13.setUploading(false);
    end;
    v13.promptSelection = function()
        local l_props_2 = v13.props;
        l_props_2.GeneralServiceController:setTextureMapFromFile(l_props_2.PBRMaterial, l_props_2.MapType, l_props_2.ImportAssetHandler, v13.setUploading, v13.setImportAsset, v13.updateTextureMap);
    end;
    v13.onFocusLost = function(v23, v24)
        local l_props_3 = v13.props;
        local l_Text_0 = v24.Text;
        if v23 then
            if not l_Text_0 or l_Text_0 == "" then
                v13.clearTextureMap();
                return ;
            else
                l_props_3.GeneralServiceController:setTextureMapFromURL(l_props_3.PBRMaterial, l_props_3.MapType, l_Text_0, v13.checkIsMounted, v13.updateTextureMap);
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v12.didMount = function(v27)
    v27._isMounted = true;
end;
v12.willUnmount = function(v28)
    v28._isMounted = false;
end;
v12.didUpdate = function(v29, v30)
    if v30.PBRMaterial ~= v29.props.PBRMaterial then
        v29:setState({
            importAsset = {}, 
            uploading = false
        });
        v29.errorMessage = nil;
    end;
end;
v12.render = function(v31)
    local l_props_4 = v31.props;
    local l_state_0 = v31.state;
    local l_Localization_1 = l_props_4.Localization;
    local v35 = "";
    local v36 = "";
    local v37 = false;
    local l_PBRMaterial_0 = l_props_4.PBRMaterial;
    if l_state_0.importAsset and l_state_0.importAsset.tempId or l_PBRMaterial_0[l_props_4.MapType] ~= "" then
        v35 = if not l_state_0.importAsset.file then l_PBRMaterial_0[l_props_4.MapType] else l_state_0.importAsset.file.Name;
        if (not (l_state_0.uploading == true) or not l_state_0.importAsset) or not l_state_0.importAsset.tempId then
            v36 = l_PBRMaterial_0[l_props_4.MapType];
            v37 = false;
        else
            v36 = l_state_0.importAsset.tempId;
            v37 = true;
        end;
    end;
    local v39 = nil;
    local v40 = nil;
    if l_PBRMaterial_0[l_props_4.MapType] == "" then
        if (v31.errorMessage and v31.errorMessage ~= "") and v31.errorMessage ~= v11.FailedToInsertAssetManager then
            v39 = Enum.PropertyStatus.Error;
            v40 = l_Localization_1:getText("CreateDialog", v31.errorMessage);
        end;
    elseif v31.errorMessage == v11.FailedToInsertAssetManager then
        v39 = Enum.PropertyStatus.Warning;
        v40 = l_Localization_1:getText("CreateDialog", v31.errorMessage);
    else
        v39 = Enum.PropertyStatus.Ok;
        v31.errorMessage = nil;
    end;
    return v1.createElement(v9, {
        FillDirection = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_4.LayoutOrder, 
        LabelColumnWidth = l_props_4.LabelColumnWidth, 
        Text = l_props_4.Text, 
        StatusText = v40, 
        Status = v39
    }, {
        v1.createElement(v10, {
            SelectionName = v35, 
            PreviewTitle = l_props_4.PreviewTitle, 
            IsTempId = v37, 
            ImageId = v36, 
            LabelWidth = l_props_4.LabelWidth, 
            PromptSelection = v31.promptSelection, 
            SearchUrl = l_PBRMaterial_0[l_props_4.MapType], 
            ClearSelection = v31.clearTextureMap, 
            OnFocusLost = v31.onFocusLost, 
            ColumnWidth = l_props_4.ColumnWidth
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    GeneralServiceController = v8, 
    Localization = l_Localization_0, 
    ImportAssetHandler = v7
})(v12));
