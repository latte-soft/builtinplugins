local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Components.FilteringTextBox);
local v6 = require(l_script_FirstAncestor_0.Src.Components.EditEventsDialog.EditEventMenu);
local v7 = require(l_script_FirstAncestor_0.Src.Components.ContextButton);
local v8 = v1.PureComponent:extend("EventNameEntry");
v8.init = function(v9)
    v9.state = {
        editing = false, 
        showContextMenu = false
    };
    v9.onMenuItemClicked = function(v10)
        if v10 == v2.ACTION_KEYS.Edit then
            v9:setState({
                editing = true
            });
            return ;
        else
            if v10 == v2.ACTION_KEYS.Delete then
                v9.props.OnDeleteAllEvents(v9.props.Name);
            end;
            return ;
        end;
    end;
    v9.onDeleteEvent = function()
        v9.props.OnDeleteEvent(v9.props.Name);
    end;
    v9.focusChanged = function(v11, v12)
        if not v12 then
            v9:setState({
                editing = false
            });
            local l_Name_0 = v9.props.Name;
            local l_Text_0 = v11.Text;
            if l_Text_0 == "" then
                v9.props.OnDeleteEvent(l_Name_0);
                return ;
            else
                v9.props.OnRenameEvent(l_Name_0, l_Text_0);
            end;
        end;
    end;
    v9.onItemClicked = function(v15)
        v9:setState({
            editing = false
        });
        local l_Name_1 = v9.props.Name;
        if l_Name_1 == "" and v15 == "" then
            v9.props.OnDeleteEvent(l_Name_1);
            return ;
        else
            if v15 ~= "" and v15 ~= l_Name_1 then
                v9.props.OnRenameEvent(l_Name_1, v15);
            end;
            return ;
        end;
    end;
    v9.showMenu = function()
        v9:setState({
            showContextMenu = true
        });
    end;
    v9.hideMenu = function()
        v9:setState({
            showContextMenu = false
        });
    end;
    v9.mouseEnter = function()
        if v9.props.Mouse then
            v9.props.Mouse:__pushCursor("PointingHand");
        end;
    end;
    v9.mouseLeave = function()
        if v9.props.Mouse then
            v9.props.Mouse:__popCursor();
        end;
    end;
end;
v8.didMount = function(v17)
    if v17.props.Name == "" then
        v17:setState({
            editing = true
        });
    end;
end;
v8.willUnmount = function(v18)
    v18.props.Mouse:__resetCursor();
end;
v8.render = function(v19)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_state_0 = v19.state;
    local l_Size_0 = l_props_0.Size;
    local l_Name_2 = l_props_0.Name;
    local l_PaddingLeft_0 = l_props_0.PaddingLeft;
    local l_PaddingRight_0 = l_props_0.PaddingRight;
    local l_UnusedEvents_0 = l_props_0.UnusedEvents;
    local l_editing_0 = l_state_0.editing;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local l_dialogTheme_0 = l_Stylizer_0.dialogTheme;
    return v1.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundColor3 = l_trackTheme_0.shadedBackgroundColor, 
        BorderColor3 = l_Stylizer_0.borderColor
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingLeft = l_PaddingLeft_0, 
            PaddingRight = l_PaddingRight_0, 
            PaddingTop = UDim.new(0, 2), 
            PaddingBottom = UDim.new(0, 2)
        }), 
        Label = not l_editing_0 and v1.createElement("TextLabel", {
            Size = UDim2.new(1, -v2.TRACKLIST_BUTTON_SIZE, 1, 0), 
            Text = l_Name_2, 
            TextColor3 = l_dialogTheme_0.textColor, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            Font = l_Stylizer_0.font, 
            TextSize = l_dialogTheme_0.textSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1
        }), 
        TextBox = l_editing_0 and v1.createElement(v5, {
            Size = UDim2.new(1, -v2.TRACKLIST_BUTTON_SIZE - 8, 1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            CaptureFocus = true, 
            Text = l_Name_2, 
            ClearTextOnFocus = false, 
            FocusChanged = v19.focusChanged, 
            OnItemClicked = v19.onItemClicked, 
            Items = l_UnusedEvents_0, 
            MaxItems = 3
        }), 
        DeleteButton = v1.createElement("ImageButton", {
            Size = UDim2.new(0, 8, 0, 8), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0, -l_PaddingLeft_0.Offset / 2, 0.5, 0), 
            BackgroundTransparency = 1, 
            Image = l_dialogTheme_0.deleteImage, 
            ImageColor3 = l_dialogTheme_0.subTextColor, 
            ScaleType = Enum.ScaleType.Fit, 
            [v1.Event.Activated] = v19.onDeleteEvent, 
            [v1.Event.MouseEnter] = v19.mouseEnter, 
            [v1.Event.MouseLeave] = v19.mouseLeave
        }), 
        ContextButton = v1.createElement(v7, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            OnActivated = v19.showMenu
        }), 
        EditEventMenu = v1.createElement(v6, {
            ShowMenu = l_state_0.showContextMenu, 
            OnMenuOpened = v19.hideMenu, 
            OnMenuItemClicked = v19.onMenuItemClicked
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v8));
