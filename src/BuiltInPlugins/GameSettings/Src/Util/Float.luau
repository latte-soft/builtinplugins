return {
    createIsEqualWithTolerance = function(v0)
        return function(v1, v2)
            if not (v1 ~= nil) or v2 == nil then
                return v1 == v2;
            else
                return math.abs(v1 - v2) <= v0;
            end;
        end;
    end
};
