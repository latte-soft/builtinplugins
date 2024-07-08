local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v2 = v1.PROMPT_BUTTON_SIZE.Y + 30;
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v5 = require(l_script_FirstAncestor_0.Src.Util.LayoutOrderIterator);
local v6 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Util.deepCopy);
local v8 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_StyledDialog_0 = v8.UI.StyledDialog;
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_script_FirstAncestor_0.Src.Components.TextBox);
local v13 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.EventNameEntry);
local v14 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.AddEventEntry);
local v15 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.FocusedPrompt);
local v16 = v3.PureComponent:extend("EditEventsDialog");
v16.init = function(v17, v18)
    v17.state = {
        CurrentEvents = v7(v18.Events), 
        deleteAllName = nil, 
        renameAllNames = nil
    };
    v17.onButtonClicked = function(v19)
        if v19 then
            v17.props.OnSaved(v17.state.CurrentEvents);
        end;
        v17.props.OnClose();
    end;
    v17.onAddEvent = function()
        local l_CurrentEvents_0 = v17.state.CurrentEvents;
        v6.addEvent(l_CurrentEvents_0, v17.props.Tick, "", "");
        v17:setState({
            CurrentEvents = l_CurrentEvents_0
        });
    end;
    v17.onRenameEvent = function(v21, v22)
        local l_CurrentEvents_1 = v17.state.CurrentEvents;
        local l_Tick_0 = v17.props.Tick;
        if not (not l_CurrentEvents_1.Data[l_Tick_0] or not l_CurrentEvents_1.Data[l_Tick_0][v21]) then
            local v25 = l_CurrentEvents_1.Data[l_Tick_0][v21];
            v6.removeEvent(l_CurrentEvents_1, l_Tick_0, v21);
            v6.addEvent(l_CurrentEvents_1, l_Tick_0, v22, v25);
        end;
        v17:setState({
            CurrentEvents = l_CurrentEvents_1
        });
    end;
    v17.onSetEventValue = function(v26, v27)
        local l_CurrentEvents_2 = v17.state.CurrentEvents;
        v6.setEventValue(l_CurrentEvents_2, v17.props.Tick, v26, v27);
        v17:setState({
            CurrentEvents = l_CurrentEvents_2
        });
    end;
    v17.onDeleteEvent = function(v29)
        local l_CurrentEvents_3 = v17.state.CurrentEvents;
        v6.removeEvent(l_CurrentEvents_3, v17.props.Tick, v29);
        v17:setState({
            CurrentEvents = l_CurrentEvents_3
        });
    end;
    v17.onDeleteAllEvents = function(v31)
        local l_CurrentEvents_4 = v17.state.CurrentEvents;
        for v33, v34 in pairs(l_CurrentEvents_4.Data) do
            if v34[v31] then
                v6.removeEvent(l_CurrentEvents_4, v33, v31);
            end;
        end;
        v17:setState({
            CurrentEvents = l_CurrentEvents_4
        });
    end;
    v17.onRenameAllEvents = function(v35, v36)
        local l_CurrentEvents_5 = v17.state.CurrentEvents;
        for v38, v39 in pairs(l_CurrentEvents_5.Data) do
            if v39[v35] then
                local v40 = v39[v35];
                v6.removeEvent(l_CurrentEvents_5, v38, v35);
                v6.addEvent(l_CurrentEvents_5, v38, v36, v40);
            end;
        end;
        v17:setState({
            CurrentEvents = l_CurrentEvents_5
        });
    end;
    v17.showDeleteAllPrompt = function(v41)
        v17:setState({
            deleteAllName = v41
        });
    end;
    v17.hideDeleteAllPrompt = function()
        v17:setState({
            deleteAllName = v3.None
        });
    end;
    v17.showRenameAllPrompt = function(v42, v43)
        v17:setState({
            renameAllNames = {
                Name = v42, 
                NewName = v43
            }
        });
    end;
    v17.hideRenameAllPrompt = function()
        v17:setState({
            renameAllNames = v3.None
        });
    end;
    v17.getUnusedEvents = function(v44)
        local v45 = {};
        local l_CurrentEvents_6 = v17.state.CurrentEvents;
        for _, v48 in pairs(l_CurrentEvents_6.Data) do
            for v49, _ in pairs(v48) do
                v45[v49] = true;
            end;
        end;
        if l_CurrentEvents_6.Data[v44] then
            for v51, _ in pairs(l_CurrentEvents_6.Data[v44]) do
                v45[v51] = nil;
            end;
        end;
        local v53 = v4.Dictionary.keys(v45);
        table.sort(v53);
        return v53;
    end;
