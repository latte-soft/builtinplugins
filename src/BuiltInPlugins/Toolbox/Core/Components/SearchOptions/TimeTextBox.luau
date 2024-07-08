local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Core.Components.RoundFrame);
local v7 = v2.PureComponent:extend("TimeTextBox");
v7.defaultProps = {
    defaultValue = 0, 
    max = math.huge, 
    min = 0
};
local function _(v8)
    return v8 % 60 or 0;
end;
local function _(v10)
    return math.floor(v10 / 60) or 0;
end;
v7.init = function(v12)
    v12.minuteRef = v2.createRef();
    v12.secondRef = v2.createRef();
    local l_currentValue_0 = v12.props.currentValue;
    v12.sec = l_currentValue_0 % 60 or 0;
    v12.minute = math.floor(l_currentValue_0 / 60) or 0;
    v12.totalSeconds = l_currentValue_0 or 0;
    v12.state = {
        isTextboxFocused = false, 
        showSecLabel = false
    };
    v12.getClampedMinute = function(v14, v15)
        return (math.clamp(v14, math.max(math.floor(v15.min / 60) or 0, 0), math.floor(v15.max / 60) or 0));
    end;
    v12.getClampedSec = function(v16, v17)
        local v18 = 0;
        local v19 = 59;
        local v20 = math.floor(v17.min / 60) or 0;
        local v21 = math.floor(v17.max / 60) or 0;
        if v12.minute <= v20 then
            v18 = math.max(v17.min % 60 or 0, v18);
        end;
        if v21 <= v12.minute then
            v19 = math.min(v17.max % 60 or 0, v19);
        end;
        return (math.clamp(v16, v18, v19));
    end;
    v12.updateTextboxes = function(_)
        if v12.secondRef.current and v12.minuteRef.current then
            local v23 = nil;
            local v24 = nil;
            local l_minute_0 = v12.minute;
            local l_sec_0 = v12.sec;
            if v12.totalSeconds == v12.props.defaultValue then
                v23 = "";
                v24 = "";
            else
                v23 = l_minute_0;
                v24 = l_sec_0 > 0 and l_sec_0 or "";
            end;
            v12.minuteRef.current.Text = v23;
            v12.secondRef.current.Text = v24;
            return ;
        else
            return ;
        end;
    end;
    v12.onFocused = function()
        v12:setState({
            showSecLabel = true, 
            isTextboxFocused = true
        });
    end;
    v12.onFocusLost = function()
        if v12.secondRef.current then
            v12.minute = v12.getClampedMinute(v12.minute, v12.props);
            v12.sec = v12.getClampedSec(v12.sec, v12.props);
            v12.totalSeconds = 60 * v12.minute + v12.sec;
            v12.updateTextboxes(false);
            v12:setState({
                hasSeconds = v12.secondRef.current.Text ~= "", 
                showSecLabel = v12.secondRef.current.Text ~= "", 
                isTextboxFocused = false
            });
            if v12.props.onDurationChange then
                v12.props.onDurationChange(v12.totalSeconds);
            end;
            return ;
        else
            return ;
        end;
    end;
    v12.onMinuteChanged = function(v27, v28)
        if v12.secondRef.current and v12.minuteRef.current then
            if v28 == "Text" then
                if #v27.Text <= 2 and not string.find(v27.Text, "\t") then
                    v12.minute = tonumber(v27.Text) or (math.floor(v12.props.defaultValue / 60) or 0);
                    if not tonumber(v12.secondRef.current.Text) then
                        v12.sec = 0;
                    end;
                else
                    local l_current_0 = v12.secondRef.current;
                    if l_current_0 then
                        l_current_0:CaptureFocus();
                    end;
                    v12.minuteRef.current.Text = tonumber(v12.minute);
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v12.onSecondChange = function(v30, v31)
        if v12.secondRef.current and v12.minuteRef.current then
            if v31 == "Text" then
                if #v30.Text > 2 then
                    v12.secondRef.current.Text = tonumber(v12.sec);
                    return ;
                else
                    v12.sec = tonumber(v30.Text) or 0;
                    if not tonumber(v12.minuteRef.current.Text) then
                        v12.minute = 0;
                    end;
                    spawn(function()
                        if v12.secondRef.current then
                            v12:setState({
                                hasSeconds = v12.secondRef.current.Text ~= ""
                            });
                            return ;
                        else
                            return ;
                        end;
                    end);
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
end;
v7.didMount = function(v32)
    v32.updateTextboxes(false);
