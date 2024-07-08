local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_0.Core.Components.RoundFrame);
local v9 = require(l_Parent_0.Core.Components.ImageWithDefault);
local v10 = v2.PureComponent:extend("DefaultThumbnailPreview");
v10.getName = function(v11)
    if v11.props.instances and #v11.props.instances > 0 then
        return v11.props.instances[1].Name;
    else
        return "";
    end;
end;
v10.render = function(v12)
    local l_props_0 = v12.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v15 = l_props_0.title or v12:getName();
    local v16 = true;
    if l_props_0.ShowTitle ~= nil then
        v16 = l_props_0.showTitle;
    end;
    local v17 = l_props_0.Position or UDim2.new(1, 0, 1, 0);
    local v18 = l_props_0.titleHeight or 24;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = v17, 
        LayoutOrder = l_props_0.LayoutOrder or 1
    }, {
        PreviewFrame = v2.createElement(v8, {
            BackgroundColor3 = l_Stylizer_0.thumbnailPreview.background, 
            BorderColor3 = l_Stylizer_0.thumbnailPreview.border, 
            Size = not not v16 and UDim2.new(1, 0, 1, -(v18 + (l_props_0.titlePadding or 12))) or UDim2.new(1, 0, 1, 0)
        }, {
            Thumbnail = v2.createElement(v9, {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/StudioToolbox/Animation.png", 
                defaultImage = ""
            })
        }), 
        Title = v16 and v2.createElement("TextLabel", {
            Text = v15, 
            Font = v5.FONT, 
            TextSize = v5.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.thumbnailPreview.text, 
            Position = UDim2.new(0, 0, 1, -v18), 
            Size = UDim2.new(1, 0, 0, v18), 
            BackgroundTransparency = 1
        })
    });
end;
return v3.connect(function(v19, _)
    return {
        instances = (v19 or {}).instances
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10)));
