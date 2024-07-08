local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.AvatarToolsShared);
local v4 = require(l_Parent_0.Src.Actions.SetDocked);
local v5 = require(l_Parent_0.Src.Thunks.UpdatePreviewAssetsSelected);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v6.Util;
local _ = l_Util_0.LayoutOrderIterator;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_Pane_0 = v6.UI.Pane;
local l_Components_0 = v3.Components;
local l_PreviewDockWidget_0 = l_Components_0.PreviewDockWidget;
local l_PreviewViewportFrame_0 = l_Components_0.PreviewViewportFrame;
local _ = v3.Util.AccessoryAndBodyToolShared.PreviewingInfo;
local v17 = v1.PureComponent:extend("PreviewViewportFrameContainer");
l_Typecheck_0.wrap(v17, script);
v17.init = function(v18)
    v18.onPoppedOut = function()
        v18.props.SetDocked(false);
    end;
    v18.onWidgetClosed = function()
        v18.props.SetDocked(true);
    end;
end;
v17.render = function(v19)
    local l_props_0 = v19.props;
    local l_Docked_0 = l_props_0.Docked;
    local _ = l_props_0.SetDocked;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v25 = {
        OnCapacityReached = v19.props.UpdatePreviewAssetsSelected
    };
    if not l_Docked_0 then
        v25.OnClose = v19.onWidgetClosed;
        return v1.createElement(l_PreviewDockWidget_0, v25);
    else
        v25.ShowPopoutButton = l_Docked_0;
        v25.OnPopoutClicked = v19.onPoppedOut;
        return v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.PreviewViewportFrameHeight), 
            LayoutOrder = l_LayoutOrder_0
        }, {
            PreviewViewportFrame = v1.createElement(l_PreviewViewportFrame_0, v25)
        });
    end;
end;
return v2.connect(function(v26, _)
    local l_previewStatus_0 = v26.previewStatus;
    local _ = v26.animation;
    return {
        Docked = l_previewStatus_0.docked
    };
end, function(v30)
    return {
        SetDocked = function(v31)
            v30(v4(v31));
        end, 
        UpdatePreviewAssetsSelected = function(v32)
            v30(v5(v32, false));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v17)));