end;
v7.didUpdate = function(v33, v34)
    if not (v34.min == v33.props.min and v34.max == v33.props.max) or v34.currentValue ~= v33.props.currentValue then
        local v35 = v33.props.currentValue % 60 or 0;
        v33.minute = v33.getClampedMinute(math.floor(v33.props.currentValue / 60) or 0, v33.props);
        v33.sec = v33.getClampedSec(v35, v33.props);
        v33.totalSeconds = 60 * v33.minute + v33.sec;
        v33.updateTextboxes(v33.state.isTextboxFocused);
        if v33.props.onDurationChange then
            v33.props.onDurationChange(v33.totalSeconds);
        end;
    end;
end;
v7.render = function(v36)
    local l_props_0 = v36.props;
    local l_state_0 = v36.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v40 = l_state_0.showSecLabel or v36.sec > 0;
    local l_isTextboxFocused_0 = l_state_0.isTextboxFocused;
    local v42 = if not l_isTextboxFocused_0 then l_props_0.defaultValue % 60 or 0 else "0";
    local v43 = math.floor(l_props_0.defaultValue / 60) or 0;
    local v44 = not not l_isTextboxFocused_0 and if not l_state_0.hasSeconds then v43 else "0" or v43;
    local l_timeTextBox_0 = l_Stylizer_0.searchOptions.timeTextBox;
    return v2.createElement(v6, {
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_timeTextBox_0.backgroundColor, 
        BorderColor3 = not not l_isTextboxFocused_0 and l_timeTextBox_0.selectedBorderColor or l_timeTextBox_0.borderColor, 
        BorderSizePixel = 1, 
        LayoutOrder = l_props_0.layoutOrder, 
        Position = l_props_0.position, 
        Size = l_props_0.size
    }, {
        Padding = v2.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0), 
            PaddingBottom = UDim.new(0, 0), 
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        }), 
        MinuteTextField = v2.createElement("TextBox", {
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            Font = v5.FONT, 
            LayoutOrder = 1, 
            Size = UDim2.new(0.5, 0, 1, 0), 
            PlaceholderText = v44, 
            PlaceholderColor3 = not not l_isTextboxFocused_0 and l_timeTextBox_0.placeholderTextColor or l_timeTextBox_0.textColor, 
            Text = "", 
            TextColor3 = l_timeTextBox_0.textColor, 
            TextSize = v5.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ZIndex = 2, 
            [v2.Event.Changed] = v36.onMinuteChanged, 
            [v2.Event.Focused] = v36.onFocused, 
            [v2.Event.FocusLost] = v36.onFocusLost, 
            [v2.Ref] = v36.minuteRef
        }), 
        MinuteLabel = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v5.FONT, 
            LayoutOrder = 2, 
            Position = UDim2.new(0, 15, 0, 0), 
            Size = UDim2.new(0, 15, 1, 0), 
            Text = l_props_0.Localization:getText("General", "AbbreviatedMinutes"), 
            TextColor3 = l_timeTextBox_0.textColor, 
            TextSize = v5.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Center
        }), 
        SecondTextField = v2.createElement("TextBox", {
            BackgroundTransparency = 1, 
            ClearTextOnFocus = false, 
            Font = v5.FONT, 
            LayoutOrder = 3, 
            PlaceholderText = not not v40 and v42 or "", 
            PlaceholderColor3 = l_timeTextBox_0.placeholderTextColor, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(0.5, 0, 1, 0), 
            Text = "", 
            TextColor3 = l_timeTextBox_0.textColor, 
            TextSize = v5.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            ZIndex = 2, 
            [v2.Event.Changed] = v36.onSecondChange, 
            [v2.Event.Focused] = v36.onFocused, 
            [v2.Event.FocusLost] = v36.onFocusLost, 
            [v2.Ref] = v36.secondRef
        }), 
        SecondLabel = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v5.FONT, 
            LayoutOrder = 4, 
            Position = UDim2.new(0.5, 15, 0, 0), 
            Size = UDim2.new(0, 15, 1, 0), 
            Text = l_props_0.Localization:getText("General", "AbbreviatedSeconds"), 
            TextColor3 = l_timeTextBox_0.textColor, 
            TextSize = v5.FONT_SIZE_MEDIUM, 
            TextTransparency = not v40 and 1 or 0, 
            TextXAlignment = Enum.TextXAlignment.Center
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
