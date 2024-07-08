local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v4 = require(l_Parent_0.Packages.Framework);
local l_Util_0 = v4.Util;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TitledFrame_0 = v4.UI.TitledFrame;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local v10 = require(l_Parent_0.Src.Components.RadioButton);
local v11 = v1.PureComponent:extend("RadioButtonSet");
v11.init = function(v12)
    v12.state = {
        maxHeight = 0
    };
    v12.layoutRef = v1.createRef();
    v12.onResize = function()
        local l_current_0 = v12.layoutRef.current;
        if l_current_0 then
            v12:setState({
                maxHeight = l_current_0.AbsoluteContentSize.Y
            });
            return ;
        else
            return ;
        end;
    end;
end;
v11.render = function(v14)
    local l_props_0 = v14.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_radioButton_0 = l_Stylizer_0.radioButton;
    local l_radioButtonSet_0 = l_Stylizer_0.radioButtonSet;
    local v19 = l_LayoutOrderIterator_0.new();
    local v20 = nil;
    v20 = if l_props_0.Selected ~= nil then l_props_0.Selected else 1;
    local l_Buttons_0 = l_props_0.Buttons;
    local v22 = {
        Layout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_radioButton_0.padding), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v1.Change.AbsoluteContentSize] = v14.onResize, 
            [v1.Ref] = v14.layoutRef
        })
    };
    if l_props_0.Description then
        table.insert(v22, v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, l_radioButtonSet_0.description.height), 
            TextTransparency = not l_props_0.Enabled and 0.5 or 0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Text = l_props_0.Description
        })));
    end;
    for v23, v24 in ipairs(l_Buttons_0) do
        if not l_props_0.RenderItem then
            local l_v22_0 = v22;
            local l_createElement_0 = v1.createElement;
            local l_v10_0 = v10;
            local v28 = {
                Title = v24.Title, 
                Id = v24.Id, 
                Description = v24.Description
            };
            local v29 = true;
            if v24.Id ~= v20 then
                v29 = v23 == v20;
            end;
            v28.Selected = v29;
            v28.Index = v23;
            v28.Enabled = l_props_0.Enabled;
            v28.LayoutOrder = v19:getNextOrder();
            v28.OnClicked = function()
                l_props_0.SelectionChanged(v24);
            end;
            v28.Children = v24.Children;
            table.insert(l_v22_0, l_createElement_0(l_v10_0, v28));
        else
            table.insert(v22, l_props_0.RenderItem(v23, v24));
        end;
    end;
    local v30 = UDim2.fromScale(1, 0);
    local v31 = l_LayoutOrderIterator_0.new();
    return v1.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = l_props_0.LayoutOrder or 1, 
        Size = v30
    }, {
        ListLayout = v1.createElement("UIListLayout", {
            Padding = UDim.new(0, l_radioButtonSet_0.padding), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        ButtonSet = v1.createElement(l_TitledFrame_0, {
            FillDirection = if not v3 then nil else l_props_0.FillDirection, 
            Title = l_props_0.Title, 
            Style = "Subtitle", 
            LayoutOrder = v31:getNextOrder()
        }, v22), 
        Warning = l_props_0.Warning and v1.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Subtitle, {
            Text = l_props_0.Warning, 
            BackgroundTransparency = 1, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = l_radioButtonSet_0.warningLabel.color, 
            Size = UDim2.new(1, 0, 0, l_radioButtonSet_0.warningLabel.height), 
            LayoutOrder = v31:getNextOrder()
        }))
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
