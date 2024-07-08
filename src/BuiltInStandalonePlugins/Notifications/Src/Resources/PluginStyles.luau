local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local l_createStyleRule_0 = v1.Styling.createStyleRule;
local l_createStyleSheet_0 = v1.Styling.createStyleSheet;
local v4 = require(l_Parent_0.Src.Resources.NotificationLuaIcons);
local v5 = {
    l_createStyleRule_0(".Plugin-NotificationCard-Hover", {
        BackgroundColor3 = "$ForegroundMain"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover"
        }), 
        l_createStyleRule_0(":pressed", {
            BackgroundColor3 = "$ActionActivated"
        })
    }), 
    l_createStyleRule_0(".Plugin-NotificationCard-HoverDisabled", {
        BackgroundColor3 = "$ForegroundMain"
    }), 
    l_createStyleRule_0(".Plugin-Icon-StatusDisabled", {
        Image = "$NotificationStatusDisabledIcon"
    }), 
    l_createStyleRule_0(".Plugin-Icon-StatusUnread", {
        Image = "$NotificationStatusUnreadIcon"
    })
};
for _, v7 in ipairs(v4) do
    table.insert(v5, l_createStyleRule_0((".Plugin-Icon-%*"):format(v7), {
        Image = ("$%*Icon"):format(v7)
    }));
end;
return l_createStyleSheet_0("NotificationsPlugin", v5);
