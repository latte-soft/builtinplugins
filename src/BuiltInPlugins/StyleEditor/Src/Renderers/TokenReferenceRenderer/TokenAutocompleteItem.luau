local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v2.UI.Pane;
local l_TextLabel_0 = v2.UI.TextLabel;
local v5 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local v6 = require(script.Parent.TokenTooltip);
local v7 = require(script.Parent.TokenSourceLink);
local _ = require(script.Parent.Types);
return function(v9)
    return v1.createElement(l_Pane_0, {
        LayoutOrder = v9.LayoutOrder, 
        OnPress = v9.OnActivated, 
        [v1.Tag] = "X-Pad DropdownItem"
    }, {
        Tooltip = v1.createElement(v6, {
            TokenInfo = v9.TokenInfo, 
            ErrorStyle = v9.ErrorStyle
        }), 
        Content = v1.createElement(l_Pane_0, {
            [v1.Tag] = "X-Fill X-RowS X-Middle"
        }, {
            NameText = v1.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                Text = v5().Localization:getText("Label", "TokenIn", {
                    token = v9.TokenInfo.Name
                }), 
                [v1.Tag] = "TextXAlignLeft X-FitX"
            }), 
            SourceLink = v9.TokenInfo.Source and v1.createElement(v7, {
                Source = v9.TokenInfo.Source, 
                LayoutOrder = 2
            })
        })
    });
end;
