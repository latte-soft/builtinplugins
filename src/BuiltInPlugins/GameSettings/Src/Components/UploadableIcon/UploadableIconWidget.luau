local l_GuiService_0 = game:GetService("GuiService");
local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local v2 = UDim2.new(0, 180, 0, 0);
local v3 = UDim2.new(1, -180, 0, 100);
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.Framework);
local v7 = require(l_Parent_0.Packages.Cryo);
local l_UI_0 = v6.UI;
local l_BulletList_0 = l_UI_0.BulletList;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v11 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_l_HttpRbxApiService_0_DocumentationUrl_0 = l_HttpRbxApiService_0:GetDocumentationUrl("articles/Game-Icons-Tips");
local v15 = require(l_Parent_0.Src.Components.UploadableIcon.UploadableIcon);
local v16 = require(l_Parent_0.Src.Components.UploadableIcon.NewUploadableIcon);
local v17 = v5.PureComponent:extend("UploadableIconWidget");
v17.init = function(v18)
    v18.mouseEnter = function()
        if v18.props.Enabled then
            v18:mouseHoverChanged(true);
        end;
    end;
    v18.mouseLeave = function()
        if v18.props.Enabled then
            v18:mouseHoverChanged(false);
        end;
    end;
end;
v17.mouseHoverChanged = function(v19, v20)
    local l_props_0 = v19.props;
    if not v20 then
        l_props_0.Mouse:__resetCursor();
        return ;
    else
        l_props_0.Mouse:__pushCursor("PointingHand");
        return ;
    end;
end;
v17.render = function(v22)
    local l_Enabled_0 = v22.props.Enabled;
    local l_Icon_0 = v22.props.Icon;
    local l_ErrorMessage_0 = v22.props.ErrorMessage;
    local l_Title_0 = v22.props.Title;
    local l_TutorialEnabled_0 = v22.props.TutorialEnabled;
    local l_Stylizer_0 = v22.props.Stylizer;
    local l_Localization_0 = v22.props.Localization;
    local v30 = nil;
    if not (typeof(l_Icon_0) == "Instance") or not l_Icon_0:IsA("File") then
        v30 = false;
    else
        l_Icon_0 = l_Icon_0:GetTemporaryId();
        v30 = true;
    end;
    local v31 = v5.createElement(l_BulletList_0, {
        Items = {
            l_Localization_0:getText("General", "GameIconHint", {
                fileTypes = table.concat(v11.IMAGE_TYPES, ", "), 
                newline = "\n"
            }), 
            l_Localization_0:getText("General", "GameIconModeration")
        }, 
        Position = v2, 
        Size = v3, 
        TextWrapped = true
    });
    local l_createElement_0 = v5.createElement;
    local l_l_TitledFrame_0_0 = l_TitledFrame_0;
    local v34 = {
        LayoutOrder = v22.props.LayoutOrder or 1, 
        Title = l_Title_0
    };
    local v35 = {};
    local l_createElement_1 = v5.createElement;
    local l_v15_0 = v15;
    local v38 = {};
    local v39;
    if l_Enabled_0 then
        v39 = true;
        if not (l_Icon_0 == "None") then
            goto label0;
        end;
    end;
    v39 = v30;
    ::label0::;
    v38.Visible = v39;
    v38.Preview = v30;
    v38.Image = l_Icon_0;
    v38.OnClick = v22.props.AddIcon;
    v35.Icon = l_createElement_1(l_v15_0, v38);
    l_createElement_1 = v5.createElement;
    l_v15_0 = v16;
    v38 = {};
    v39 = l_Enabled_0;
    if v39 then
        v39 = false;
        if l_Icon_0 == "None" then
            v39 = not v30;
        end;
    end;
    v38.Visible = v39;
    v38.OnClick = v22.props.AddIcon;
    v35.NewIcon = l_createElement_1(l_v15_0, v38);
    v35.Notes = v31;
    v35.NewNote = l_TutorialEnabled_0 and v5.createElement("TextButton", v7.Dictionary.join(l_Stylizer_0.fontStyle.Smaller, {
        BackgroundTransparency = 1, 
        Text = l_Localization_0:getText("General", "GameIconTutorial"), 
        TextColor3 = l_Stylizer_0.hyperlink, 
        Size = UDim2.new(1, 0, 0, 18), 
        Position = UDim2.new(0, 180, 0, 92), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        [v5.Event.MouseEnter] = v22.mouseEnter, 
        [v5.Event.MouseLeave] = v22.mouseLeave, 
        [v5.Event.Activated] = function()
            l_GuiService_0:OpenBrowserWindow(l_l_HttpRbxApiService_0_DocumentationUrl_0);
        end
    }));
    v35.ErrorMessage = l_ErrorMessage_0 and v5.createElement("TextLabel", v7.Dictionary.join(l_Stylizer_0.fontStyle.Error, {
        Size = UDim2.new(1, -180, 0, 40), 
        Position = UDim2.new(0, 180, 0, 122), 
        BackgroundTransparency = 1, 
        Text = l_ErrorMessage_0, 
        TextWrapped = true, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center
    }));
    return l_createElement_0(l_l_TitledFrame_0_0, v34, v35);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v17));
