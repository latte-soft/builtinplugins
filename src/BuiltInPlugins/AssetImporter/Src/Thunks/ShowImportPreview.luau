local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetActiveQueueItem);
local v3 = require(l_Actions_0.SetAssetImportSession);
local v4 = require(l_Actions_0.SetImportTree);
local v5 = require(l_Actions_0.SetFilename);
local v6 = require(l_Actions_0.SetSelectedImportItem);
local v7 = require(l_Actions_0.SetShowPreview);
local v8 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v9 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateChecked);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
return function(v11, v12)
    return function(v13)
        local v14 = nil;
        local v15 = nil;
        if v10() then
            v13:dispatch(v2(v11));
        end;
        local v16 = if not v10() then v11 else v11.session;
        if v16 then
            v14 = v16:GetImportTree();
            v15 = v16:GetFilename();
        end;
        if not (not v14 or not v15) then
            local l_v14_Preview_0 = v14:GetPreview();
            local v18 = {};
            for _, v20 in v14:GetDescendants() do
                v18[v20] = v20.ShouldImport;
            end;
            v18[v14] = true;
            v13:dispatch(v8(l_v14_Preview_0));
            v13:dispatch(v4(v14));
            v13:dispatch(v5(v15));
            v13:dispatch(v6(v14));
            v13:dispatch(v9(v18));
        end;
        v13:dispatch(v3(v16));
        local v21 = false;
        if v14 ~= nil then
            v21 = v15 ~= nil;
        end;
        local v22 = v16 == nil;
        if v12 then
            v12(v21, v22);
        end;
        v13:dispatch(v7(v21 and not v22));
    end;
end;
