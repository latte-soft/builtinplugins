local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Cryo);
local v5 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_Util_0 = v6.Util;
local l_Button_0 = l_UI_0.Button;
local l_Container_0 = l_UI_0.Container;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_FitTextLabel_0 = l_Util_0.FitFrame.FitTextLabel;
local v15 = require(l_Parent_0.Src.Components.MenuBar);
local v16 = require(l_Parent_0.Src.Components.Separator);
local v17 = require(l_Parent_0.Src.Components.Footer);
local v18 = require(l_Parent_0.Pages.PageManifest);
local v19 = require(l_Parent_0.Src.Util.Analytics);
local l_TextService_0 = game:GetService("TextService");
local v21 = v2.PureComponent:extend("MainView");
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
v21.init = function(v23)
    local v24 = nil;
    local l_FirstSelectedId_0 = v23.props.FirstSelectedId;
    if l_FirstSelectedId_0 and l_FirstSelectedId_0 ~= "" then
        for v26, v27 in ipairs(v18) do
            if v27 and v27.LocalizationId == l_FirstSelectedId_0 then
                v24 = v26;
                break;
            end;
        end;
        assert(v24, "There are no pages in PageManifest with LocalizationId \"" .. l_FirstSelectedId_0 .. "\"");
    else
        local v28 = nil;
        for v29, v30 in ipairs(v18) do
            if v30 then
                v28 = v29;
                break;
            end;
        end;
        assert(v28, "There are no valid pages in PageManifest");
        v24 = v28;
    end;
    v23.state = {
        Selected = v24, 
        PageContentOffset = 0
    };
end;
v21.pageSelected = function(v31, v32)
    v19.onTabChangeEvent(v18[v31.state.Selected].LocalizationId, v18[v32].LocalizationId);
    v31:setState({
        Selected = v32
    });
end;
v21.render = function(v33)
    local l_props_0 = v33.props;
    local l_Selected_0 = v33.state.Selected;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v38 = l_props_0.GameId ~= 0;
    local l_PageLoadStates_0 = l_props_0.PageLoadStates;
    local v40 = {};
    local v41 = {};
    if v38 then
        for v42, v43 in ipairs(v18) do
            if v43 then
                local v44 = l_PageLoadStates_0[v43.LocalizationId];
                v41[v42] = v43.LocalizationId;
                local v45 = tostring(v43);
                local v46;
                if v42 ~= l_Selected_0 then
                    v46 = false;
                    if not (v44 ~= nil) then
                        goto label0;
                    end;
                end;
                v46 = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.fromScale(1, 1), 
                    Visible = v42 == l_Selected_0
                }, {
                    PageContents = v2.createElement(v43)
                });
                ::label0::;
                v40[v45] = v46;
            end;
        end;
    end;
    local v47 = l_Localization_0:getText("General", "PublishText");
    local v48 = l_Localization_0:getText("General", "ButtonPublish");
    v47 = l_Localization_0:getText("General", "SaveText");
    v48 = l_Localization_0:getText("General", "ButtonSaveToRoblox");
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v48, l_Stylizer_0.fontStyle.Normal.TextSize, l_Stylizer_0.fontStyle.Normal.Font, Vector2.new(math.huge, math.huge));
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor
    }, not v38 and {
        UseText = v2.createElement(l_FitTextLabel_0, v4.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_0.mainView.publishText.offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Text = v47, 
            BackgroundTransparency = 1, 
            width = l_Stylizer_0.mainView.publishText.width
        })), 
        PublishButton = v2.createElement(l_Button_0, {
            Style = "GameSettingsPrimaryButton", 
            Text = v48, 
            Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X + l_Stylizer_0.mainView.publishButton.paddingX, 0, l_l_TextService_0_TextSize_0.Y + l_Stylizer_0.mainView.publishButton.paddingY), 
            Position = UDim2.new(0.5, 0, 0, l_Stylizer_0.mainView.publishButton.offset), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            OnClick = function()
                l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
                v33.props.OnClose(false);
            end
        }, {
            v2.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        })
    } or {
        Padding = if not v1 then v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 5)
        }) else nil, 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        CenterContent = v2.createElement(l_Container_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 1, -l_Stylizer_0.footer.height)
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            MenuBar = v2.createElement(v15, {
                LayoutOrder = 1, 
                Entries = v41, 
                Selected = l_Selected_0, 
                SelectionChanged = function(v50)
                    v33:pageSelected(v50);
                end
            }), 
            Separator = v2.createElement(v16, {
                LayoutOrder = 2, 
                Size = UDim2.new(0, 3, 1, 0), 
                Position = UDim2.new(0, v5.MENU_BAR_WIDTH, 0, 0)
            }), 
            PageContent = v2.createElement("Frame", {
                LayoutOrder = 3, 
                Size = UDim2.new(1, -v33.state.PageContentOffset, 1, 0), 
                BackgroundTransparency = 1, 
                [v2.Change.AbsolutePosition] = function(v51)
                    local l_Parent_1 = v51.Parent;
                    if l_Parent_1 then
                        v33:setState({
                            PageContentOffset = (v51.AbsolutePosition - l_Parent_1.AbsolutePosition).X
                        });
                        return ;
                    else
                        return ;
                    end;
                end
            }, v40)
        }), 
        FooterContent = v2.createElement(l_Container_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.footer.height), 
            LayoutOrder = 2
        }, {
            Footer = v2.createElement(v17, {
                OnClose = function(v53, v54)
                    v33.props.OnClose(v53, v54);
                end
            })
        })
    });
end;
return (v3.connect(function(v55, _)
    return {
        GameId = v55.Metadata.gameId, 
        PageLoadStates = v55.PageLoadState
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v21))));
