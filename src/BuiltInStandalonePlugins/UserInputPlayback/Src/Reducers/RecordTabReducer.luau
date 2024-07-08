local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local l_join_0 = require(l_Parent_0.Packages.Cryo).Dictionary.join;
local _ = require(l_Parent_0.Src.Actions.RecordTab.SetScreenSize);
local _ = require(l_Parent_0.Src.Actions.RecordTab.SetEmulationDeviceId);
local _ = require(l_Parent_0.Src.Actions.RecordTab.SetEmulationDeviceOrientation);
return v1.createReducer({
    screenSize = Vector2.new(), 
    emulationDeviceId = "Unknown", 
    emulationDeviceOrientation = "Unknown"
}, {
    SetScreenSize = function(v6, v7)
        return l_join_0(v6, {
            screenSize = v7.screenSize
        });
    end, 
    SetEmulationDeviceId = function(v8, v9)
        return l_join_0(v8, {
            emulationDeviceId = v9.emulationDeviceId
        });
    end, 
    SetEmulationDeviceOrientation = function(v10, v11)
        return l_join_0(v10, {
            emulationDeviceOrientation = v11.orientation
        });
    end
});
