local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local l_VisualizationModeService_0 = game:GetService("VisualizationModeService");
local v2 = require(l_script_FirstAncestor_0.Src.Resources.Localization.createLocalization);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Maid);
local v5 = require(l_script_FirstAncestor_0.Packages.React);
local v6 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v7 = require(l_script_FirstAncestor_0.Src.Modes.StudioVisualizationModes);
local l_ContextServices_0 = v3.ContextServices;
local v9 = {
    ClassName = "StudioVisualizationModeProvider"
};
v9.__index = v9;
v9.new = function()
    local v10 = setmetatable({}, v9);
    v10._maid = v4.new();
    v10._localization = v2();
    l_VisualizationModeService_0:ClearAllChildren();
    v10._root = v6.createRoot(v10._maid:add(Instance.new("Folder")));
    v10._root:render(l_ContextServices_0.provide({
        v10._localization
    }, {
        StudioVisualizationModes = v6.createPortal(v5.createElement(v7, {
            Plugin = plugin
        }), l_VisualizationModeService_0)
    }));
    v10._maid:giveTask(function()
        v10._root:unmount();
    end);
    return v10;
end;
v9.destroy = function(v11)
    v11._maid:destroy();
end;
return v9;
