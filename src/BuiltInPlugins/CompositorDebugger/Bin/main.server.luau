require(script.Parent.defineLuaFlags);
if plugin then
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("CompositorDebugger", l_Parent_0.Src);
    if not v1.isCli() then
        if game:GetFastFlag("CDEnableCompositorDebugger1") then
            local v2 = require(l_Parent_0.Packages.React);
            local v3 = require(l_Parent_0.Packages.ReactRoblox);
            local v4 = require(l_Parent_0.Src.MainPlugin);
            local v5 = nil;
            local function v7()
                plugin.Name = l_Parent_0.Name;
                local v6 = v2.createElement(v4, {
                    Plugin = plugin
                });
                v5 = v3.createRoot(Instance.new("Frame"));
                v5:render(v6);
            end;
            plugin.Unloading:Connect(function()
                if v5 then
                    v5:render(nil);
                    v5 = nil;
                end;
            end);
            v7();
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
