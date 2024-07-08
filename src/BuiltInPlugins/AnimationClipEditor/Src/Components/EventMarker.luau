local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_script_FirstAncestor_0.Src.Components.Tooltip);
local v6 = v1.PureComponent:extend("EventMarker");
v6.getTooltip = function(_, v8)
    local v9 = "";
    for v10, v11 in ipairs(v8) do
        v9 = v9 .. v11;
        if v10 ~= #v8 then
            v9 = v9 .. ", ";
        end;
    end;
    return v9;
end;
v6.render = function(v12)
    local l_props_0 = v12.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Selected_0 = l_props_0.Selected;
    local l_Names_0 = l_props_0.Names;
    local l_eventMarker_0 = l_Stylizer_0.eventMarker;
    return v1.createElement("ImageButton", {
        Size = v2.EVENT_MARKER_SIZE, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = l_props_0.Position, 
        ZIndex = l_props_0.ZIndex, 
        BackgroundTransparency = 1, 
        AutoButtonColor = false, 
        ImageColor3 = l_eventMarker_0.imageColor, 
        Image = l_eventMarker_0.mainImage, 
        [v1.Event.MouseButton2Click] = l_props_0.OnRightClick, 
        [v1.Event.InputBegan] = l_props_0.OnInputBegan, 
        [v1.Event.InputEnded] = l_props_0.OnInputEnded
    }, {
        Tooltip = l_Names_0 and v1.createElement(v5, {
            Text = v12:getTooltip(l_Names_0), 
            ShowDelay = 0
        }), 
        Border = v1.createElement("ImageLabel", {
            Size = v2.EVENT_MARKER_SIZE, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            BackgroundTransparency = 1, 
            ImageColor3 = not not l_Selected_0 and l_eventMarker_0.selectionBorderColor or l_eventMarker_0.borderColor, 
            Image = l_eventMarker_0.borderImage
        }), 
        SelectionBorder = l_Selected_0 and v1.createElement("ImageLabel", {
            Size = v2.EVENT_MARKER_BORDER_SIZE, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            BackgroundTransparency = 1, 
            ImageColor3 = l_eventMarker_0.selectionBorderColor, 
            Image = l_eventMarker_0.selectionBorderImage
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
