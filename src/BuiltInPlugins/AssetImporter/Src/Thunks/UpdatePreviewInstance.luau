local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetPreviewInstance);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportCleanUpPreviewInstance);
local function v6(v3)
    for _, v5 in (v3:GetDescendants()), nil, nil do
        if v5:IsA("KeyframeSequence") then
            v5:Destroy();
        end;
    end;
end;
return function(v7)
    return function(v8)
        if not v7 then
            v8:dispatch(v1(nil));
            return ;
        else
            local v9 = v7:Clone();
            if v9:IsA("KeyframeSequence") then
                local l_Preview_0 = v8:getState().Preview.assetImportSession:GetImportTree():GetPreview();
                if v2() then
                    v6(l_Preview_0);
                end;
                local l_WorldModel_0 = Instance.new("WorldModel");
                v9.Parent = l_Preview_0;
                l_Preview_0.Parent = l_WorldModel_0;
                v9 = l_WorldModel_0;
            end;
            v8:dispatch(v1(v9));
            return ;
        end;
    end;
end;
