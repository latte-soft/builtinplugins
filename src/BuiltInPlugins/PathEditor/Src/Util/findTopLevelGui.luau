return function(v0)
    local l_v0_0 = v0;
    while true do
        if l_v0_0 ~= nil then
            if not l_v0_0:IsA("ScreenGui") and not l_v0_0:IsA("SurfaceGui") then
                l_v0_0 = l_v0_0.Parent;
            else
                return l_v0_0;
            end;
        else
            return nil;
        end;
    end;
end;
