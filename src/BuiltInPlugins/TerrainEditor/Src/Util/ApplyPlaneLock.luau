local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.getPlaneIntersection);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushSettings_0 = v2.BrushSettings;
local l_Category_0 = v2.Category;
local l_PlaneLock_0 = v2.PlaneLock;
return function(v6, v7, v8)
    local l_Position_0 = v8.Origin.Position;
    local v10 = v6[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneTransform];
    local l_Direction_0 = v8.UnitRay.Direction;
    if v6[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Auto then
        local l_LookVector_0 = v7.LookVector;
        local v13 = v1(l_Position_0, l_Direction_0, v7.Position, l_LookVector_0);
        return {
            Distance = (v13 - l_Position_0).Magnitude, 
            Normal = l_LookVector_0, 
            Position = v13
        };
    elseif v6[l_Category_0.BrushSettings][l_BrushSettings_0.PlaneLock] == l_PlaneLock_0.Manual then
        local v14 = v1(l_Position_0, l_Direction_0, v10.Position, v10.LookVector);
        return {
            Distance = (v14 - l_Position_0).Magnitude, 
            Normal = v10.LookVector, 
            Position = v14
        };
    else
        return nil;
    end;
end;
