local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
if game:GetFastFlag("StudioVisualizationModes") then
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("VisualizationModes", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        plugin.Name = l_script_FirstAncestor_0.Name;
        (function(v2)
            local v3 = require(l_script_FirstAncestor_0.Packages.React);
            local v4 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
            local v5 = require(l_script_FirstAncestor_0.Src.VisualizationModesPlugin);
            local v6 = require(l_script_FirstAncestor_0.Src.Modes.StudioVisualizationModeProvider);
            local v7 = require(l_script_FirstAncestor_0.Src.Util.Maid).new();
            v7:add(v6.new());
            local v8 = v3.createElement(v5, {
                Plugin = v2
            });
            local v9 = v4.createRoot((Instance.new("Frame")));
            v9:render(v8);
            v7:giveTask(function()
                v9:unmount();
            end);
            v7:giveTask(v2.Unloading:Connect(function()
                v7:destroy();
            end));
        end)(plugin);
        return ;
    else
        return ;
    end;
else
    return ;
end;
