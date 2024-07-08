require(script.Parent.Parent.Common.defineLuaFlags);
local l_Common_0 = script.Parent.Parent.Common;
if plugin then
    local l_Parent_0 = script.Parent.Parent.Parent;
    require(l_Common_0.commonInit)();
    local v2 = require(l_Parent_0.Packages.TestLoader);
    v2.launch("ActivityFeed", l_Parent_0.Src);
    if not v2.isCli() then
        if game:GetFastFlag("COLLAB4260ActivityFeed") then
            local l_Frame_0 = Instance.new("Frame");
            local v4 = require(l_Parent_0.Packages.React);
            local v5 = require(l_Parent_0.Packages.ReactRoblox);
            local v6 = require(l_Parent_0.Src.MainPlugin);
            local v7 = nil;
            local function v9()
                plugin.Name = l_Parent_0.Name;
                local v8 = v4.createElement(v6, {
                    Plugin = plugin
                });
                v7 = v5.createRoot(l_Frame_0);
                if v7 then
                    v7:render(v8);
                end;
            end;
            plugin.Unloading:Connect(function()
                if v7 then
                    v7:render(nil);
                    v7 = nil;
                end;
            end);
            v9();
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
