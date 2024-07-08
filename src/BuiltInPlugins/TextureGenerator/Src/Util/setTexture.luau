local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
return function(v1, v2)
    if v2 == nil then
        return ;
    else
        v1.TextureID = "";
        local l_SurfaceAppearance_0 = v1:FindFirstChildWhichIsA("SurfaceAppearance");
        if l_SurfaceAppearance_0 ~= nil then
            l_SurfaceAppearance_0.Parent = nil;
        end;
        local l_SurfaceAppearance_1 = Instance.new("SurfaceAppearance");
        l_SurfaceAppearance_1.ColorMap = v2;
        l_SurfaceAppearance_1.Parent = v1;
        l_ChangeHistoryService_0:SetWaypoint("Set Texture");
        return ;
    end;
end;
