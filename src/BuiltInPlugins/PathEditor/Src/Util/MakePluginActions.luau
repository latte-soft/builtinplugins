local v0 = require(script:FindFirstAncestor("PathEditor").Src.Util.getShortcuts)();
local l_PathEditorCustomBindings_0 = game:GetFastFlag("PathEditorCustomBindings");
local v2 = nil;
v2 = if not l_PathEditorCustomBindings_0 then {
    "DoneEditing", 
    "AddPointMode", 
    "AddTangentMode", 
    "MoveTool", 
    "DeletePoint", 
    "DeletePoint2"
} else {
    "DoneEditing", 
    "AddPointMode", 
    "AddTangentMode", 
    "MoveTool"
};
local function v6(_, v4, v5)
    if not l_PathEditorCustomBindings_0 then
        return {
            id = v5, 
            text = v4:getText("ContextMenu", v5), 
            allowBinding = false
        };
    else
        return {
            id = v5, 
            text = v4:getText("ShortcutNames", v5), 
            statusTip = v4:getText("ShortcutDescriptions", v5), 
            allowBinding = true
        };
    end;
end;
return function(v7, v8)
    local v9 = {};
    for _, v11 in ipairs(v2) do
        v9[v11] = v6(v7, v8, v11);
    end;
    v9.MoveTool.defaultShortcut = v0.Move;
    v9.AddPointMode.defaultShortcut = v0.AddPoint;
    v9.AddTangentMode.defaultShortcut = v0.AddTangent;
    v9.DoneEditing.defaultShortcut = v0.Done;
    if not l_PathEditorCustomBindings_0 then
        v9.DeletePoint.defaultShortcut = v0.Delete;
        v9.DeletePoint2.defaultShortcut = v0.Delete2;
    end;
    return v9;
end;
