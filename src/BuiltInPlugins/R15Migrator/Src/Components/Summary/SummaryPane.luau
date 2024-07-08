local l_HttpRbxApiService_0 = game:GetService("HttpRbxApiService");
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v3.ContextServices;
local v6 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v7 = require(l_script_FirstAncestor_0.Packages.Dash);
local v8 = require(l_script_FirstAncestor_0.Src.Util.UILayoutHelpers);
local v9 = require(l_script_FirstAncestor_0.Src.Contexts.ScriptConversionContext);
local l_UI_0 = v3.UI;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_Image_0 = l_UI_0.Image;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Util_0 = v3.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_Util_1 = l_script_FirstAncestor_0.Src.Util;
local v24 = require(l_Util_1.TabsData);
local v25 = require(l_Util_1.SortData);
local v26 = require(script.Parent.StatusTable);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v28 = require(l_Thunks_0.LoadCharacterMetadata);
local v29 = require(l_Thunks_0.AddAdapters);
local v30 = require(l_Thunks_0.RemoveAdapters);
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v32 = require(l_Actions_0.SetSelectedTab);
local v33 = require(l_Actions_0.SetSortSelection);
local l_StatusTableData_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).StatusTableData;
local v35 = require(l_script_FirstAncestor_0.Src.Util.sanitizeString);
local v36 = require(l_script_FirstAncestor_0.Src.Util.SaveInterface);
local v37 = require(l_script_FirstAncestor_0.Src.Modules.NpcIdManager);
local l_R15MigShowLinkedText_0 = game:GetFastFlag("R15MigShowLinkedText");
local v39 = v4.PureComponent:extend("SummaryPane");
getHeaderCellComponent = function(v40, v41, v42)
    local v43 = v4.PureComponent:extend(v40 .. "HeaderCellComponent");
    v43.init = function(v44)
        v44.state = {
            expanded = true
        };
    end;
    v43.render = function(v45)
        local l_props_0 = v45.props;
        local l_state_0 = v45.state;
        local l_Name_0 = l_props_0.Name;
        local l_ColumnIndex_0 = l_props_0.ColumnIndex;
        local l_Width_0 = l_props_0.Width;
        local l_Style_0 = l_props_0.Style;
        local v52 = {
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            ImageRectOffset = Vector2.new(12, 0), 
            ImageRectSize = Vector2.new(12, 12), 
            Size = UDim2.fromOffset(12, 12), 
            [l_StyleModifier_0.Selected] = {
                ImageRectOffset = Vector2.new(24, 0)
            }
        };
        local l_Localization_0 = l_props_0.Localization;
        local v54 = l_LayoutOrderIterator_0.new();
        return v4.createElement(l_Pane_0, v7.assign({
            BorderColor3 = l_Style_0.Border, 
            BorderSizePixel = 1, 
            Padding = l_Style_0.HeaderCellPadding, 
            Style = "SubtleBox", 
            Size = UDim2.new(l_Width_0.Scale, l_Width_0.Offset, 1, 0), 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = 10, 
            OnClick = function()
                v42();
                v45:setState(function(v55)
                    return {
                        expanded = not v55.expanded
                    };
                end);
            end
        }, l_props_0.WrapperProps), {
            Arrow = if l_ColumnIndex_0 ~= l_StatusTableData_0.STATUS_COLUMN_INDEX then v4.createElement(l_Image_0, {
                LayoutOrder = v54:getNextOrder(), 
                Style = v52, 
                StyleModifier = not not l_state_0.expanded and l_StyleModifier_0.Selected or nil, 
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.fromScale(0, 0.5)
            }) else nil, 
            Text = if l_ColumnIndex_0 ~= l_StatusTableData_0.STATUS_COLUMN_INDEX then v4.createElement(l_TextWithLinks_0, {
                LayoutOrder = v54:getNextOrder(), 
                Size = UDim2.fromScale(1, 1), 
                Text = l_Name_0, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextProps = {
                    TextSize = l_Style_0.TextSize, 
                    Font = l_Style_0.Font, 
                    TextWrapped = false
                }, 
                LinkMap = {
                    ["[link1]"] = {
                        LinkText = l_Localization_0:getText("Summary", v40), 
                        LinkCallback = function()
                            l_props_0.setSelectedTab(v41);
                        end
                    }
                }
            }) else v4.createElement(l_TextLabel_0, {
                LayoutOrder = v54:getNextOrder(), 
                Text = l_Name_0, 
                Size = UDim2.fromScale(1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextTruncate = Enum.TextTruncate.AtEnd
            })
        });
    end;
    return v6.connect(nil, function(v56)
        return {
            setSelectedTab = function(v57)
                v56(v32(v57));
            end
        };
    end)((l_ContextServices_0.withContext({
        Localization = l_ContextServices_0.Localization
    })(v43)));
end;
v39.init = function(v58)
    local function _(v59)
        return function()
            v58:setState(function(v60)
                local v61 = v7.copy(v60.sections);
                v61[v59].expanded = not v61[v59].expanded;
                return {
                    sections = v61
                };
            end);
        end;
    end;
    local v63 = {
        expanded = {
            Convert = true, 
            Test = true, 
            ReadyToPublish = true, 
            Publish = true
        }
    };
    local v64 = {};
    local v65 = {
        keys = {}, 
        values = {}, 
        tabTarget = v24.CharacterConversion
    };
    local l_getHeaderCellComponent_0 = getHeaderCellComponent;
    local v67 = "Characters";
    local l_CharacterConversion_0 = v24.CharacterConversion;
    local v69 = 1;
    local l_v69_0 = v69 --[[ copy: 9 -> 10 ]];
    v65.headerCellComponent = l_getHeaderCellComponent_0(v67, l_CharacterConversion_0, function()
        v58:setState(function(v71)
            local v72 = v7.copy(v71.sections);
            v72[l_v69_0].expanded = not v72[l_v69_0].expanded;
            return {
                sections = v72
            };
        end);
    end);
    v65.expanded = true;
    v64[1] = v65;
    v65 = {
        keys = {}, 
        values = {}, 
        tabTarget = v24.AnimationConversion
    };
    l_getHeaderCellComponent_0 = getHeaderCellComponent;
    v67 = "Animation";
    l_CharacterConversion_0 = v24.AnimationConversion;
    v69 = 2;
    local l_v69_1 = v69 --[[ copy: 9 -> 11 ]];
    v65.headerCellComponent = l_getHeaderCellComponent_0(v67, l_CharacterConversion_0, function()
        v58:setState(function(v74)
            local v75 = v7.copy(v74.sections);
            v75[l_v69_1].expanded = not v75[l_v69_1].expanded;
            return {
                sections = v75
            };
        end);
    end);
    v65.expanded = true;
    v64[2] = v65;
    v65 = {
        keys = {}, 
        values = {}, 
        tabTarget = v24.ScriptConversion
    };
    l_getHeaderCellComponent_0 = getHeaderCellComponent;
    v67 = "Scripts";
    l_CharacterConversion_0 = v24.AnimationConversion;
    v69 = 3;
    v65.headerCellComponent = l_getHeaderCellComponent_0(v67, l_CharacterConversion_0, function()
        v58:setState(function(v76)
            local v77 = v7.copy(v76.sections);
            v77[v69].expanded = not v77[v69].expanded;
            return {
                sections = v77
            };
        end);
    end);
    v65.expanded = true;
    v64[3] = v65;
    v63.sections = v64;
    v58.state = v63;
    v58.onExpandedChanged = function(v78)
        return function()
            v58:setState(function(v79)
                local v80 = v7.copy(v79.expanded);
                v80[v78] = not v80[v78];
                return {
                    expanded = v80
                };
            end);
        end;
    end;
    v58.setSelectedTab = function(v81)
        local l_props_1 = v58.props;
        local v83 = v36.getPublishTime() ~= nil;
        if not (v81 ~= v24.Summary) or not v83 then
            l_props_1.setSelectedTab(v81);
            return ;
        else
            return ;
        end;
    end;
    v58.setSortSelection = function(v84)
        v58.props.setSortSelection(v84);
    end;
end;
v39.didMount = function(v85)
    if v85.props.characterMetadataLoadedVersion == 0 then
        v85.props.loadCharacterMetadata(v85.props.Analytics);
    end;
end;
local function v96(v86, v87, v88)
    local function v94(v89)
        if v88 == v25.Alphabetical then
            table.sort(v89, function(v90, v91)
                return v90.text < v91.text;
            end);
            return ;
        else
            if v88 == v25.Status then
                table.sort(v89, function(v92, v93)
                    return not v92.complete and v93.complete;
                end);
            end;
            return ;
        end;
    end;
    for v95 in v87, nil, nil do
        v94(v86[v95].values);
    end;
end;
local function v113(v97, v98)
    local l_characters_0 = v97.characters;
    local l_charactersConverted_0 = v97.charactersConverted;
    local v101 = v7.copy(v98.sections[1]);
    local l_keys_0 = v101.keys;
    local l_values_0 = v101.values;
    local function v110(v104, v105)
        local v106 = 0;
        for v107, v108 in v104, nil, nil do
            local v109 = {
                target = if not v108.key then nil else v37.GetNpcFromId(v108.key), 
                text = v35(v108.fullName), 
                complete = v105
            };
            if l_keys_0[v107] then
                if l_keys_0[v107] then
                    l_keys_0[v107].complete = v105;
                end;
            else
                l_keys_0[v107] = v109;
                table.insert(l_values_0, v109);
            end;
            v106 = v106 + 1;
        end;
        return v106;
    end;
    local v111 = v110(l_characters_0, false);
    local v112 = v110(l_charactersConverted_0, true);
    v101.total = v111 + v112;
    v101.complete = v112;
    return v101;
end;
local function v125(v114, v115)
    local l_animations_0 = v114.animations;
    local v117 = v7.copy(v115.sections[2]);
    local l_keys_1 = v117.keys;
    local l_values_1 = v117.values;
    local v120 = 0;
    local v121 = 0;
    for v122, v123 in l_animations_0, nil, nil do
        local v124 = {
            target = v123.animationAssetInfo.instance, 
            text = v35(v123.name), 
            complete = not next(v123.refs)
        };
        if not l_keys_1[v122] then
            l_keys_1[v122] = v124;
            table.insert(l_values_1, v124);
        end;
        v120 = v120 + 1;
        if not next(v123.refs) then
            v121 = v121 + 1;
        end;
    end;
    v117.total = v120;
    v117.complete = v121;
    return v117;
end;
local function v142(v126, v127)
    if v126.ScriptConversionContext then
        local l_scripts_0 = v126.scripts;
        local v129 = v7.copy(v127.sections[3]);
        local l_keys_2 = v129.keys;
        local l_values_2 = v129.values;
        local v132 = 0;
        local v133 = 0;
        for v134, v135 in l_scripts_0, nil, nil do
            if not l_keys_2[v134] then
                local v136 = v126.ScriptConversionContext:getScriptInstanceFromGUID(v134);
                local v137 = {
                    target = v136, 
                    text = v35(not not v136 and v136:GetFullName() or "Unknown")
                };
                l_keys_2[v134] = v137;
                table.insert(l_values_2, v137);
            end;
            local v139 = v7.filter(v135:Get(), function(v138)
                return v138.resolution == nil;
            end);
            local v140 = l_keys_2[v134];
            local v141 = true;
            if #v135._list ~= 0 then
                v141 = #v139 == 0;
            end;
            v140.complete = v141;
            if l_keys_2[v134].complete then
                v133 = v133 + 1;
            end;
            v132 = v132 + 1;
        end;
        v129.total = v132;
        v129.complete = v133;
        return v129;
    else
        return ;
    end;
end;
v39.getDerivedStateFromProps = function(v143, v144)
    local v145 = {};
    local v146 = nil;
    local v147 = nil;
    local v148 = nil;
    if v143.sortSelection ~= v144.sortSelection then
        v145 = {
            [2] = true, 
            [3] = true, 
            [1] = true
        };
    end;
    if v143.animations ~= v144.animations then
        v145[2] = true;
        v147 = v125(v143, v144);
    end;
    if v143.scripts ~= v144.scripts then
        v145[3] = true;
        v148 = v142(v143, v144);
    end;
    if not (v143.characters == v144.characters) or v143.charactersConverted ~= v144.charactersConverted then
        v145[1] = true;
        v146 = v113(v143, v144);
    end;
    local v149 = v7.join(v144.sections, {
        [1] = v146, 
        [2] = v147, 
        [3] = v148
    });
    if next(v145) then
        v96(v149, v145, v143.sortSelection);
    end;
    return {
        sortSelection = v143.sortSelection, 
        characters = v143.characters, 
        charactersConverted = v143.charactersConverted, 
        animations = v143.animations, 
        scripts = v143.scripts, 
        sections = v149
    };
end;
local function _(v150)
    if not v150 then
        return "R15";
    else
        return "R6 & R15";
    end;
end;
local function _(v152)
    if not v152 then
        return "R15";
    else
        return "R6_R15";
    end;
end;
v39.renderHeader = function(v154, v155, v156)
    local l_props_2 = v154.props;
    local l_state_1 = v154.state;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local v160 = v154.onExpandedChanged(v155);
    local v161 = l_state_1.expanded[v155];
    local l_Localization_1 = l_props_2.Localization;
    local v163 = l_Localization_1:getText("Summary", v155);
    local v164 = nil;
    local v165 = nil;
    if not (not (v155 == "Convert") or not v156) then
        v164 = l_Localization_1:getText("Summary", "Complete");
        v165 = l_Stylizer_0.ExpandedHeaderStatusCompleteColor;
    end;
    if v155 == "Test" then
        v164 = l_Localization_1:getText("Summary", "TestAdaptedModeText", {
            adaptedText = not l_props_2.adapted and "R15" or "R6 & R15"
        });
        v165 = l_Stylizer_0.ExpandedHeaderStatusAdpatedColor;
    end;
    if v155 == "Publish" then
        v164 = not not v156 and l_Localization_1:getText("Summary", "ReadyToPublish") or "Not Ready";
        v165 = not not v156 and l_Stylizer_0.ExpandedHeaderStatusReadyPublishColor or l_Stylizer_0.ExpandedHeaderStatusNotReadyPublishColor;
    end;
    return v4.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 28), 
        OnClick = v160, 
        BackgroundColor = l_Stylizer_0.HeaderColor, 
        BorderColor3 = l_Stylizer_0.DividerColor, 
        BorderSizePixel = 1, 
        LayoutOrder = 1, 
        Padding = {
            Left = 8, 
            Right = 8
        }
    }, {
        Arrow = v4.createElement(l_Image_0, {
            Style = l_Stylizer_0.Arrow, 
            StyleModifier = not not v161 and l_StyleModifier_0.Selected or nil, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.fromScale(0, 0.5)
        }), 
        Text = v4.createElement(l_TextLabel_0, {
            Text = v163, 
            AutomaticSize = Enum.AutomaticSize.XY, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 24, 0.5, 0)
        }), 
        CompleteStatus = if not v164 then nil else v4.createElement(l_TextLabel_0, {
            Text = v164, 
            TextColor = v165, 
            Size = l_Stylizer_0.ExpandedHeaderStatusSize, 
            Position = l_Stylizer_0.ExpandedHeaderStatusPosition, 
            TextXAlignment = Enum.TextXAlignment.Right, 
            Font = Enum.Font.SourceSansSemibold, 
            TextSize = l_Stylizer_0.ExpandedHeaderStatusFontSize, 
            BackgroundTransparency = 1
        })
    });
