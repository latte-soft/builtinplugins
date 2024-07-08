local v0 = require(script.Parent.AdornmentModule);
local v1 = require(script.Parent.Analytics);
local _ = require(script.Parent.Convert);
local v3 = require(script.Parent.Extents2D);
local _ = require(script.Parent.FFlag);
local v5 = require(script.Parent.GlobalValues);
local v6 = require(script.Parent.MouseIconManager);
local _ = require(script.Parent.RotateUtility);
local _ = require(script.Parent.Select);
local v9 = require(script.Parent.SelectionManager);
local v10 = require(script.Parent.SnappingPointManager);
local v11 = require(script.Parent.Utility);
local v12 = require(script.Parent.Convert);
local v13 = require(script.Parent.Enum.SnappingType);
local l_UserInputService_0 = game:GetService("UserInputService");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v16 = nil;
local v17 = nil;
local v18 = false;
local v19 = false;
local v20 = {};
local v21 = nil;
local function _(v22, v23)
    local l_Parent_0 = v22.Parent;
    while true do
        if not l_Parent_0 then
            return nil;
        elseif not l_Parent_0:IsA(v23) then
            return l_Parent_0;
        else
            l_Parent_0 = l_Parent_0.Parent;
        end;
    end;
end;
local function v31(v26)
    for v27 = 1, #v20 do
        local v28 = v20[v27][1];
        local l_Parent_1 = v28.Parent;
        local v30;
        while true do
            if not l_Parent_1 then
                v30 = nil;
                break;
            elseif not l_Parent_1:IsA("Folder") then
                v30 = l_Parent_1;
                break;
            else
                l_Parent_1 = l_Parent_1.Parent;
            end;
        end;
        if not (not v30 or not v30:IsA("GuiBase2d")) then
            v28.Position = v12:convertAbsolutePositionToScaleOrOffset(v11:isOnlyScaleUDim2(v20[v27][3]) or not v11:isOnlyOffsetUDim2(v20[v27][3]) and v5:isScale(), v20[v27][2] + v26, v28.AbsoluteSize, v28.Position, v30, v28.AnchorPoint);
        end;
    end;
end;
local function _(v32)
    v31(v32 - v17);
end;
local function v35(v34)
    if v34 == 1 then
        return Vector2.new(0, -1);
    elseif v34 == 2 then
        return Vector2.new(0, 1);
    elseif v34 == 3 then
        return Vector2.new(-1, 0);
    elseif v34 == 4 then
        return Vector2.new(1, 0);
    else
        return Vector2.new(0, -1);
    end;
end;
local function v36(v37, v38)
    if v37 and v37.Parent then
        if not v37.Parent:IsA(v38) then
            return v36(v37.Parent, v38);
        else
            return v37.Parent;
        end;
    else
        return nil;
    end;
end;
local function _(v39, v40)
    while true do
        if not v39 or not v39.Parent then
            return false;
        elseif v39.Parent == v40 then
            return true;
        else
            v39 = v39.Parent;
        end;
    end;
end;
getHighestZIndexOfSelfAndDescendants = function(v42, v43)
    if v42 == v43 then
        return 0;
    else
        local v44 = 0;
        if v42:IsA("GuiObject") then
            v44 = v42.ZIndex;
        end;
        local l_v42_Children_0 = v42:GetChildren();
        for v46 = 1, #l_v42_Children_0 do
            v44 = math.max(v44, getHighestZIndexOfSelfAndDescendants(l_v42_Children_0[v46], v43));
        end;
        return v44;
    end;
end;
incrementZIndexOfSelfAndDescendantsBy = function(v47, v48)
    if v47:IsA("GuiObject") then
        v47.ZIndex = v47.zIndex + v48;
    end;
    local l_v47_Children_0 = v47:GetChildren();
    for v50 = 1, #l_v47_Children_0 do
        incrementZIndexOfSelfAndDescendantsBy(l_v47_Children_0[v50], v48);
    end;
end;
local v67 = {
    isDragInProgress = function(_)
        return v18;
    end, 
    startDrag = function(_, v53)
        v20 = {};
        local v54 = v9:getFilteredSelectionCommonAncestors();
        for v55 = 1, #v54 do
            table.insert(v20, {
                v54[v55], 
                v54[v55].AbsolutePosition, 
                v54[v55].Position
            });
        end;
        if #v20 == 0 then
            return ;
        else
            v17 = v53;
            v18 = true;
            v19 = false;
            v21 = v3:getExtentsFromGuis(v54);
            v6:setToMoveIcon();
            v0:createSelectionAdorns();
            v16:onMoveBegan(v53);
            return ;
        end;
    end, 
    finishDrag = function(_, v57)
        if v19 then
            v1:reportEvent("Move");
            l_ChangeHistoryService_0:SetWaypoint("Translate Objects (better tt needed)");
        end;
        v18 = false;
        v17 = nil;
        v0:hideSnappingLines();
        v19 = false;
        v6:setToDefaultIcon();
        v0:deleteSelectionAdorns();
        v16:onMoveEnded(v57);
    end, 
    updateDrag = function(_, v59)
        if not v19 and v11:manhattanDistance(v59 - v17) <= 3 then
            return ;
        else
            v19 = true;
            v0:hideSnappingLines();
            local _ = v13.MoveXY;
            if not (not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) then
                v59 = if math.abs(v59.Y - v17.Y) < math.abs(v59.X - v17.X) then Vector2.new(v59.X, v17.Y) else Vector2.new(v17.X, v59.Y);
            end;
            local v61 = v3:translate(v21, v59 - v17);
            local v62 = nil;
            local v63, v64 = v10:snapExtents(v61, v13.MoveXY);
            v61 = v63;
            v62 = v64;
            for v65 = 1, #v62 do
                v0:showSnappingLine(v62[v65]);
            end;
            v63 = nil;
            v31((v17 + v11:floorVector2(v61.TopLeft - v21.TopLeft)) - v17);
            v0:updateSelectionAdorns(v61);
            v16:onMoveChanged(v59);
            return ;
        end;
    end, 
    onSelectionChanged = function(_)
        if v9:hasFilteredSelection() then
            v0:updateSelectionPosition();
            v0:showSelection();
            v6:setToMoveIcon();
            return ;
        else
            v0:hideSelection();
            v6:setToDefaultIcon();
            return ;
        end;
    end
};
v67.bump = function(_, v69)
    v67:startDrag(Vector2.new(0, 0));
    v31(v35(v69));
    v67:finishDrag(v69);
end;
v67.setActionMediator = function(_, v71)
    v16 = v71;
end;
v67.UP = 1;
v67.DOWN = 2;
v67.LEFT = 3;
v67.RIGHT = 4;
return v67;
