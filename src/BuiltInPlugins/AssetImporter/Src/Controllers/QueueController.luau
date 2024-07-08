local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextItem_0 = v1.ContextServices.ContextItem;
local l_Promise_0 = v1.Util.Promise;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v5 = require(l_Actions_0.SetShowPreview);
local v6 = require(l_Actions_0.SetUploading);
local v7 = require(l_Actions_0.SetSessionQueue);
local v8 = require(l_Actions_0.UpdateQueueItem);
local v9 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v11 = require(l_Thunks_0.InsertModelInWorkspace);
local v12 = require(l_Thunks_0.ClosePreview);
local v13 = require(l_script_FirstAncestor_0.Src.Utility.openInAvatarPreviewer);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagImporterOpensAvatarPreviewerBetaCheck);
local v15 = l_ContextItem_0:extend("QueueController");
v15.new = function(v16, v17)
    local v18 = {
        _store = v16, 
        _mock = v17
    };
    v18.resolveUploadPromise = function(v19, v20)
        local l_session_0 = v20.session;
        local l_l_session_0_ImportTree_0 = l_session_0:GetImportTree();
        v18._store:dispatch(v8(v9.update(v20, {
            uploaded = true
        })));
        v18._store:dispatch(v11(v19, l_l_session_0_ImportTree_0));
        if v14() then
            v13(v19, l_l_session_0_ImportTree_0, l_session_0);
        end;
    end;
    v18.rejectUploadPromise = function(_)
    end;
    return (setmetatable(v18, v15));
end;
v15.mock = function(v24)
    return v15.new(v24, true);
end;
v15.destroy = function(v25)
    if not v25._store:getState().Dialogs.uploading then
        v25:removeAllQueuedFiles();
        return ;
    else
        return ;
    end;
end;
v15._getSessionQueue = function(v26)
    return v26._store:getState().Sessions.sessionQueue;
end;
v15.destroyItem = function(_, v28)
    if not (not v28 or not v28.session) then
        v28.session:Cancel();
    end;
end;
v15.removeAllQueuedFiles = function(v29)
    if not v29._store:getState().Dialogs.uploading then
        v29._store:dispatch(v12());
        for _, v31 in v29:_getSessionQueue() do
            v29:destroyItem(v31);
        end;
        v29._store:dispatch(v7({}));
        return ;
    else
        return ;
    end;
end;
v15.removeErroredQueuedFiles = function(v32)
    v32._store:dispatch(v12());
end;
v15.removeUploadedQueuedFiles = function(v33)
    v33._store:dispatch(v12());
end;
v15.isImportEnabled = function(_, v35)
    return v35.validSession;
end;
v15.beginImportQueue = function(v36)
    if not v36._store:getState().Dialogs.uploading then
        v36._store:dispatch(v5(false));
        v36._store:dispatch(v6(true));
        for _, v38 in (v36:_getSessionQueue()), nil, nil do
            v36:uploadItem(v38);
        end;
        v36._store:dispatch(v6(false));
        return ;
    else
        return ;
    end;
end;
v15.uploadItem = function(v39, v40)
    if not (not v40.enabled or not v39:isImportEnabled(v40)) then
        v39:_createUploadPromise(v40):andThen(v39.resolveUploadPromise, v39.rejectUploadPromise):await();
    end;
end;
v15._createUploadPromise = function(_, v42)
    return l_Promise_0.new(function(v43, v44)
        local v45 = nil;
        local v46 = nil;
        if v42.session and v42.session:GetImportTree() then
            local function v48(v47)
                if v45 then
                    v45:Disconnect();
                end;
                if v46 then
                    v46:Disconnect();
                end;
                if not v47.Succeeded then
                    v44();
                    return ;
                else
                    v43(v47, v42);
                    return ;
                end;
            end;
            local function v50(_)
            end;
            local l_session_1 = v42.session;
            v45 = l_session_1.UploadComplete:Connect(v48);
            v46 = l_session_1.UploadProgress:Connect(v50);
            l_session_1:Upload();
            return ;
        else
            v44();
            return ;
        end;
    end);
end;
return v15;
