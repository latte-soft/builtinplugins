return {
    isShift = function(_, v1)
        local v2 = true;
        if v1 ~= Enum.KeyCode.LeftShift then
            v2 = v1 == Enum.KeyCode.RightShift;
        end;
        return v2;
    end, 
    isControl = function(_, v4)
        local v5 = true;
        if v4 ~= Enum.KeyCode.LeftControl then
            v5 = true;
            if v4 ~= Enum.KeyCode.RightControl then
                v5 = true;
                if v4 ~= Enum.KeyCode.RightSuper then
                    v5 = v4 == Enum.KeyCode.LeftSuper;
                end;
            end;
        end;
        return v5;
    end, 
    isLetterA = function(_, v7)
        return v7 == Enum.KeyCode.A;
    end
};
