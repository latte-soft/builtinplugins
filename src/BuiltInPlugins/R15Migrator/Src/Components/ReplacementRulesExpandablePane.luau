local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_SimpleExpandablePane_0 = v1.UI.SimpleExpandablePane;
local v4 = require(l_script_FirstAncestor_0.Src.Components.ReplaceOptionsPane);
local v5 = v2.PureComponent:extend("ReplacementRulesExpandablePane");
v5.render = function(v6)
    local l_props_0 = v6.props;
    return v2.createElement(l_SimpleExpandablePane_0, {
        Size = l_props_0.Size, 
        Style = "Section", 
        LayoutOrder = l_props_0.LayoutOrder, 
        Text = "Replacement Rules", 
        Expanded = true
    }, {
        ReplaceOptionsPane = v2.createElement(v4)
    });
end;
return v5;
