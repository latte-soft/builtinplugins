local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local l_join_0 = require(l_script_FirstAncestor_0.Packages.Cryo).Dictionary.join;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v4 = require(l_Actions_0.SetSessionQueue);
local v5 = require(l_Actions_0.UpdateQueueItem);
local v6 = require(l_Actions_0.RemoveQueueItem);
local _ = require(l_script_FirstAncestor_0.Src.DataTypes.QueuedSession);
return v1.createReducer({
    sessionQueue = {}
}, {
    [v4.name] = function(v8, v9)
        return l_join_0(v8, {
            sessionQueue = v9.sessionQueue
        });
    end, 
    [v5.name] = function(v10, v11)
        return l_join_0(v10.sessionQueue, {
            sessionQueue = l_join_0(v10.sessionQueue, {
                [v11.queueItem.filepath] = v11.queueItem
            })
        });
    end, 
    [v6.name] = function(v12, v13)
        local v14 = table.clone(v12.sessionQueue);
        v14[v13.filepath] = nil;
        return l_join_0(v12, {
            sessionQueue = v14
        });
    end
});
