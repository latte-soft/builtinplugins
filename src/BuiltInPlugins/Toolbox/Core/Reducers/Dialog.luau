local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Actions_0 = l_script_FirstAncestor_0.Core.Actions;
return v3.createReducer({
    subsequentDialogQueue = {}
}, {
    [require(l_Actions_0.EnqueueSubsequentDialog).name] = function(v5, v6)
        return v2.Dictionary.join(v5, {
            subsequentDialogQueue = v2.List.join(v5.subsequentDialogQueue, {
                {
                    assetData = v6.assetData, 
                    status = v6.status
                }
            })
        });
    end, 
    [require(l_Actions_0.DequeueSubsequentDialog).name] = function(v7, _)
        return v2.Dictionary.join(v7, {
            subsequentDialogQueue = v2.List.removeValue(v7.subsequentDialogQueue, v7.subsequentDialogQueue[1])
        });
    end
});
