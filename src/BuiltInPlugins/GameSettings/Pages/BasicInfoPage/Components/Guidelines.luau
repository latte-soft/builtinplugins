local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local l_GameSettingsFixGuidelinesQuestionnareInfo_0 = game:GetFastFlag("GameSettingsFixGuidelinesQuestionnareInfo");
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = v3.PureComponent:extend(script.Name);
local l_OpenExperienceQuestionnaire_0 = require(l_Parent_0.Src.Util.BrowserUtils).OpenExperienceQuestionnaire;
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Packages.Cryo);
local l_LayoutOrderIterator_0 = v6.Util.LayoutOrderIterator;
local l_UI_0 = v6.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Button_0 = l_UI_0.Button;
local l_GetTextSize_0 = v6.Util.GetTextSize;
v4.init = function(v15)
    assert(l_GameSettingsExperienceGuidelines_0);
    v15.frameRef = v3.createRef();
    v15.state = {
        maxChildWidth = 0, 
        questionnaireButtonClicked = false
    };
    v15.updateSize = function()
        v15:setState({
            maxChildWidth = v15.frameRef.current.AbsoluteSize.x
        });
    end;
end;
v4.didMount = function(v16)
    v16.updateSize();
end;
v4.render = function(v17)
    assert(l_GameSettingsExperienceGuidelines_0);
    local l_props_0 = v17.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_GameId_0 = l_props_0.GameId;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v23 = l_LayoutOrderIterator_0.new();
    local v24 = l_Localization_0:getText("Guidelines", "SectionTitle");
    local v25 = nil;
    local v26 = nil;
    local v27 = nil;
    v26 = if not l_props_0.GameGuideline then l_Localization_0:getText("Guidelines", "SubmitQuestionnaire") else l_Localization_0:getText("Guidelines", "UpdateQuestionnaire");
    v27 = l_GetTextSize_0(v26, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(math.huge, math.huge));
    v25 = l_Localization_0:getText("Guidelines", "17PlusWarning");
    if not l_props_0.GameGuideline then
        v25 = v25 .. " " .. l_Localization_0:getText("Guidelines", "UnavailableNoticeText");
    end;
    return v3.createElement("Frame", v9.Dictionary.join({
        LayoutOrder = l_LayoutOrder_0
    }, l_Stylizer_0.guidelinesFrame), {
        Title = v3.createElement(l_TextLabel_0, v9.Dictionary.join({
            Text = v24
        }, l_Stylizer_0.guidelinesTitle)), 
        DescriptionFrame = v3.createElement("Frame", v9.Dictionary.join({
            [v3.Ref] = v17.frameRef, 
            [v3.Change.AbsoluteSize] = v17.updateSize
        }, l_Stylizer_0.guidelinesDescriptionFrame), {
            Layout = v3.createElement("UIListLayout", l_Stylizer_0.guidelinesDescriptionListLayout), 
            ChosenGuideline = v3.createElement(l_TextLabel_0, v9.Dictionary.join({
                Text = l_props_0.GameGuideline or l_Localization_0:getText("Guidelines", not v17.state.questionnaireButtonClicked and "NotSubmitted" or "Pending"), 
                LayoutOrder = v23:getNextOrder(), 
                TextTransparency = not l_props_0.GameGuideline and 0.5 or 0
            }, l_Stylizer_0.chosenGuidelineText)), 
            OpenQuestionnaireButton = v3.createElement(l_Button_0, v9.Dictionary.join({
                Size = UDim2.new(0, v27.X + l_Stylizer_0.openQuestionnaireButton.PaddingX, 0, v27.Y + l_Stylizer_0.openQuestionnaireButton.PaddingY), 
                Text = v26, 
                OnClick = function()
                    v17:setState({
                        questionnaireButtonClicked = true
                    });
                    l_OpenExperienceQuestionnaire_0(l_GameId_0)();
                end, 
                LayoutOrder = v23:getNextOrder()
            }, l_Stylizer_0.openQuestionnaireButton)), 
            GuidelinesQuestionnaireInfo = v3.createElement(l_TextLabel_0, if not l_GameSettingsFixGuidelinesQuestionnareInfo_0 then {
                Text = l_Localization_0:getText("Guidelines", not l_props_0.GameGuideline and "GetAnAgeRecommendation" or "RetakeQuestionnaire"), 
                TextProps = l_Stylizer_0.guidelinesDescriptionText, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = v23:getNextOrder()
            } else v9.Dictionary.join({
                Text = l_Localization_0:getText("Guidelines", not l_props_0.GameGuideline and "GetAnAgeRecommendation" or "RetakeQuestionnaire"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                LayoutOrder = v23:getNextOrder()
            }, l_Stylizer_0.guidelinesDescriptionText))
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v4));
