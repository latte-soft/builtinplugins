local v0 = {};
local v1 = nil;
local v2 = false;
v0.updateMouse = function(v3)
    local v4 = v1 or "rbxasset://SystemCursors/Arrow";
    assert(v3);
    local v5 = v3:get();
    if v5 then
        v5.Icon = v4;
    end;
end;
v0.setCursor = function(v6, v7)
    v1 = v7;
    if not v2 then
        v0.updateMouse(v6);
    end;
end;
v0.resetCursor = function(v8)
    v0.setCursor(v8, nil);
end;
v0.setLocked = function(v9, v10)
    v2 = v10;
    if not v10 then
        v0.updateMouse(v9);
    end;
end;
return v0;
