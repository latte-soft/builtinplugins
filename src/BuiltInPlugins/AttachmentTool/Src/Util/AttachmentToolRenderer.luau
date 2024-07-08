local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttachmentTool");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_DraggerFramework_0.Components.TargetGridView);
local v4 = require(l_DraggerFramework_0.Components.TargetSoftSnapView);
local v5 = require(l_DraggerFramework_0.Components.HotkeyUsageInfo);
local v6 = require(l_DraggerFramework_0.Utility.HotkeyHelpBuilder);
local v7 = {};
v7.__index = v7;
v7.new = function(v8, v9, v10)
    return (setmetatable({
        _draggerContext = v8, 
        _draggerSchema = v9, 
        _attachmentToolModel = v10, 
        _mouseCursor = ""
    }, v7));
end;
v7._renderSnapTarget = function(v11, v12)
    local l__draggerContext_0 = v11._draggerContext;
    if not l__draggerContext_0:shouldShowTargetGrids() then
        return nil;
    elseif not (#v12.softSnaps > 0) then
        local v14 = if not l__draggerContext_0:shouldGridSnap() then nil else l__draggerContext_0:getGridSize();
        local _, _, v17 = v11._attachmentToolModel._selectionInfo:getLocalBoundingBox();
        return v2.createElement(v3, {
            DragTarget = v12, 
            SourceSize = v17, 
            Scale = l__draggerContext_0:getHandleScale(v12.targetMatrix.Position), 
            GridSize = v14, 
            Color = l__draggerContext_0:getGridColor(), 
            PrimaryColor = l__draggerContext_0:getChosenColor()
        });
    else
        return v2.createElement(v4, {
            DragTarget = v12, 
            DraggerContext = l__draggerContext_0
        });
    end;
end;
v7._renderSnap = function(v18)
    local l__lastDragTarget_0 = v18._attachmentToolModel._lastDragTarget;
    if v18._draggerContext:areConstraintsEnabled() or not l__lastDragTarget_0 then
        return nil;
    else
        return v2.createFragment({
            SnapTarget = v18:_renderSnapTarget(l__lastDragTarget_0)
        });
    end;
end;
local v20 = table.freeze({
    Hotkey = "T", 
    LabelLocEntry = "DragTilt"
});
local v21 = table.freeze({
    Hotkey = "R", 
    LabelLocEntry = "DragRotate"
});
local v22 = table.freeze({
    Hotkey = "\226\172\135Alt", 
    LabelLocEntry = "HoldOrientation"
});
local v23 = table.freeze({
    Hotkey = "\226\172\134Alt", 
    LabelLocEntry = "UnholdOrientation"
});
v7._getHotkeyList = function(v24)
    local l__draggerContext_1 = v24._draggerContext;
    local v26 = {
        v20, 
        v21
    };
    if not l__draggerContext_1:isAltKeyDown() then
        table.insert(v26, v22);
    else
        table.insert(v26, v23);
    end;
    v6.addGridSnap(v26, l__draggerContext_1);
    v6.addHelp(v26);
    return v26;
end;
v7.setMouseCursor = function(v27, v28)
    if v27._mouseCursor ~= v28 then
        v27._mouseCursor = v28;
        v27._draggerContext:setMouseIcon(v28);
    end;
end;
v7.render = function(v29)
    v29:setMouseCursor("rbxasset://textures/ConstraintCursor.png");
    local v30 = v29:_renderSnap();
    local v31 = nil;
    if not v29._draggerContext:getSetting("HotkeyUsageHidden") then
        v31 = v2.createElement(v5, {
            DraggerContext = v29._draggerContext, 
            HotkeyList = v29:_getHotkeyList()
        });
    end;
    return v2.createFragment({
        DraggerElements = v30, 
        HotkeyUsageInfo = v31
    });
end;
return v7;
