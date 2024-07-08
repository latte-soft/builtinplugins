local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local _ = require(l_Parent_0.Src.Models.Watch.VariableRow);
local _ = require(l_Parent_0.Src.Models.StepStateBundle);
return l_Action_0(script.Name, function(v4, v5, v6)
    local v7 = {};
    local v8 = {};
    for _, v10 in ipairs(v6) do
        table.insert(v7, v10.pathColumn);
        v8[v10.pathColumn] = v10;
    end;
    return {
        stepStateBundle = v4, 
        parentPath = v5, 
        childKeys = v7, 
        newVarsMapping = v8
    };
end);