end;
v16.didMount = function(v54)
    v54.props.Mouse:__resetCursor();
end;
v16.makeText = function(_, v56, v57, v58, v59)
    return v3.createElement("TextLabel", {
        LayoutOrder = 0, 
        Size = UDim2.new(0, 220, 0, 22), 
        Text = v57, 
        TextColor3 = v58 or v56.dialogTheme.textColor, 
        Font = v56.font, 
        TextSize = v56.dialogTheme.textSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        BackgroundTransparency = 1
    }, {
        Padding = v3.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, not v59 and 20 or 8), 
            PaddingRight = UDim.new(0, not v59 and 8 or 20)
        })
    });
end;
v16.addTitleRow = function(v60, v61, v62)
    return v3.createElement("Frame", {
        Size = UDim2.new(0, 440, 0, 22), 
        BackgroundTransparency = 1, 
        LayoutOrder = v60.layout:getNextOrder()
    }, {
        [1] = v60:makeText(v61, v62:getText("Title", "EventName")), 
        [2] = v60:makeText(v61, v62:getText("Title", "Parameter"), nil, true)
    });
end;
v16.addEventRow = function(v63, v64, v65, v66, v67)
    return v3.createElement("Frame", {
        Size = UDim2.new(0, 440, 0, 22), 
        BackgroundTransparency = 1, 
        LayoutOrder = v63.layout:getNextOrder()
    }, {
        [1] = v3.createElement(v13, {
            Size = UDim2.new(0, 220, 0, 22), 
            Name = v65, 
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 8), 
            OnDeleteEvent = v63.onDeleteEvent, 
            OnDeleteAllEvents = v63.showDeleteAllPrompt, 
            UnusedEvents = v67, 
            OnRenameEvent = function(v68, v69)
                if v68 == "" then
                    v63.onRenameEvent(v68, v69);
                    return ;
                else
                    if v68 ~= v69 then
                        v63.showRenameAllPrompt(v68, v69);
                    end;
                    return ;
                end;
            end
        }), 
        [2] = v3.createElement("Frame", {
            Size = UDim2.new(0, 220, 0, 22), 
            BackgroundColor3 = v64.trackTheme.shadedBackgroundColor, 
            BorderColor3 = v64.borderColor
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 20), 
                PaddingTop = UDim.new(0, 2), 
                PaddingBottom = UDim.new(0, 2)
            }), 
            TextBox = v3.createElement(v12, {
                Size = UDim2.new(1, 0, 1, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Text = v66, 
                ClearTextOnFocus = false, 
                FocusChanged = function(v70, v71)
                    if not v71 then
                        v63.onSetEventValue(v65, v70.Text);
                    end;
                end
            })
        })
    });
end;
v16.addNewEventRow = function(v72, v73, _)
    return v3.createElement("Frame", {
        Size = UDim2.new(0, 440, 0, 22), 
        BorderColor3 = v73.borderColor, 
        BackgroundColor3 = v73.backgroundColor, 
        LayoutOrder = v72.layout:getNextOrder()
    }, {
        AddEventEntry = v3.createElement(v14, {
            Size = UDim2.new(0, 220, 0, 22), 
            PaddingLeft = UDim.new(0, 20), 
            PaddingRight = UDim.new(0, 8), 
            OnAddEvent = v72.onAddEvent
        })
    });
end;
v16.renderEvents = function(v75, v76, v77)
    local l_props_0 = v75.props;
    local l_state_0 = v75.state;
    local l_Tick_1 = l_props_0.Tick;
    local l_CurrentEvents_7 = l_state_0.CurrentEvents;
    local v82 = 66;
    if not ((not l_CurrentEvents_7 or not l_CurrentEvents_7.Data) or not l_CurrentEvents_7.Data[l_Tick_1]) then
        local v83 = v75.getUnusedEvents(l_Tick_1);
        local v84 = v4.Dictionary.keys(l_CurrentEvents_7.Data[l_Tick_1]);
        table.sort(v84, function(v85, v86)
            if v85 == "" then
                return false;
            elseif v86 == "" then
                return true;
            else
                return v85 < v86;
            end;
        end);
        for _, v88 in ipairs(v84) do
            v77["Event_" .. v88] = v75:addEventRow(v76, v88, l_CurrentEvents_7.Data[l_Tick_1][v88], v83);
            v82 = v82 + 22;
        end;
    end;
    return v82;
