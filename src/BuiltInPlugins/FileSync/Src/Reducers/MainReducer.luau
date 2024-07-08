local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local l_SetWarningText_0 = l_Actions_0.SetWarningText;
local l_ClearWarningText_0 = l_Actions_0.ClearWarningText;
local l_SetSyncPath_0 = l_Actions_0.SetSyncPath;
local l_SetLastOperation_0 = l_Actions_0.SetLastOperation;
local l_SetLastOperationTime_0 = l_Actions_0.SetLastOperationTime;
local function _()
    return {
        redrawSignal = false, 
        warningText = nil, 
        syncPath = nil, 
        lastOperation = "", 
        lastOperationTime = ""
    };
end;
return v1.createReducer({
    redrawSignal = false, 
    warningText = nil, 
    syncPath = nil, 
    lastOperation = "", 
    lastOperationTime = ""
}, {
    [l_SetWarningText_0.Name] = function(v10, v11)
        return v2.Dictionary.join(v10, {
            warningText = v11.warningText
        });
    end, 
    [l_ClearWarningText_0.Name] = function(v12, v13)
        return v2.Dictionary.join(v12, {
            warningText = v13.warningText
        });
    end, 
    [l_SetSyncPath_0.Name] = function(v14, v15)
        return v2.Dictionary.join(v14, {
            syncPath = v15.syncPath
        });
    end, 
    [l_SetLastOperation_0.Name] = function(v16, v17)
        return v2.Dictionary.join(v16, {
            lastOperation = v17.lastOperation
        });
    end, 
    [l_SetLastOperationTime_0.Name] = function(v18, v19)
        return v2.Dictionary.join(v18, {
            lastOperationTime = v19.lastOperationTime
        });
    end
});
