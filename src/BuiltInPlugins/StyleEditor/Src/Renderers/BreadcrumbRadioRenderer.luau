local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Breadcrumb_0 = l_UI_0.Breadcrumb;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButton_0 = l_UI_0.RadioButton;
local l_joinTags_0 = v2.Styling.joinTags;
return function(v8)
    local l_Schema_0 = v8.Schema;
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = l_joinTags_0(v8[v1.Tag], "X-Middle X-Row")
    }, {
        Label = v1.createElement(l_Breadcrumb_0, {
            Editing = v8.Editing or l_Schema_0 and l_Schema_0.Editing, 
            LayoutOrder = 1, 
            OnPressed = v8.OnPressed, 
            OnDoubleClick = v8.OnDoubleClick, 
            OnEdited = v8.OnChanged, 
            Text = v8.Value.Name, 
            [v1.Tag] = "BreadcrumbRadioSize"
        }), 
        Radio = v1.createElement(l_RadioButton_0, {
            LayoutOrder = 2, 
            Key = v8.Value:GetDebugId(), 
            OnClick = function(_)
                v8.OnClick(v8.Value);
            end, 
            Selected = v8.Selected, 
            Text = "Active"
        })
    });
end;
