local v0 = require(script.Parent.Parent.Parent.Src.Util.ConvertTransformToRegion);
return function(v1, v2, v3, v4, v5)
    if not v5 then
        v2:ApplyTransform(v3.Rotation, v4);
    end;
    v1:PasteRegion(v2, v0(v3, v4).Min, false);
end;
