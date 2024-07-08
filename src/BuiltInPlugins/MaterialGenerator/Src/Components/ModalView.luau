local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.React);
local l_withContext_0 = v1.ContextServices.withContext;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_KeyboardListener_0 = l_UI_0.KeyboardListener;
local l_Pane_0 = l_UI_0.Pane;
local l_prioritize_0 = v1.Util.prioritize;
local v10 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v11 = v2.PureComponent:extend("ModalView");
v11.init = function(v12)
    assert(not v10(), "Expected FFlagMaterialGeneratorNewUI to be false");
    v12.close = function()
        if v12.props.OnClose then
            v12.props.OnClose();
        end;
    end;
end;
v11.render = function(v13)
    local l_props_0 = v13.props;
    local l_ModalView_0 = l_props_0.Stylizer.ModalView;
    return v2.createElement(l_Pane_0, {
        BackgroundColor = Color3.new(0, 0, 0), 
        LayoutOrder = l_props_0.LayoutOrder, 
        OnClick = v13.close, 
        Size = l_prioritize_0(l_props_0.Size, l_ModalView_0.Size), 
        Transparency = l_ModalView_0.Transparency, 
        ZIndex = 1
    }, {
        ContentWrapper = v2.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = l_prioritize_0(l_props_0.ContentSize, l_ModalView_0.ContentSize), 
            ZIndex = 2
        }, {
            CloseButton = v2.createElement(l_Button_0, {
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, -2, 0, 2), 
                Size = l_ModalView_0.CloseButtonSize, 
                Style = "Close", 
                OnClick = v13.close, 
                ZIndex = 1000
            }), 
            KeyboardListener = v2.createElement(l_KeyboardListener_0, {
                OnKeyPressed = function(_, v17)
                    if v17[Enum.KeyCode.Escape] then
                        v13.close();
                    end;
                end
            }), 
            Content = l_props_0.Content
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v11));
