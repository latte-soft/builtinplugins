local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetDiagnostics);
local v3 = require(l_script_FirstAncestor_0.Src.Util.ScriptReplacement);
return function(v4, v5, v6, v7)
    return function(v8)
        local v9 = l_deepCopy_0(v8:getState().ScriptConversion.diagnostics);
        local v10 = v9[v4];
        for v11 = #v10._list, 1, -1 do
            local v12 = v10._list[v11];
            local l_range_0 = v12.range;
            for _, v15 in v5, nil, nil do
                if v12.diagnosticId == v15 then
                    local v16 = if v6 == v3.UNASSIGNED then v12.instanceName else v6;
                    v3.goToScript(v4, l_range_0, v7):EditTextAsync(v16, l_range_0.startLine, l_range_0.startCharacter, l_range_0.endLine, l_range_0.endCharacter);
                    v12.range.endCharacter = (v12.range.endCharacter - #(v12.resolution or v12.instanceName)) + #v16;
                    v12.resolution = if v6 == v3.UNASSIGNED then nil else v6;
                    break;
                end;
            end;
        end;
        v8:dispatch(v2(v9));
    end;
end;
