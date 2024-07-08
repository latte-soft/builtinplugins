local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v4 = game:DefineFastFlag("AvatarPreviewerEditingToolsDraggerClosestPoint", false);
local v5 = {};
v5.__index = v5;
v5.new = function(v6)
    return (setmetatable({
        _draggerContext = v6, 
        _selectedPoint = v6.selectedPoints[1], 
        _updatePointPosition = if #v6.selectedPoints == 1 then v6.createUpdatePointPosition(v6.selectedPoints[1]) else nil
    }, v5));
end;
v5.render = function(_)
    return nil;
end;
v5.rotate = function(_)
end;
v5.update = function(v9)
    if v9._updatePointPosition == nil then
        return ;
    else
        assert(v9._updatePointPosition ~= nil, v3.LUAU_ANALYZE_ERROR);
        local v10 = v9._draggerContext:getMouseRay();
        local v11 = RaycastParams.new();
        v11.FilterType = Enum.RaycastFilterType.Include;
        v11.FilterDescendantsInstances = {
            v9._selectedPoint.limb
        };
        local v12 = l_Workspace_0:Raycast(v10.Origin, v10.Direction, v11);
        local v13 = nil;
        if not v4 then
            if v12 == nil then
                return ;
            else
                assert(v12 ~= nil, v3.LUAU_ANALYZE_ERROR);
                v13 = v12.Position;
            end;
        elseif v12 == nil then
            local l_limb_0 = v9._selectedPoint.limb;
            v13 = l_limb_0:GetClosestPointOnSurface(v10.Origin + v10.Direction.Unit * (l_limb_0.Position - v10.Origin).Magnitude);
        else
            v13 = v12.Position;
        end;
        if not v9._draggerContext.projectionEnabled then
            local _ = nil;
            local v16;
            while true do
                v16 = l_Workspace_0:Raycast(v10.Origin + v10.Direction * 0.05, -v10.Direction, v11);
                if v16 ~= nil then
                    break;
                end;
            end;
            assert(v16 ~= nil, v3.LUAU_ANALYZE_ERROR);
            v9._updatePointPosition(CFrame.new(v9._draggerContext.worldModel.PrimaryPart.CFrame:PointToObjectSpace((v13:Lerp(v16.Position, 0.5)))) * v9._selectedPoint.getCFrame().Rotation);
            return ;
        else
            v9._updatePointPosition(CFrame.new(v9._draggerContext.worldModel.PrimaryPart.CFrame:PointToObjectSpace(v13)) * v9._selectedPoint.getCFrame().Rotation);
            return ;
        end;
    end;
end;
v5.destroy = function(_)
end;
return v5;