end;
v16.renderDeleteAllPrompt = function(v89, v90, v91)
    local l_deleteAllName_0 = v89.state.deleteAllName;
    local _ = v90.button;
    return v3.createElement(v15, {
        Buttons = {
            {
                Key = false, 
                Text = v91:getText("Dialog", "No"), 
                Style = "Round"
            }, 
            {
                Key = true, 
                Text = v91:getText("Dialog", "Yes"), 
                Style = "RoundPrimary"
            }
        }, 
        PromptText = v91:getText("Dialog", "DeleteAllPrompt_Migrated", {
            name = l_deleteAllName_0
        }), 
        OnButtonClicked = function(v94)
            if v94 then
                v89.onDeleteAllEvents(l_deleteAllName_0);
            end;
            v89.hideDeleteAllPrompt();
        end, 
        OnClose = v89.hideDeleteAllPrompt
    });
end;
v16.renderRenameAllPrompt = function(v95, _, v97)
    local l_state_1 = v95.state;
    local l_Name_0 = l_state_1.renameAllNames.Name;
    local l_NewName_0 = l_state_1.renameAllNames.NewName;
    return v3.createElement(v15, {
        Buttons = {
            {
                Key = false, 
                Text = v97:getText("Dialog", "ChangeThis"), 
                Style = "Round"
            }, 
            {
                Key = true, 
                Text = v97:getText("Dialog", "ChangeAll"), 
                Style = "Round"
            }
        }, 
        PromptText = v97:getText("Dialog", "RenameAllPrompt_Migrated", {
            name = l_Name_0, 
            newName = l_NewName_0
        }), 
        OnButtonClicked = function(v101)
            if not v101 then
                v95.onRenameEvent(l_Name_0, l_NewName_0);
            else
                v95.onRenameAllEvents(l_Name_0, l_NewName_0);
            end;
            v95.hideRenameAllPrompt();
        end, 
        OnClose = v95.hideRenameAllPrompt
    });
end;
v16.render = function(v102)
    local l_Stylizer_0 = v102.props.Stylizer;
    local l_Localization_0 = v102.props.Localization;
    v102.layout = v5.new();
    local l_props_1 = v102.props;
    local l_state_2 = v102.state;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    local _ = l_Stylizer_0.button;
    local v109 = l_state_2.deleteAllName ~= nil;
    local v110 = l_state_2.renameAllNames ~= nil;
    local v111 = {
        {
            Key = false, 
            Text = l_Localization_0:getText("Dialog", "Cancel"), 
            Style = "Round"
        }, 
        {
            Key = true, 
            Text = l_Localization_0:getText("Dialog", "Save"), 
            Style = "RoundPrimary"
        }
    };
    local v112 = {
        Layout = v3.createElement("UITableLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillEmptySpaceColumns = true
        }), 
        TitleRow = v102:addTitleRow(l_Stylizer_0, l_Localization_0)
    };
    local v113 = v102:renderEvents(l_Stylizer_0, v112);
    v112.AddNew = v102:addNewEventRow(l_Stylizer_0, l_Localization_0);
    if not v109 then
        if v110 then
            v112.RenameAllPrompt = v102:renderRenameAllPrompt(l_Stylizer_0, l_Localization_0);
        end;
    else
        v112.DeleteAllPrompt = v102:renderDeleteAllPrompt(l_Stylizer_0, l_Localization_0);
    end;
    local v114 = Vector2.new(460, math.max(v113, 110) + v2);
    return v3.createElement(l_StyledDialog_0, {
        Size = v114, 
        MinContentSize = v114, 
        TextSize = l_dialogTheme_0.textSize, 
        Resizable = true, 
        Buttons = v111, 
        OnButtonPressed = v102.onButtonClicked, 
        OnClose = l_props_1.OnClose, 
        BorderPadding = 10, 
        ButtonPadding = v1.PROMPT_BUTTON_PADDING, 
        ButtonHeight = v1.PROMPT_BUTTON_SIZE.Y, 
        ButtonWidth = v1.PROMPT_BUTTON_SIZE.X, 
        Title = l_Localization_0:getText("Title", "EditEvents")
    }, {
        Container = v3.createElement("ScrollingFrame", {
            BorderSizePixel = 0, 
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            Size = UDim2.new(1, 0, 1, -10), 
            ScrollBarThickness = 8, 
            CanvasSize = UDim2.new(0, 0, 0, v113)
        }, v112)
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v16));
