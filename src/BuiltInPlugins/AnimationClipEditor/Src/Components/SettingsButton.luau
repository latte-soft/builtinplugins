local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Components.SettingsMenu);
local v6 = v1.PureComponent:extend("SettingsButton");
v6.init = function(v7)
    v7.state = {
        showMenu = false
    };
    v7.showMenu = function()
        v7:setState({
            showMenu = true
        });
    end;
    v7.hideMenu = function()
        v7:setState({
            showMenu = false
        });
    end;
    v7.mouseEnter = function()
        if v7.props.Mouse then
            v7.props.Mouse:__pushCursor("PointingHand");
        end;
    end;
    v7.mouseLeave = function()
        if v7.props.Mouse then
            v7.props.Mouse:__popCursor();
        end;
    end;
end;
v6.willUnmount = function(v8)
    v8.props.Mouse:__resetCursor();
end;
v6.render = function(v9)
    local l_props_0 = v9.props;
    local l_state_0 = v9.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v1.createElement("ImageButton", {
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderColor3 = l_Stylizer_0.borderColor, 
        Size = UDim2.new(0, v2.SCROLL_BAR_SIZE, 0, v2.TIMELINE_HEIGHT), 
        Image = l_Stylizer_0.settingsButtonTheme.image, 
        ScaleType = Enum.ScaleType.Fit, 
        ImageColor3 = l_Stylizer_0.settingsButtonTheme.imageColor, 
        AutoButtonColor = false, 
        [v1.Event.Activated] = v9.showMenu, 
        [v1.Event.MouseEnter] = v9.mouseEnter, 
        [v1.Event.MouseLeave] = v9.mouseLeave
    }, {
        SettingsMenu = v1.createElement(v5, {
            ShowMenu = l_state_0.showMenu, 
            OnMenuOpened = v9.hideMenu, 
            OnChangeFPS = l_props_0.OnChangeFPS, 
            OnChangeGridSpeed = l_props_0.OnChangeGridSpeed, 
            OnChangePlaybackSpeed = l_props_0.OnChangePlaybackSpeed
        })
    });
end;
return (l_withContext_0({
    Mouse = l_ContextServices_0.Mouse, 
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
