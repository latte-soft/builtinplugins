local l_Common_0 = script.Parent.Parent.Common;
require(l_Common_0.defineLuaFlags);
if plugin then
    local l_Parent_0 = script.Parent.Parent.Parent;
    require(l_Common_0.commonInit)();
    if not require(l_Parent_0.Packages.TestLoader).isCli() then
        local l_Frame_0 = Instance.new("Frame");
        local v3 = require(l_Parent_0.Packages.React);
        local v4 = require(l_Parent_0.Packages.ReactRoblox);
        local v5 = require(l_Parent_0.Src.MainPlugin);
        local v6 = nil;
        local function v8()
            plugin.Name = l_Parent_0.Name;
            local v7 = v3.createElement(v5, {
                Plugin = plugin
            });
            v6 = v4.createRoot(l_Frame_0);
            v6:render(v7);
        end;
        plugin.Unloading:Connect(function()
            if v6 then
                v6:render(nil);
                v6 = nil;
            end;
        end);
        v8();
        return ;
    else
        return ;
    end;
else
    return ;
end;
