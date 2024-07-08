local l_Signal_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({
        ProgressUpdate = l_Signal_0.new(), 
        ColormapHasUnknownPixels = l_Signal_0.new()
    }, v1));
end;
v1.IsA = function(_, v3)
    return v3 == "HeightmapImporterService";
end;
v1.ImportHeightmap = function(_, _, _, _, _)
end;
v1.SetImportHeightmapPaused = function(_, _)
end;
v1.CancelImportHeightmap = function(_)
end;
v1.IsValidHeightmap = function(_, _)
    return true, "Ok", 1024, 1024, 3, 1;
end;
v1.IsValidColormap = function(_, _)
    return true, "Ok", 1024, 1024, 3;
end;
return v1;
