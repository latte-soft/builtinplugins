if plugin then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("TutorialLinks", l_Parent_0.Src);
    if not v1.isCli() then
        local l_StarterGui_0 = game:GetService("StarterGui");
        local v3 = require(l_Parent_0.Src.Links);
        pcall(function()
            v3.addLinks(l_StarterGui_0);
        end);
        plugin.Unloading:Connect(function()
            v3.removeLinks();
        end);
        return ;
    else
        return ;
    end;
else
    return ;
end;
