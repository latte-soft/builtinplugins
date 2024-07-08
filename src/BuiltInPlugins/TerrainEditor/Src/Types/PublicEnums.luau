local v0 = {};
local v1 = {};
local v2 = {
    Add = "Add", 
    Subtract = "Subtract"
};
v1.BrushMode = "BrushMode";
v0.BrushMode = v2;
local v3 = {
    Sphere = "Sphere", 
    Cube = "Cube", 
    Cylinder = "Cylinder"
};
v1.BrushShape = "BrushShape";
v0.BrushShape = v3;
local v4 = {
    Fill = "Fill", 
    Replace = "Replace"
};
v1.FillMode = "FillMode";
v0.FillMode = v4;
local v5 = {
    Erode = "Erode", 
    Grow = "Grow", 
    Both = "Both"
};
v1.FlattenMode = "FlattenMode";
v0.FlattenMode = v5;
local v6 = {
    Auto = "Auto", 
    Fixed = "Fixed"
};
v1.FlattenPlane = "FlattenPlane";
v0.FlattenPlane = v6;
local v7 = {
    Bottom = "Bottom", 
    Center = "Center", 
    Top = "Top"
};
v1.PivotPosition = "PivotPosition";
v0.PivotPosition = v7;
local v8 = {
    Auto = "Auto", 
    Off = "Off", 
    Manual = "Manual"
};
v1.PlaneLock = "PlaneLock";
v0.PlaneLock = v8;
local v9 = {
    Paint = "Paint", 
    Replace = "Replace"
};
v1.MaterialMode = "MaterialMode";
v0.MaterialMode = v9;
local v10 = {
    Stud = "Stud", 
    Percentage = "Percentage"
};
v1.MaterialUnit = "MaterialUnit";
v0.MaterialUnit = v10;
local v11 = {
    Off = "Off", 
    Voxel = "Voxel"
};
v1.Snapping = "Snapping";
v0.Snapping = v11;
local v12 = {
    Arctic = "Arctic", 
    Crater = "Crater", 
    Desert = "Desert", 
    Lake = "Lake", 
    Mesa = "Mesa", 
    Mountain = "Mountain", 
    Plain = "Plain", 
    Volcano = "Volcano", 
    None = "None"
};
v1.TerrainType = "TerrainType";
v0.TerrainType = v12;
local v13 = {
    [v1.BrushMode] = {
        v2.Add, 
        v2.Subtract
    }, 
    [v1.BrushShape] = {
        v3.Sphere, 
        v3.Cube, 
        v3.Cylinder
    }, 
    [v1.FillMode] = {
        v4.Fill, 
        v4.Replace
    }, 
    [v1.FlattenPlane] = {
        v6.Auto, 
        v6.Fixed
    }, 
    [v1.FlattenMode] = {
        v5.Erode, 
        v5.Grow, 
        v5.Both
    }, 
    [v1.PivotPosition] = {
        v7.Bottom, 
        v7.Center, 
        v7.Top
    }, 
    [v1.PlaneLock] = {
        v8.Off, 
        v8.Auto, 
        v8.Manual
    }, 
    [v1.MaterialMode] = {
        v9.Paint, 
        v9.Replace
    }, 
    [v1.MaterialUnit] = {
        v10.Stud, 
        v10.Percentage
    }, 
    [v1.Snapping] = {
        v11.Off, 
        v11.Voxel
    }, 
    [v1.TerrainType] = {
        v12.Plain, 
        v12.Arctic, 
        v12.Desert, 
        v12.Mountain, 
        v12.Volcano, 
        v12.Mesa, 
        v12.Crater, 
        v12.Lake, 
        v12.None
    }
};
for v14, v15 in v0, nil, nil do
    assert(v13[v14], (("Expected editor enum index for %*"):format(v14)));
    for _, v17 in v15, nil, nil do
        assert(table.find(v13[v14], v17), (("Expected index for enum value %*.%*"):format(v14, v17)));
    end;
end;
v0.EnumTypeIndices = v13;
v0.EnumType = v1;
return v0;
