local v0 = {};
local _ = require(script.Parent.FFlag);
local v2 = nil;
local v3 = nil;
local v4 = nil;
local v5 = nil;
local v6 = nil;
local v7 = nil;
local v8 = nil;
local v9 = nil;
local v10 = nil;
v0.onMoveBegan = function(_, _)
    v3:hide();
    v9:setVisible(false);
end;
v0.onMoveChanged = function(_, _)
    v7:update();
    v7:setVisible(true);
end;
v0.onMoveEnded = function(_, _)
    v3:updatePosition();
    v3:show();
    v9:updatePosition();
    v9:setVisible(true);
end;
v0.onResizeBegan = function(_, _)
end;
v0.onResizeChanged = function(_, _)
    v7:update();
    v9:update();
end;
v0.onResizeEnded = function(_, _)
end;
v0.onRotateBegan = function(_, _)
    v7:setVisible(false);
    v3:hide();
    v9:setVisible(false);
end;
v0.onRotateChanged = function(_, v26)
    v8:update(v26, v4:getRotation());
end;
v0.onRotateEnded = function(_, _)
    v3:updatePosition();
    v3:show();
    v9:setVisible(true);
    v7:update();
    v7:setVisible(true);
end;
v0.onRubberbandBegan = function(_, _)
    v3:hide();
    v9:setVisible(false);
    v7:setVisible(false);
    v10:setSuppressFilteredSelectionChanged(true);
end;
v0.onRubberbandEnded = function(_)
    v10:setSuppressFilteredSelectionChanged(false);
end;
v0.onTextEditorBegan = function(_)
    v7:setVisible(false);
    v3:hide();
    v9:setVisible(false);
end;
v0.onTextEditorEnded = function(_)
    v7:setVisible(true);
    v3:show();
    v9:setVisible(true);
end;
v0.setMove = function(_, v35)
    v2 = v35;
end;
v0.setRotate = function(_, v37)
    v4 = v37;
end;
v0.setResize = function(_, v39)
    v3 = v39;
end;
v0.setRubberband = function(_, v41)
    v5 = v41;
end;
v0.setTextEditor = function(_, v43)
    v6 = v43;
end;
v0.setDistanceLinesManager = function(_, v45)
    v7 = v45;
end;
v0.setRotationBox = function(_, v47)
    v8 = v47;
end;
v0.setSizeBox = function(_, v49)
    v9 = v49;
end;
v0.setSelectionManager = function(_, v51)
    v10 = v51;
end;
return v0;
