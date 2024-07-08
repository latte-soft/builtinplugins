local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Container_0 = v1.UI.Container;
local l_UI_0 = v1.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Image_0 = l_UI_0.Image;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v11 = v2.PureComponent:extend(script.Name);
local l_TextService_0 = game:GetService("TextService");
v11.init = function(v13)
    v13.state = {
        showingDialog = false
    };
    v13.close = function()
        v13:setState({
            showingDialog = false
        });
        v13.props.OnClose();
    end;
end;
v11.didMount = function(v14)
    spawn(function()
        v14:setState({
            showingDialog = true
        });
    end);
end;
v11.render = function(v15)
    local l_Localization_0 = v15.props.Localization;
    local l_Title_0 = v15.props.Title;
    local l_MainText_0 = v15.props.MainText;
    local l_SubText_0 = v15.props.SubText;
    local l_LinkInfo_0 = v15.props.LinkInfo;
    local v21 = not not l_LinkInfo_0 and l_LinkInfo_0.Text or "";
    local l_Image_1 = v15.props.Image;
    local l_SourceSansBold_0 = Enum.Font.SourceSansBold;
    local l_SourceSans_0 = Enum.Font.SourceSans;
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(l_MainText_0, 20, l_SourceSansBold_0, Vector2.new(400, math.huge));
    local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(l_SubText_0, 20, l_SourceSans_0, Vector2.new(400, math.huge));
    local v27 = not not l_LinkInfo_0 and l_TextService_0:GetTextSize(v21, 20, l_SourceSans_0, Vector2.new(400, math.huge)) or Vector2.new(0, 0);
    return v15.state.showingDialog and v2.createElement(l_StyledDialog_0, {
        Enabled = true, 
        Modal = false, 
        Title = l_Title_0, 
        OnClose = v15.close, 
        OnButtonPressed = v15.close, 
        Buttons = {
            {
                Key = "OK", 
                Text = l_Localization_0:getText("Action", "OK"), 
                Style = "RoundPrimary"
            }
        }, 
        MinContentSize = Vector2.new(64 + math.max(l_l_TextService_0_TextSize_0.X, (math.max(l_l_TextService_0_TextSize_1.X, v27.X))), ((l_l_TextService_0_TextSize_0.Y + 8) + l_l_TextService_0_TextSize_1.Y) + (not not l_LinkInfo_0 and 8 + v27.Y or 0))
    }, {
        Icon = v2.createElement(l_Container_0, {
            Size = UDim2.new(0, 44, 0, 44)
        }, {
            Decoration = v2.createElement(l_Image_0, {
                Style = {
                    Image = l_Image_1
                }
            })
        }), 
        TextSection = v2.createElement(l_Container_0, {
            Position = UDim2.new(0, 64, 0, 0), 
            Size = UDim2.new(1, -64, 1, 0)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            MainText = v2.createElement(l_TextLabel_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, l_l_TextService_0_TextSize_0.Y), 
                Text = l_MainText_0, 
                Font = l_SourceSansBold_0, 
                TextSize = 20, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            SubText = v2.createElement(l_TextLabel_0, {
                LayoutOrder = 2, 
                Size = UDim2.new(1, 0, 0, l_l_TextService_0_TextSize_1.Y), 
                Text = l_SubText_0, 
                TextWrapped = true, 
                Font = l_SourceSans_0, 
                TextSize = 20, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Link = l_LinkInfo_0 and v2.createElement(l_LinkText_0, {
                LayoutOrder = 3, 
                Size = UDim2.new(1, 0, 0, v27.Y), 
                Text = v21, 
                TextWrapped = true, 
                TextSize = 20, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                OnClick = l_LinkInfo_0.OnClick
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v11));
