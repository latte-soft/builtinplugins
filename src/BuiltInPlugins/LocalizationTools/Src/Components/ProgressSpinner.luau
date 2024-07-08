local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = v1.PureComponent:extend("ProgressSpinner");
local function v9(v6)
    local v7 = false;
    local v8 = {
        bail = function()
            v7 = true;
        end
    };
    spawn(function()
        while not v7 do
            wait(0.01);
            v6.Rotation = v6.Rotation + 7;
        end;
    end);
    return v8;
end;
v5.init = function(v10)
    v10.progressSpinnerRef = v1.createRef();
end;
v5.didUpdate = function(v11)
    local l_current_0 = v11.progressSpinnerRef.current;
    if v11._currentSpinnerTask then
        v11._currentSpinnerTask.bail();
    end;
    if l_current_0 then
        v11._currentSpinnerTask = v9(l_current_0);
    end;
end;
v5.willUnmount = function(v13)
    if v13._currentSpinnerTask then
        v13._currentSpinnerTask.bail();
    end;
end;
v5.render = function(v14)
    local l_props_0 = v14.props;
    local l_IsBusy_0 = l_props_0.IsBusy;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return l_IsBusy_0 and v1.createElement("ImageLabel", {
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        Size = UDim2.new(0, l_Stylizer_0.Size, 0, l_Stylizer_0.Size), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ZIndex = 10, 
        Image = l_Stylizer_0.ProgressSpinnerImageUrl, 
        ImageRectSize = Vector2.new(l_Stylizer_0.ImageRectSize, l_Stylizer_0.ImageRectSize), 
        ImageRectOffset = Vector2.new(0.5, 0.5), 
        [v1.Ref] = v14.progressSpinnerRef
    });
end;
return v2.connect(function(v18, _)
    return {
        IsBusy = v18.CloudTable.IsBusy
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5)));
