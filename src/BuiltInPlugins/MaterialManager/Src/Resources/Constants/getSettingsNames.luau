local _ = require(script.Parent.Parent.Parent.Parent.Src.Types);
local v1 = {
    GeneralSettings = "GeneralSettings", 
    TextureSettings = "TextureSettings", 
    OverrideSettings = "OverrideSettings", 
    TilingSettings = "TilingSettings", 
    PhysicalSettings = "PhysicalSettings", 
    TerrainDetailsSettings = "TerrainDetailsSettings", 
    TerrainDetailsEditor = {
        Top = "TerrainDetailsTop", 
        Side = "TerrainDetailsSide", 
        Bottom = "TerrainDetailsBottom"
    }
};
return function()
    return v1;
end;
