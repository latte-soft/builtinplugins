local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialPresence");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local function _(v3, v4)
    return "rbxthumb://type=AvatarHeadShot" .. "&id=" .. v3 .. "&w=" .. v4.X .. "&h=" .. v4.Y .. "&filters=circular";
end;
return function(v6)
    local l_createElement_0 = v1.createElement;
    local v8 = "Frame";
    local v9 = {
        Size = v6.Size, 
        Position = v6.Position, 
        AnchorPoint = v6.AnchorPoint, 
        LayoutOrder = v6.LayoutOrder, 
        ZIndex = v6.ZIndex, 
        [v1.Tag] = l_joinTags_0("Component-CollaboratorThumbnail", v6[v1.Tag])
    };
    local v10 = {
        ActivityRing = v1.createElement("ImageLabel", {
            ImageColor3 = v6.RingColor, 
            [v1.Tag] = if not v6.IsIdle then nil else "Idle"
        })
    };
    local l_createElement_1 = v1.createElement;
    local v12 = "ImageLabel";
    local v13 = {};
    local l_UserId_0 = v6.UserId;
    local v15 = Vector2.new(60, 60);
    v13.Image = "rbxthumb://type=AvatarHeadShot" .. "&id=" .. l_UserId_0 .. "&w=" .. v15.X .. "&h=" .. v15.Y .. "&filters=circular";
    v13[v1.Tag] = if not v6.IsIdle then nil else "Idle";
    v10.Avatar = l_createElement_1(v12, v13);
    return l_createElement_0(v8, v9, v10);
end;
