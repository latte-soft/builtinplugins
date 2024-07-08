local l_AssetImportService_0 = game:GetService("AssetImportService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.ResetState);
local v4 = require(l_Actions_0.SetAssetImportSession);
local v5 = require(l_Actions_0.SetFilename);
local v6 = require(l_Actions_0.SetImportTree);
local v7 = require(l_Actions_0.SetSelectedImportItem);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v9 = require(l_Thunks_0.CreateQueuedSession);
local v10 = require(l_Thunks_0.LoadManagedGroups);
local v11 = require(l_Thunks_0.UpdateChecked);
local v12 = require(l_Thunks_0.UpdatePreviewInstance);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportUseUploadId);
return function(v15)
    return function(v16)
        if not v13() then
            local v17 = nil;
            local v18 = nil;
            local v19 = nil;
            v17 = l_AssetImportService_0:StartSessionWithPrompt();
            if v17 then
                v18 = v17:GetImportTree();
                v19 = v17:GetFilename();
            end;
            if not (not v18 or not v19) then
                local l_v18_Preview_0 = v18:GetPreview();
                local v21 = {};
                for _, v23 in v18:GetDescendants() do
                    v21[v23] = v23.ShouldImport;
                end;
                v21[v18] = true;
                v16:dispatch(v3());
                v16:dispatch(v12(l_v18_Preview_0));
                v16:dispatch(v6(v18));
                v16:dispatch(v5(v19));
                v16:dispatch(v7(v18));
                v16:dispatch(v11(v21));
                if v14() then
                    v16:dispatch(v10());
                end;
            end;
            v16:dispatch(v4(v17));
            if v15 then
                local v24 = false;
                if v18 ~= nil then
                    v24 = v19 ~= nil;
                end;
                v15(v24, v17 == nil);
            end;
        else
            local v25 = l_AssetImportService_0:PickMultipleFilesWithPrompt();
            for _, v27 in v25, nil, nil do
                v16:dispatch(v9(v27, (l_AssetImportService_0:StartSessionWithPath(v27))));
            end;
            if v15 then
                v15(v25);
                return ;
            end;
        end;
    end;
end;
