local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Issue);
local v2 = require(l_Parent_0.R6Info);
local v3 = {};
v3.__index = v3;
v3.new = function(v4, v5)
    return (setmetatable({
        StartIndex = v4, 
        EndIndex = v5, 
        Issues = {}, 
        Children = {}, 
        Lines = {}, 
        Variables = {}
    }, v3));
end;
local function _(v6, v7)
    v6.Parent = v7;
end;
v3.AddChild = function(v9, v10)
    table.insert(v9.Children, v10);
    v10.Parent = v9;
end;
v3.AddVariable = function(v11, v12, v13, v14, v15)
    v11.Variables[v12] = {
        Value = v13, 
        LineNo = v14, 
        StartIndex = v15
    };
end;
v3.SetVariableValue = function(v16, v17, v18)
    if v16.Variables[v17] then
        v16.Variables[v17].Value = v18;
    end;
end;
v3.IsHumanoidVariable = function(v19, v20)
    if not v19.Variables[v20] then
        return false;
    else
        return v2.IsHumanoidName(v20) or v2.IsHumanoidName(v19.Variables[v20].Value);
    end;
end;
v3.AddIssue = function(v21, ...)
    table.insert(v21.Issues, v1.new(...));
end;
return v3;
