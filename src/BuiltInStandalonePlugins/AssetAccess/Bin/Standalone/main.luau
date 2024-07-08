local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetAccess");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Src.MainPlugin);
return function(v4)
    local l_Frame_0 = Instance.new("Frame");
    local v6 = v2.createRoot(l_Frame_0);
    v6:render(v1.createElement(v3, {
        Plugin = v4
    }));
    v4.Unloading:Once(function()
        v6:unmount();
        l_Frame_0:Destroy();
    end);
end;
