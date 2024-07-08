if game:GetService("StudioService"):HasInternalPermission() then
    require(script.Parent.Parent.Common.defineLuaFlags);
    if plugin then
        local l_Parent_0 = script.Parent.Parent.Parent;
        if not require(l_Parent_0.Packages.TestLoader).isCli() then
            if game:GetFastFlag("EnableStudioTutorials") then
                local function _()
                    plugin.Name = l_Parent_0.Name;
                end;
                plugin.Name = l_Parent_0.Name;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    else
        return ;
    end;
else
    return ;
end;
