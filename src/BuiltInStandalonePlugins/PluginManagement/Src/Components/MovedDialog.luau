local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Src.Util.Constants);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Dialog_0 = l_UI_0.Dialog;
local v9 = v1.PureComponent:extend("MovedDialog");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = v10.props.Stylizer;
    return v1.createElement(l_Dialog_0, {
        Title = l_Localization_0:getText("Moved", "Title"), 
        Enabled = true, 
        Modal = true, 
        Size = Vector2.new(v2.MOVED_DIALOG_WIDTH, v2.MOVED_DIALOG_HEIGHT), 
        Resizable = false, 
        OnClose = l_props_0.OnClose
    }, {
        Background = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_Stylizer_0.BackgroundColor
        }, {
            Label = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v2.MOVED_DIALOG_LABEL_HEIGHT), 
                Position = UDim2.new(0, v2.MOVED_DIALOG_SIDE_PADDING, 0, v2.MOVED_DIALOG_TOP_PADDING), 
                AnchorPoint = Vector2.new(0, 0), 
                Text = l_Localization_0:getText("Moved", "MovedMessage"), 
                TextSize = 22, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Font = Enum.Font.SourceSans, 
                BackgroundTransparency = 1
            }), 
            Label2 = v1.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, v2.MOVED_DIALOG_LABEL_HEIGHT), 
                Position = UDim2.new(0, v2.MOVED_DIALOG_SIDE_PADDING, 0, (v2.MOVED_DIALOG_TOP_PADDING + v2.MOVED_DIALOG_LABEL_HEIGHT) + v2.MOVED_DIALOG_INTRA_PADDING), 
                AnchorPoint = Vector2.new(0, 0), 
                Text = l_Localization_0:getText("Moved", "NewLocationMessage"), 
                TextSize = 17, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Font = Enum.Font.SourceSansLight, 
                BackgroundTransparency = 1
            }), 
            CloseButton = v1.createElement(l_Button_0, {
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.new(0.5, 0, 1, -v2.MOVED_DIALOG_BOTTOM_PADDING), 
                Size = UDim2.new(0, v2.MOVED_DIALOG_BUTTON_WIDTH, 0, v2.MOVED_DIALOG_BUTTON_HEIGHT), 
                OnClick = l_props_0.OnClose, 
                Style = "RoundPrimary"
            }, {
                Label = v1.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = l_Localization_0:getText("Moved", "GotIt"), 
                    TextColor3 = l_Stylizer_0.White, 
                    Font = Enum.Font.SourceSans, 
                    TextSize = 19, 
                    BackgroundTransparency = 1
                })
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
