local v0 = require(script.Parent.Extents2D);
local _ = require(script.Parent.FFlag);
local v2 = require(script.Parent.GlobalValues);
local v3 = require(script.Parent.InstanceInfo);
local v4 = require(script.Parent.Select);
local v5 = require(script.Parent.SelectionManager);
local _ = require(script.Parent.Set);
local v7 = require(script.Parent.Utility);
local v8 = require(script.Parent.Enum.SnappingType);
local v9 = {};
local v10 = {};
local v11 = 1;
local function _(v12, v13, v14)
    local v15 = nil;
    local v16 = 9000000000;
    for v17 = 1, #v14 do
        if v14[v17][2] == v13 then
            local v18 = math.abs(v12 - v14[v17][1]);
            if v18 < v16 then
                v16 = v18;
                v15 = v14[v17][1];
            else
                break;
            end;
        end;
    end;
    return v15;
end;
local function v20(v21, v22, v23)
    if v23[v21] ~= nil then
        return ;
    else
        v23[v21] = true;
        while not not v7:removeItemFromTable(v21, v22) do
        end;
        local l_v21_Children_0 = v21:GetChildren();
        for v25 = 1, #l_v21_Children_0 do
            v20(l_v21_Children_0[v25], v22, v23);
        end;
        return ;
    end;
