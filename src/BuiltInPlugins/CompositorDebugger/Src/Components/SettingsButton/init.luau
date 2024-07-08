local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Style.Stylizer;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v8 = require(l_Actions_0.SetActiveLayersFilter);
local v9 = require(l_Actions_0.SetLayerFilter);
local v10 = require(l_script_FirstAncestor_0.Src.Thunks.SetFrameBufferDuration);
local v11 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_showContextMenu_0 = v3.UI.showContextMenu;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v14 = v1.PureComponent:extend("SettingsButton");
v14.init = function(v15)
    v15.toggleCrossFadeFilter = function()
        local l_props_0 = v15.props;
        local v17 = l_props_0.Plugin:get();
        local l_LayerFilters_0 = l_props_0.LayerFilters;
        l_LayerFilters_0.CrossFade = not l_LayerFilters_0.CrossFade;
        l_props_0.SetLayerFilter("CrossFade", l_LayerFilters_0.CrossFade);
        v17:SetSetting(v11.SETTINGS.LayerFilters, l_LayerFilters_0);
        l_props_0.Analytics:report("onChangeSetting", "crossFadeFilter", l_LayerFilters_0.CrossFade);
    end;
    v15.toggleActiveLayersFilter = function()
        local l_props_1 = v15.props;
        local v20 = l_props_1.Plugin:get();
        local v21 = not v15.props.ActiveLayersFilter;
        v15.props.SetActiveLayersFilter(v21);
        v20:SetSetting(v11.SETTINGS.ActiveLayersFilter, v21);
        l_props_1.Analytics:report("onChangeSetting", "activeLayersFilter", v21);
    end;
    v15.onReplayDurationChanged = function(v22)
        local l_props_2 = v15.props;
        local v24 = l_props_2.Plugin:get();
        local l_Id_0 = v22.Id;
        v15.props.SetFrameBufferDuration(l_Id_0);
        v24:SetSetting(v11.SETTINGS.FrameBufferDuration, l_Id_0);
        l_props_2.Analytics:report("onChangeSetting", "frameBufferDuration", l_Id_0);
    end;
    v15.onButtonClicked = function()
        local l_props_3 = v15.props;
        local l_Localization_0 = l_props_3.Localization;
        l_showContextMenu_0(l_props_3.Plugin:get(), {
            v15:makeReplaySubmenu(), 
            {
                Id = "ToggleCrossFade", 
                Text = l_Localization_0:getText("Settings", "ToggleCrossFade"), 
                Checked = not v15.props.LayerFilters.CrossFade, 
                OnItemClicked = v15.toggleCrossFadeFilter
            }, 
            {
                Id = "ToggleActiveLayers", 
                Text = l_Localization_0:getText("Settings", "ToggleActiveLayers"), 
                Checked = v15.props.ActiveLayersFilter, 
                OnItemClicked = v15.toggleActiveLayersFilter
            }
        });
    end;
end;
v14.makeReplaySubmenu = function(v28)
    local l_props_4 = v28.props;
    local l_Localization_1 = l_props_4.Localization;
    local v31 = if not l_props_4.FrameBuffer then nil else l_props_4.FrameBuffer:getSize() / v11.FRAMERATE;
    local v32 = {};
    for v33, _ in v11.TIMECONTROLS_INVERVALS, nil, nil do
        table.insert(v32, {
            Id = v33, 
            Text = l_Localization_1:getText("Replay", "Seconds", {
                duration = v33
            }), 
            Checked = v33 == v31, 
            OnItemClicked = v28.onReplayDurationChanged
        });
    end;
    table.sort(v32, function(v35, v36)
        return v35.Id < v36.Id;
    end);
    v32.Id = "ReplayLength";
    v32.Text = l_Localization_1:getText("Settings", "ReplayLength");
    return v32;
end;
v14.render = function(v37)
    local l_props_5 = v37.props;
    local l_Stylizer_1 = l_props_5.Stylizer;
    return v1.createElement("ImageButton", {
        LayoutOrder = l_props_5.LayoutOrder, 
        Size = l_props_5.Size, 
        Position = UDim2.fromScale(1, 0.5), 
        AnchorPoint = Vector2.new(1, 0.5), 
        BackgroundTransparency = 1, 
        Image = l_Stylizer_1.Image, 
        ImageColor3 = l_Stylizer_1.Color, 
        [v1.Event.Activated] = v37.onButtonClicked
    });
end;
return (v2.connect(function(v40, _)
    return {
        ActiveLayersFilter = v40.Status.ActiveLayersFilter, 
        LayerFilters = v40.Status.LayerFilters
    };
end, function(v42)
    return {
        SetActiveLayersFilter = function(v43)
            v42(v8(v43));
        end, 
        SetFrameBufferDuration = function(v44)
            v42(v10(v44));
        end, 
        SetLayerFilter = function(v45, v46)
            v42(v9(v45, v46));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = v3.Style.Stylizer
})(v14))));
