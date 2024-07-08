local v0 = require(script.Parent.Parent.Parent.Parent.Packages.React);
local l_ContentProvider_0 = game:GetService("ContentProvider");
local function _(v2, v3)
    return "rbxthumb://type=AvatarHeadShot" .. "&id=" .. v2 .. "&w=" .. v3.X .. "&h=" .. v3.Y;
end;
local v5 = v0.Component:extend(script.Name);
v5.init = function(v6)
    v6.state = {
        fetchStatus = nil, 
        contentId = nil
    };
    v6.fetchingContentId = nil;
    v6.currentId = nil;
    v6.updateThumbnail = function()
        local l_Id_0 = v6.props.Id;
        local v8 = Vector2.new(60, 60);
        local v9 = "rbxthumb://type=AvatarHeadShot" .. "&id=" .. l_Id_0 .. "&w=" .. v8.X .. "&h=" .. v8.Y;
        if l_Id_0 ~= v6.currentId then
            v6.currentId = l_Id_0;
            v6:setState({
                fetchStatus = v0.None, 
                contentId = v9
            });
        end;
        if v9 ~= v6.state.contentId then
            v6.loadThumbnail(v9);
        end;
    end;
    v6.loadThumbnail = function(v10)
        if v10 == v6.fetchingContentId then
            return ;
        else
            v6.fetchingContentId = v10;
            coroutine.wrap(function()
                l_ContentProvider_0:PreloadAsync({
                    v10
                }, function(v11, v12)
                    if v6.fetchingContentId == v11 then
                        v6.fetchingContentId = nil;
                        v6:setState({
                            fetchStatus = v12, 
                            contentId = v11
                        });
                    end;
                end);
            end)();
            return ;
        end;
    end;
end;
v5.didUpdate = function(v13, v14, _)
    if v14.Id ~= v13.props.Id then
        v13.updateThumbnail();
    end;
end;
v5.didMount = function(v16)
    v16.updateThumbnail();
end;
v5.render = function(v17)
    local l_props_0 = v17.props;
    local l_state_0 = v17.state;
    return l_props_0.RenderContents(l_state_0.contentId, l_state_0.fetchStatus);
end;
return v5;
