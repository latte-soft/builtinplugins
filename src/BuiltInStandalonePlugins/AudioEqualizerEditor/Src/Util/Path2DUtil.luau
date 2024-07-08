local v0 = require(script:FindFirstAncestor("AudioEqualizerEditor").Bin.Common.defineLuaFlags).getFFlagPath2DEnabled();
return {
    makeControlPoint = function(v1, v2, v3)
        if v0 then
            if v1 then
                if v2 and v3 then
                    return Path2DControlPoint.new(UDim2.fromOffset(v1.X, v1.Y), UDim2.fromOffset(v2.X, v2.Y), UDim2.fromOffset(v3.X, v3.Y));
                else
                    return Path2DControlPoint.new(UDim2.fromOffset(v1.X, v1.Y));
                end;
            else
                return Path2DControlPoint.new();
            end;
        else
            return {};
        end;
    end
};
