local l_Workspace_0 = game:GetService("Workspace");
local v1 = require(script.Parent.Parent.Parent.Src.Resources.Constants);
local v2 = {
    [Enum.NormalId.Top] = {
        axisX = "Z", 
        axisY = "X", 
        invertX = true, 
        invertY = false
    }, 
    [Enum.NormalId.Bottom] = {
        axisX = "Z", 
        axisY = "X", 
        invertX = true, 
        invertY = true
    }, 
    [Enum.NormalId.Left] = {
        axisX = "Z", 
        axisY = "Y", 
        invertX = false, 
        invertY = true
    }, 
    [Enum.NormalId.Right] = {
        axisX = "Z", 
        axisY = "Y", 
        invertX = true, 
        invertY = true
    }, 
    [Enum.NormalId.Front] = {
        axisX = "X", 
        axisY = "Y", 
        invertX = true, 
        invertY = true
    }, 
    [Enum.NormalId.Back] = {
        axisX = "X", 
        axisY = "Y", 
        invertX = false, 
        invertY = true
    }
};
return function(v3)
    return function(v4)
        local l_PathReducer_0 = v4:getState().PathReducer;
        if not (l_PathReducer_0.SelectedObject ~= nil) or l_PathReducer_0.SelectedObjectGui == nil then
            return nil;
        elseif l_PathReducer_0.SelectedObjectGui:isA("SurfaceGui") then
            local v6 = if not l_PathReducer_0.SelectedObjectGui.Adornee then l_PathReducer_0.SelectedObjectGui.Parent else l_PathReducer_0.SelectedObjectGui.Adornee;
            local v7 = l_Workspace_0.CurrentCamera:ScreenPointToRay(v3.X, v3.Y);
            local v8 = RaycastParams.new();
            v8.FilterType = Enum.RaycastFilterType.Whitelist;
            v8:AddToFilter(v6);
            local v9 = l_Workspace_0:Raycast(v7.Origin, v7.Direction * v1.SurfaceGuiDragRaycastDepth, v8);
            if v9 then
                local l_Position_0 = v6.CFrame:ToObjectSpace((CFrame.new(v9.Position))).Position;
                local v11 = v2[l_PathReducer_0.SelectedObjectGui.Face];
                local v12 = l_Position_0[v11.axisX] / v6.Size[v11.axisX] + 0.5;
                local v13 = l_Position_0[v11.axisY] / v6.Size[v11.axisY] + 0.5;
                if v11.invertX then
                    v12 = 1 - v12;
                end;
                if v11.invertY then
                    v13 = 1 - v13;
                end;
                return Vector2.new(v12 * l_PathReducer_0.SelectedObjectGui.AbsoluteSize.X, v13 * l_PathReducer_0.SelectedObjectGui.AbsoluteSize.Y);
            else
                return nil;
            end;
        else
            return v3;
        end;
    end;
end;
