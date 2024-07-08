local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = v1.PureComponent:extend("ExampleComponent");
v11.render = function(v12)
    return v1.createElement(l_Pane_0, {
        Style = "Box", 
        Padding = 10
    }, {
        Text = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Style = "Title", 
            Text = v12.props.Localization:getText("Plugin", "Text")
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v11));
