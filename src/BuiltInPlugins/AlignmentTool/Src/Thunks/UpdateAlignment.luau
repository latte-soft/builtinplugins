local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Src.Actions.SetAlignEnabled);
local v4 = require(l_Parent_0.Src.Utility.RelativeTo);
local v5 = require(l_Parent_0.Src.Utility.alignObjects);
local _ = require(l_Parent_0.Src.Types);
return function(v7)
    return function(v8)
        local v9 = v8:getState();
        local l_alignableObjects_0 = v9.alignableObjects;
        local l_alignmentMode_0 = v9.alignmentMode;
        local l_alignmentSpace_0 = v9.alignmentSpace;
        local l_enabledAxes_0 = v9.enabledAxes;
        local l_relativeTo_0 = v9.relativeTo;
        local v15 = nil;
        if l_relativeTo_0 == v4.Active then
            v15 = l_Selection_0.ActiveInstance;
        end;
        v5(l_alignableObjects_0, l_alignmentSpace_0, l_enabledAxes_0, l_alignmentMode_0, v15);
        v7:report("useAlignTool", l_alignableObjects_0, {
            Mode = l_alignmentMode_0, 
            Axes = l_enabledAxes_0, 
            CoordinateSpace = l_alignmentSpace_0, 
            RelativeTo = l_relativeTo_0
        });
        l_ChangeHistoryService_0:SetWaypoint("Align Objects");
        v8:dispatch(v3(false));
    end;
end;
