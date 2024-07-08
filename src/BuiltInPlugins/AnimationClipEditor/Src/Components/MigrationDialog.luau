local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Packages.Roact);
local v5 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetAnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetReadOnly);
local _ = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedKeyframes);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.History.AddWaypoint);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.Playback.StepAnimation);
local _ = require(l_script_FirstAncestor_0.Src.Thunks.UpdateAnimationData);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetLegacyAnimationInstances);
local v13 = require(l_script_FirstAncestor_0.Src.Thunks.LoadLatestAnimation);
local _ = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local _ = require(l_script_FirstAncestor_0.Src.Util.isEmpty);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyframeUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.PathUtils);
local v20 = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.TrackUtils);
local _ = require(l_script_FirstAncestor_0.Src.Util.KeyframeReduction.VisvalingamWhyatt);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Dash_0 = v3.Dash;
local l_assign_0 = l_Dash_0.assign;
local l_join_0 = l_Dash_0.join;
local _ = l_Dash_0.map;
local l_UI_0 = v3.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local _ = l_UI_0.Slider;
local l_Table_0 = l_UI_0.Table;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v38 = game:DefineFastString("ACELearnMoreAnimSavesMigration", "https://create.roblox.com/docs/animation/editor#saving-an-animation");
local v39 = v4.PureComponent:extend("MigrationDialog");
v39.init = function(v40)
    v40.state = {
        choices = {}
    };
    v40.columns = {
        {
            Name = "Animation", 
            Width = UDim.new(0.5, 0)
        }, 
        {
            Name = "Action", 
            Width = UDim.new(0.5, 0)
        }
    };
    v40.onMigrate = function()
        local v41 = nil;
        for v42, v43 in v40.state.choices, nil, nil do
            if v43 == "Migrate" then
                if v41 == nil then
                    v41 = v20.getAnimSavesFolder(v40.props.RootInstance, true);
                end;
                v42.Parent = v41;
            elseif v43 == "Delete" then
                v42:Destroy();
            end;
        end;
        v40.onClose();
    end;
    v40.onClose = function()
        v40.props.ClearLegacyAnimationInstances();
        v40.props.LoadLatestAnimation(v40.props.RootInstance, v40.props.Analytics);
    end;
    v40.onSizesChange = function(v44)
        v40:setState({
            sizes = v44
        });
    end;
    v40.onActionClicked = function(v45, v46)
        if not v46 then
            local v47 = {};
            for _, v49 in v40.props.LegacyAnimationInstances, nil, nil do
                v47[v49.animation] = v45;
            end;
            v40:setState({
                choices = v47
            });
            return ;
        else
            v40:setState({
                choices = l_join_0(v40.state.choices, {
                    [v46] = v45
                })
            });
            return ;
        end;
    end;
    v40.onLearnMore = function(_, _)
        l_GuiService_0:OpenBrowserWindow(v38);
    end;
