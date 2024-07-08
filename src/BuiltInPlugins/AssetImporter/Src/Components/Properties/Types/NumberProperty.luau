local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
return function(v6)
    local v7 = tostring(v6.Value);
    if not (v6.Editable ~= nil) or v6.Editable then
        return v2.createElement(l_TextInput_0, {
            Disabled = true, 
            LayoutOrder = v6.LayoutOrder, 
            Size = v6.Size, 
            Text = v7
        });
    else
        return v2.createElement(l_TextLabel_0, {
            LayoutOrder = v6.LayoutOrder, 
            Size = UDim2.new(0, 0, v6.Size.Y.Scale, v6.Size.Y.Offset), 
            AutomaticSize = Enum.AutomaticSize.X, 
            Text = v7, 
            TextXAlignment = Enum.TextXAlignment.Left
        });
    end;
end;
