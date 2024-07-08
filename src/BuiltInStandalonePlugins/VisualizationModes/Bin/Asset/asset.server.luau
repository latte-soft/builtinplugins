if plugin then
    local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
    require(l_script_FirstAncestor_0.Bin.Common.defineLuaFlags);
    local v1 = require(l_script_FirstAncestor_0.Packages.TestLoader);
    v1.launch("VisualizationModes", l_script_FirstAncestor_0.Src);
    if not v1.isCli() then
        if game:GetFastFlag("StudioVisualizationModes") then
            local v2 = require(l_script_FirstAncestor_0.Src.Util.Maid);
            local v3 = v2.new();
            local function v6()
                local v4 = v2.new();
                local v5 = require(l_script_FirstAncestor_0.Src.Modes.StudioVisualizationModeProvider);
                v4:add(require(l_script_FirstAncestor_0.Src.Model.VisualizationModeCombinerClient).new(plugin, (v4:add(require(l_script_FirstAncestor_0.Src.Model.Tracking.VisualizationModeServiceTracker).new()))));
                v4:add(v5.new());
                v3._mount = v4;
            end;
            plugin.Unloading:Connect(function()
                v3._mount = nil;
            end);
            v6();
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
