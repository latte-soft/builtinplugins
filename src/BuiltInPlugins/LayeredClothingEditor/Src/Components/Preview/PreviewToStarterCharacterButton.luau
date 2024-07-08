local l_Workspace_0 = game.Workspace;
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local l_AccessoryAndBodyToolShared_0 = v3.Util.AccessoryAndBodyToolShared;
local l_EditingItemContext_0 = v3.Contexts.EditingItemContext;
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_PreviewModelAsCharacter_0 = l_AccessoryAndBodyToolShared_0.PreviewModelAsCharacter;
local l_Button_0 = v6.UI.Button;
local v11 = require(l_Parent_0.Src.Util.StringUtil);
local v12 = v2.PureComponent:extend("PreviewToStarterCharacterButton");
v12.init = function(v13)
    v13.onPreviewButtonClick = function()
        local l_LayeredClothingEditorPreview_0 = l_Workspace_0:FindFirstChild("LayeredClothingEditorPreview");
        if l_LayeredClothingEditorPreview_0 then
            local l_Mannequin_0 = l_LayeredClothingEditorPreview_0:FindFirstChild("Mannequin");
            if l_Mannequin_0 then
                l_PreviewModelAsCharacter_0:SetPreviewAsCharacter(l_Mannequin_0, v13.props.EditingItemContext:getItem());
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
end;
v12.render = function(v16)
    local l_props_0 = v16.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v2.createElement(l_Button_0, {
        Size = UDim2.new(0, v11.getTextWidth("Preview", l_Stylizer_0.TextSize, l_Stylizer_0.Font) + l_Stylizer_0.MainPadding, 0, l_Stylizer_0.ButtonHeight), 
        Text = "Preview", 
        TextSize = l_Stylizer_0.TextSize, 
        ButtonHeight = l_Stylizer_0.ButtonHeight, 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        Style = "Round", 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = v16.onPreviewButtonClick
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    EditingItemContext = l_EditingItemContext_0
})(v12));
