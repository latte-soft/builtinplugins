local l_Parent_0 = script.Parent.Parent;
local l_EnableGuiDevEnv_0 = game:GetFastFlag("EnableGuiDevEnv");
if game:GetService("StudioService"):HasInternalPermission() then
    if l_EnableGuiDevEnv_0 then
        require(script.Parent.commonInit)();
        local v2 = require(l_Parent_0.Packages.Roact);
        local v3 = require(l_Parent_0.Src.MainPlugin);
        local v4 = nil;
        local function _()
            plugin.Name = "Guide";
            v4 = v2.mount((v2.createElement(v3, {
                plugin = plugin
            })));
        end;
        plugin.Unloading:Connect(function()
            if v4 then
                v2.unmount(v4);
                v4 = nil;
            end;
        end);
        plugin.Name = "Guide";
        v4 = v2.mount((v2.createElement(v3, {
            plugin = plugin
        })));
        return ;
    else
        return ;
    end;
else
    return ;
end;
