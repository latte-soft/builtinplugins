local v0 = require(script.Parent.Parent.Util.ConstantScaleBoundaries);
local v1 = {};
local v2 = nil;
v1.getHeightBoundaries = function(v3)
    return not not v2(v3) and v2(v3).height or v0.Height;
end;
v1.getWidthBoundaries = function(v4)
    return not not v2(v4) and v2(v4).width or v0.Width;
end;
v1.getHeadBoundaries = function(v5)
    return not not v2(v5) and v2(v5).head or v0.Head;
end;
v1.getBodyTypeBoundaries = function(v6)
    return not not v2(v6) and v2(v6).bodyType or v0.BodyType;
end;
v1.getProportionBoundaries = function(v7)
    return not not v2(v7) and v2(v7).proportion or v0.Proportion;
end;
v2 = function(v8)
    return v8.StateSettings and v8.StateSettings.scaleBoundaries.boundaries;
end;
return v1;
