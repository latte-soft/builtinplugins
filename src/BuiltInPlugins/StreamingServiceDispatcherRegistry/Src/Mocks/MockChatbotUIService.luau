local l_Signal_0 = require(script:FindFirstAncestor("StreamingServiceDispatcherRegistry").Packages.Framework).Util.Signal;
local v1 = {};
v1.__index = v1;
v1.new = function()
    local v2 = {};
    setmetatable(v2, v1);
    v2.ShiftVariationSignal = l_Signal_0.new();
    v2.ShiftToAssetIdSignal = l_Signal_0.new();
    v2.ActionActivatedSignal = l_Signal_0.new();
    v2.FindVariationsSignal = l_Signal_0.new();
    v2.SetMaterialSettingsSignal = l_Signal_0.new();
    v2.SettingChangedSignal = l_Signal_0.new();
    v2.settings = {
        AutoRunCode = true
    };
    v2.displayContentCalls = {};
    return v2;
end;
v1.DisplayContent = function(v3, v4, v5)
    if not v3.displayContentCalls[v4] then
        v3.displayContentCalls[v4] = {};
    end;
    table.insert(v3.displayContentCalls[v4], v5);
end;
v1.GetSettings = function(v6)
    return v6.settings;
end;
return v1;