end;
v39.makeHeader = function(v52, v53)
    local l_Localization_0 = v52.props.Localization;
    return function(v55)
        local _ = v55.Name;
        local l_Width_0 = v55.Width;
        local l_ColumnIndex_0 = v55.ColumnIndex;
        local l_Style_0 = v55.Style;
        local _ = nil;
        return v4.createElement(l_Pane_0, l_assign_0({
            LayoutOrder = l_ColumnIndex_0, 
            BorderColor3 = l_Style_0.Border, 
            BorderSizePixel = 1, 
            Padding = l_Style_0.HeaderCellPadding, 
            Style = "SubtleBox", 
            Size = UDim2.new(l_Width_0.Scale, l_Width_0.Offset, 1, 0)
        }, v55.WrapperProps), {
            Content = if l_ColumnIndex_0 == 1 then v4.createElement(l_TextLabel_0, {
                Text = l_Localization_0:getText("Migration", "AnimationClip"), 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Size = UDim2.fromScale(1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left
            }) else v4.createElement(l_RadioButtonList_0, {
                Buttons = {
                    {
                        Key = "Delete", 
                        Text = l_Localization_0:getText("Migration", "Delete")
                    }, 
                    {
                        Key = "Migrate", 
                        Text = l_Localization_0:getText("Migration", "Migrate")
                    }, 
                    {
                        Key = "Ignore", 
                        Text = l_Localization_0:getText("Migration", "Ignore")
                    }
                }, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SelectedKey = v53, 
                OnClick = v52.onActionClicked
            })
        });
    end;
end;
v39.makeCell = function(v61)
    local l_Localization_1 = v61.props.Localization;
    return function(v63)
        local l_ColumnIndex_1 = v63.ColumnIndex;
        local _ = v63.RowIndex;
        local l_Value_0 = v63.Value;
        local l_Style_1 = v63.Style;
        local v68 = v63.Width or UDim.new(1 / #v63.Columns, 0);
        local _ = nil;
        return v4.createElement(l_Pane_0, {
            LayoutOrder = v63.ColumnIndex, 
            Padding = {
                Top = 1, 
                Bottom = 1, 
                Left = 5, 
                Right = 5
            }, 
            Style = "Box", 
            BackgroundColor3 = l_Style_1.BackgroundEven, 
            BorderSizePixel = 1, 
            BorderColor3 = l_Style_1.Border, 
            Size = UDim2.new(v68.Scale, v68.Offset, 1, 0), 
            ClipsDescendants = true
        }, {
            Content = if l_ColumnIndex_1 == 1 then v4.createElement(l_TextLabel_0, {
                Text = l_Value_0, 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                Size = UDim2.fromScale(1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left
            }) else v4.createElement(l_RadioButtonList_0, {
                Buttons = {
                    {
                        Key = "Delete", 
                        Text = l_Localization_1:getText("Migration", "Delete")
                    }, 
                    {
                        Key = "Migrate", 
                        Text = l_Localization_1:getText("Migration", "Migrate")
                    }, 
                    {
                        Key = "Ignore", 
                        Text = l_Localization_1:getText("Migration", "Ignore")
                    }
                }, 
                FillDirection = Enum.FillDirection.Horizontal, 
                SelectedKey = l_Value_0.SelectedKey, 
                OnClick = l_Value_0.OnClick
            })
        });
    end;
end;
v39.findCommonAction = function(v70)
    local v71 = nil;
    for _, v73 in v70.state.choices, nil, nil do
        if v71 ~= nil and v73 ~= v71 then
            return nil;
        else
            v71 = v73;
        end;
    end;
    return v71 or "Ignore";
end;
v39.makeRows = function(v74)
    local _ = v74.props.Localization;
    local v76 = {};
    for _, v78 in v74.props.LegacyAnimationInstances, nil, nil do
        table.insert(v76, {
            Animation = v78.animation.Name, 
            Action = {
                SelectedKey = v74.state.choices[v78.animation] or "Ignore", 
                OnClick = function(v79)
                    v74.onActionClicked(v79, v78.animation);
                end
            }
        });
    end;
    table.sort(v76, function(v80, v81)
        return v80.Animation < v81.Animation;
    end);
    return v76;
end;
v39.didMount = function(v82)
    local v83 = {};
    local v84 = v82.props.LegacyAnimationInstances or {};
    for _, v86 in v84, nil, nil do
        v83[v86.animation] = "Ignore";
    end;
    v82:setState({
        choices = v83
    });
end;
v39.render = function(v87)
    local l_Stylizer_0 = v87.props.Stylizer;
    local l_Localization_3 = v87.props.Localization;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local _ = v87.state.keyframes;
    local _ = v87.state.ticks;
    return v4.createElement(l_StyledDialog_0, {
        MinContentSize = Vector2.new(600, 250), 
        Size = Vector2.new(600, 250), 
        TextSize = l_dialogTheme_0.textSize, 
        Resizable = false, 
        Buttons = {
            {
                Key = false, 
                Text = l_Localization_3:getText("Dialog", "Skip"), 
                Style = "Round"
            }, 
            {
                Key = true, 
                Text = l_Localization_3:getText("Dialog", "Ok"), 
                Style = "RoundPrimary"
            }
        }, 
        OnButtonPressed = function(v93)
            if not v93 then
                v87.onClose();
                return ;
            else
                v87.onMigrate();
                return ;
            end;
        end, 
        OnClose = v87.onClose, 
        Title = l_Localization_3:getText("Title", "MigrateAnimations")
    }, {
        Layout = v4.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }), 
        Text = v4.createElement(l_TextLabel_0, {
            Size = UDim2.new(1, 0, 0, 75), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Text = l_Localization_3:getText("Migration", "MigrateAnimations"), 
            TextColor3 = l_Stylizer_0.TextColor, 
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            LayoutOrder = 1
        }), 
        Link = v4.createElement(l_LinkText_0, {
            Size = UDim2.new(1, 0, 0, 30), 
            Text = l_Localization_3:getText("Migration", "LearnMore"), 
            TextYAlignment = Enum.TextYAlignment.Top, 
            OnClick = v87.onLearnMore, 
            LayoutOrder = 2
        }), 
        Table = v4.createElement(l_Table_0, {
            Size = UDim2.new(1, 0, 1, -105), 
            Scroll = true, 
            UseScale = true, 
            ClampSize = true, 
            Columns = v87.columns, 
            Rows = v87:makeRows(), 
            CellComponent = v87:makeCell(), 
            HeaderCellComponent = v87:makeHeader((v87:findCommonAction())), 
            ShowHeader = true, 
            LayoutOrder = 3
        })
    });
end;
return v5.connect(function(v94)
    local l_Status_0 = v94.Status;
    return {
        LegacyAnimationInstances = l_Status_0.LegacyAnimationInstances, 
        RootInstance = l_Status_0.RootInstance
    };
end, function(v96)
    return {
        ClearLegacyAnimationInstances = function()
            v96(v12({}));
        end, 
        LoadLatestAnimation = function(v97, v98)
            v96(v13(v97, v98));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v39)));
