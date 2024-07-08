local l_Parent_0 = script.Parent.Parent;
local v1 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
local v2 = require(l_Parent_0.Components.MorpherTemplate);
local v3 = v1.Component:extend("ComponentMorpherTemplateContainer");
v3.init = function(v4)
    v4.frameRef = v1.createRef();
end;
v3.render = function(v5)
    local v7 = {
        UIListLayoutVertical = v1.createElement("UIListLayout", {
            [v1.Change.AbsoluteContentSize] = function(v6)
                v5.frameRef.current.Size = UDim2.new(1, 0, 0, v6.AbsoluteContentSize.y);
            end
        })
    };
    if not (not v5.props.StateTemplates or not v5.props.StateTemplates.templates) then
        for v8, _ in pairs(v5.props.StateTemplates.templates) do
            v7[tostring(v8)] = v1.createElement(v2, {
                ThemeData = v5.props.ThemeData, 
                template = v8, 
                StateTemplates = v5.props.StateTemplates, 
                IsEnabled = v5.props.IsEnabled, 
                IsGameShutdownRequired = v5.props.IsGameShutdownRequired, 
                AssetOverrideErrors = v5.props.AssetOverrideErrors, 
                Mouse = v5.props.Mouse, 
                IsPlacePublished = v5.props.IsPlacePublished, 
                clobberTemplate = v5.props.clobberTemplate
            });
            break;
        end;
    end;
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        [v1.Ref] = v5.frameRef
    }, v7);
end;
return v3;
