local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Orientation);
local _ = require(l_Parent_0.Src.Types);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = {};
local v5 = v1.Left.rawValue();
local v6 = v1.Right.rawValue();
local v7 = v1.Top.rawValue();
local v8 = v1.Bottom.rawValue();
v4.getSliceRectFromSliceCenter = function(v9)
    return {
        v9.Min.X, 
        v9.Max.X, 
        v9.Min.Y, 
        v9.Max.Y
    };
end;
v4.getSliceCenterFromSliceRect = function(v10)
    return Rect.new(v10[v5], v10[v7], v10[v6], v10[v8]);
end;
v4.copySliceRect = function(v11)
    return v3.Dictionary.join(v11);
end;
v4.getOffsetsFromSliceRect = function(v12, v13)
    return {
        v12[v5], 
        v13.X - v12[v6], 
        v12[v7], 
        v13.Y - v12[v8]
    };
end;
v4.getSliceRectFromOffsets = function(v14, v15)
    return {
        v14[v5], 
        v15.X - v14[v6], 
        v14[v7], 
        v15.Y - v14[v8]
    };
end;
return v4;
