local l_script_FirstAncestor_0 = script:FindFirstAncestor("ControlsEmulator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_map_0 = require(l_script_FirstAncestor_0.Packages.Dash).map;
local v4 = require(l_script_FirstAncestor_0.Src.Util.enumToDisplayKeyCode);
local l_Localization_0 = v2.ContextServices.Localization;
local v6 = require(l_script_FirstAncestor_0.Src.Util.MappingsContext);
local v7 = v2.Util.LayoutOrderIterator.new();
return function(_)
    local _ = l_Localization_0:use();
    return v1.createElement("Frame", {
        [v1.Tag] = "Component-MappingsList"
    }, l_map_0(v1.useContext(v6).Mappings, function(v10, v11)
        return v1.createElement("TextButton", {
            Name = tostring(v11), 
            Text = tostring(v11) .. " -> " .. v4(v10), 
            LayoutOrder = v7:getNextOrder()
        });
    end));
end;
