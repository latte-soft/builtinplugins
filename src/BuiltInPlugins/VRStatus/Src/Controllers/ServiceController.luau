local l_script_FirstAncestor_0 = script:FindFirstAncestor("VRStatus");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.ContextItem:extend("ServiceController");
local l_Mocks_0 = l_script_FirstAncestor_0.Src.Mocks;
local v3 = require(l_Mocks_0.MockUserSettingService);
local v4 = require(l_Mocks_0.MockVRService);
v1.new = function(v5)
    return (setmetatable({
        _services = {
            VRService = if not v5 then game:GetService("VRService") else v4.new(), 
            UserGameSettings = if not v5 then UserSettings():GetService("UserGameSettings") else v3.new()
        }
    }, v1));
end;
v1.mock = function()
    v1.new(true);
end;
v1.getService = function(v6, v7)
    return v6._services[v7];
end;
return v1;
