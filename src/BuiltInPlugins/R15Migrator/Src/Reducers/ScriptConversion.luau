local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local function v4()
    return {
        diagnostics = {}, 
        completedScripts = {}, 
        selection = {}, 
        expansion = {}, 
        initialIssueCounts = {}, 
        revertedScripts = {}, 
        filter = nil, 
        replaceRules = v3.getScriptConversionRules() or {
            {
                FromText = "Left Arm", 
                ToText = "LeftUpperArm", 
                Enabled = true
            }, 
            {
                FromText = "Right Arm", 
                ToText = "RightUpperArm", 
                Enabled = true
            }, 
            {
                FromText = "Left Leg", 
                ToText = "LeftUpperLeg", 
                Enabled = true
            }, 
            {
                FromText = "Right Leg", 
                ToText = "RightUpperLeg", 
                Enabled = true
            }, 
            {
                FromText = "Torso", 
                ToText = "LowerTorso", 
                Enabled = true
            }
        }, 
        replaceProgress = nil, 
        messageKey = "", 
        processResult = {}, 
        analyticsSent = false
    };
end;
return (v1.createReducer(v4(), {
    SetDiagnostics = function(v5, v6)
        return v2.Dictionary.join(v5, {
            diagnostics = v6.diagnostics
        });
    end, 
    SetFilter = function(v7, v8)
        return v2.Dictionary.join(v7, {
            filter = v8.filter
        });
    end, 
    SetScriptSelection = function(v9, v10)
        return v2.Dictionary.join(v9, {
            selection = v10.selection
        });
    end, 
    SetScriptExpansion = function(v11, v12)
        return v2.Dictionary.join(v11, {
            expansion = v12.expansion
        });
    end, 
    SetCompletedScripts = function(v13, v14)
        return v2.Dictionary.join(v13, {
            completedScripts = v14.completedScripts
        });
    end, 
    SetInitialIssueCounts = function(v15, v16)
        return v2.Dictionary.join(v15, {
            initialIssueCounts = v16.initialIssueCounts
        });
    end, 
    SetRevertedScripts = function(v17, v18)
        return v2.Dictionary.join(v17, {
            revertedScripts = v18.revertedScripts
        });
    end, 
    SetReplaceRules = function(v19, v20)
        return v2.Dictionary.join(v19, {
            replaceRules = v20.replaceRules
        });
    end, 
    SetReplaceProgress = function(v21, v22)
        return v2.Dictionary.join(v21, {
            replaceProgress = v22.progress
        });
    end, 
    SetProgressBarMessageKey = function(v23, v24)
        return v2.Dictionary.join(v23, {
            messageKey = v24.messageKey
        });
    end, 
    SetProcessResult = function(v25, v26)
        return v2.Dictionary.join(v25, {
            processResult = v26.processResult
        });
    end, 
    ResetAllScriptConversion = function(v27)
        return v2.Dictionary.join(v27, (v4()));
    end, 
    SetScriptAnalyticsSent = function(v28, v29)
        return v2.Dictionary.join(v28, {
            analyticsSent = v29.analyticsSent
        });
    end
}));
