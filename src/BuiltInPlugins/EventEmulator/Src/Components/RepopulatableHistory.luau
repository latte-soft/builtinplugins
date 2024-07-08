local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.Components.RepopulatableHistoryItem);
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v11 = v1.PureComponent:extend("RepopulatableHistory");
v11.init = function(v12)
    v12.createChildren = function()
        local l_props_0 = v12.props;
        local l_HistoryItems_0 = l_props_0.HistoryItems;
        local v15 = {
            Layout = v1.createElement("UIListLayout", l_props_0.Stylizer.Layout.Vertical.Vertical)
        };
        for _, v17 in pairs(l_HistoryItems_0) do
            table.insert(v15, 1, v1.createElement(v6, {
                View = v17.View, 
                Name = v17.Name, 
                Data = v17.Data
            }));
        end;
        return v15;
    end;
end;
v11.render = function(v18)
    return v1.createElement(l_Pane_0, {
        Style = "RoundBox", 
        Layout = Enum.FillDirection.Vertical
    }, {
        Header = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            Style = "Bold", 
            Text = "History"
        }), 
        ScrollingContainer = v1.createElement(l_ScrollingFrame_0, {
            Size = UDim2.new(1, 0, 1, -v18.props.Stylizer.Text.BrightText.Size)
        }, v18.createChildren())
    });
end;
return v2.connect(function(v19, _)
    return {
        HistoryItems = v19.History.HistoryItems
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11)));
