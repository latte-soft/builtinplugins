local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v6 = require(l_Actions_0.ResetState);
local v7 = require(l_Actions_0.SetActiveQueueItem);
local v8 = require(l_Actions_0.SetAssetImportSession);
local v9 = require(l_Actions_0.SetCheckedCount);
local v10 = require(l_Actions_0.SetCurrentPreset);
local v11 = require(l_Actions_0.SetErrorNodeChecked);
local v12 = require(l_Actions_0.SetFilename);
local v13 = require(l_Actions_0.SetHasInvalidPackageId);
local v14 = require(l_Actions_0.SetImportTree);
local v15 = require(l_Actions_0.SetManagedGroups);
local v16 = require(l_Actions_0.SetPreviewInstance);
local v17 = require(l_Actions_0.SetSelectedImportItem);
local v18 = require(l_Actions_0.SetSettingsChanged);
local v19 = require(l_Actions_0.SetTreeChecked);
local v20 = require(l_Actions_0.SetTreeExpansion);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v22 = {
    activeQueueItem = if not v21() then nil else v4.new(), 
    assetImportSession = nil, 
    currentPreset = not v21() and "" or nil, 
    errorNodeChecked = false, 
    filename = "", 
    hasInvalidPackageId = false, 
    importDataChecked = {}, 
    importDataCheckedCount = -1, 
    importDataExpansion = {}, 
    importTree = nil, 
    managedGroups = {}, 
    previewInstance = nil, 
    selectedImportItem = nil, 
    settingsChanged = false
};
return v1.createReducer(v22, {
    [v7.name] = function(v23, v24)
        return v2.Dictionary.join(v23, {
            activeQueueItem = v24.activeQueueItem
        });
    end, 
    [v8.name] = function(v25, v26)
        return v2.Dictionary.join(v25, {
            assetImportSession = v26.assetImportSession
        });
    end, 
    [v14.name] = function(v27, v28)
        return v2.Dictionary.join(v27, {
            importTree = v28.importTree, 
            importDataExpansion = v2.Dictionary.join(v27.importDataExpansion, {
                [v28.importTree] = true
            })
        });
    end, 
    [v12.name] = function(v29, v30)
        return v2.Dictionary.join(v29, {
            filename = v30.filename
        });
    end, 
    [v13.name] = function(v31, v32)
        return v2.Dictionary.join(v31, {
            hasInvalidPackageId = v32.hasInvalidPackageId
        });
    end, 
    [v16.name] = function(v33, v34)
        return v2.Dictionary.join(v33, {
            previewInstance = v34.previewInstance
        });
    end, 
    [v15.name] = function(v35, v36)
        return v2.Dictionary.join(v35, {
            managedGroups = v36.managedGroups
        });
    end, 
    [v17.name] = function(v37, v38)
        return v2.Dictionary.join(v37, {
            selectedImportItem = v38.selectedImportItem
        });
    end, 
    [v19.name] = function(v39, v40)
        for v41, v42 in pairs(v40.checked) do
            v41.ShouldImport = v42 ~= false;
        end;
        return v2.Dictionary.join(v39, {
            importDataChecked = v2.Dictionary.join(v39.importDataChecked, v40.checked)
        });
    end, 
    [v9.name] = function(v43, v44)
        return v2.Dictionary.join(v43, {
            importDataCheckedCount = v44.count
        });
    end, 
    [v20.name] = function(v45, v46)
        return v2.Dictionary.join(v45, {
            importDataExpansion = v2.Dictionary.join(v45.importDataExpansion, v46.expansion)
        });
    end, 
    [v11.name] = function(v47, v48)
        return v2.Dictionary.join(v47, {
            errorNodeChecked = v48.isErrorChecked
        });
    end, 
    [v18.name] = function(v49, v50)
        return v2.Dictionary.join(v49, {
            settingsChanged = v50.settingsChanged
        });
    end, 
    [v10.name] = if not v21() then function(v51, v52)
        return v2.Dictionary.join(v51, {
            currentPreset = v52.currentPreset
        });
    end else nil, 
    [v6.name] = function(_)
        if not v21() then
            return (v2.Dictionary.join({}, v22));
        else
            return (table.clone(v22));
        end;
    end
});
