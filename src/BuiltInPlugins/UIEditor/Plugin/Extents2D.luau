local _ = require(script.Parent.FFlag);
local v1 = require(script.Parent.InstanceInfo);
local v2 = require(script.Parent.Utility);
local v3 = require(script.Parent.Select);
local function v5(v4)
    v4.Center = (v4.hidden.TopLeft + v4.hidden.BottomRight) * 0.5;
    v4.hidden.Left = v4.hidden.TopLeft.X;
    v4.hidden.Right = v4.hidden.BottomRight.X;
    v4.hidden.Top = v4.hidden.TopLeft.Y;
    v4.hidden.Bottom = v4.hidden.BottomRight.Y;
    v4.hidden.TopRight = Vector2.new(v4.Right, v4.Top);
    v4.hidden.BottomLeft = Vector2.new(v4.Left, v4.Bottom);
    v4.Width = v4.hidden.Right - v4.hidden.Left;
    v4.Height = v4.hidden.Bottom - v4.hidden.Top;
    v4.Size = Vector2.new(v4.Width, v4.Height);
end;
local function v11(v6, v7, v8)
    if v6 then
        local v9 = v3:getGuiObjectsAtPoint(v7);
        for v10 = 1, #v9 do
            if v9[v10] == v6 then
                return true;
            elseif not v8(v9[v10]) then
                return false;
            end;
        end;
        return false;
    else
        return true;
    end;
end;
local function v16(v12, v13)
    if v12 then
        local v14 = v3:getGuiObjectsAtPoint(v13);
        for v15 = 1, #v14 do
            if v14[v15] == v12 then
                return true;
            elseif not v1:canSeeThrough(v14[v15]) then
                return false;
            end;
        end;
        return false;
    else
        return true;
    end;
end;
local function v20(v17, v18, v19)
    v17.hidden.TopLeftVisible = v11(v18, v17.hidden.TopLeft, v19);
    v17.hidden.TopRightVisible = v11(v18, v17.hidden.TopRight, v19);
    v17.hidden.BottomLeftVisible = v11(v18, v17.hidden.BottomLeft, v19);
    v17.hidden.BottomRightVisible = v11(v18, v17.hidden.BottomRight, v19);
    v17.hidden.CenterVisible = v11(v18, v17.Center, v19);
end;
local function _(v21, v22)
    v21.hidden.TopLeftVisible = v16(v22, v21.hidden.TopLeft);
    v21.hidden.TopRightVisible = v16(v22, v21.hidden.TopRight);
    v21.hidden.BottomLeftVisible = v16(v22, v21.hidden.BottomLeft);
    v21.hidden.BottomRightVisible = v16(v22, v21.hidden.BottomRight);
    v21.hidden.CenterVisible = v16(v22, v21.Center);
end;
local function v27(v24, ...)
    local v25 = {
        ...
    };
    for v26 = 1, #v25 do
        v24.hidden.TopLeft = v2:minVector2(v24.hidden.TopLeft, v25[v26]);
        v24.hidden.BottomRight = v2:maxVector2(v24.hidden.BottomRight, v25[v26]);
    end;
    v5(v24);
end;
local function v30(v28, ...)
    local v29 = {
        ...
    };
    if #v29 > 0 then
        v28.hidden.TopLeft = v29[1];
        v28.hidden.BottomRight = v29[1];
        table.remove(v29, 1);
        v27(v28, unpack(v29));
        return ;
    else
        v5(v28);
        return ;
    end;
end;
translate = function(v31, v32)
    v31.hidden.TopLeft = v31.hidden.TopLeft + v32;
    v31.hidden.BottomRight = v31.hidden.BottomRight + v32;
    v5(v31);
end;
resize = function(v33, v34)
    v33.hidden.BottomRight = v33.hidden.TopLeft + v34;
    v5(v33);
end;
expandFromCenter = function(v35, v36)
    local v37 = v36 * 0.5;
    v35.TopLeft = v35.TopLeft - v37;
    v35.BottomRight = v35.BottomRight + v37;
    v5(v35);
