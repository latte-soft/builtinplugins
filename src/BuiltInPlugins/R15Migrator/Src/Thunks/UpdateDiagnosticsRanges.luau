local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetDiagnostics);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Range);
return function(v4, v5, v6)
    return function(v7)
        local l_diagnostics_0 = v7:getState().ScriptConversion.diagnostics;
        if v5 then
            local v9 = v4:addOrFindScript(v5);
            local v10 = l_diagnostics_0[v9];
            if v10 then
                local l__list_0 = l_deepCopy_0(v10)._list;
                local v12 = nil;
                local v13 = false;
                for _, v15 in v6, nil, nil do
                    v15.range = v3.fromLinter(v15.range);
                    v12 = {};
                    for _, v17 in l__list_0, nil, nil do
                        if not v17.range:Overlaps(v15.range) then
                            if not (v15.range.startLine >= v17.range.startLine) or v15.range.startLine == v17.range.startLine and v15.range.startCharacter < v17.range.startCharacter then
                                local _, v19 = v15.text:gsub("\n", "\n");
                                local v20 = v19 - (v15.range.endLine - v15.range.startLine);
                                local v21 = 0;
                                if v15.range.endLine == v17.range.startLine then
                                    local v22 = v15.text:find("\n[^\n]*$");
                                    v21 = ((#v15.text - (v22 or 0)) + (v22 ~= nil and 1 or v15.range.startCharacter)) - v15.range.endCharacter;
                                    local l_range_0 = v17.range;
                                    l_range_0.startCharacter = l_range_0.startCharacter + v21;
                                    if v17.range.endLine == v17.range.startLine then
                                        l_range_0 = v17.range;
                                        l_range_0.endCharacter = l_range_0.endCharacter + v21;
                                    end;
                                end;
                                local l_range_1 = v17.range;
                                l_range_1.startLine = l_range_1.startLine + v20;
                                l_range_1 = v17.range;
                                l_range_1.endLine = l_range_1.endLine + v20;
                                l_range_1 = v13;
                                if not l_range_1 then
                                    l_range_1 = true;
                                    if v20 == 0 then
                                        l_range_1 = v21 ~= 0;
                                    end;
                                end;
                                v13 = l_range_1;
                            end;
                            table.insert(v12, v17);
                        else
                            v13 = true;
                        end;
                    end;
                    l__list_0 = v12;
                end;
                if v13 then
                    local v25 = l_deepCopy_0(l_diagnostics_0);
                    v25[v9]._list = v12;
                    v7:dispatch(v2(v25));
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
