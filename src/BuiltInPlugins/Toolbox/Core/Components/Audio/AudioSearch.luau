local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Util.Constants);
local v4 = require(l_Parent_0.Core.Components.SearchOptions.TimeTextBox);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_RangeSlider_0 = require(l_Packages_0.Framework).UI.RangeSlider;
local _ = require(l_Packages_0.Framework).Util;
local l_MAX_AUDIO_SEARCH_DURATION_0 = v3.MAX_AUDIO_SEARCH_DURATION;
local l_MIN_AUDIO_SEARCH_DURATION_0 = v3.MIN_AUDIO_SEARCH_DURATION;
local v11 = Vector2.new(80, 32);
local v12 = Vector2.new(6, 12);
local v13 = v2.PureComponent:extend("AudioSearch");
v13.init = function(v14, _)
    v14.onMinDurationChange = function(v16)
        if v16 ~= v14.props.minDuration then
            v14.props.onDurationChange(v16, v14.props.maxDuration);
        end;
    end;
    v14.onMaxDurationChange = function(v17)
        if v17 ~= v14.props.maxDuration then
            v14.props.onDurationChange(v14.props.minDuration, v17);
        end;
    end;
    v14.onSliderChange = function(v18, v19)
        v14.props.onDurationChange(v18, (math.max(1, v19)));
    end;
end;
v13.render = function(v20)
    local l_props_0 = v20.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_minDuration_0 = l_props_0.minDuration;
    local l_maxDuration_0 = l_props_0.maxDuration;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.fromScale(1, 0)
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, v12.Y)
        }), 
        AudioDuration = v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, v11.Y)
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Padding = UDim.new(0, v12.X), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            MinTextBox = v2.createElement(v4, {
                currentValue = l_minDuration_0, 
                defaultValue = 0, 
                layoutOrder = 1, 
                max = l_maxDuration_0, 
                min = 0, 
                onDurationChange = v20.onMinDurationChange, 
                size = UDim2.new(0, v11.X, 0, v11.Y)
            }), 
            ToLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                LayoutOrder = 2, 
                Size = UDim2.new(0, 20, 1, 0), 
                Text = l_props_0.Localization:getText("General", "SearchOptionAudioTo"), 
                TextColor3 = l_Stylizer_0.searchOptions.audioSearch.textColor
            }), 
            MaxTextBox = v2.createElement(v4, {
                currentValue = l_maxDuration_0, 
                defaultValue = l_MAX_AUDIO_SEARCH_DURATION_0, 
                layoutOrder = 3, 
                max = l_MAX_AUDIO_SEARCH_DURATION_0, 
                min = l_minDuration_0, 
                onDurationChange = v20.onMaxDurationChange, 
                size = UDim2.new(0, v11.X, 0, v11.Y)
            })
        }), 
        RangeSlider = v2.createElement(l_RangeSlider_0, {
            LayoutOrder = 2, 
            LowerRangeValue = l_minDuration_0, 
            UpperRangeValue = l_maxDuration_0, 
            Min = l_MIN_AUDIO_SEARCH_DURATION_0, 
            Max = l_MAX_AUDIO_SEARCH_DURATION_0, 
            OnValuesChanged = v20.onSliderChange, 
            Size = UDim2.new(1, 0, 0, 20), 
            SnapIncrement = 1
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
