local v0 = require(script:FindFirstAncestor("AttachmentTool").Packages.DraggerFramework.Utility.AnimationTask);
local v1 = {};
v1.__index = v1;
v1.new = function(v2)
    local v3 = setmetatable({
        _attachmentToolModel = v2
    }, v1);
    v3._animationTask = v0.new(function(v4, v5)
        v3:_animationCallback(v4, v5);
    end);
    return v3;
end;
local function _(v6)
    if v6 < 0.5 then
        return 0.5 * (v6 / 0.5) ^ 4;
    else
        return 1 - 0.5 * ((1 - v6) / 0.5) ^ 4;
    end;
end;
v1._animationCallback = function(v8, v9, v10)
    local l__lastDragTarget_0 = v8._attachmentToolModel._lastDragTarget;
    if not v10 then
        local v12 = if v9 < 0.5 then 0.5 * (v9 / 0.5) ^ 4 else 1 - 0.5 * ((1 - v9) / 0.5) ^ 4;
        local l__animateFrom_0 = v8._animateFrom;
        v8._attachmentToolModel._attachmentMover:moveTo((l__animateFrom_0.baseCFrame:Lerp(l__lastDragTarget_0.baseCFrame, v12) * l__animateFrom_0.tiltRotate:Lerp(v8._attachmentToolModel._tiltRotate, v12)) * l__animateFrom_0.offsetCFrame:Lerp(l__lastDragTarget_0.offsetCFrame, v12), l__lastDragTarget_0.targetPart);
        return ;
    else
        v8._attachmentToolModel._attachmentMover:moveTo(l__lastDragTarget_0.mainCFrame, l__lastDragTarget_0.targetPart);
        return ;
    end;
end;
v1.beginAnimation = function(v14, v15)
    local l__lastDragTarget_1 = v14._attachmentToolModel._lastDragTarget;
    v14._animateFrom = table.freeze({
        tiltRotate = v14._attachmentToolModel._tiltRotate, 
        baseCFrame = l__lastDragTarget_1.baseCFrame, 
        offsetCFrame = l__lastDragTarget_1.offsetCFrame
    });
    v14._attachmentToolModel._tiltRotate = v15;
    v14._animationTask:animate(0.13);
end;
v1.inProgress = function(v17)
    return v17._animationTask:inProgress();
end;
v1.forceFinish = function(v18)
    v18._animationTask:commit();
end;
return v1;