end;
v39.getRadioButtons = function(v166)
    local l_props_3 = v166.props;
    local l_Analytics_0 = l_props_3.Analytics;
    local l_Localization_2 = l_props_3.Localization;
    return v4.createElement(l_RadioButtonList_0, {
        Size = UDim2.new(1, 0, 0, 0), 
        SelectedKey = not l_props_3.adapted and "R15" or "R6_R15", 
        CurrentSelectedKey = not l_props_3.adapted and "R15" or "R6_R15", 
        AutomaticSize = Enum.AutomaticSize.Y, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextWrapped = true, 
        OnClick = function(v170)
            if v170 == "R6_R15" then
                l_props_3.addAdapters(l_Analytics_0);
                return ;
            else
                if v170 == "R15" then
                    l_props_3.removeAdapters(l_Analytics_0);
                end;
                return ;
            end;
        end, 
        Buttons = {
            {
                Key = "R6_R15", 
                Text = "R6 & R15", 
                Description = l_Localization_2:getText("Summary", "R6R15ModeDesc"), 
                LinkProps = if not l_R15MigShowLinkedText_0 then nil else {
                    Text = l_Localization_2:getText("AdapterPane", "LearnMore"), 
                    OnClick = function()
                        l_GuiService_0:OpenBrowserWindow(l_HttpRbxApiService_0:GetDocumentationUrl(""));
                    end
                }
            }, 
            {
                Key = "R15", 
                Text = "R15", 
                Description = l_Localization_2:getText("Summary", "R15ModeDesc")
            }
        }
    });
