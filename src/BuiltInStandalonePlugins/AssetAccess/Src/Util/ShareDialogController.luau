local _ = require(script:FindFirstAncestor("AssetAccess").Src.Types);
local v1 = {};
v1.__index = v1;
local function v2(v3)
    if typeof(v3) == "table" then
        if not table.isfrozen(v3) then
            table.freeze(v3);
        end;
        for _, v5 in v3, nil, nil do
            v2(v5);
        end;
    end;
    return v3;
end;
v1.new = function(v6)
    local v7 = {};
    setmetatable(v7, v1);
    v7._alive = true;
    v7._model = table.freeze({
        state = "Inactive"
    });
    v7._plugin = v6;
    v7._threads = {};
    local l_v6_PluginComponent_0 = v6:GetPluginComponent("AssetAccessController");
    v7._assetAccessController = l_v6_PluginComponent_0;
    v7._showShareDialogConnection = l_v6_PluginComponent_0.ShowShareDialog:Connect(function(v9)
        v7:_ShowShareDialog(v9);
    end);
    v7._newInaccessibleAssetConnection = l_v6_PluginComponent_0.NewInaccessibleAsset:Connect(function(v10)
        v7:_NewInaccessibleAsset(v10);
    end);
    v7._shareAccessConnection = v6:OnInvoke("ShareAccess", function()
        v7:_ShareAccess();
    end);
    v7._shareDialogDismissedConnection = v6:OnInvoke("ShareDialogDismissed", function()
        v7:_ShareDialogDismissed();
    end);
    v7._onGetAssetMetadataFinished = function()
    end;
    v7._onShareAccessFinished = function()
    end;
    v7._plugin:SetItem("ShareDialogModel", v7._model);
    return v7;
end;
v1._GetModel = function(v11)
    assert(v11._alive, "ShareDialogController has been destroyed");
    return v11._model;
end;
v1._SetModel = function(v12, v13)
    assert(v12._alive, "ShareDialogController has been destroyed");
    v12._model = v2(table.clone(v13));
    v12._plugin:SetItem("ShareDialogModel", v12._model);
end;
v1._Defer = function(v14, v15)
    assert(v14._alive, "ShareDialogController has been destroyed");
    local v16 = nil;
    v16 = task.defer(function()
        v15();
        v14._threads[v16] = nil;
    end);
    v14._threads[v16] = true;
    return v16;
end;
v1._GetAndHydrateAssetMetadata = function(v17, v18)
    assert(v17._alive, "ShareDialogController has been destroyed");
    assert(v17:_GetModel().state == "Prompt", "Can only load asset metadata in the Prompt state");
    v17:_Defer(function()
        local l_status_0, l_result_0 = pcall(function()
            return v17._assetAccessController:GetAssetMetadata(v18);
        end);
        local v21 = v17:_GetModel();
        if v21.state ~= "Prompt" then
            v17._onGetAssetMetadataFinished();
            return ;
        else
            assert(v21.state == "Prompt", "Luau");
            local v22 = table.clone(v21.assetModels);
            if not l_status_0 then
                for _, v24 in v18, nil, nil do
                    if v22[v24] and v22[v24].state == "Loading" then
                        v22[v24] = {
                            state = "Failed"
                        };
                    end;
                end;
            else
                for _, v26 in l_result_0, nil, nil do
                    if v22[v26.id] and v22[v26.id].state == "Loading" then
                        v22[v26.id] = {
                            state = "Loaded", 
                            metadata = v26
                        };
                    end;
                end;
            end;
            v17:_SetModel({
                state = "Prompt", 
                assetModels = v22
            });
            v17._onGetAssetMetadataFinished();
            return ;
        end;
    end);
end;
v1._ShowShareDialog = function(v27, v28)
    assert(v27._alive, "ShareDialogController has been destroyed");
    local v29 = {};
    for _, v31 in v28, nil, nil do
        v29[v31] = {
            state = "Loading"
        };
    end;
    v27:_SetModel({
        assetModels = v29, 
        state = "Prompt"
    });
    v27:_GetAndHydrateAssetMetadata(v28);
end;
v1._NewInaccessibleAsset = function(v32, v33)
    assert(v32._alive, "ShareDialogController has been destroyed");
    local v34 = v32:_GetModel();
    if v34.state ~= "Prompt" then
        return ;
    else
        assert(v34.state == "Prompt", "Luau");
        local v35 = table.clone(v34.assetModels);
        v35[v33] = {
            state = "Loading"
        };
        v32:_SetModel({
            assetModels = v35, 
            state = "Prompt"
        });
        v32:_GetAndHydrateAssetMetadata({
            v33
        });
        return ;
    end;
end;
v1._ShareAccess = function(v36)
    assert(v36._alive, "ShareDialogController has been destroyed");
    local v37 = v36:_GetModel();
    if v37.state ~= "Prompt" then
        v36._onShareAccessFinished();
        return ;
    else
        assert(v37.state == "Prompt", "Luau");
        v36:_SetModel({
            state = "Sharing", 
            assetModels = v37.assetModels
        });
        local v38 = {};
        for v39, _ in v37.assetModels, nil, nil do
            table.insert(v38, v39);
        end;
        v36:_Defer(function()
            local l_status_1, l_result_1 = pcall(function()
                return v36._assetAccessController:ShareAccessToInaccessibleAssets(v38);
            end);
            local v43 = v36:_GetModel();
            if v43.state ~= "Sharing" then
                v36._onShareAccessFinished();
                return ;
            else
                assert(v43.state == "Sharing", "Luau");
                if l_status_1 then
                    if #l_result_1 == 0 then
                        v36:_SetModel({
                            state = "Inactive"
                        });
                        v36._onShareAccessFinished();
                        return ;
                    else
                        local v44 = {};
                        for _, v46 in l_result_1, nil, nil do
                            v44[v46] = table.clone(v43.assetModels[v46]);
                        end;
                        v36:_SetModel({
                            state = "CantShare", 
                            assetModels = v44
                        });
                        v36._onShareAccessFinished();
                        return ;
                    end;
                else
                    v36:_SetModel({
                        state = "UnexpectedError"
                    });
                    v36._onShareAccessFinished();
                    return ;
                end;
            end;
        end);
        return ;
    end;
end;
v1._ShareDialogDismissed = function(v47)
    assert(v47._alive, "ShareDialogController has been destroyed");
    v47:_SetModel({
        state = "Inactive"
    });
end;
v1.Destroy = function(v48)
    assert(v48._alive, "ShareDialogController already destroyed");
    for v49, _ in v48._threads, nil, nil do
        task.cancel(v49);
    end;
    v48._threads = {};
    v48._showShareDialogConnection:Disconnect();
    v48._newInaccessibleAssetConnection:Disconnect();
    v48._shareAccessConnection:Disconnect();
    v48._shareDialogDismissedConnection:Disconnect();
    v48._plugin:SetItem("ShareDialogModel", nil);
    v48._alive = false;
end;
return table.freeze(v1);
