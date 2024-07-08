local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Parent_0.Core.Util.Images);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = v3.PureComponent:extend("CollaboratorThumbnail");
v8.init = function(v9)
    v9.state = {
        backgroundColor = nil
    };
    local function v11()
        local l_current_0 = v9.ref.current;
        if l_current_0 == nil then
            return ;
        else
            v9:setState({
                backgroundColor = l_current_0.Parent.BackgroundColor3
            });
            return ;
        end;
    end;
    v9.parentChanged = function()
        local l_current_1 = v9.ref.current;
        if l_current_1 == nil then
            return ;
        else
            if v9.colorChanged then
                v9.colorChanged:Disconnect();
                v9.colorChanged = nil;
            end;
            if l_current_1.Parent then
                v9.colorChanged = l_current_1.Parent:GetPropertyChangedSignal("BackgroundColor3"):Connect(v11);
                local l_current_2 = v9.ref.current;
                if l_current_2 == nil then
                    return ;
                else
                    v9:setState({
                        backgroundColor = l_current_2.Parent.BackgroundColor3
                    });
                end;
            end;
            return ;
        end;
    end;
    v9.ref = v3.createRef();
end;
v8.didMount = function(v14)
    v14.parentChangedSignal = v14.ref.current:GetPropertyChangedSignal("Parent"):Connect(function()
        v14.parentChanged();
    end);
    v14.parentChanged();
end;
v8.willUnmount = function(v15)
    if v15.parentChangedSignal then
        v15.parentChangedSignal:Disconnect();
        v15.parentChangedSignal = nil;
    end;
    if v15.colorChanged then
        v15.colorChanged:Disconnect();
        v15.colorChanged = nil;
    end;
end;
v8.render = function(v16)
    local l_Stylizer_0 = v16.props.Stylizer;
    local v18 = v16.props.UseMask or false;
    return v3.createElement("ImageLabel", v2.Dictionary.join(v2.Dictionary.join(v16.props, {
        UseMask = v2.None, 
        IsLoadedThumbnail = v2.None, 
        Stylizer = v2.None
    }), {
        [v3.Ref] = v16.ref, 
        ImageColor3 = not not (v16.props.IsLoadedThumbnail or false) and Color3.new(1, 1, 1) or l_Stylizer_0.assetConfig.packagePermissions.subjectThumbnail.defaultImageColor, 
        ImageTransparency = 0, 
        BackgroundColor3 = l_Stylizer_0.assetConfig.packagePermissions.subjectThumbnail.backgroundColor, 
        BackgroundTransparency = not v18 and 1 or 0, 
        BorderSizePixel = 0
    }), {
        Mask = v18 and v3.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            Image = v5.AVATAR_MASK, 
            ImageColor3 = v16.state.backgroundColor
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
