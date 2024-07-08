local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Checkbox_0 = v1.UI.Checkbox;
return function(v4)
    return v2.createElement(l_Checkbox_0, {
        OnClick = v4.OnToggleItem, 
        LayoutOrder = v4.LayoutOrder, 
        Checked = v4.Value
    });
end;
