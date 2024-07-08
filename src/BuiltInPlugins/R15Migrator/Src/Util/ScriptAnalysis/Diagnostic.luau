local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
local v3 = {};
v3.__index = v3;
v3.__eq = function(v4, v5)
    if not ((v4.range == v5.range and v4.message == v5.message) and #v4.suggestions == #v5.suggestions) or v4.issueType ~= v5.issueType then
        return false;
    else
        for v6, v7 in v4.suggestions, nil, nil do
            if v7 ~= v5.suggestions[v6] then
                return false;
            end;
        end;
        return true;
    end;
end;
v3.__lt = function(v8, v9)
    return v8.range < v9.range;
end;
v3.new = function(v10, v11, v12, v13, v14, v15, v16, v17)
    return (setmetatable({
        diagnosticId = l_HttpService_0:GenerateGUID(true), 
        range = v10, 
        code = v11, 
        codeDescription = v16, 
        instanceName = v12, 
        message = v13, 
        severity = v14, 
        suggestions = v15, 
        issueType = v17
    }, v3));
end;
v3.GetDataForLinter = function(v18)
    return {
        range = v18.range:GetDataForLinter(), 
        code = v18.code, 
        message = v18.message, 
        severity = v18.severity, 
        codeDescription = v18.codeDescription
    };
end;
return v3;
