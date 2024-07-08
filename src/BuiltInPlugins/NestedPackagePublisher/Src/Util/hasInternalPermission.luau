local l_status_0, l_result_0 = pcall(function()
    return game:GetService("StudioService"):HasInternalPermission();
end);
local v2 = l_status_0 and l_result_0;
return function()
    return v2;
end;
