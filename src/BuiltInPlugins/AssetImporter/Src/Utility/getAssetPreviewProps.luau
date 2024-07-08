local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Utility.getInsertContext);
local v2 = require(l_script_FirstAncestor_0.Src.Utility.getAssetRenderModel);
return function(v3, v4, v5, v6)
    local v7 = {
        model = nil, 
        initDist = 0, 
        insertContextOffset = Vector3.new(), 
        workspacePreview = nil, 
        model = v2(v3)
    };
    v7.initDist = v7.model:GetExtentsSize().Magnitude;
    if not ((not v6 or not v4.InsertInWorkspace) or not v5) then
        local v8, v9 = v1(v4, v7.model);
        v7.workspacePreview = v8;
        v7.insertContextOffset = v9;
    end;
    return v7;
end;
