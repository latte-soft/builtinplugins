local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Mocks.DebuggerVariable);
local v2 = require(l_Parent_0.Util.Constants);
local _ = require(script.Parent.WatchWindowTableRow);
local function v5(v4)
    return {
        expressionColumn = v4, 
        pathColumn = v4, 
        scopeColumn = "", 
        valueColumn = "", 
        dataTypeColumn = "", 
        childPaths = {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
local function v7(v6)
    return {
        expressionColumn = v6.expression, 
        pathColumn = v6.path, 
        scopeColumn = v6.scope, 
        valueColumn = v6.value, 
        dataTypeColumn = v6.dataType, 
        childPaths = v6.childPaths or {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
local function v10(v8, v9)
    return {
        expressionColumn = v9, 
        pathColumn = v9, 
        idColumn = v8.VariableId, 
        scopeColumn = "", 
        valueColumn = v8.Value, 
        dataTypeColumn = v8.Type, 
        childPaths = {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
local function v13(v11, v12)
    return {
        expressionColumn = v11.Name, 
        pathColumn = v12 .. v2.SeparationToken .. v11.Name, 
        idColumn = v11.VariableId, 
        scopeColumn = "", 
        valueColumn = v11.Value, 
        dataTypeColumn = v11.Type, 
        childPaths = {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
return {
    fromData = v7, 
    fromExpression = v5, 
    fromInstance = v10, 
    fromChildInstance = v13, 
    dummyRow = function(v14)
        return (v13(v1.newDummyRow(), v14.pathColumn));
    end
};
