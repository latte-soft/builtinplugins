local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Action_0 = require(l_Parent_0.Packages.Framework).Util.Action;
local _ = require(l_Parent_0.Src.Models.Watch.VariableRow);
local _ = require(l_Parent_0.Src.Models.StepStateBundle);
return l_Action_0(script.Name, function(v4, v5)
    local v6 = {};
    local v7 = {};
    for _, v9 in ipairs(v5) do
        table.insert(v6, v9.pathColumn);
        v7[v9.pathColumn] = v9;
    end;
    return {
        stepStateBundle = v4, 
        tokenizedList = v6, 
        newVarsMapping = v7
    };
end);