end;
v39.getSorter = function(v171)
    local l_props_4 = v171.props;
    local l_Stylizer_1 = l_props_4.Stylizer;
    local l_Localization_3 = l_props_4.Localization;
    return v4.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, l_Stylizer_1.SortBy.Height), 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Spacing = l_Stylizer_1.SortBy.Spacing
    }, {
        FilterLabel = v4.createElement(l_TextLabel_0, {
            Text = l_Localization_3:getText("Summary", "Sortby"), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 1
        }), 
        Filter = v4.createElement(l_SelectInput_0, {
            PlaceholderText = l_Localization_3:getText("Summary", "Sortby"), 
            SelectedIndex = l_props_4.sortSelection, 
            Items = v25.getOrderedSortData(l_Localization_3), 
            Size = UDim2.fromOffset(l_Stylizer_1.SortBy.Width, l_Stylizer_1.SortBy.Height), 
            LayoutOrder = 2, 
            OnItemActivated = function(_, v176)
                v171.setSortSelection(v176);
            end
        })
    });
end;
v39.getSortAndRefreshRow = function(v177)
    local l_props_5 = v177.props;
    local l_Stylizer_2 = l_props_5.Stylizer;
    return v4.createElement(l_Pane_0, {
        LayoutOrder = -1, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_2.SortBy.Height)
    }, {
        sorter = v177:getSorter(); 
        v4.createElement(l_IconButton_0, {
            LeftIcon = l_Stylizer_2.RefreshButton.Icon, 
            Cursor = "PointingHand", 
            OnClick = l_props_5.OnResetPlugin, 
            Size = l_Stylizer_2.RefreshButton.Size, 
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            BackgroundStyle = l_Stylizer_2.RefreshButton.BackgroundStyle, 
            TooltipText = l_props_5.Localization:getText("Summary", "Refresh")
        })
    });
