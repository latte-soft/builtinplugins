local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local l_Tabs_0 = l_UI_0.Tabs;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v15 = require(l_Parent_0.Src.Actions);
local v16 = require(l_Parent_0.Src.Components.Icon);
local _ = require(l_Parent_0.Src.Types);
local v18 = require(script.IconsPage);
local v19 = require(script.EmojiPage);
local v20 = require(script.CustomPage);
local v21 = require(l_Parent_0.Src.Util.TagEditorPluginPolicy);
local v22 = game:DefineFastFlag("TagEditorLuobuIconFixes2", false);
local v23 = v1.PureComponent:extend("IconPicker");
v23.init = function(v24)
    v24.tabs = {};
    v24:setState({
        selectedTab = {}
    });
    v24.closeFunc = function()
        v24.props.close();
    end;
    v24.onHoverFunc = function(v25)
        v24.props.setHoveredIcon(v25);
    end;
end;
v23.render = function(v26)
    local l_props_0 = v26.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_IconPicker_0 = l_props_0.Stylizer.IconPicker;
    local v30 = l_LayoutOrderIterator_0.new();
    local v31 = string.format("%s %s", l_Localization_1:getText("Info", "IconPickerTitle"), l_props_0.tagName);
    local l_v18_0 = v18;
    if v26.state.selectedTab.Key == "Emoji" then
        l_v18_0 = v19;
    elseif v26.state.selectedTab.Key == "Custom" then
        l_v18_0 = v20;
    end;
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        TopPane = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v30:getNextOrder(), 
            Size = l_IconPicker_0.TopPaneSize, 
            Spacing = l_IconPicker_0.TopPaneSpacing
        }, {
            Cancel = v1.createElement(l_Button_0, {
                LayoutOrder = v30:getNextOrder(), 
                OnClick = l_props_0.close, 
                Size = l_IconPicker_0.CancelButtonSize, 
                Style = "Round", 
                Text = l_Localization_1:getText("General", "Cancel")
            }), 
            TitleText = v1.createElement(l_TextLabel_0, {
                LayoutOrder = v30:getNextOrder(), 
                Size = l_IconPicker_0.TitleTextSize, 
                Text = v31
            }), 
            MiddlePane = v1.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v30:getNextOrder(), 
                Size = l_IconPicker_0.MiddlePaneSize
            }, {
                Icon = v1.createElement(v16, {
                    LayoutOrder = v30:getNextOrder(), 
                    Name = l_props_0.tagIcon, 
                    Size = l_IconPicker_0.PreviewIconSize, 
                    Style = "Preview"
                }), 
                SearchBarPane = v1.createElement(l_Pane_0, {
                    Layout = Enum.FillDirection.Vertical, 
                    LayoutOrder = v30:getNextOrder(), 
                    Size = l_IconPicker_0.SearchBarPaneSize
                }, {
                    SearchBar = v1.createElement(l_SearchBar_0, {
                        OnSearchRequested = l_props_0.setTerm, 
                        Size = l_IconPicker_0.SearchBarSize, 
                        Style = "Compact", 
                        PlaceholderText = l_Localization_1:getText("General", "Search")
                    }), 
                    TextLabel = v1.createElement(l_TextLabel_0, {
                        Size = l_IconPicker_0.IconNameTextSize, 
                        Text = l_props_0.tagIcon, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    })
                })
            }), 
            TabsPane = v1.createElement(l_Pane_0, {
                LayoutOrder = v30:getNextOrder(), 
                Size = l_IconPicker_0.TabsPaneSize, 
                Style = "SubtleBox"
            }, {
                Tabs = v1.createElement(l_Tabs_0, {
                    OnTabSelected = function(v33)
                        v26:setState({
                            selectedTab = v33
                        });
                    end, 
                    SelectedTab = v26.state.selectedTab, 
                    Tabs = v26.tabs
                })
            })
        }), 
        SelectedPagePane = v1.createElement(l_Pane_0, {
            LayoutOrder = v30:getNextOrder()
        }, {
            SelectedPage = v1.createElement(l_v18_0, {
                LayoutOrder = v30:getNextOrder(), 
                Size = l_IconPicker_0.SelectedPageSize, 
                tagName = l_props_0.tagName, 
                search = l_props_0.search, 
                closeFunc = v26.closeFunc, 
                onHoverFunc = v26.onHoverFunc
            })
        })
    });
end;
v23.didMount = function(v34)
    local l_Localization_2 = v34.props.Localization;
    if not v22 or v21.getAreCustomIconsAndEmojiAllowed() then
        v34.tabs = {
            {
                Key = "Emoji", 
                Label = l_Localization_2:getText("IconPicker", "Emoji")
            }, 
            {
                Key = "Icons", 
                Label = l_Localization_2:getText("IconPicker", "Icons")
            }, 
            {
                Key = "Custom", 
                Label = l_Localization_2:getText("IconPicker", "Custom")
            }
        };
    else
        v34.tabs = {
            {
                Key = "Icons", 
                Label = l_Localization_2:getText("IconPicker", "Icons")
            }
        };
    end;
    v34:setState({
        selectedTab = v34.tabs[1]
    });
end;
return (v2.connect(function(v36, _)
    local l_IconPicker_1 = v36.IconPicker;
    local l_HoveredIcon_0 = v36.HoveredIcon;
    if l_HoveredIcon_0 == nil then
        for _, v41 in pairs(v36.TagData) do
            if v41.Name == l_IconPicker_1 then
                l_HoveredIcon_0 = v41.Icon;
                break;
            end;
        end;
    end;
    return {
        tagName = l_IconPicker_1, 
        tagIcon = l_HoveredIcon_0, 
        search = v36.IconSearch
    };
end, function(v42)
    return {
        close = function()
            v42(v15.ToggleIconPicker(""));
        end, 
        setTerm = function(v43)
            v42(v15.SetIconSearch(v43));
        end, 
        setHoveredIcon = function(v44)
            v42(v15.SetHoveredIcon(v44));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v23))));
