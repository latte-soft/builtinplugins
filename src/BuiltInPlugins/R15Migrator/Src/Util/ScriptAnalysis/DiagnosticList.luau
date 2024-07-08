local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v3 = {};
v3.__index = v3;
v3.__eq = function(v4, v5)
    if #v4._list ~= #v5._list then
        return false;
    else
        for v6, v7 in v4._list, nil, nil do
            if v7 ~= v5._list[v6] then
                return false;
            end;
        end;
        return true;
    end;
end;
v3.new = function()
    return (setmetatable({
        _list = {}
    }, v3));
end;
v3.AddDiagnostic = function(v8, v9)
    table.insert(v8._list, v9);
end;
v3.GetDataForLinter = function(v10)
    local v11 = {};
    for _, v13 in v10._list, nil, nil do
        table.insert(v11, v13:GetDataForLinter());
    end;
    return v11;
end;
v3.Get = function(v14)
    return v14._list;
end;
v3.GetSize = function(v15)
    return #v15._list;
end;
v3.ErrorCount = function(v16, v17)
    local v18 = 0;
    for _, v20 in v16._list, nil, nil do
        if not (not ((not v17 or v17 == v20.instanceName) and v20.severity == Enum.Severity.Error) or v20.resolution) then
            v18 = v18 + 1;
        end;
    end;
    return v18;
end;
v3.WarningCount = function(v21, v22)
    local v23 = 0;
    for _, v25 in v21._list, nil, nil do
        if not (not ((not v22 or v22 == v25.instanceName) and v25.severity == Enum.Severity.Warning) or v25.resolution) then
            v23 = v23 + 1;
        end;
    end;
    return v23;
end;
v3.HasErrors = function(v26)
    return v26:ErrorCount() > 0;
end;
v3.HasWarnings = function(v27)
    return v27:WarningCount() > 0;
end;
v3.Merge = function(v28, v29)
    local v30 = v3.new();
    v30._list = l_deepCopy_0(v28._list);
    for _, v32 in v29._list, nil, nil do
        local v33 = false;
        for _, v35 in v30._list, nil, nil do
            if (v32.range == v35.range and v32.instanceName == v35.instanceName) and v32.issueType == v35.issueType then
                v33 = true;
                break;
            end;
        end;
        if not v33 then
            v30:AddDiagnostic(v32);
        end;
    end;
    table.sort(v30._list);
    return v30;
end;
return v3;
