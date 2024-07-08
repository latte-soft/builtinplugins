local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetProcessResult);
local v2 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ScriptIssueSorting);
local v4 = require(l_script_FirstAncestor_0.Src.Util.ScriptConversionProgressTracker);
local v5 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local function v10(v6)
    local v7 = {};
    for _, v9 in v6, nil, nil do
        if (v9.FromText ~= "" and v9.ToText ~= "") and v9.Enabled ~= false then
            v7[v9.FromText] = v9.ToText;
        end;
    end;
    return v7;
end;
local _ = function(v11)
    local v12 = 0;
    for _, v14 in v11, nil, nil do
        v12 = v12 + #v14;
    end;
    return v12;
end;
local function v29(v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26)
    local v27 = nil;
    if not v19 or #v20 > 0 then
        v27 = v21[v18];
    end;
    if v20 and #v20 == 1 then
        v27 = v20[1];
        v23.autoConverted = v23.autoConverted + 1;
    end;
    if v27 then
        v2.replaceWithSuggestion(v16, v17, v22, v27, v24, v25);
        return true;
    else
        local v28 = v23[v26 == v5.ReferenceKey and "failedVar" or "failed"];
        if not v28[v16] then
            v28[v16] = {};
        end;
        v28[v16][v18] = true;
        return false;
    end;
end;
local function v45(_, v31, v32, v33, v34, v35, v36, v37, v38)
    local v39 = next(v33);
    for v40, v41 in v33, nil, nil do
        local v42 = v37[v40];
        for _, v44 in v41, nil, nil do
            v31:updateProgress();
            if v29(v40, v44.range, v44.instanceName, v35, v44.suggestions, v36, v32, v34, v42, v38, v44.issueType) then
                v34.succeeded = v34.succeeded + 1;
            end;
        end;
        if v40 ~= v39 then
            v32:closeScriptIfOpen(v40);
        end;
    end;
    if v39 then
        v32:closeScriptIfOpen(v39);
    end;
end;
return function(v46, _, v48, v49)
    return function(v50)
        local v51 = v50:getState();
        local l_selection_0 = v51.ScriptConversion.selection;
        local l_diagnostics_0 = v51.ScriptConversion.diagnostics;
        local v54 = v3:sortSelectionForConversion(l_selection_0, l_diagnostics_0);
        local v55 = {
            autoConverted = 0, 
            succeeded = 0, 
            failed = {}, 
            failedVar = {}
        };
        local v56 = v10(v51.ScriptConversion.replaceRules);
        local v57 = 0;
        for _, v59 in v54, nil, nil do
            v57 = v57 + #v59;
        end;
        local l_v57_0 = v57;
        if l_v57_0 > 0 then
            v57 = "ReplaceWithRules";
            if v48 then
                v57 = "Convert";
            end;
            local v61 = v4.new(v57, l_v57_0, v50);
            v45(v51, v61, v46, v54, v55, v48, v56, l_diagnostics_0, v49);
            v61:clearProgressBar();
        end;
        v57 = {
            replaceResult = v55
        };
        v50:dispatch(v1(v57));
        v49:getHandler("onScriptConvertSelection")(v57, v56);
    end;
end;
