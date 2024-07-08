local v0 = require(script.Parent.Parent.Parent.Parent.Packages.Roact);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local v2 = {
    GroupIcon = {
        Vector2.new(150, 150), 
        Vector2.new(420, 420)
    }, 
    AvatarHeadShot = {
        Vector2.new(48, 48), 
        Vector2.new(60, 60), 
        Vector2.new(150, 150)
    }, 
    Avatar = {
        Vector2.new(100, 100), 
        Vector2.new(352, 352), 
        Vector2.new(720, 720)
    }, 
    GameIcon = {
        Vector2.new(50, 50), 
        Vector2.new(128, 128), 
        Vector2.new(150, 150), 
        Vector2.new(256, 256), 
        Vector2.new(512, 512)
    }, 
    BadgeIcon = {
        Vector2.new(150, 150)
    }, 
    GamePass = {
        Vector2.new(150, 150)
    }, 
    Asset = {
        Vector2.new(150, 150), 
        Vector2.new(420, 420)
    }, 
    BundleThumbnail = {
        Vector2.new(150, 150), 
        Vector2.new(420, 420)
    }, 
    Outfit = {
        Vector2.new(150, 150), 
        Vector2.new(420, 420)
    }
};
local function v9(v3, v4)
    local v5 = v2[v3];
    local v6 = v5[1];
    for v7 = 2, #v5 do
        local v8 = v5[v7];
        if math.abs(v4.Magnitude - v8.Magnitude) < math.abs(v4.Magnitude - v6.Magnitude) then
            v6 = v8;
        end;
    end;
    return v6;
end;
local function _(v10, v11, v12)
    return "rbxthumb://type=" .. v10 .. "&id=" .. v11 .. "&w=" .. v12.X .. "&h=" .. v12.Y;
end;
local function _(v14, v15)
    return "https://www.roblox.com/asset-thumbnail/image?width=" .. v15.X .. "&height=" .. v15.Y .. "&format=png&assetId=" .. v14;
end;
local v17 = v0.Component:extend(script.Name);
v17.init = function(v18)
    v18.state = {
        fetchStatus = nil, 
        contentId = nil
    };
    v18.ref = v0.createRef();
    v18.fetchingContentId = nil;
    v18.currentId = nil;
    v18.currentThumbnailType = nil;
    v18.updateThumbnail = function()
        local l_props_0 = v18.props;
        local l_ThumbnailType_0 = l_props_0.ThumbnailType;
        local l_Id_0 = l_props_0.Id;
        local l_UseAssetThumbnailUrl_0 = l_props_0.UseAssetThumbnailUrl;
        local l_ref_0 = v18.ref;
        if l_ref_0:getValue() then
            local v24 = v9(l_ThumbnailType_0, l_ref_0:getValue().AbsoluteSize);
            local v25 = nil;
            v25 = if not l_UseAssetThumbnailUrl_0 then "rbxthumb://type=" .. l_ThumbnailType_0 .. "&id=" .. l_Id_0 .. "&w=" .. v24.X .. "&h=" .. v24.Y else "https://www.roblox.com/asset-thumbnail/image?width=" .. v24.X .. "&height=" .. v24.Y .. "&format=png&assetId=" .. l_Id_0;
            if not (l_Id_0 == v18.currentId) or l_ThumbnailType_0 ~= v18.currentThumbnailType then
                v18.currentId = l_Id_0;
                v18.currentThumbnailType = l_ThumbnailType_0;
                v18:setState({
                    fetchStatus = v0.None, 
                    contentId = v25
                });
            end;
            if v25 ~= v18.state.contentId then
                v18.loadThumbnail(v25);
            end;
            return ;
        else
            return ;
        end;
    end;
    v18.loadThumbnail = function(v26)
        if v26 == v18.fetchingContentId then
            return ;
        else
            v18.fetchingContentId = v26;
            coroutine.wrap(function()
                l_ContentProvider_0:PreloadAsync({
                    v26
                }, function(v27, v28)
                    local v29 = v18.ref:getValue() ~= nil;
                    if not (not (v18.fetchingContentId == v27) or not v29) then
                        v18.fetchingContentId = nil;
                        v18:setState({
                            fetchStatus = v28, 
                            contentId = v27
                        });
                    end;
                end);
            end)();
            return ;
        end;
    end;
end;
v17.didUpdate = function(v30, v31, _)
    local l_props_1 = v30.props;
    local l_Id_1 = v31.Id;
    local l_Id_2 = l_props_1.Id;
    local l_ThumbnailType_1 = v31.ThumbnailType;
    local l_ThumbnailType_2 = l_props_1.ThumbnailType;
    if not (l_Id_1 == l_Id_2) or l_ThumbnailType_1 ~= l_ThumbnailType_2 then
        v30.updateThumbnail();
    end;
end;
v17.didMount = function(v38)
    v38.updateThumbnail();
end;
v17.render = function(v39)
    local l_props_2 = v39.props;
    local l_state_0 = v39.state;
    return v0.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v0.Ref] = v39.ref, 
        [v0.Change.AbsoluteSize] = v39.updateThumbnail
    }, {
        Thumbnail = l_props_2.RenderContents(l_state_0.contentId, l_state_0.fetchStatus)
    });
end;
return v17;
