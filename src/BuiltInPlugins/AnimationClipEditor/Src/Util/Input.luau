local v6 = {
    isControl = function(v0)
        local v1 = true;
        if v0 ~= Enum.KeyCode.LeftControl then
            v1 = true;
            if v0 ~= Enum.KeyCode.RightControl then
                v1 = true;
                if v0 ~= Enum.KeyCode.RightSuper then
                    v1 = v0 == Enum.KeyCode.LeftSuper;
                end;
            end;
        end;
        return v1;
    end, 
    isShift = function(v2)
        local v3 = true;
        if v2 ~= Enum.KeyCode.LeftShift then
            v3 = v2 == Enum.KeyCode.RightShift;
        end;
        return v3;
    end, 
    isDeleteKey = function(v4)
        local v5 = true;
        if v4 ~= Enum.KeyCode.Backspace then
            v5 = v4 == Enum.KeyCode.Delete;
        end;
        return v5;
    end
};
v6.isMultiSelectKey = function(v7)
    return v6.isShift(v7) or v6.isControl(v7);
end;
v6.isPlayPauseKey = function(v8)
    return v8 == Enum.KeyCode.Space;
end;
v6.isManipulatorToggleKey = function(v9)
    return v9 == Enum.KeyCode.R;
end;
v6.isWorldSpaceToggleKey = function(v10)
    return v10 == Enum.KeyCode.L;
end;
v6.isUp = function(v11)
    return v11 == Enum.KeyCode.Up;
end;
v6.isDown = function(v12)
    return v12 == Enum.KeyCode.Down;
end;
v6.isLeft = function(v13)
    return v13 == Enum.KeyCode.Left;
end;
v6.isRight = function(v14)
    return v14 == Enum.KeyCode.Right;
end;
v6.isLeftBracket = function(v15)
    return v15 == Enum.KeyCode.LeftBracket;
end;
v6.isRightBracket = function(v16)
    return v16 == Enum.KeyCode.RightBracket;
end;
return v6;
