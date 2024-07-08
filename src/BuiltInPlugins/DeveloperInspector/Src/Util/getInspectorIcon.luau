local v0 = {
    Branch = 5923556358, 
    Consumer = 5923556689, 
    Fragment = 5923557006, 
    Functional = 5923557211, 
    Portal = 5923557429, 
    Provider = 5923557657, 
    Pure = 5923557814, 
    Stateful = 5923557987
};
local function v2(v1)
    return game:GetService("StudioService"):GetClassIcon(v1);
end;
return function(v3)
    if not v0[v3] then
        local l_status_0, l_result_0 = pcall(function()
            return v2(v3);
        end);
        if not l_status_0 then
            return v2("Folder");
        else
            return l_result_0;
        end;
    else
        return {
            Image = "rbxassetid://" .. v0[v3], 
            ImageRectSize = Vector2.new(24, 24), 
            ImageRectOffset = Vector2.new(0, 0)
        };
    end;
end;
