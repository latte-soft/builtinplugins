local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Enums.NotificationTargetType);
local v2 = require(l_Parent_0.Src.Resources.NotificationLuaIcons);
local v3 = {};
for _, v5 in ipairs(v2) do
    v3[v5] = ("Plugin-Icon-%*"):format(v5);
end;
local v8 = {
    [v1.Universe] = function(v6)
        return (("rbxthumb://type=GameIcon&id=%*&w=50&h=50"):format(v6));
    end, 
    [v1.User] = function(v7)
        return (("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format(v7));
    end
};
return {
    getDynamicIconPath = function(v9, v10)
        if not v8[v10] then
            return nil;
        else
            return v8[v10](v9);
        end;
    end, 
    getReadStatusIconTag = function(v11, v12)
        if not v12 then
            if not v11 then
                return "Plugin-Icon-StatusUnread";
            else
                return "";
            end;
        else
            return "Plugin-Icon-StatusDisabled";
        end;
    end, 
    getStaticIconTag = function(v13, v14)
        if v14 ~= v1.Static then
            return nil;
        elseif not v3[v13] then
            return "Plugin-Icon-NotificationBell";
        else
            return v3[v13];
        end;
    end
};
