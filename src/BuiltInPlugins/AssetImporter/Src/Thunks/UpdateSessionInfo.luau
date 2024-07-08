local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.UpdateQueueItem);
local v2 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v3 = require(l_script_FirstAncestor_0.Src.Utility.Status.countStatusLevelsForTree);
return function(v4)
    return function(v5)
        if v4 and v4.session then
            local l_ImportTree_0 = v4.session:GetImportTree();
            if l_ImportTree_0 == nil then
                v5:dispatch(v1((v2.update(v4, {
                    validSession = false
                }))));
                return ;
            else
                local v7 = nil;
                local v8 = nil;
                if l_ImportTree_0 then
                    local v9 = v3(l_ImportTree_0);
                    v7 = v9[l_ImportTree_0].errors + v9[l_ImportTree_0].descErrors;
                    v8 = v9[l_ImportTree_0].warnings + v9[l_ImportTree_0].descWarnings;
                end;
                v5:dispatch(v1((v2.update(v4, {
                    errors = v7, 
                    warnings = v8
                }))));
                return ;
            end;
        else
            return ;
        end;
    end;
end;
