local _ = require(script.Parent.Parent.Parent.Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    return (setmetatable({}, v1));
end;
v1.IsA = function(_, v3)
    return v3 == "Terrain";
end;
v1.WriteVoxels = function(_, _, _, _, _)
end;
v1.ReadVoxels = function(_, _, _)
    return {
        size = Vector3.new(0, 0, 0)
    }, {
        size = Vector3.new(0, 0, 0)
    };
end;
v1.FillBall = function(_, _, _, _)
end;
v1.FillBlock = function(_, _, _, _)
end;
v1.FillCylinder = function(_, _, _, _, _)
end;
v1.Clear = function(_)
end;
v1.PasteRegion = function(_, _, _, _)
end;
v1.CopyRegion = function(_, _)
    return {};
end;
v1.ReplaceMaterial = function(_, _, _, _, _)
end;
v1.CanShorelinesBeUpgraded = function(_)
end;
return v1;
