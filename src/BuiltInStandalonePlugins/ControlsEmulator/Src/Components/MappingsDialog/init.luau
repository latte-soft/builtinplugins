local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local _ = require(l_script_FirstAncestor_0.Src.Components.ControlsWidgets.Button);
local _ = require(l_script_FirstAncestor_0.Src.Components.ControlsWidgets.Thumbstick);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.MappingsActionsContext);
local _ = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v8 = require(l_script_FirstAncestor_0.Src.Components.MappingsList);
return function(_)
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-MappingsDialog data-testid=Component-MappingsDialog"
    }, {
        List = v1.createElement(v8, {})
    });
end;
