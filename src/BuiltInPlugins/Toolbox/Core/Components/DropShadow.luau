local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Cryo);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.Util.Images);
local v6 = require(l_Parent_0.Core.Util.Immutable);
return function(v7)
    return v2.createElement("ImageLabel", ((v3.Dictionary.join or v6.JoinDictionaries)(v7, {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Image = v5.DROP_SHADOW_IMAGE, 
        ImageColor3 = v4.DROP_SHADOW_COLOR, 
        ImageTransparency = v4.DROP_SHADOW_TRANSPARENCY, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = v4.DROP_SHADOW_SLICE_CENTER
    })));
end;
