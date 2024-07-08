local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsGlobals);
local v3 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptStatusUtil);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local l_AnimationStatus_0 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.constants).AnimationStatus;
local v7 = require(l_script_FirstAncestor_0.Src.Modules.NpcManager);
local l_HttpService_0 = game:GetService("HttpService");
return function(v9)
    local function v13(v10, v11)
        local v12 = v1.Dictionary.join({
            studioSid = v9:GetSessionId(), 
            clientId = v9:GetClientId(), 
            placeId = game.PlaceId
        }, v11 or {});
        if v3.LogAnalytics() then
            print(("%s SendEvent eventName=%s args=%s"):format("R15Migrator", tostring(v10), l_HttpService_0:JSONEncode(v12)));
        end;
        v9:SendEventDeferred("studio", "R15Migrator", v10, v12);
    end;
    return {
        onCharactersLoaded = function(v14, v15)
            local _ = function(v16)
                local v17 = 0;
                local v18 = {};
                for v19, _ in v16, nil, nil do
                    v17 = v17 + 1;
                    table.insert(v18, v19);
                end;
                return v17, v18;
            end;
            local v22 = 0;
            local v23 = {};
            for v24, _ in v14, nil, nil do
                v22 = v22 + 1;
                table.insert(v23, v24);
            end;
            local l_v22_0 = v22;
            local l_v23_0 = v23;
            local v28 = 0;
            local v29 = {};
            for v30, _ in v15, nil, nil do
                v28 = v28 + 1;
                table.insert(v29, v30);
            end;
            v22 = v28;
            v13("CharactersLoaded", {
                numUnconverted = l_v22_0, 
                unconvertedIds = l_v23_0, 
                numConverted = v22, 
                convertedIds = v29, 
                percentConverted = l_v22_0 == 0 and 0 or math.clamp((v22 / (v22 + l_v22_0)) * 100, 0, 100), 
                numWarnings = v7.GetNumCharactersHaveWarnings(v14), 
                numCustom = v7.GetNumCharactersHaveCustomMesh(v14)
            });
        end, 
        onCharactersConverted = function(v32, v33)
            local v34 = #v1.Dictionary.keys(v32);
            local v35 = 0;
            local v36 = {};
            local v37 = {};
            for _, v39 in v33, nil, nil do
                if v32[v39] then
                    v35 = v35 + 1;
                    table.insert(v36, v32[v39]);
                    table.insert(v37, v39);
                end;
            end;
            v13("CharactersConverted", {
                numConverted = v35, 
                convertedIds = v37, 
                percentConverted = v34 == 0 and 0 or math.clamp((v35 / v34) * 100, 0, 100), 
                numWarnings = v7.GetNumCharactersHaveWarnings(v36), 
                numCustom = v7.GetNumCharactersHaveCustomMesh(v36)
            });
        end, 
        onCharactersReverted = function(v40, v41)
            local v42 = #v1.Dictionary.keys(v40);
            local v43 = 0;
            local v44 = {};
            local v45 = {};
            for _, v47 in v41, nil, nil do
                if v40[v47] then
                    v43 = v43 + 1;
                    table.insert(v44, v40[v47]);
                    table.insert(v45, v47);
                end;
            end;
            v13("CharactersReverted", {
                numReverted = v43, 
                revertedIds = v45, 
                percentReverted = v42 == 0 and 0 or math.clamp((v43 / v42) * 100, 0, 100), 
                numWarnings = v7.GetNumCharactersHaveWarnings(v44), 
                numCustom = v7.GetNumCharactersHaveCustomMesh(v44)
            });
        end, 
        onAnimationsConverted = function(v48, v49)
            local v50 = #v1.Dictionary.keys(v48);
            local v51 = 0;
            for v52, _ in v49, nil, nil do
                if v48[v52] then
                    v51 = v51 + 1;
                end;
            end;
            v13("AnimationsConverted", {
                numConverted = v51, 
                percentConverted = v50 == 0 and 0 or math.clamp((v51 / v50) * 100, 0, 100)
            });
        end, 
        onInitialAnimationsAnalysisScan = function(v54, v55)
            local v56 = {
                numAnimations = 0, 
                numConverted = 0, 
                percentConverted = 0
            };
            for v57, _ in v54, nil, nil do
                v56.numAnimations = v56.numAnimations + 1;
                if (v55[v57] or {}).status == l_AnimationStatus_0.Done then
                    v56.numConverted = v56.numConverted + 1;
                end;
            end;
            v56.percentConverted = v56.numAnimations == 0 and 0 or math.clamp((v56.numConverted / v56.numAnimations) * 100, 0, 100);
            v13("InitialAnimationAnalysisScan", v56);
        end, 
        onScriptRulesUpdate = function(v59, v60, v61)
            v13("onScriptRulesUpdate", {
                fromPart = v59 or "", 
                toPart = v60 or "", 
                isEnabled = v61
            });
        end, 
        onInitialScriptAnalysisScan = function(v62, v63, v64)
            local v65 = {
                numScripts = 0, 
                averageLines = 0, 
                numCompleted = 0, 
                totalScripts = v63
            };
            local v66 = 0;
            for _, v68 in v62, nil, nil do
                v65.numScripts = v65.numScripts + 1;
                v66 = v66 + v68:GetSize();
            end;
            if v65.numScripts ~= 0 then
                v65.averageLines = v65.numScripts == 0 and 0 or v66 / v65.numScripts;
                for _, _ in v64, nil, nil do
                    v65.numCompleted = v65.numCompleted + 1;
                end;
                v13("InitialScriptAnalysisScan", v65);
            end;
        end, 
        onScriptSuggestionApplied = function()
            v13("ScriptSuggestionApplied", {});
        end, 
        onScriptSelectionReverted = function(v71)
            v13("ScriptSelectionReverted", {
                numScripts = v4:GetStatusCounts(v71)[v5.ScriptStatus.Reverted]
            });
        end, 
        onScriptAutoReplacement = function(v72)
            v13("onScriptAutoReplacement", {
                issueType = v72
            });
        end, 
        onScriptSelectionRevertUndo = function(v73)
            v13("ScriptSelectionUndoRevert", {
                numScripts = v4:GetStatusCounts(v73)[v5.ScriptStatus.Reverted]
            });
        end, 
        onAdapterToggle = function(v74, v75, v76, v77)
            if v75 == nil then
                v75 = 0;
            end;
            if v76 == nil then
                v76 = 0;
            end;
            if v77 == nil then
                v77 = 0;
            end;
            v13("AdapterToggled", {
                adapterAdded = v74, 
                numScriptIssuesLeft = v75, 
                numAnimationsNotConverted = v76, 
                numCharactersNotConverted = v77
            });
        end, 
        onScriptConvertSelection = function(v78, v79)
            local l_v4_StatusCounts_0 = v4:GetStatusCounts(v78);
            local v81 = not l_v4_StatusCounts_0[v5.ScriptStatus.AutoConverted] and 0 or l_v4_StatusCounts_0[v5.ScriptStatus.AutoConverted];
            local v82 = {
                autoConvertCount = v81, 
                replacedCount = math.min(0, (not l_v4_StatusCounts_0[v5.ScriptStatus.Complete] and 0 or l_v4_StatusCounts_0[v5.ScriptStatus.Complete]) - v81), 
                failedCount = not l_v4_StatusCounts_0[v5.ScriptStatus.Error] and 0 or l_v4_StatusCounts_0[v5.ScriptStatus.Error], 
                numRules = 0
            };
            for _, v84 in v79, nil, nil do
                if v84.Enabled and v84.ToText ~= "" then
                    v82.numRules = v82.numRules + 1;
                end;
            end;
            v13("ScriptSelectionConvert", v82);
        end, 
        onPluginClosed = function()
            v13("PluginClosed", {
                timeSpent = os.time() - v2.StartTime
            });
        end, 
        onPublish = function(v85)
            v13("Publish", {
                checks = v85
            });
        end
    };
end;
