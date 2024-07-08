local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local v6 = require(l_Parent_0.Src.Util.SliceRectUtil);
local v7 = require(l_Parent_0.Src.Components.SliceEditorMain);
local v8 = v1.PureComponent:extend("SliceEditorTestWrapper");
v8.init = function(v9, v10)
    v9.state = {
        sliceRect = v10.sliceRect
    };
end;
v8.didMount = function(v11)
    local l_selectedObject_0 = v11.props.selectedObject;
    v11.sliceCenterChangedSignal = l_selectedObject_0:GetPropertyChangedSignal("SliceCenter"):Connect(function()
        v11:setState({
            sliceRect = v6.getSliceRectFromSliceCenter(l_selectedObject_0.SliceCenter)
        });
    end);
end;
v8.willUnmount = function(v13)
    if v13.sliceCenterChangedSignal then
        v13.sliceCenterChangedSignal:Disconnect();
        v13.sliceCenterChangedSignal = nil;
    end;
end;
v8.render = function(v14)
    local l_props_0 = v14.props;
    return v1.createElement(v7, {
        selectedObject = l_props_0.selectedObject, 
        pixelDimensions = l_props_0.pixelDimensions, 
        onClose = function()
        end, 
        sliceRect = v14.state.sliceRect, 
        revertSliceRect = l_props_0.sliceRect
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v8));
