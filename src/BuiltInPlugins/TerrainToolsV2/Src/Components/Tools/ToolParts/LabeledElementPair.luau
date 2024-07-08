local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = v1.ContextServices.withContext;
local v4 = require(l_Parent_0.Src.ContextItems);
local v5 = require(l_Parent_0.Src.Util.Constants);
local v6 = require(l_Parent_0.Src.Components.StatusIcon);
local v7 = require(l_Parent_0.Src.Components.TeachingCallout);
local l_Tooltip_0 = v1.UI.Tooltip;
local l_TextService_0 = game:GetService("TextService");
local v10 = v2.PureComponent:extend(script.Name);
local v11 = game:DefineFastFlag("TerrainEditorFixDETruncations", false);
v10.init = function(v12)
    v12.mainFrameRef = v2.createRef();
    v12.DEPRECATED_contentFrameRef = v2.createRef();
    v12.labelLayoutRef = v2.createRef();
    v12.contentLayoutRef = v2.createRef();
    v12.resizeToContent = function()
        local l_current_0 = v12.mainFrameRef.current;
        if l_current_0 then
            local l_current_1 = v12.labelLayoutRef.current;
            local l_current_2 = v12.contentLayoutRef.current;
            local v16 = nil;
            if l_current_1 then
                v16 = l_current_1.AbsoluteContentSize.Y;
            end;
            if l_current_2 then
                v16 = math.max(v16 or 0, l_current_2.AbsoluteContentSize.Y);
            end;
            if v16 then
                l_current_0.Size = UDim2.new(l_current_0.Size.X.Scale, l_current_0.Size.X.Offset, 0, v16);
            end;
        end;
    end;
end;
v10.didMount = function(v17)
    if v17.props.SizeToContent then
        v17.resizeToContent();
    end;
end;
v10.render = function(v18)
    local v19 = v18.props.Theme:get();
    local v20 = v18.props.Padding or UDim.new(0, 0);
    local v21 = v18.props.Text or "";
    local l_Size_0 = v18.props.Size;
    local l_LayoutOrder_0 = v18.props.LayoutOrder;
    local v24 = v18.props.ContentDirection or Enum.FillDirection.Vertical;
    local l_TeachingCallout_0 = v18.props.TeachingCallout;
    local l_Tooltip_1 = v18.props.Tooltip;
    local l_SizeToContent_0 = v18.props.SizeToContent;
    local v28 = true;
    if v18.props.Visible ~= nil then
        v28 = v18.props.Visible;
    end;
    local v29 = v18.props[v2.Children];
    if not (not l_SizeToContent_0 or not v29) then
        v29.UIListLayout = v2.createElement("UIListLayout", {
            Padding = v20, 
            FillDirection = v24, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Change.AbsoluteContentSize] = v18.resizeToContent, 
            [v2.Ref] = v18.contentLayoutRef
        });
    end;
    local v30 = (v18.props.ErrorMessage or v18.props.WarningMessage) or v18.props.InfoMessage;
    local l_textSize_0 = v19.textSize;
    local l_font_0 = v19.font;
    local v33 = {};
    local v34 = UDim2.new(1, 0, 1, 0);
    local v35 = nil;
    if v11 then
        v35 = if v5.OVERFLOW_THRESHOLD < l_TextService_0:GetTextSize(v21, l_textSize_0, l_font_0, Vector2.new(0, 0)).X then v5.OVERFLOW_PADDING else 0;
    end;
    if v30 then
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v21, l_textSize_0, l_font_0, Vector2.new(v5.FIRST_COLUMN_WIDTH, math.huge));
        local v37 = nil;
        v37 = if not v11 then math.min(math.ceil(l_l_TextService_0_TextSize_0.x) + 2, v5.FIRST_COLUMN_WIDTH) else math.min(math.ceil(l_l_TextService_0_TextSize_0.x) + 2, v5.FIRST_COLUMN_WIDTH) + v35;
        v34 = UDim2.new(0, v37, 0, math.ceil(l_l_TextService_0_TextSize_0.y) + 2);
        local v38 = (v37 + 4) + 18 <= v5.FIRST_COLUMN_WIDTH;
        local v39 = not v38 and 0 or 2;
        v33.UIListLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 4), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = not not v38 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical, 
            [v2.Change.AbsoluteContentSize] = v18.resizeToContent, 
            [v2.Ref] = v18.labelLayoutRef
        });
        v33.StatusIconContainer = v2.createElement("Frame", {
            LayoutOrder = 2, 
            Size = UDim2.new(0, 18, 0, 18 + v39), 
            BackgroundTransparency = 1
        }, {
            StatusIcon = v2.createElement(v6, {
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                ErrorMessage = v18.props.ErrorMessage, 
                WarningMessage = v18.props.WarningMessage, 
                InfoMessage = v18.props.InfoMessage
            })
        });
    end;
    v33.LabelContainer = v2.createElement("Frame", {
        LayoutOrder = 1, 
        Size = v34, 
        BackgroundTransparency = 1
    }, {
        Label = v2.createElement("TextLabel", {
            Position = UDim2.new(0, 0, 0, 2), 
            Size = UDim2.new(1, 0, 1, -2), 
            BackgroundTransparency = 1, 
            Text = v21, 
            TextSize = l_textSize_0, 
            Font = l_font_0, 
            TextWrapped = true, 
            TextColor3 = v19.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top
        }), 
        Tooltip = if not l_Tooltip_1 then nil else v2.createElement(l_Tooltip_0, {
            Text = l_Tooltip_1
        })
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_Size_0, 
        Visible = v28, 
        LayoutOrder = l_LayoutOrder_0, 
        [v2.Ref] = v18.mainFrameRef
    }, {
        LabelColumn = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, v5.SIDE_PADDING, 0, 0), 
            Size = if not v11 then UDim2.new(0, v5.FIRST_COLUMN_WIDTH, 1, 0) else UDim2.new(0, v5.FIRST_COLUMN_WIDTH + v35, 1, 0)
        }, v33), 
        ContentColumn = v2.createElement("Frame", {
            Position = if not v11 then UDim2.new(0, v5.SECOND_COLUMN_START, 0, 0) else UDim2.new(0, v5.SECOND_COLUMN_START + v35, 0, 0), 
            Size = UDim2.new(1, -(v5.SECOND_COLUMN_START + v5.SIDE_PADDING), 1, 0), 
            BackgroundTransparency = 1
        }, v29), 
        TeachingCallout = if not l_TeachingCallout_0 then nil else v2.createElement(v7, {
            DefinitionId = l_TeachingCallout_0.DefinitionId, 
            LocationId = l_TeachingCallout_0.LocationId
        })
    });
end;
return (l_withContext_0({
    Theme = v4.DEPRECATED_Theme
})(v10));
