local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_TextLabel_0 = v1.UI.TextLabel;
return function(v4)
    return v2.createElement(l_TextLabel_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0), 
        Text = v4.Schema.Text
    });
end;
