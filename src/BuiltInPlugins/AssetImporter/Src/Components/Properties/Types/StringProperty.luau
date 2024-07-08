local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TruncatedTextLabel_0 = l_UI_0.TruncatedTextLabel;
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportFixPropertyLength);
return function(v9)
    if not (v9.Editable ~= nil) or v9.Editable then
        if not v8() then
            return v2.createElement(l_TextInput_0, {
                LayoutOrder = v9.LayoutOrder, 
                OnTextChanged = v9.OnSetItem, 
                Size = v9.Size, 
                Text = v9.Value
            });
        else
            return v2.createElement(l_Pane_0, {
                Size = v9.Size, 
                LayoutOrder = v9.LayoutOrder
            }, {
                v2.createElement(l_TextInput_0, {
                    AutomaticSize = Enum.AutomaticSize.None, 
                    OnTextChanged = v9.OnSetItem, 
                    Text = v9.Value
                })
            });
        end;
    else
        return v2.createElement(l_TruncatedTextLabel_0, {
            LayoutOrder = v9.LayoutOrder, 
            Size = v9.Size, 
            SuffixLength = 20, 
            Text = v9.Value, 
            TextXAlignment = Enum.TextXAlignment.Left
        }, {
            Tooltip = v2.createElement(l_Tooltip_0, {
                Text = v9.Value
            })
        });
    end;
end;
