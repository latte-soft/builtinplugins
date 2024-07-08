local l_ContextItem_0 = require(script.Parent.Parent.Packages.Framework).ContextServices.ContextItem;
local l_TerrainInterfaces_0 = script.Parent.TerrainInterfaces;
return {
    DEPRECATED_Theme = l_ContextItem_0:createSimple("DEPRECATED_Theme", {
        getValues = function(v2)
            return v2.values;
        end, 
        getChangedSignal = function(v3)
            return v3.valuesChanged;
        end, 
        destroy = function(v4)
            v4:destroy();
        end
    }), 
    Terrain = l_ContextItem_0:createSimple("Terrain"), 
    PluginActivationController = require(script.Parent.Util.PluginActivationController), 
    PluginActionsController = require(script.Parent.Util.PluginActionsController), 
    TerrainGeneration = require(l_TerrainInterfaces_0.TerrainGenerationInstance), 
    TerrainImporter = require(l_TerrainInterfaces_0.TerrainImporterInstance), 
    SeaLevel = require(l_TerrainInterfaces_0.TerrainSeaLevel), 
    ImageLoader = require(script.Parent.Util.ImageLoader), 
    CalloutController = require(script.Parent.Util.CalloutController), 
    ShorelineController = require(script.Parent.Util.ShorelineController), 
    SmoothVoxelsController = require(script.Parent.Util.SmoothVoxelsController)
};
