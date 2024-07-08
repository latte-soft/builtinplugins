local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_Parent_0.Src.Components.Menu.MenuEntry);
local v5 = v1.PureComponent:extend("MenuBar");
v5.render = function(v6)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_Selected_0 = l_props_0.Selected;
    local l_SelectionChanged_0 = l_props_0.SelectionChanged;
    local l_Entries_0 = l_props_0.Entries;
    assert(type(l_Entries_0) == "table", "MenuBar.Entries must be a table");
    local v13 = {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, 1)
        })
    };
    for v14, v15 in ipairs(l_Entries_0) do
        table.insert(v13, v1.createElement(v4, {
            Title = l_Localization_0:getText("MenuItem", v15), 
            Selected = l_Selected_0 == v14, 
            ShowError = false, 
            ShowWarning = false, 
            OnClicked = function()
                l_SelectionChanged_0(v14);
            end
        }));
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(0, l_Stylizer_0.MENU_BAR_WIDTH, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.menuBar.backgroundColor, 
        BorderSizePixel = 0
    }, v13);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v5));
