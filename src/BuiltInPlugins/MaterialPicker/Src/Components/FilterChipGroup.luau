local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local l_createElement_0 = require(l_script_FirstAncestor_0.Packages.React).createElement;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local v3 = require(script.Parent.FilterChip);
FilterChipGroup = function(v4)
    return l_createElement_0(l_Pane_0, {
        key = "Filters", 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Spacing = -6, 
        Padding = {
            Left = 0, 
            Top = 1
        }
    }, {
        l_createElement_0(v3, {
            Text = v4.LeftText, 
            OnClick = v4.OnClickLeft, 
            selected = v4.LeftSelected, 
            PaddingRight = 11
        }), 
        l_createElement_0(v3, {
            Text = v4.RightText, 
            OnClick = v4.OnClickRight, 
            selected = v4.RightSelected
        })
    });
end;
return FilterChipGroup;