end;
local v57 = {
    new = function(...)
        local v38 = {
            map = {}, 
            mt = {}, 
            hidden = {}
        };
        v38.hidden.TopLeft = Vector2.new(0, 0);
        v38.hidden.BottomRight = Vector2.new(0, 0);
        v30(v38, ...);
        v20(v38, nil, function(v39)
            return v1:canSeeThrough(v39);
        end);
        v38.mt.__index = function(v40, v41)
            if v41 == "extend" then
                return v27;
            elseif v41 == "set" then
                return v30;
            elseif v41 == "TopLeft" then
                return v40.hidden.TopLeft;
            elseif v41 == "BottomRight" then
                return v40.hidden.BottomRight;
            elseif v41 == "TopRight" then
                return v40.hidden.TopRight;
            elseif v41 == "BottomLeft" then
                return v40.hidden.BottomLeft;
            elseif v41 == "Top" then
                return v40.hidden.Top;
            elseif v41 == "Bottom" then
                return v40.hidden.Bottom;
            elseif v41 == "Left" then
                return v40.hidden.Left;
            elseif v41 == "Right" then
                return v40.hidden.Right;
            elseif v41 == "TopLeftVisible" then
                return v38.hidden.TopLeftVisible;
            elseif v41 == "TopRightVisible" then
                return v38.hidden.TopRightVisible;
            elseif v41 == "BottomLeftVisible" then
                return v38.hidden.BottomLeftVisible;
            elseif v41 == "BottomRightVisible" then
                return v38.hidden.BottomRightVisible;
            elseif v41 == "TopVisible" then
                return v38.hidden.TopLeftVisible or v38.hidden.TopRightVisible;
            elseif v41 == "BottomVisible" then
                return v38.hidden.BottomLeftVisible or v38.hidden.BottomRightVisible;
            elseif v41 == "LeftVisible" then
                return v38.hidden.TopLeftVisible or v38.hidden.BottomLeftVisible;
            elseif v41 == "RightVisible" then
                return v38.hidden.TopRightVisible or v38.hidden.BottomRightVisible;
            elseif v41 == "CenterVisible" then
                return v38.hidden.CenterVisible;
            elseif v41 == "translate" then
                return translate;
            elseif v41 == "resize" then
                return resize;
            elseif v41 == "expandFromCenter" then
                return expandFromCenter;
            elseif v41 == "refreshVisibility" then
                return v20;
            else
                return ;
            end;
        end;
        v38.mt.__newindex = function(v42, v43, v44)
            if v43 == "TopLeft" then
                v42.hidden.TopLeft = v44;
            elseif v43 == "BottomRight" then
                v42.hidden.BottomRight = v44;
            elseif v43 == "TopRight" then
                v42.hidden.TopLeft = Vector2.new(v42.hidden.Left, v44.Y);
                v42.hidden.BottomRight = Vector2.new(v44.X, v42.hidden.Bottom);
            elseif v43 == "BottomLeft" then
                v42.hidden.TopLeft = Vector2.new(v44.X, v42.hidden.Top);
                v42.hidden.BottomRight = Vector2.new(v42.hidden.Right, v44.Y);
            elseif v43 == "Top" then
                v42.hidden.TopLeft = Vector2.new(v42.hidden.Left, v44);
            elseif v43 == "Bottom" then
                v42.hidden.BottomRight = Vector2.new(v42.hidden.Right, v44);
            elseif v43 == "Left" then
                v42.hidden.TopLeft = Vector2.new(v44, v42.hidden.Top);
            elseif v43 == "Right" then
                v42.hidden.BottomRight = Vector2.new(v44, v42.hidden.Bottom);
            end;
            v5(v42);
        end;
        setmetatable(v38, v38.mt);
        return v38;
    end, 
    translate = function(_, v46, v47)
        local v48 = v2:cloneTable(v46);
        translate(v48, v47);
        return v48;
    end, 
    resize = function(_, v50, v51)
        local v52 = v2:cloneTable(v50);
        resize(v50, v51);
        return v52;
    end, 
    expandFromCenter = function(_, v54, v55)
        local v56 = v2:cloneTable(v54);
        expandFromCenter(v54, v55);
        return v56;
    end
};
v57.getExtentsFromGui = function(_, v59)
    local v60 = v57.new(Vector2.new(0, 0));
    v30(v60, v59.AbsolutePosition, v59.AbsolutePosition + v59.AbsoluteSize);
    return v60;
end;
v57.getExtentsFromGuis = function(_, v62)
    if #v62 == 0 then
        return nil;
    else
        local v63 = v57.new(Vector2.new(0, 0));
        v30(v63, v62[1].AbsolutePosition, v62[1].AbsolutePosition + v62[1].AbsoluteSize);
        for v64 = 2, #v62 do
            v27(v63, v62[v64].AbsolutePosition, v62[v64].AbsolutePosition + v62[v64].AbsoluteSize);
        end;
        return v63;
    end;
end;
return v57;
