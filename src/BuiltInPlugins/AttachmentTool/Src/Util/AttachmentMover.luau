local l_RunService_0 = game:GetService("RunService");
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({}, v1));
end;
v1._anchorIfNeedBe = function(v2, v3)
    v2._cachedAnchoredState = v3.Anchored;
    if not (not v3 or v3:IsGrounded()) then
        v3.Anchored = true;
    end;
end;
v1.setDragged = function(v4, v5)
    local v6 = l_RunService_0:IsRunning();
    v4._attachmentsAndParents = {};
    v4._attachment = v5;
    v4._parent = v5:FindFirstAncestorWhichIsA("BasePart");
    if v6 then
        v4:_anchorIfNeedBe(v4._parent);
    end;
end;
v1.moveTo = function(v7, v8, v9)
    if v7._attachment then
        if v9 ~= v7._parent then
            if l_RunService_0:IsRunning() then
                if not (not v7._parent or not v7._parent.Anchored) then
                    v7._parent.Anchored = v7._cachedAnchoredState;
                end;
                v7:_anchorIfNeedBe(v9);
            end;
            v7._attachment.Parent = v9;
            v7._parent = v9;
        end;
        v7._attachment.WorldCFrame = v8;
    end;
end;
v1.commit = function(v10)
    if not ((not l_RunService_0:IsRunning() or not v10._parent) or not v10._parent.Anchored) then
        v10._parent.Anchored = v10._cachedAnchoredState;
    end;
    v10._attachment = nil;
    v10._parent = nil;
    v10._cachedAnchoredState = false;
end;
v1.isMovingThisAttachment = function(v11, v12)
    return v11._attachment == v12;
end;
return v1;
