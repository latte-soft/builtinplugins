local v0 = require(script.Parent.Parent.Parent.Src.Util.TerrainEnums);
local l_ToolId_0 = v0.ToolId;
local l_BrushShape_0 = v0.BrushShape;
return function(v3)
    local v4 = {};
    for v5, v6 in pairs(v3) do
        v4[v5] = v6;
    end;
    if v4.currentTool == l_ToolId_0.Flatten then
        v4.planeLock = nil;
        if not v4.fixedPlane then
            v4.planePositionY = nil;
        end;
    else
        v4.flattenMode = nil;
        v4.fixedPlane = nil;
        v4.planePositionY = nil;
    end;
    if (v4.currentTool ~= l_ToolId_0.Add and v4.currentTool ~= l_ToolId_0.Grow) and v4.currentTool ~= l_ToolId_0.Paint then
        v4.material = nil;
        v4.autoMaterial = nil;
    else
        v4.material = v4.material.Name;
        if v4.currentTool == l_ToolId_0.Paint then
            v4.autoMaterial = nil;
        end;
    end;
    if v4.currentTool ~= l_ToolId_0.Replace then
        v4.source = nil;
        v4.target = nil;
    else
        v4.source = v4.source.Name;
        v4.target = v4.target.Name;
    end;
    if v3.brushShape == l_BrushShape_0.Sphere then
        v4.cursorHeight = nil;
    end;
    return v4;
end;
