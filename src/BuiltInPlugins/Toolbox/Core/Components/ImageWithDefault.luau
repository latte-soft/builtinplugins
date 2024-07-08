local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = require(l_Packages_0.Cryo);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v4 = {};
local l_Decal_0 = Instance.new("Decal");
local v6 = v1.PureComponent:extend("ImageWithDefault");
v6.init = function(v7)
    v7.imageRef = v1.createRef();
end;
v6._loadAndSetImage = function(v8)
    local l_Image_0 = v8.props.Image;
    local l_defaultImage_0 = v8.props.defaultImage;
    if ((not (l_Image_0 and l_Image_0 ~= "") or not v8.imageRef) or not v8.imageRef.current) or v8.imageRef.current.Image == l_Image_0 then
        return ;
    elseif not v4[l_Image_0] then
        v8.imageRef.current.Image = l_defaultImage_0;
        spawn(function()
            l_Decal_0.Texture = l_Image_0;
            l_ContentProvider_0:PreloadAsync({
                l_Decal_0
            });
            v4[l_Image_0] = true;
            if not (not v8.imageRef or not v8.imageRef.current) and v8.props.Image == l_Image_0 then
                v8.imageRef.current.Image = l_Image_0;
            end;
        end);
        return ;
    else
        v8.imageRef.current.Image = l_Image_0;
        return ;
    end;
end;
v6.didMount = function(v11)
    v11:_loadAndSetImage();
end;
v6.didUpdate = function(v12, v13)
    if not (v12.props.Image == v13.Image) or v12.props.defaultImage ~= v13.defaultImage then
        v12:_loadAndSetImage();
    end;
end;
v6.render = function(v14)
    local _ = nil;
    return v1.createElement("ImageLabel", (v2.Dictionary.join(v14.props, {
        [v1.Ref] = v14.imageRef, 
        Image = v2.None, 
        defaultImage = v2.None
    })));
end;
v6.mockImage = function(v16)
    v4[v16] = true;
end;
return v6;
