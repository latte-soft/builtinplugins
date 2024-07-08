local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateSessionInfo);
local v2 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
return function(v3, v4)
    return function(v5)
        local v6 = if v4 ~= nil then v4:GetImportTree() else nil;
        v5:dispatch(v1((v2.new({
            assetName = if not v6 then v3 else v6.ImportName, 
            enabled = v6 ~= nil, 
            filepath = v3, 
            session = v4, 
            timestamp = os.time(), 
            validSession = v6 ~= nil
        }))));
    end;
end;
