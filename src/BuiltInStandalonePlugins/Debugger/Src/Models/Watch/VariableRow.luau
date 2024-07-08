local _ = require(script.Parent.WatchWindowTableRow);
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Mocks.DebuggerVariable);
local v3 = require(l_Parent_0.Util.Constants);
local v4 = require(l_Parent_0.Util.WatchHelperFunctions);
local function v6(v5)
    return {
        nameColumn = v5.name, 
        pathColumn = v5.path, 
        idColumn = v5.id, 
        scopeColumn = v5.scope, 
        valueColumn = v5.value, 
        dataTypeColumn = v5.dataType, 
        childPaths = v5.childPaths or {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
end;
local function v13(v7, v8, v9, v10, v11)
    local v12 = {
        nameColumn = v7.Name, 
        pathColumn = (not v8 and "" or v8.pathColumn .. v3.SeparationToken) .. v7.Name, 
        idColumn = v7.VariableId, 
        scopeColumn = not not v8 and v8.scopeColumn or v9, 
        valueColumn = v7.Value, 
        dataTypeColumn = v7.Type, 
        childPaths = {}, 
        expanded = false, 
        textFilteredOut = false, 
        scopeFilteredOut = false
    };
    v12.textFilteredOut = not v4.textMatchRow(v10, v12);
    v12.scopeFilteredOut = v4.isScopeFiltered(v11, v12);
    return v12;
end;
return {
    fromData = v6, 
    fromInstance = v13, 
    dummyRow = function(v14, v15, v16)
        return (v13(v2.newDummyRow(), v14, "", v15, v16));
    end
};
