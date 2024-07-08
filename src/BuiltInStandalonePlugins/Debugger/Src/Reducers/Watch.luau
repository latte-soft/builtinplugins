local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local l_Models_0 = l_Parent_0.Src.Models;
local l_deepCopy_0 = require(l_Parent_0.Packages.Framework).Util.deepCopy;
local v6 = require(l_Actions_0.Watch.SetVariablesScopeFilteredOut);
local v7 = require(l_Actions_0.Watch.SetVariablesTextFilteredOut);
local v8 = require(l_Actions_0.Watch.SetVariableExpanded);
local v9 = require(l_Actions_0.Watch.AddRootVariables);
local v10 = require(l_Actions_0.Watch.AddChildVariables);
local v11 = require(l_Actions_0.Watch.RemoveDummyVariableFromParent);
local v12 = require(l_Actions_0.Watch.AddChildExpression);
local v13 = require(l_Actions_0.Watch.AddExpression);
local v14 = require(l_Actions_0.Watch.ChangeExpression);
local v15 = require(l_Actions_0.Watch.ExpressionEvaluated);
local v16 = require(l_Actions_0.Watch.ExpressionsEvaluated);
local v17 = require(l_Actions_0.Watch.RemoveExpression);
local v18 = require(l_Actions_0.Watch.SetExpansionTree);
local v19 = require(l_Actions_0.Watch.SetWatchSortState);
local v20 = require(l_Actions_0.Watch.SetExpressionExpanded);
local v21 = require(l_Actions_0.Watch.ClearAllExpressions);
local v22 = require(l_Actions_0.Common.SimPaused);
local v23 = require(l_Actions_0.Common.Resumed);
local v24 = require(l_Actions_0.Common.ClearConnectionData);
local v25 = require(l_Actions_0.Watch.ScopeFilterChange);
local v26 = require(l_Actions_0.Watch.VariablesFilterChange);
local v27 = require(l_Actions_0.Watch.MyWatchesFilterChange);
local v28 = require(l_Actions_0.Watch.SetTab);
local v29 = require(l_Actions_0.Watch.FilterTextChanged);
local _ = require(l_Models_0.DebuggerStateToken);
local _ = require(l_Models_0.Watch.VariableRow);
local _ = require(l_Models_0.Watch.WatchRow);
local v33 = require(l_Models_0.Watch.ScopeEnum);
local v34 = require(l_Models_0.Watch.TableTab);
local v35 = require(l_Models_0.Watch.VariablesColumnEnum);
local v36 = require(l_Models_0.Watch.MyWatchesColumnEnum);
local v37 = require(l_Parent_0.Src.Util.Constants);
local function v40(v38, v39)
    assert(v38[v39.debuggerStateToken] ~= nil);
    if v38[v39.debuggerStateToken][v39.threadId] == nil then
        v38[v39.debuggerStateToken][v39.threadId] = {};
    end;
    if v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber] == nil then
        v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber] = {};
    end;
    if v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber].Variables == nil then
        v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber].Variables = {};
    end;
    if v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber].Watches == nil then
        v38[v39.debuggerStateToken][v39.threadId][v39.frameNumber].Watches = {};
    end;
end;
local function _(v41, v42)
    if v41[v42.debuggerStateToken] == nil then
        assert(false);
        return false;
    elseif v41[v42.debuggerStateToken][v42.threadId] == nil then
        assert(false);
        return false;
    elseif v41[v42.debuggerStateToken][v42.threadId][v42.frameNumber] == nil then
        assert(false);
        return false;
    else
        return true;
    end;
end;
local function v48(v44, v45)
    local l_stepStateBundle_0 = v45.stepStateBundle;
    local v47;
    if v44[l_stepStateBundle_0.debuggerStateToken] == nil then
        assert(false);
        v47 = false;
    elseif v44[l_stepStateBundle_0.debuggerStateToken][l_stepStateBundle_0.threadId] == nil then
        assert(false);
        v47 = false;
    elseif v44[l_stepStateBundle_0.debuggerStateToken][l_stepStateBundle_0.threadId][l_stepStateBundle_0.frameNumber] == nil then
        assert(false);
        v47 = false;
    else
        v47 = true;
    end;
    if v47 == false then
        return false;
    else
        v47 = v44[l_stepStateBundle_0.debuggerStateToken][l_stepStateBundle_0.threadId][l_stepStateBundle_0.frameNumber];
        if v47.Variables == nil then
            assert(false);
            return false;
        elseif v45.path ~= nil and v47.Variables[v45.path] == nil then
            assert(false);
            return false;
        elseif v45.parentPath ~= nil and v47.Variables[v45.parentPath] == nil then
            assert(false);
            return false;
        else
            return true;
        end;
    end;
