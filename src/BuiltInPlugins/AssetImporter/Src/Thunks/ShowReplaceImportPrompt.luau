local l_AssetImportService_0 = game:GetService("AssetImportService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.UpdateQueueItem);
local v4 = require(l_Actions_0.RemoveQueueItem);
local v5 = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.CreateQueuedSession);
local function _(v7, v8)
    return v7:getState().Sessions.sessionQueue[v8];
end;
return function(v10, v11)
    return function(v12)
        local v13 = l_AssetImportService_0:PickMultipleFilesWithPrompt()[1];
        if not (v13 ~= nil and v13 ~= "") or v13 == v10 then
            return ;
        else
            local v14 = v12:getState().Sessions.sessionQueue[v10];
            v12:dispatch(v4(v10));
            v12:dispatch(v6(v13, (l_AssetImportService_0:StartSessionWithPath(v13))));
            v12:dispatch(v3((v5.update(v12:getState().Sessions.sessionQueue[v13], {
                timestamp = v14.timestamp
            }))));
            v11(v13, v14);
            return ;
        end;
    end;
end;
