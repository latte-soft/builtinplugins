local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Dash);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local v7 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local l_Stylizer_0 = v2.Style.Stylizer;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_UI_0 = v2.UI;
local l_Button_0 = l_UI_0.Button;
local l_RoundBox_0 = l_UI_0.RoundBox;
local l_UserId_0 = game:GetService("StudioService"):GetUserId();
return function(v14)
    local v15 = v7:use():get();
    local v16 = l_Localization_0.use();
    local v17 = l_Stylizer_0:use();
    local v18 = l_Analytics_0:use();
    return v1.createElement(l_Button_0, {
        OnClick = function()
            v15:RequestFlyToCollaborator(v14.Id);
            if v14.OnJump then
                v14.OnJump();
            end;
            v18:report("jumpToCollaboratorPressed");
        end, 
        Text = v14.Id == l_UserId_0 and v16:getText("Collaborator", "Return") or v16:getText("Collaborator", "Join"), 
        Size = UDim2.new(1, 0, 0, 28), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromOffset(0, 80), 
        Style = {
            Background = l_RoundBox_0, 
            BackgroundStyle = v3.join({
                Color = v17.jumpButton.background
            }, v17.jumpButton.baseStyle), 
            [l_StyleModifier_0.Hover] = {
                BackgroundStyle = v3.join({
                    Color = v17.jumpButton.hoveredBackground
                }, v17.jumpButton.baseStyle)
            }, 
            [l_StyleModifier_0.Pressed] = {
                BackgroundStyle = v3.join({
                    Color = v17.jumpButton.pressedBackground
                }, v17.jumpButton.baseStyle)
            }, 
            Font = Enum.Font.SourceSans, 
            TextColor = v17.jumpButton.textColor, 
            TextSize = 18
        }
    });
end;
