local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialGenerator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.ReactUtils).useToggleState;
local v3 = require(l_script_FirstAncestor_0.Src.Util.PreviewContext);
local v4 = {};
local function v8(v5)
    local v6, v7 = v1.useState(v5.selectedMaterial);
    return v1.createElement(v3.Provider, {
        value = {
            selectedMaterial = v6, 
            setSelectedMaterial = v7, 
            applySelectedMaterial = function()
            end
        }
    }, v5.children);
end;
v4.BasicProvider = function(v9)
    return v1.createElement(v8, {
        selectedMaterial = v9.selectedMaterial
    }, v9.children);
end;
return v4;
