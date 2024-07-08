require(script.Parent.defineLuaFlags);
if plugin then
    local l_Parent_0 = script.Parent.Parent;
    if game:GetFastFlag("EnableTextureGenerator2") then
        local v1 = require(l_Parent_0.Packages.React);
        local v2 = require(l_Parent_0.Packages.ReactRoblox);
        local v3 = require(l_Parent_0.Src.MainPlugin);
        local v4 = nil;
        local function v6()
            plugin.Name = l_Parent_0.Name;
            local v5 = v1.createElement(v3, {
                Plugin = plugin
            });
            v4 = v2.createRoot(Instance.new("Frame"));
            v4:render(v5);
        end;
        plugin.Unloading:Connect(function()
            if v4 then
                v4:render(nil);
                v4 = nil;
            end;
        end);
        v6();
        return ;
    else
        return ;
    end;
else
    return ;
end;
