return {
    isInvalidCameraType = function()
        local l_CameraType_0 = game.Workspace.CurrentCamera.CameraType;
        if not (l_CameraType_0 ~= Enum.CameraType.Attach) or l_CameraType_0 == Enum.CameraType.Scriptable then
            return true;
        else
            return false;
        end;
    end, 
    getRayPlaneHit = function(v1, v2, v3, v4)
        local l_v2_0 = v2;
        local v6 = v2 - v1;
        local v7 = (v4 - v3:Dot(v1)) / v3:Dot(v6);
        if v7 >= 0 and v7 <= 1 then
            l_v2_0 = v1 + v7 * v6;
        end;
        return l_v2_0;
    end
};
