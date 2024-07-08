local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Roact);
local l_withContext_0 = v1.ContextServices.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local v6 = v3.PureComponent:extend("ToggleButton");
v6.init = function(v7, _)
    v7.toggle = function()
        if not v7.props.Disabled then
            v7.props.SetIsOn(not v7.props.IsOn);
        end;
    end;
end;
v6.render = function(v9)
    local v10 = v9.props.LayoutOrder or nil;
    local v11 = v9.props.Position or UDim2.new(0, 0, 0, 0);
    local l_Size_0 = v9.props.Size;
    local l_IsOn_0 = v9.props.IsOn;
    return v3.createElement("ImageButton", {
        Position = v11, 
        LayoutOrder = v10, 
        Size = l_Size_0, 
        Image = (not not v9.props.Disabled and (l_IsOn_0 and v9.props.DisabledOnImage or v9.props.DisabledOffImage) or l_IsOn_0 and v9.props.OnImage) or v9.props.OffImage, 
        BackgroundTransparency = 1, 
        [v3.Event.Activated] = v9.toggle
    });
end;
local v14 = v3.PureComponent:extend("ToggleButton");
v14.render = function(v15)
    local v16 = v15.props.Theme:get();
    return v3.createElement(v6, (v2.Dictionary.join(v15.props, {
        OnImage = v16.toggleTheme.toggleOnImage, 
        OffImage = v16.toggleTheme.toggleOffImage, 
        DisabledOnImage = v16.toggleTheme.toggleLockModeOnImage, 
        DisabledOffImage = v16.toggleTheme.toggleLockModeOffImage, 
        Size = UDim2.new(0, 27, 0, 16)
    })));
end;
v14 = l_withContext_0({
    Theme = v5.DEPRECATED_Theme
})(v14);
local v17 = v3.PureComponent:extend("PickerButton");
v17.render = function(v18)
    local v19 = v18.props.Theme:get();
    return v3.createElement(v6, (v2.Dictionary.join(v18.props, {
        OnImage = v19.brushSettingsTheme.pickHeightEnableImage, 
        OffImage = v19.brushSettingsTheme.pickHeightDisableImage, 
        Size = UDim2.new(0, 18, 0, 18)
    })));
end;
return {
    ToggleButton = v14, 
    PickerButton = l_withContext_0({
        Theme = v5.DEPRECATED_Theme
    })(v17)
};
