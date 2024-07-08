local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v1.ContextServices;
local v3 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_UI_0 = v1.UI;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_Slider_0 = l_UI_0.Slider;
local l_Pane_0 = l_UI_0.Pane;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local v10 = require(l_script_FirstAncestor_0.Src.Resources.Images);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v12 = v3.PureComponent:extend("MediaPlayerControls");
local function _(v13, v14)
    if v14 then
        if not v13 then
            return v10.PLAY_BUTTON;
        else
            return v10.PAUSE_BUTTON;
        end;
    else
        return v10.LOADING_BUTTON;
    end;
end;
v12.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = v16.props.Stylizer;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_CurrentTime_0 = l_props_0.CurrentTime;
    local l_TimeLength_0 = l_props_0.TimeLength;
    local l_IsPlaying_0 = l_props_0.IsPlaying;
    local l_IsLoaded_0 = l_props_0.IsLoaded;
    local l_OnPlay_0 = l_props_0.OnPlay;
    local l_OnPause_0 = l_props_0.OnPause;
    local l_OnScrub_0 = l_props_0.OnScrub;
    local v29 = l_LayoutOrderIterator_0.new();
    return v3.createElement(l_Pane_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = l_Stylizer_0.Spacing, 
        BackgroundColor = l_Stylizer_0.BackgroundColor, 
        Style = "RoundBox", 
        Padding = l_Stylizer_0.Padding
    }, {
        PlayOrPauseButton = v3.createElement(l_Button_0, {
            Size = l_Stylizer_0.ButtonSize, 
            LayoutOrder = v29:getNextOrder(), 
            OnClick = if not l_IsPlaying_0 then l_OnPlay_0 else l_OnPause_0, 
            Style = "Round", 
            StyleModifier = if l_IsLoaded_0 then nil else l_StyleModifier_0.Disabled
        }, {
            Icon = v3.createElement(l_Image_0, {
                Image = if l_IsLoaded_0 then if l_IsPlaying_0 then v10.PAUSE_BUTTON else v10.PLAY_BUTTON else v10.LOADING_BUTTON, 
                ImageColor3 = l_Stylizer_0.ImageColor
            })
        }), 
        Scrubber = v3.createElement(l_Slider_0, {
            Min = 0, 
            Max = l_TimeLength_0, 
            Size = l_Stylizer_0.SliderSize, 
            Value = math.clamp(l_CurrentTime_0, 0, l_TimeLength_0), 
            LayoutOrder = v29:getNextOrder(), 
            OnValueChanged = l_OnScrub_0, 
            Disabled = not l_IsLoaded_0 or nil
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v12));
