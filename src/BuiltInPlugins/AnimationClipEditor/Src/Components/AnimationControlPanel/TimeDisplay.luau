local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v3 = require(l_script_FirstAncestor_0.Src.Util.StringUtils);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_script_FirstAncestor_0.Src.Components.TextBox);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v8 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagTimelineUnitSeconds);
local v9 = v1.PureComponent:extend("TimeDisplay");
v9.init = function(v10)
    v10.setCurrentTime = function(v11, v12)
        local l_props_0 = v10.props;
        local l_AnimationData_0 = l_props_0.AnimationData;
        if not (v12 or not l_AnimationData_0) then
            local v15 = if not v8() then l_props_0.ShowAsTime else nil;
            local l_TimelineUnit_0 = l_props_0.TimelineUnit;
            local l_EndTick_0 = l_props_0.EndTick;
            local l_UpdateEditingLength_0 = l_props_0.UpdateEditingLength;
            local l_StepAnimation_0 = l_props_0.StepAnimation;
            local l_FrameRate_0 = l_props_0.FrameRate;
            local v21 = math.clamp(v3.parseTime(v11.Text, l_FrameRate_0, l_TimelineUnit_0) or 0, 0, v2.TICK_FREQUENCY * v2.MAX_ANIMATION_LENGTH);
            if l_EndTick_0 < v21 then
                l_UpdateEditingLength_0(v21);
            end;
            v11.Text = if not v8() then v3.formatTime_DEPRECATED(v21, l_FrameRate_0, v15) else v3.formatTime(v21, l_FrameRate_0, l_TimelineUnit_0);
            l_StepAnimation_0(v21);
        end;
    end;
    v10.setEndTime = function(v22, v23)
        local l_props_1 = v10.props;
        local l_AnimationData_1 = l_props_1.AnimationData;
        if not (v23 or not l_AnimationData_1) then
            local l_ShowAsTime_0 = l_props_1.ShowAsTime;
            local l_FrameRate_1 = l_props_1.FrameRate;
            local l_UpdateEditingLength_1 = l_props_1.UpdateEditingLength;
            local l_EndTick_1 = l_AnimationData_1.Metadata.EndTick;
            local l_TimelineUnit_1 = l_props_1.TimelineUnit;
            local v31 = math.clamp(v3.parseTime(v22.Text, l_FrameRate_1, l_TimelineUnit_1) or 0, math.max(l_EndTick_1, v2.TICK_FREQUENCY), v2.MAX_ANIMATION_LENGTH);
            v22.Text = if not v8() then v3.formatTime_DEPRECATED(v31, l_FrameRate_1, l_ShowAsTime_0) else v3.formatTime(v31, l_FrameRate_1, l_TimelineUnit_1);
            l_UpdateEditingLength_1(v31);
        end;
    end;
end;
v9.render = function(v32)
    local l_props_2 = v32.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local v35 = if not v8() then l_props_2.ShowAsTime else nil;
    local l_TimelineUnit_2 = l_props_2.TimelineUnit;
    local l_Playhead_0 = l_props_2.Playhead;
    local l_EditingLength_0 = l_props_2.EditingLength;
    local l_FrameRate_2 = l_props_2.FrameRate;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v2.TIME_DISPLAY_WIDTH, 1, 0), 
        LayoutOrder = l_props_2.LayoutOrder
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        CurrentFrameBox = v1.createElement(v6, {
            Size = UDim2.new(0, 40, 1, -6), 
            Text = if not v8() then v3.formatTime_DEPRECATED(l_Playhead_0, l_FrameRate_2, v35) else v3.formatTime(l_Playhead_0, l_FrameRate_2, l_TimelineUnit_2), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 0, 
            ClearTextOnFocus = false, 
            FocusChanged = v32.setCurrentTime
        }, {
            Tooltip = v1.createElement(v7, {
                TextKey = "CurrentFrameBox"
            })
        }), 
        DividerLabel = v1.createElement("TextLabel", {
            Text = "/", 
            TextSize = l_Stylizer_0.textBox.textSize, 
            Font = l_Stylizer_0.font, 
            Size = UDim2.new(0, 12, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            TextColor3 = l_Stylizer_0.playbackTheme.iconColor
        }), 
        EndFrameBox = v1.createElement(v6, {
            Size = UDim2.new(0, 40, 1, -6), 
            Text = if not v8() then v3.formatTime_DEPRECATED(l_EditingLength_0, l_FrameRate_2, v35) else v3.formatTime(l_EditingLength_0, l_FrameRate_2, l_TimelineUnit_2), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            LayoutOrder = 2, 
            ClearTextOnFocus = false, 
            FocusChanged = v32.setEndTime, 
            ReadOnly = l_props_2.ReadOnly
        }, {
            Tooltip = v1.createElement(v7, {
                TextKey = "EndFrameBox"
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