end;
local v33 = {
    generateSnappingLines = function(_)
        v9 = {};
        v10 = {};
        local v27 = v5:getFilteredSelection();
        if #v27 == 0 then
            return ;
        else
            local v28 = v4:getGuiObjects();
            if #v28 > 0 then
                local v29 = {};
                for v30 = 1, #v27 do
                    v20(v27[v30], v28, v29);
                end;
                for v31 = 1, #v28 do
                    local v32 = v0:getExtentsFromGui(v28[v31]);
                    table.insert(v9, v32);
                    v10[v32] = v28[v31];
                end;
            end;
            table.insert(v9, v0.new(Vector2.new(0, 0), v2:getScreenSize()));
            return ;
        end;
    end
};
local v34 = Color3.new(1, 0.03137254901960784, 0.403921568627451);
local v35 = Color3.new(0, 1, 0);
v33.snapExtents = function(_, v37, v38)
    v37 = v7:cloneTable(v37);
    local v39 = {};
    local v40 = false;
    local v41 = false;
    local v42 = nil;
    local v43 = nil;
    local v44 = {};
    local function _()
        v42 = v11 + 1;
        v43 = 0;
        v44 = {};
    end;
    local function v53(v46, v47, v48, v49, v50)
        local v51 = v7:distance(v46, v47);
        local v52 = v47 - v46;
        if v51 < v42 then
            v44 = {};
            v42 = v51;
            v43 = v52;
            table.insert(v44, {
                v48, 
                v49, 
                v50
            });
            return ;
        else
            if v51 == v42 and v52 == v43 then
                table.insert(v44, {
                    v48, 
                    v49, 
                    v50
                });
            end;
            return ;
        end;
    end;
    if #v10 > 0 then
        local v54 = v5:getFilteredSelection();
        local function v57(v55)
            if not v3:canSeeThrough(v55) then
                for v56 = 1, #v54 do
                    if v55 == v54[v56] then
                        return true;
                    end;
                end;
                return false;
            else
                return true;
            end;
        end;
        for v58 = 1, #v9 do
            local v59 = v10[v9[v58]];
            if v59 ~= nil then
                v9[v58]:refreshVisibility(v59, v57);
            end;
        end;
        v10 = {};
    end;
    if v8:containsType(v38, v8.MoveX) then
        v42 = v11 + 1;
        v43 = 0;
        v44 = {};
        for v60 = 1, #v9 do
            if v9[v60].LeftVisible then
                v53(v37.Left, v9[v60].Left, Vector2.new(v9[v60].Left, math.min(v37.Top, v9[v60].Top) - 10), Vector2.new(v9[v60].Left, math.max(v37.Bottom, v9[v60].Bottom) + 10), v34);
                v53(v37.Right, v9[v60].Left, Vector2.new(v9[v60].Left, math.min(v37.Top, v9[v60].Top) - 10), Vector2.new(v9[v60].Left, math.max(v37.Bottom, v9[v60].Bottom) + 10), v34);
            end;
            if v9[v60].RightVisible then
                v53(v37.Left, v9[v60].Right, Vector2.new(v9[v60].Right, math.min(v37.Top, v9[v60].Top) - 10), Vector2.new(v9[v60].Right, math.max(v37.Bottom, v9[v60].Bottom) + 10), v34);
                v53(v37.Right, v9[v60].Right, Vector2.new(v9[v60].Right, math.min(v37.Top, v9[v60].Top) - 10), Vector2.new(v9[v60].Right, math.max(v37.Bottom, v9[v60].Bottom) + 10), v34);
            end;
            if v9[v60].CenterVisible then
                v53(v37.Center.X, v9[v60].Center.X, Vector2.new(v9[v60].Center.X, math.min(v37.Top, v9[v60].Top) - 10), Vector2.new(v9[v60].Center.X, math.max(v37.Bottom, v9[v60].Bottom) + 10), v35);
            end;
        end;
        v40 = v43 ~= 0;
        v37 = v0:translate(v37, Vector2.new(v43, 0));
        v39 = v7:joinTables(v39, v44);
    end;
    if v8:containsType(v38, v8.MoveY) then
        v42 = v11 + 1;
        v43 = 0;
        v44 = {};
        for v61 = 1, #v9 do
            if v9[v61].TopVisible then
                v53(v37.Top, v9[v61].Top, Vector2.new(math.min(v37.Left, v9[v61].Left) - 10, v9[v61].Top), Vector2.new(math.max(v37.Right, v9[v61].Right) + 10, v9[v61].Top), v34);
                v53(v37.Bottom, v9[v61].Top, Vector2.new(math.min(v37.Left, v9[v61].Left) - 10, v9[v61].Top), Vector2.new(math.max(v37.Right, v9[v61].Right) + 10, v9[v61].Top), v34);
            end;
            if v9[v61].BottomVisible then
                v53(v37.Top, v9[v61].Bottom, Vector2.new(math.min(v37.Left, v9[v61].Left) - 10, v9[v61].Bottom), Vector2.new(math.max(v37.Right, v9[v61].Right) + 10, v9[v61].Bottom), v34);
                v53(v37.Bottom, v9[v61].Bottom, Vector2.new(math.min(v37.Left, v9[v61].Left) - 10, v9[v61].Bottom), Vector2.new(math.max(v37.Right, v9[v61].Right) + 10, v9[v61].Bottom), v34);
            end;
            if v9[v61].CenterVisible then
                v53(v37.Center.Y, v9[v61].Center.Y, Vector2.new(math.min(v37.Left, v9[v61].Left) - 10, v9[v61].Center.Y), Vector2.new(math.max(v37.Right, v9[v61].Right) + 10, v9[v61].Center.Y), v35);
            end;
        end;
        v41 = v43 ~= 0;
        v37 = v0:translate(v37, Vector2.new(0, v43));
        v39 = v7:joinTables(v39, v44);
    end;
    if v8:containsType(v38, v8.ResizeXp) then
        v42 = v11 + 1;
        v43 = 0;
        v44 = {};
        for v62 = 1, #v9 do
            if v9[v62].LeftVisible then
                v53(v37.Right, v9[v62].Left, Vector2.new(v9[v62].Left, math.min(v37.Top, v9[v62].Top) - 10), Vector2.new(v9[v62].Left, math.max(v37.Bottom, v9[v62].Bottom) + 10), v34);
            end;
            if v9[v62].RightVisible then
                v53(v37.Right, v9[v62].Right, Vector2.new(v9[v62].Right, math.min(v37.Top, v9[v62].Top) - 10), Vector2.new(v9[v62].Right, math.max(v37.Bottom, v9[v62].Bottom) + 10), v34);
            end;
        end;
        v40 = v43 ~= 0;
        v37.Right = v37.Right + v43;
        v39 = v7:joinTables(v39, v44);
    end;
    if v8:containsType(v38, v8.ResizeXn) then
        v42 = v11 + 1;
        v43 = 0;
        v44 = {};
        for v63 = 1, #v9 do
            if v9[v63].LeftVisible then
                v53(v37.Left, v9[v63].Left, Vector2.new(v9[v63].Left, math.min(v37.Top, v9[v63].Top) - 10), Vector2.new(v9[v63].Left, math.max(v37.Bottom, v9[v63].Bottom) + 10), v34);
            end;
            if v9[v63].RightVisible then
                v53(v37.Left, v9[v63].Right, Vector2.new(v9[v63].Right, math.min(v37.Top, v9[v63].Top) - 10), Vector2.new(v9[v63].Right, math.max(v37.Bottom, v9[v63].Bottom) + 10), v34);
            end;
        end;
        v40 = v43 ~= 0;
        v37.Left = v37.Left + v43;
        v39 = v7:joinTables(v39, v44);
    end;
    if v8:containsType(v38, v8.ResizeYp) then
        v42 = v11 + 1;
        v43 = 0;
        v44 = {};
        for v64 = 1, #v9 do
            if v9[v64].TopVisible then
                v53(v37.Bottom, v9[v64].Top, Vector2.new(math.min(v37.Left, v9[v64].Left) - 10, v9[v64].Top), Vector2.new(math.max(v37.Right, v9[v64].Right) + 10, v9[v64].Top), v34);
            end;
            if v9[v64].BottomVisible then
                v53(v37.Bottom, v9[v64].Bottom, Vector2.new(math.min(v37.Left, v9[v64].Left) - 10, v9[v64].Bottom), Vector2.new(math.max(v37.Right, v9[v64].Right) + 10, v9[v64].Bottom), v34);
            end;
        end;
        v41 = v43 ~= 0;
        v37.Bottom = v37.Bottom + v43;
        v39 = v7:joinTables(v39, v44);
    end;
    if v8:containsType(v38, v8.ResizeYn) then
        v42 = v11 + 1;
        v43 = 0;
        v44 = {};
        for v65 = 1, #v9 do
            if v9[v65].TopVisible then
                v53(v37.Top, v9[v65].Top, Vector2.new(math.min(v37.Left, v9[v65].Left) - 10, v9[v65].Top), Vector2.new(math.max(v37.Right, v9[v65].Right) + 10, v9[v65].Top), v34);
            end;
            if v9[v65].BottomVisible then
                v53(v37.Top, v9[v65].Bottom, Vector2.new(math.min(v37.Left, v9[v65].Left) - 10, v9[v65].Bottom), Vector2.new(math.max(v37.Right, v9[v65].Right) + 10, v9[v65].Bottom), v34);
            end;
        end;
        v41 = v43 ~= 0;
        v37.Top = v37.Top + v43;
        v39 = v7:joinTables(v39, v44);
    end;
    return v37, v39, v40, v41;
end;
v33.setThreshold = function(_, v67)
    v11 = v67;
end;
return v33;
