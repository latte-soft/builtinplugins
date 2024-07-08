local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = v1.UI.Button;
local l_IconButton_0 = v1.UI.IconButton;
local _ = v1.Util.StyleModifier;
return function(v6)
    local l_Schema_0 = v6.Schema;
    return v2.createElement(l_IconButton_0, {
        Disabled = v6.Disabled, 
        OnClick = l_Schema_0.OnClick, 
        Size = UDim2.new(1, 0, 0, 32), 
        Style = not v6.Disabled and "PrimaryBrand" or nil, 
        Text = l_Schema_0.Label, 
        TextXAlignment = Enum.TextXAlignment.Center
    });
end;
