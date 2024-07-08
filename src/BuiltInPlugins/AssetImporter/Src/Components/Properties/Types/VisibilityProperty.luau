local l_DevFrameworkToggleAllowEyeIcon_0 = game:GetFastFlag("DevFrameworkToggleAllowEyeIcon");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_Stylizer_0 = v2.Style.Stylizer;
local l_ToggleButton_0 = v2.UI.ToggleButton;
return function(v6)
    if not l_DevFrameworkToggleAllowEyeIcon_0 then
        return v3.createElement(l_ToggleButton_0, {
            OnClick = v6.OnToggleItem, 
            Size = v6.Size, 
            LayoutOrder = v6.LayoutOrder, 
            Selected = v6.Value, 
            Stylizer = l_Stylizer_0
        });
    else
        return v3.createElement(l_ToggleButton_0, {
            OnClick = v6.OnToggleItem, 
            Size = v6.Size, 
            LayoutOrder = v6.LayoutOrder, 
            Selected = v6.Value, 
            Stylizer = l_Stylizer_0, 
            Style = "EyeIcon"
        });
    end;
end;
