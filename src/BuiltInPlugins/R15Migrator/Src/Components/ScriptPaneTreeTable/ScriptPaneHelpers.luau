local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_Dash_0 = require(l_script_FirstAncestor_0.Packages.Framework).Dash;
local l_append_0 = l_Dash_0.append;
local _ = l_Dash_0.join;
local _ = l_Dash_0.keys;
local l_map_0 = l_Dash_0.map;
local _ = l_Dash_0.pretty;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v8 = require(l_Util_0.ScriptReplacement);
local v9 = require(l_Util_0.ScriptAnalysis.R6Info);
local v10 = require(l_Util_0.ScriptAnalysis.Constants);
local v11 = require(script.Parent.Sort);
local v12 = {
    [v9.PartKey] = "Part", 
    [v10.ReferenceKey] = "Variable", 
    [v9.JointKey] = "Joint"
};
local v13 = {};
local function v20(v14, v15)
    local l_issueType_0 = v14.issueType;
    local l_instanceName_0 = v14.instanceName;
    local v18 = nil;
    if l_issueType_0 == v9.PartKey then
        v18 = v9.Conversions[v9.PartsKey][l_instanceName_0];
    elseif l_issueType_0 == v9.JointKey then
        v18 = {
            v9.Conversions[v9.JointsKey][l_instanceName_0][v9.JointKey]
        };
    else
        return nil;
    end;
    return {
        Type = "Dropdown", 
        Options = l_append_0({
            {
                Id = v8.UNASSIGNED, 
                Label = v15:getText("ScriptPane", v8.UNASSIGNED)
            }
        }, l_map_0(v18, function(v19)
            return {
                Id = v19, 
                Label = v19
            };
        end))
    };
end;
v13.isDiagnosticFilteredOut = function(v21, v22, v23)
    if (v23.scriptName and v23.scriptName ~= "") and string.find(v21, v23.scriptName) == nil then
        return true;
    elseif not next(v23.rigFilters.R6) or v23.rigFilters.R6[v22.instanceName] then
        if next(v23.rigFilters.R15) then
            if v23.rigFilters.R15.Unassigned or v22.resolution then
                if not (v23.rigFilters.R15.Assigned or not v22.resolution) then
                    return true;
                end;
            else
                return true;
            end;
        end;
        return false;
    else
        return true;
    end;
end;
v13.makeItemId = function(v24, v25, v26, v27)
    local v28 = v24 .. "|" .. v25 .. "|" .. v26;
    if v27 then
        v28 = v28 .. "|" .. v27;
    end;
    return v28;
end;
v13.genSortItems = function(v29, v30)
    return function(v31, v32)
        local v33 = typeof(v31[v29.Key]) == "table";
        local v34 = typeof(v32[v29.Key]) == "table";
        local v35 = if not v33 then v31[v29.Key] else v31[v29.Key].Value;
        local v36 = if not v34 then v32[v29.Key] else v32[v29.Key].Value;
        if not v29.SortMethod then
            if v35 ~= v36 then
                if v30 == Enum.SortDirection.Descending then
                    return v35 < v36;
                else
                    return v36 < v35;
                end;
            end;
        else
            local v37 = v29.SortMethod(v35, v36, v30);
            if v37 ~= nil then
                return v37;
            end;
        end;
        return v11.scriptLinkSort(v31.name.Value, v32.name.Value, Enum.SortDirection.Ascending);
    end;
end;
v13.generateTreeViewItems = function(v38, v39, v40, v41, v42)
    local v43 = {};
    local v44 = {};
    for v45, v46 in v38, nil, nil do
        local v47 = v39:getScriptInstanceFromGUID(v45);
        local l_v47_FullName_0 = v47:GetFullName();
        for _, v50 in v46:Get() do
            if not v13.isDiagnosticFilteredOut(l_v47_FullName_0, v50, v40) then
                local l_instanceName_1 = v50.instanceName;
                local l_issueType_1 = v50.issueType;
                if l_issueType_1 ~= v9.AnimationKey then
                    if not v43[v45] then
                        v43[v45] = {};
                    end;
                    if not v43[v45][l_issueType_1] then
                        v43[v45][l_issueType_1] = {};
                    end;
                    local v53 = v43[v45][l_issueType_1][l_instanceName_1];
                    local v54 = v20(v50, v42);
                    local _, v56 = next(v41);
                    local l_v56_0 = v56;
                    if l_v56_0 then
                        l_v56_0 = true;
                        if v56.issueType == l_issueType_1 then
                            l_v56_0 = v56.instanceName ~= l_instanceName_1;
                        end;
                    end;
                    if v53 == nil then
                        v53 = {
                            select = {
                                Value = v41[v13.makeItemId(v45, l_issueType_1, l_instanceName_1)], 
                                Schema = {
                                    Type = "Checkbox"
                                }
                            }, 
                            name = {
                                Value = {
                                    Script = v47
                                }, 
                                Schema = {
                                    Type = "ScriptLink"
                                }
                            }, 
                            count = 0, 
                            issue = v12[l_issueType_1], 
                            r6 = l_instanceName_1, 
                            r15 = if not v54 then {
                                Value = ""
                            } else {
                                Value = v50.resolution or v8.UNASSIGNED, 
                                Schema = v54
                            }, 
                            menu_status = {
                                Value = {
                                    Checked = true
                                }, 
                                Schema = {
                                    Type = "Status"
                                }
                            }, 
                            children = {}, 
                            Path = {
                                scriptId = v45, 
                                instanceName = l_instanceName_1, 
                                issueType = l_issueType_1
                            }, 
                            _id = v13.makeItemId(v45, l_issueType_1, l_instanceName_1), 
                            _disabled = l_v56_0
                        };
                        v53.Path.item = v53;
                        v43[v45][l_issueType_1][l_instanceName_1] = v53;
                        table.insert(v44, v53);
                    end;
                    local v58 = {
                        select = nil, 
                        name = {
                            Value = {
                                Script = v47, 
                                Range = v50.range
                            }, 
                            Schema = {
                                Type = "ScriptLink"
                            }
                        }, 
                        count = nil, 
                        issue = "", 
                        r6 = l_instanceName_1, 
                        r15 = if not v54 then {
                            Value = ""
                        } else {
                            Value = v50.resolution or v8.UNASSIGNED, 
                            Schema = v54
                        }, 
                        menu_status = {
                            Value = {
                                Checked = v50.resolution ~= nil
                            }, 
                            Schema = {
                                Type = "Status"
                            }
                        }, 
                        Path = {
                            parent = v53, 
                            scriptId = v45, 
                            issueType = l_issueType_1, 
                            diagnostic = v50
                        }, 
                        _id = v13.makeItemId(v45, l_issueType_1, l_instanceName_1, v50.diagnosticId), 
                        _disabled = l_v56_0
                    };
                    if not (not v53.r15 or not v53.r15.Value) and v50.resolution ~= v53.r15.Value then
                        v53.r15 = if not v54 then nil else {
                            Value = v8.UNASSIGNED, 
                            Schema = v54
                        };
                    end;
                    if v50.resolution == nil then
                        v53.menu_status.Value.Checked = false;
                    end;
                    v58.Path.item = v58;
                    table.insert(v53.children, v58);
                    v53.count = v53.count + 1;
                end;
            end;
        end;
    end;
    return v44;
end;
v13.getItemId = function(v59)
    return v59._id;
end;
return v13;