end;
v39.getConversionItems = function(v180)
    local l_props_6 = v180.props;
    local _ = v180.state;
    local l_Localization_4 = l_props_6.Localization;
    local v184 = {
        sortAndRefresh = v180:getSortAndRefreshRow()
    };
    for v185, v186 in v180.state.sections, nil, nil do
        v184[v185] = v4.createElement(v26, {
            LayoutOrder = v185, 
            Rows = not not v186.expanded and v186.values or {}, 
            Title = l_Localization_4:getText("Summary", "ConvertHeader", {
                currentAmount = tostring(v186.complete), 
                total = tostring(v186.total)
            }), 
            HeaderCellComponent = v186.headerCellComponent, 
            OnClick = function()
                v180.setSelectedTab(v186.tabTarget);
            end
        });
    end;
    return v184;
end;
v39.render = function(v187)
    local l_props_7 = v187.props;
    local l_Stylizer_3 = l_props_7.Stylizer;
    local l_Localization_5 = l_props_7.Localization;
    local l_expanded_0 = v187.state.expanded;
    local l_isSuccessfullyPublished_0 = l_props_7.isSuccessfullyPublished;
    local l_experienceData_0 = l_props_7.experienceData;
    local v194 = l_LayoutOrderIterator_0.new();
    local function v197(v195, v196)
        return {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v194:getNextOrder(), 
            Expanded = l_expanded_0[v195], 
            OnExpandedChanged = v187.onExpandedChanged(v195), 
            ContentPadding = l_Stylizer_3.ExpandedPanePadding, 
            HeaderOverride = v187:renderHeader(v195, v196)
        };
    end;
    local v198 = true;
    for _, v200 in pairs(v187.state.sections) do
        if v200.complete ~= v200.total then
            v198 = false;
            break;
        end;
    end;
    local v201 = not l_props_7.adapted;
    local v202 = l_props_7.avatarType ~= Enum.GameAvatarType.R6;
    local v203 = (v198 and v201) and v202;
    local v204 = l_Localization_5:getText("Summary", "PublishButtonText");
    local v205 = v8.getTextSize(v204, l_Stylizer_3.ButtonTextSize, l_Stylizer_3.ButtonFont, l_Stylizer_3.ButtonPadding);
    return v4.createElement(l_ScrollingFrame_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        Spacing = l_Stylizer_3.ExpandedPaneSpacing, 
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical
    }, {
        Convert = v4.createElement(l_ExpandablePane_0, v197("Convert", v198), v187:getConversionItems()), 
        Test = if not l_isSuccessfullyPublished_0 then v4.createElement(l_ExpandablePane_0, v197("Test"), {
            Content = v187:getRadioButtons()
        }) else nil, 
        Publish = if not l_isSuccessfullyPublished_0 then v4.createElement(l_ExpandablePane_0, v197("Publish", v203), {
            Content = v4.createElement(v26, {
                LayoutOrder = v194:getNextOrder(), 
                Title = l_Localization_5:getText("Summary", "Checklist"), 
                Rows = {
                    {
                        text = l_Localization_5:getText("Summary", "AllAssetsConverted"), 
                        complete = v198
                    }, 
                    {
                        text = l_Localization_5:getText("Summary", "R15ModeOn"), 
                        complete = v201
                    }, 
                    {
                        text = l_Localization_5:getText("Summary", "GameSettingsAvatarType"), 
                        complete = v202
                    }
                }
            }), 
            PublishButtonPane = v4.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Size = UDim2.new(1, 0, 0, v205.Height.Offset), 
                LayoutOrder = v194:getNextOrder()
            }, {
                PublishButton = v4.createElement(l_IconButton_0, {
                    Disabled = not v203, 
                    LayoutOrder = v194:getNextOrder(), 
                    Size = v205, 
                    Text = v204, 
                    TextXAlignment = Enum.TextXAlignment.Center, 
                    OnClick = function()
                        game.StudioPublishService:ShowSaveOrPublishPlaceToRoblox(false, true, Enum.StudioCloseMode.None);
                    end, 
                    Style = "PrimaryBrand"
                })
            })
        }) else v4.createElement(l_ExpandablePane_0, v197("Publish", true), {
            Content = if not not l_experienceData_0 and l_experienceData_0.publishedDateTime then v4.createElement(l_TextLabel_0, {
                Text = l_Localization_5:getText("Summary", "PublishMessage", {
                    experienceName = l_experienceData_0.name, 
                    month = l_experienceData_0.publishedDateTime.month, 
                    day = l_experienceData_0.publishedDateTime.day, 
                    year = l_experienceData_0.publishedDateTime.year, 
                    hour = l_experienceData_0.publishedDateTime.hour, 
                    minute = l_experienceData_0.publishedDateTime.minute, 
                    amPm = l_Localization_5:getText("Summary", not l_experienceData_0.publishedDateTime.isPm and "AM" or "PM")
                }), 
                BackgroundTransparency = 1, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                RichText = true
            }) else nil
        })
    });
