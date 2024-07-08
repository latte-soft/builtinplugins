local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_ContextItem_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.ResetState);
local v4 = require(l_Actions_0.SetShowError);
local v5 = require(l_Actions_0.SetShowPreview);
local v6 = require(l_Actions_0.SetShowProgress);
local v7 = require(l_Actions_0.SetShowQueue);
local v8 = require(l_Actions_0.SetUploading);
local _ = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v11 = require(l_Thunks_0.ShowImportPreview);
local v12 = require(l_Thunks_0.LoadManagedGroups);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUseUploadId);
local v15 = l_ContextItem_0:extend("FileController");
v15.new = function(v16, v17, v18)
    local v19 = {
        _store = v16, 
        _presetController = v17, 
        _mock = v18, 
        promptRequested = false
    };
    if not v18 then
        v19.showImportPrompt = function(v20)
            v19._store:dispatch(require(l_Thunks_0.ShowImportPrompt)(v20));
        end;
        v19.showReplaceImportPrompt = function(v21, v22)
            v19._store:dispatch(require(l_Thunks_0.ShowReplaceImportPrompt)(v21, v22));
        end;
    else
        v19.showImportPrompt = function()
            error("Please call FileController.overrideShowImportPrompt to provide testing function");
        end;
        v19.showReplaceImportPrompt = function()
            error("TODO: Implement FileController.showReplaceImportPrompt for mock");
        end;
        v19.overrideShowImportPrompt = function(v23)
            v19.showImportPrompt = v23;
        end;
        v19.setPromptRequested = function(v24)
            v19.promptRequested = v24;
        end;
    end;
    return (setmetatable(v19, v15));
end;
v15.mock = function(v25, v26)
    return v15.new(v25, v26, true);
end;
v15.DEPRECATED_cleanupPreview = function(v27)
    local l_assetImportSession_0 = v27._store:getState().Preview.assetImportSession;
    if l_assetImportSession_0 then
        v27:DEPRECATED_onSessionCanceled(l_assetImportSession_0);
    end;
    v27._store:dispatch(v3());
end;
v15.DEPRECATED_onSessionCanceled = function(v29, v30)
    if v30 then
        v30:Cancel();
    end;
    v29._store:dispatch(v5(false));
    v29._store:dispatch(v8(false));
end;
v15.destroy = function(v31)
    v31:DEPRECATED_cleanupPreview();
end;
v15.onPluginButtonClicked = function(v32)
    local v33 = v32._store:getState();
    local l_uploading_0 = v33.Dialogs.uploading;
    if not v13() or not l_uploading_0 then
        local v35 = ((v33.Dialogs.showPreview or v33.Dialogs.showError) or v33.Dialogs.showProgress) or v32.promptRequested;
        if v13() then
            v35 = v35 or v33.Dialogs.showQueue;
        end;
        if v35 then
            if not v32.promptRequested then
                v32._store:dispatch(v5(false));
                v32._store:dispatch(v4(false));
                if v13() then
                    v32._store:dispatch(v7(false));
                end;
                return ;
            else
                return ;
            end;
        else
            if not (not v14() or not v13()) then
                v32._store:dispatch(v12());
            end;
            v32:requestFilePicker();
            return ;
        end;
    else
        return ;
    end;
end;
v15.requestFilePicker = function(v36)
    v36.promptRequested = true;
    if not v13() then
        v36.showImportPrompt(function(v37, v38)
            assert(v36.promptRequested);
            v36.promptRequested = false;
            if not v38 then
                if not v37 then
                    v36._store:dispatch(v4(true));
                else
                    v36._presetController:initializePresets();
                    v36._store:dispatch(v5(true));
                    return ;
                end;
            end;
        end);
        return ;
    else
        v36._store:dispatch(v7(true));
        v36.showImportPrompt(function(v39)
            v36:_onFilePicked(v39);
            v36.promptRequested = false;
        end);
        return ;
    end;
end;
v15._onFilePicked = function(v40, v41)
    if #v41 == 0 then
        return ;
    else
        v40._presetController:initializePresets(v41);
        local l_sessionQueue_0 = v40._store:getState().Sessions.sessionQueue;
        local v43, v44 = next(l_sessionQueue_0);
        local v45 = false;
        if v44 ~= nil then
            v45 = next(l_sessionQueue_0, v43) == nil;
        end;
        local v46 = false;
        if v44 ~= nil then
            v46 = v44.validSession;
        end;
        if not (not v45 or not v46) then
            v40:requestPreview(v44);
        end;
        return ;
    end;
end;
v15.requestFileSwap = function(v47, v48)
    v47.promptRequested = true;
    v47.showReplaceImportPrompt(v48, function(v49, v50)
        v47:_onFileSwapped(v49, v50);
        v47.promptRequested = false;
    end);
end;
v15._onFileSwapped = function(v51, v52, v53)
    if v52 then
        local v54 = v51._store:getState().Sessions.sessionQueue[v52];
        local v55 = if v53.currentPreset ~= "" then v53.currentPreset else v51._presetController.defaultName;
        if v55 ~= v54.currentPreset then
            v51._presetController:resolvePreset(v55, v54);
        end;
        return ;
    else
        return ;
    end;
end;
v15.requestPreview = function(v56, v57)
    v56._store:dispatch(v11(v57, function(_, _)
    end));
end;
v15.DEPRECATED_onImport = function(v60, v61)
    if v61 then
        if not v60._store:getState().Dialogs.uploading then
            v60._presetController:createPresetFromLastImport(v61:GetImportTree());
            v61:Upload();
            v60._store:dispatch(v5(false));
            v60._store:dispatch(v8(true));
            v60._store:dispatch(v6(true));
            return ;
        else
            return ;
        end;
    else
        v60._store:dispatch(v5(false));
        v60._store:dispatch(v4(true));
        return ;
    end;
end;
v15.DEPRECATED_onImportCompleted = function(v62)
    v62._store:dispatch(v8(false));
    v62:DEPRECATED_cleanupPreview();
end;
return v15;