end;
local function v53(v49, v50, v51)
    local v52;
    if v49[v50.debuggerStateToken] == nil then
        assert(false);
        v52 = false;
    elseif v49[v50.debuggerStateToken][v50.threadId] == nil then
        assert(false);
        v52 = false;
    elseif v49[v50.debuggerStateToken][v50.threadId][v50.frameNumber] == nil then
        assert(false);
        v52 = false;
    else
        v52 = true;
    end;
    if v52 == false then
        return false;
    else
        v52 = v49[v50.debuggerStateToken][v50.threadId][v50.frameNumber];
        if v52.Watches == nil then
            assert(false);
            return false;
        elseif v51.path ~= nil and v52.Watches[v51.path] == nil then
            assert(false);
            return false;
        elseif v51.parentPath ~= nil and v52.Watches[v51.parentPath] == nil then
            assert(false);
            return false;
        else
            return true;
        end;
    end;
end;
local function _(v54, v55)
    for v56, v57 in pairs(v54) do
        if v57 == v55 then
            return v56;
        end;
    end;
    return nil;
end;
return v1.createReducer({
    stateTokenToRoots = {}, 
    stateTokenToFlattenedTree = {}, 
    currentTab = v34.Variables, 
    listOfEnabledScopes = {
        v33.Local, 
        v33.Upvalue, 
        v33.Global
    }, 
    listOfVariablesColumns = {
        v35.Scope, 
        v35.Value, 
        v35.DataType
    }, 
    listOfMyWatchesColumns = {
        v36.Value, 
        v36.DataType
    }, 
    listOfExpressions = {}, 
    pathToExpansionState = {}, 
    expressionToExpansionState = {}, 
    filterText = "", 
    variablesSortDirection = nil, 
    variablesColumnIndex = nil, 
    watchesSortDirection = nil, 
    watchesColumnIndex = nil
}, {
    [v22.name] = function(v59, v60)
        local v61;
        if v59.stateTokenToRoots[v60.debuggerStateToken] ~= nil then
            v61 = false;
            if not (v59.stateTokenToRoots[v60.debuggerStateToken][v60.threadId] == nil) then
                goto label0;
            end;
        end;
        v61 = true;
        if v59.stateTokenToFlattenedTree[v60.debuggerStateToken] ~= nil then
            v61 = v59.stateTokenToFlattenedTree[v60.debuggerStateToken][v60.threadId] == nil;
        end;
        ::label0::;
        assert(v61);
        return v2.Dictionary.join(v59, {
            stateTokenToRoots = v2.Dictionary.join(v59.stateTokenToRoots, {
                [v60.debuggerStateToken] = v2.Dictionary.join(v59.stateTokenToRoots[v60.debuggerStateToken] or {}, {
                    [v60.threadId] = {}
                })
            }), 
            stateTokenToFlattenedTree = v2.Dictionary.join(v59.stateTokenToFlattenedTree, {
                [v60.debuggerStateToken] = v2.Dictionary.join(v59.stateTokenToFlattenedTree[v60.debuggerStateToken] or {}, {
                    [v60.threadId] = {}
                })
            })
        });
    end, 
    [v23.name] = function(v62, v63)
        assert(v62.stateTokenToRoots[v63.debuggerStateToken] ~= nil);
        if v62.stateTokenToRoots[v63.debuggerStateToken][v63.threadId] == nil then
            return v62;
        else
            local v64 = false;
            if v62.stateTokenToFlattenedTree[v63.debuggerStateToken] ~= nil then
                v64 = v62.stateTokenToFlattenedTree[v63.debuggerStateToken][v63.threadId] ~= nil;
            end;
            assert(v64);
            local v65 = l_deepCopy_0(v62.stateTokenToRoots[v63.debuggerStateToken]);
            v65[v63.threadId] = nil;
            v64 = l_deepCopy_0(v62.stateTokenToFlattenedTree[v63.debuggerStateToken]);
            v64[v63.threadId] = nil;
            return v2.Dictionary.join(v62, {
                stateTokenToRoots = v2.Dictionary.join(v62.stateTokenToRoots, {
                    [v63.debuggerStateToken] = v65
                }), 
                stateTokenToFlattenedTree = v2.Dictionary.join(v62.stateTokenToFlattenedTree, {
                    [v63.debuggerStateToken] = v64
                })
            });
        end;
    end, 
    [v24.name] = function(v66, v67)
        local v68 = false;
        if v66.stateTokenToRoots[v67.debuggerStateToken] ~= nil then
            v68 = v66.stateTokenToFlattenedTree[v67.debuggerStateToken] ~= nil;
        end;
        local v69 = true;
        for _, _ in pairs(v66.stateTokenToRoots) do
            v69 = false;
        end;
        assert(v68 or v69);
        return v2.Dictionary.join(v66, {
            stateTokenToRoots = v2.Dictionary.join(v66.stateTokenToRoots, {
                [v67.debuggerStateToken] = v2.None
            }), 
            stateTokenToFlattenedTree = v2.Dictionary.join(v66.stateTokenToFlattenedTree, {
                [v67.debuggerStateToken] = v2.None
            })
        });
    end, 
    [v9.name] = function(v72, v73)
        local v74 = l_deepCopy_0(v72.stateTokenToRoots);
        v40(v74, v73.stepStateBundle);
        local l_stepStateBundle_1 = v73.stepStateBundle;
        local l_Variables_0 = v74[l_stepStateBundle_1.debuggerStateToken][l_stepStateBundle_1.threadId][l_stepStateBundle_1.frameNumber].Variables;
        for _, v78 in ipairs(v73.tokenizedList) do
            table.insert(l_Variables_0, v78);
        end;
        local v79 = l_deepCopy_0(v72.stateTokenToFlattenedTree);
        v40(v79, v73.stepStateBundle);
        local l_Variables_1 = v79[l_stepStateBundle_1.debuggerStateToken][l_stepStateBundle_1.threadId][l_stepStateBundle_1.frameNumber].Variables;
        for v81, v82 in pairs(v73.newVarsMapping) do
            l_Variables_1[v81] = v82;
        end;
        return v2.Dictionary.join(v72, {
            stateTokenToRoots = v74, 
            stateTokenToFlattenedTree = v79
        });
    end, 
    [v10.name] = function(v83, v84)
        local v85 = l_deepCopy_0(v83.stateTokenToFlattenedTree);
        if v48(v85, v84) == false then
            return v83;
        else
            local l_stepStateBundle_2 = v84.stepStateBundle;
            local l_Variables_2 = v85[l_stepStateBundle_2.debuggerStateToken][l_stepStateBundle_2.threadId][l_stepStateBundle_2.frameNumber].Variables;
            for v88, v89 in pairs(v84.newVarsMapping) do
                l_Variables_2[v88] = v89;
            end;
            local l_childPaths_0 = l_Variables_2[v84.parentPath].childPaths;
            for _, v92 in ipairs(v84.childKeys) do
                table.insert(l_childPaths_0, v92);
            end;
            return v2.Dictionary.join(v83, {
                stateTokenToFlattenedTree = v85
            });
        end;
    end, 
    [v11.name] = function(v93, v94)
        local v95 = l_deepCopy_0(v93.stateTokenToFlattenedTree);
        local l_stepStateBundle_3 = v94.stepStateBundle;
        local v97 = nil;
        if not v94.isVariablesTab then
            if v53(v95, v94.stepStateBundle, v94) == false then
                return v93;
            else
                v97 = v95[l_stepStateBundle_3.debuggerStateToken][l_stepStateBundle_3.threadId][l_stepStateBundle_3.frameNumber].Watches;
            end;
        elseif v48(v95, v94) == false then
            return v93;
        else
            v97 = v95[l_stepStateBundle_3.debuggerStateToken][l_stepStateBundle_3.threadId][l_stepStateBundle_3.frameNumber].Variables;
        end;
        v97[v94.parentPath].childPaths = {};
        v97[v94.parentPath .. v37.SeparationToken .. v37.DummyRowName] = nil;
        return v2.Dictionary.join(v93, {
            stateTokenToFlattenedTree = v95
        });
    end, 
    [v8.name] = function(v98, v99)
        return v2.Dictionary.join(v98, {
            pathToExpansionState = v2.Dictionary.join(v98.pathToExpansionState, {
                [v99.path] = v99.expanded
            })
        });
    end, 
    [v20.name] = function(v100, v101)
        return v2.Dictionary.join(v100, {
            expressionToExpansionState = v2.Dictionary.join(v100.expressionToExpansionState, {
                [v101.path] = v101.expanded
            })
        });
    end, 
    [v6.name] = function(v102, v103)
        local v104 = l_deepCopy_0(v102.stateTokenToFlattenedTree);
        if v48(v104, v103) == false then
            return v102;
        else
            local l_stepStateBundle_4 = v103.stepStateBundle;
            local l_Variables_3 = v104[l_stepStateBundle_4.debuggerStateToken][l_stepStateBundle_4.threadId][l_stepStateBundle_4.frameNumber].Variables;
            for v107, v108 in pairs(v103.textFilterMap) do
                l_Variables_3[v107].scopeFilteredOut = v108;
            end;
            return v2.Dictionary.join(v102, {
                stateTokenToFlattenedTree = v104
            });
        end;
    end, 
    [v7.name] = function(v109, v110)
        local v111 = l_deepCopy_0(v109.stateTokenToFlattenedTree);
        if v48(v111, v110) == false then
            return v109;
        else
            local l_stepStateBundle_5 = v110.stepStateBundle;
            local v113 = if not v110.isVariablesTab then v111[l_stepStateBundle_5.debuggerStateToken][l_stepStateBundle_5.threadId][l_stepStateBundle_5.frameNumber].Watches else v111[l_stepStateBundle_5.debuggerStateToken][l_stepStateBundle_5.threadId][l_stepStateBundle_5.frameNumber].Variables;
            for v114, v115 in pairs(v110.textFilterMap) do
                v113[v114].textFilteredOut = v115;
            end;
            return v2.Dictionary.join(v109, {
                stateTokenToFlattenedTree = v111
            });
        end;
    end, 
    [v28.name] = function(v116, v117)
        return v2.Dictionary.join(v116, {
            currentTab = v117.currentTab
        });
    end, 
    [v25.name] = function(v118, v119)
        return v2.Dictionary.join(v118, {
            listOfEnabledScopes = v119.listOfEnabledScopes
        });
    end, 
    [v26.name] = function(v120, v121)
        return v2.Dictionary.join(v120, {
            listOfVariablesColumns = v121.listOfVariablesColumns
        });
    end, 
    [v27.name] = function(v122, v123)
        return v2.Dictionary.join(v122, {
            listOfMyWatchesColumns = v123.listOfMyWatchesColumns
        });
    end, 
    [v12.name] = function(v124, v125)
        local v126 = l_deepCopy_0(v124.stateTokenToFlattenedTree);
        if v53(v126, v125.stepStateBundle, v125) == false then
            return v124;
        else
            local l_Watches_0 = v126[v125.stepStateBundle.debuggerStateToken][v125.stepStateBundle.threadId][v125.stepStateBundle.frameNumber].Watches;
            for v128, v129 in pairs(v125.newVarsMapping) do
                l_Watches_0[v128] = v129;
            end;
            local l_childPaths_1 = l_Watches_0[v125.parentPath].childPaths;
            for _, v132 in ipairs(v125.childKeys) do
                table.insert(l_childPaths_1, v132);
            end;
            return v2.Dictionary.join(v124, {
                stateTokenToFlattenedTree = v126
            });
        end;
    end, 
    [v13.name] = function(v133, v134)
        local l_listOfExpressions_0 = v133.listOfExpressions;
        local l_expression_0 = v134.expression;
        local v137;
        for v138, v139 in pairs(l_listOfExpressions_0) do
            if v139 == l_expression_0 then
                v137 = v138;
                goto label1 --[[  true, false  ]];
            end;
        end;
        v137 = nil;
        ::label1::;
        if v137 ~= nil then
            return v133;
        else
            return v2.Dictionary.join(v133, {
                listOfExpressions = v2.List.join(v133.listOfExpressions, {
                    v134.expression
                })
            });
        end;
    end, 
    [v14.name] = function(v140, v141)
        local l_listOfExpressions_1 = v140.listOfExpressions;
        local l_newExpression_0 = v141.newExpression;
        local v144;
        for v145, v146 in pairs(l_listOfExpressions_1) do
            if v146 == l_newExpression_0 then
                v144 = v145;
                goto label2 --[[  true, false  ]];
            end;
        end;
        v144 = nil;
        ::label2::;
        if v144 ~= nil then
            return v140;
        else
            l_listOfExpressions_1 = v140.listOfExpressions;
            l_newExpression_0 = v141.oldExpression;
            for v147, v148 in pairs(l_listOfExpressions_1) do
                if v148 == l_newExpression_0 then
                    v144 = v147;
                    goto label3 --[[  true, false  ]];
                end;
            end;
            v144 = nil;
            ::label3::;
            if v144 == nil then
                return v140;
            else
                v144 = l_deepCopy_0(v140.listOfExpressions);
                l_newExpression_0 = v141.oldExpression;
                for v149, v150 in pairs(v144) do
                    if v150 == l_newExpression_0 then
                        l_listOfExpressions_1 = v149;
                        goto label4 --[[  true, false  ]];
                    end;
                end;
                l_listOfExpressions_1 = nil;
                ::label4::;
                v144[l_listOfExpressions_1] = v141.newExpression;
                return v2.Dictionary.join(v140, {
                    listOfExpressions = v144
                });
            end;
        end;
    end, 
    [v15.name] = function(v151, v152)
        local v153 = l_deepCopy_0(v151.stateTokenToRoots);
        v40(v153, v152.stepStateBundle);
        table.insert(v153[v152.stepStateBundle.debuggerStateToken][v152.stepStateBundle.threadId][v152.stepStateBundle.frameNumber].Watches, v152.watchRow.pathColumn);
        local v154 = l_deepCopy_0(v151.stateTokenToFlattenedTree);
        v40(v154, v152.stepStateBundle);
        v154[v152.stepStateBundle.debuggerStateToken][v152.stepStateBundle.threadId][v152.stepStateBundle.frameNumber].Watches[v152.watchRow.pathColumn] = v152.watchRow;
        return v2.Dictionary.join(v151, {
            stateTokenToRoots = v153, 
            stateTokenToFlattenedTree = v154
        });
    end, 
    [v16.name] = function(v155, v156)
        local v157 = l_deepCopy_0(v155.stateTokenToRoots);
        v40(v157, v156.stepStateBundle);
        local l_Watches_1 = v157[v156.stepStateBundle.debuggerStateToken][v156.stepStateBundle.threadId][v156.stepStateBundle.frameNumber].Watches;
        for _, v160 in v156.watchRows, nil, nil do
            table.insert(l_Watches_1, v160.pathColumn);
        end;
        local v161 = l_deepCopy_0(v155.stateTokenToFlattenedTree);
        v40(v161, v156.stepStateBundle);
        local l_Watches_2 = v161[v156.stepStateBundle.debuggerStateToken][v156.stepStateBundle.threadId][v156.stepStateBundle.frameNumber].Watches;
        for _, v164 in v156.watchRows, nil, nil do
            l_Watches_2[v164.pathColumn] = v164;
        end;
        return v2.Dictionary.join(v155, {
            stateTokenToRoots = v157, 
            stateTokenToFlattenedTree = v161
        });
    end, 
    [v17.name] = function(v165, v166)
        return v2.Dictionary.join(v165, {
            listOfExpressions = v2.List.removeValue(v165.listOfExpressions, v166.expression)
        });
    end, 
    [v21.name] = function(v167, _)
        return v2.Dictionary.join(v167, {
            listOfExpressions = {}
        });
    end, 
    [v18.name] = function(v169, v170)
        if not v170.isVariablesTab then
            return v2.Dictionary.join(v169, {
                expressionToExpansionState = v2.Dictionary.join(v169.expressionToExpansionState, v170.expansionMapping)
            });
        else
            return v2.Dictionary.join(v169, {
                pathToExpansionState = v2.Dictionary.join(v169.pathToExpansionState, v170.expansionMapping)
            });
        end;
    end, 
    [v29.name] = function(v171, v172)
        return v2.Dictionary.join(v171, {
            filterText = v172.filterText
        });
    end, 
    [v19.name] = function(v173, v174)
        if v173.currentTab == v34.Variables then
            return v2.Dictionary.join(v173, {
                variablesSortDirection = v174.sortDirection, 
                variablesColumnIndex = v174.columnIndex
            });
        else
            return v2.Dictionary.join(v173, {
                watchesSortDirection = v174.sortDirection, 
                watchesColumnIndex = v174.columnIndex
            });
        end;
    end
});
