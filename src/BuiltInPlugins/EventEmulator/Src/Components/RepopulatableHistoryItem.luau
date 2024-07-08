local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Container_0 = l_UI_0.Container;
local l_Box_0 = l_UI_0.Box;
local l_Button_0 = l_UI_0.Button;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.RemoveHistoryItem);
local v12 = require(l_Actions_0.SetMemStoragePair);
local v13 = require(l_Actions_0.SetRBXParameters);
local v14 = require(l_Actions_0.SetView);
local l_VIEW_ID_0 = require(l_Parent_0.Src.Util.Constants).VIEW_ID;
local v16 = v1.PureComponent:extend("RepopulatableHistoryItem");
v16.init = function(v17)
    v17.repopulateHistoryItem = function()
        local l_props_0 = v17.props;
        local l_CurrentView_0 = l_props_0.CurrentView;
        local l_View_0 = l_props_0.View;
        local l_Data_0 = l_props_0.Data;
        if l_CurrentView_0 ~= l_View_0 then
            v17.props.SetView(l_View_0);
        end;
        if l_View_0 == l_VIEW_ID_0.RBXEvent then
            v17.props.SetRBXParameters(l_Data_0);
        end;
        if l_View_0 == l_VIEW_ID_0.MemStorage then
            v17.props.SetMemStoragePair(l_Data_0);
        end;
    end;
    v17.deleteHistoryItem = function()
        v17.props.RemoveHistoryItem(v17.props.Name);
    end;
end;
v16.render = function(v22)
    local l_props_1 = v22.props;
    local l_Name_0 = l_props_1.Name;
    local l_View_1 = l_props_1.View;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Sizes_0 = l_Stylizer_0.Sizes;
    return v1.createElement(l_Container_0, {
        Background = l_Box_0, 
        Size = UDim2.new(1, 0, 0, l_Sizes_0.HistoryButtonMinor)
    }, {
        Layout = v1.createElement("UIListLayout", l_Stylizer_0.Layout.HistoryItem), 
        View = v1.createElement("TextLabel", {
            Size = UDim2.new(0, l_Sizes_0.HistoryButtonMajor, 0, l_Sizes_0.HistoryButtonMinor), 
            Text = l_View_1, 
            LayoutOrder = 2, 
            TextColor3 = l_Stylizer_0.Text.BrightText.Color, 
            BackgroundTransparency = 1, 
            TextSize = 18, 
            Font = Enum.Font.SourceSans
        }), 
        Name = v1.createElement(l_Button_0, {
            Size = UDim2.new(0, l_Sizes_0.HistoryButtonMajor, 0, l_Sizes_0.HistoryButtonMinor), 
            Text = l_Name_0, 
            LayoutOrder = 3, 
            OnClick = v22.repopulateHistoryItem
        }), 
        DeleteButton = v1.createElement(l_Button_0, {
            Size = UDim2.new(0, l_Sizes_0.HistoryButtonMinor, 0, l_Sizes_0.HistoryButtonMinor), 
            Text = " \240\159\151\145", 
            LayoutOrder = 4, 
            OnClick = v22.deleteHistoryItem
        })
    });
end;
return v2.connect(function(v28, _)
    return {
        CurrentView = v28.Status.CurrentView
    };
end, function(v30)
    return {
        RemoveHistoryItem = function(v31)
            v30(v11(v31));
        end, 
        SetMemStoragePair = function(v32)
            v30(v12(v32));
        end, 
        SetRBXParameters = function(v33)
            v30(v13(v33));
        end, 
        SetView = function(v34)
            v30(v14(v34));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v16)));
