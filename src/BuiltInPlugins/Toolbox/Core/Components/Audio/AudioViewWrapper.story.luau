local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.Util.MockWrapper);
local v3 = require(l_script_FirstAncestor_0.Core.Networking.NetworkInterface);
local v4 = require(script.Parent.AudioViewWrapper);
return {
    story = function()
        return v1.createElement(v2, {
            networkInterface = v3.new()
        }, {
            AudioViewWrapper = v1.createElement(v4)
        });
    end
};
