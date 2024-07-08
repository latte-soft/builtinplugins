local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_Util_0 = l_Parent_0.Src.Util;
local v3 = require(l_Util_0.createMaterialVariant);
local v4 = require(l_Util_0.DEPRECATED_getNewMaterialName);
return function(v5, v6, v7, _)
    local v9 = {
        Name = v4(v5, game:GetService("MaterialService")), 
        Id = v6, 
        Textures = {
            ColorMap = v7
        }, 
        BaseMaterial = nil, 
        IsGenerating = false, 
        IsTemporary = true
    };
    v9.MaterialVariant = v3(v9);
    return v9;
end;
