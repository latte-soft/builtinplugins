local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_Util_0 = l_Parent_0.Src.Util;
local v3 = require(l_Util_0.createMaterialVariant);
local v4 = require(l_Util_0.getNewMaterialName);
return function(v5, v6, v7)
    local v8 = {
        Name = v4(v5, v7), 
        Id = v6, 
        Textures = {
            ColorMap = v6
        }, 
        BaseMaterial = nil, 
        IsGenerating = false, 
        IsTemporary = true
    };
    v8.MaterialVariant = v3(v8);
    return v8;
end;
