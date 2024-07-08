local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Dev.ReactTestingLibrary);
return function(v3)
    local v4 = v1.createRef();
    v2.render(v1.createElement(function()
        v4.current = table.pack(v3());
    end));
    return function()
        return table.unpack(v4.current);
    end;
end;
