local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.AvatarToolsShared);
local v3 = require(l_Parent_0.Packages.Framework);
local l_PreviewAvatarWheel_0 = v2.Components.PreviewAvatarWheel;
local l_PreviewContext_0 = v2.Contexts.PreviewContext;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v1.PureComponent:extend("InExperiencePreviewerFrame");
v8.init = function(v9)
    v9.state = {
        index = 1
    };
end;
v8.didMount = function(v10)
    local l_PreviewContext_1 = v10.props.PreviewContext;
    v10.modelSelectionChangedHandle = l_PreviewContext_1:getPreviewModelChangedSignal():Connect(function()
        v10:setState({
            index = l_PreviewContext_1:getCurrentPreviewAvatarIndex()
        });
    end);
end;
v8.render = function(v12)
    local l_props_0 = v12.props;
    return v1.createElement("ScreenGui", {
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        AvatarSelection = v1.createElement(l_PreviewAvatarWheel_0, {
            PreviewAvatars = l_props_0.PreviewContext:getAvatars(), 
            SelectedIndex = v12.state.index, 
            Size = l_props_0.Stylizer.Size, 
            Position = UDim2.fromScale(0.5, 1), 
            AnchorPoint = Vector2.new(0.5, 1), 
            Capacity = 3
        })
    });
end;
v8.willUnmount = function(v14)
    if v14.modelSelectionChangedHandle then
        v14.modelSelectionChangedHandle:Disconnect();
        v14.modelSelectionChangedHandle = nil;
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    PreviewContext = l_PreviewContext_0
})(v8));
