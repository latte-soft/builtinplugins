local v0 = 1;
local v2 = {
    isScale = function(_)
        return v0 == 1;
    end
};
v2.toggleGridType = function(_)
    if not v2:isScale() then
        v0 = 1;
        print("Setting Grid mode: Scale");
        return ;
    else
        v0 = 2;
        print("Setting Grid mode: Offset");
        return ;
    end;
end;
v2.getScreenSize = function(_)
    return game.Workspace.CurrentCamera.ViewportSize;
end;
return v2;
