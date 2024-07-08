local v0 = {};
local v1 = require(script.Parent.Enum.Direction);
local v2 = {
    [v1.E] = "rbxasset://textures/StudioUIEditor/icon_resize2.png", 
    [v1.SE] = "rbxasset://textures/StudioUIEditor/icon_resize3.png", 
    [v1.S] = "rbxasset://textures/StudioUIEditor/icon_resize4.png", 
    [v1.SW] = "rbxasset://textures/StudioUIEditor/icon_resize1.png", 
    [v1.W] = "rbxasset://textures/StudioUIEditor/icon_resize2.png", 
    [v1.NW] = "rbxasset://textures/StudioUIEditor/icon_resize3.png", 
    [v1.N] = "rbxasset://textures/StudioUIEditor/icon_resize4.png", 
    [v1.NE] = "rbxasset://textures/StudioUIEditor/icon_resize1.png"
};
local v3 = {
    [v1.E] = "rbxasset://textures/StudioUIEditor/icon_rotate1.png", 
    [v1.SE] = "rbxasset://textures/StudioUIEditor/icon_rotate2.png", 
    [v1.S] = "rbxasset://textures/StudioUIEditor/icon_rotate3.png", 
    [v1.SW] = "rbxasset://textures/StudioUIEditor/icon_rotate4.png", 
    [v1.W] = "rbxasset://textures/StudioUIEditor/icon_rotate5.png", 
    [v1.NW] = "rbxasset://textures/StudioUIEditor/icon_rotate6.png", 
    [v1.N] = "rbxasset://textures/StudioUIEditor/icon_rotate7.png", 
    [v1.NE] = "rbxasset://textures/StudioUIEditor/icon_rotate8.png"
};
local v4 = {
    DEFAULT = 0, 
    MOVE = 1, 
    RESIZE = 2, 
    ROTATE = 3
};
local v5 = nil;
local l_DEFAULT_0 = v4.DEFAULT;
local l_NOT_SET_0 = v1.NOT_SET;
local v8 = nil;
v0.calcMouseIconDirection = function(_, v10, v11)
    return v1:angleToDirection(v1:directionToAngle(v10) + v11);
end;
v0.setToDefaultIcon = function(_)
    if l_DEFAULT_0 ~= v4.DEFAULT then
        l_DEFAULT_0 = v4.DEFAULT;
        v8.Icon = v5;
        l_NOT_SET_0 = v1.NOT_SET;
    end;
end;
v0.setToMoveIcon = function(_)
    if l_DEFAULT_0 ~= v4.MOVE then
        l_DEFAULT_0 = v4.MOVE;
        v8.Icon = "rbxasset://textures/advClosed-hand.png";
        l_NOT_SET_0 = v1.NOT_SET;
    end;
end;
v0.setToResizeIcon = function(_, v15)
    assert(v1:isValid(v15), "The handle direction was not valid.");
    if not (not (l_DEFAULT_0 == v4.RESIZE) or l_NOT_SET_0 == v15) or l_DEFAULT_0 ~= v4.RESIZE then
        l_DEFAULT_0 = v4.RESIZE;
        v8.Icon = v2[v15];
        l_NOT_SET_0 = v15;
    end;
end;
v0.setToRotateIcon = function(_, v17)
    assert(v1:isValid(v17), "The handle direction was not valid.");
    if not (not (l_DEFAULT_0 == v4.ROTATE) or l_NOT_SET_0 == v17) or l_DEFAULT_0 ~= v4.ROTATE then
        l_DEFAULT_0 = v4.ROTATE;
        v8.Icon = v3[v17];
        l_NOT_SET_0 = v17;
    end;
end;
v0.Off = function(_, _)
    v0:setToDefaultIcon();
    v8 = nil;
    v5 = nil;
end;
v0.On = function(_, v21)
    assert(v21 ~= nil, "Cannot initialize MouseIconManager. Got a nil mouse.");
    assert(v21.Icon ~= nil, "Cannot initialize MouseIconManager. The mouse icon was nil");
    v8 = v21;
    v5 = v21.Icon;
    l_DEFAULT_0 = v4.DEFAULT;
    l_NOT_SET_0 = v1.NOT_SET;
end;
return v0;
