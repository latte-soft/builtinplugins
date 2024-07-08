local l_StudioService_0 = game:GetService("StudioService");
return function()
    local v1 = 0;
    pcall(function()
        v1 = l_StudioService_0:GetUserId();
    end);
    return v1;
end;
