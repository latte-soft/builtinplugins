local l_Parent_0 = script.Parent.Parent.Parent;
local l_Selection_0 = game:GetService("Selection");
local l_CoreGui_0 = game:GetService("CoreGui");
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Src.Utility.renderAlignObjectsPreview);
local v6 = require(l_Parent_0.Src.Utility.RelativeTo);
local v7 = v3.PureComponent:extend("AlignObjectsPreview");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local v10 = nil;
    if l_props_0.relativeTo == v6.Active then
        v10 = l_Selection_0.ActiveInstance;
    end;
    return v3.createElement(v3.Portal, {
        target = l_CoreGui_0
    }, {
        AlignToolPreviewUI = v3.createElement("Folder", {}, {
            Elements = v5(l_props_0.objects, l_props_0.space, l_props_0.axes, l_props_0.mode, v10)
        })
    });
end;
return v4.connect(function(v11, _)
    return {
        objects = v11.alignableObjects, 
        mode = v11.alignmentMode, 
        space = v11.alignmentSpace, 
        axes = v11.enabledAxes, 
        relativeTo = v11.relativeTo, 
        alignEnabled = v11.alignEnabled
    };
end, nil)(v7);