end;
return v6.connect(function(v206)
    return {
        animations = v206.AnimationConversion.animations, 
        characters = v206.CharacterConversion.characters, 
        charactersConverted = v206.CharacterConversion.convertedCharacters, 
        characterMetadataLoadedVersion = v206.CharacterConversion.characterMetadataLoadedVersion, 
        scripts = v206.ScriptConversion.diagnostics, 
        adapted = v206.Adapter.adapted, 
        avatarType = v206.AvatarType, 
        selectedTab = v206.PanelSelection.selectedTab, 
        sortSelection = v206.DataDisplay.sortSelection, 
        isSuccessfullyPublished = v206.ConversionProgress.isSuccessfullyPublished, 
        experienceData = v206.ConversionProgress.experienceData
    };
end, function(v207)
    return {
        loadCharacterMetadata = function(v208)
            v207(v28(v208));
        end, 
        addAdapters = function(v209)
            v207(v29(v209));
        end, 
        removeAdapters = function(v210)
            v207(v30(v210));
        end, 
        setSelectedTab = function(v211)
            v207(v32(v211));
        end, 
        setSortSelection = function(v212)
            v207(v33(v212));
        end
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    ScriptConversionContext = v9, 
    Analytics = l_ContextServices_0.Analytics
})(v39)));
