local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Src.Util.ActivityHistoryEventTranslated);
local v4 = require(l_Parent_0.Src.Contexts.ActivityHistoryContext);
local v5 = require(l_Parent_0.Src.Util.BaseUrls);
local l_UI_0 = v2.UI;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Analytics_0 = v2.ContextServices.Analytics;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_joinTags_0 = v2.Styling.joinTags;
local v11 = v2.Util.LayoutOrderIterator.new();
local v19 = {
    Universe = function(v12)
        return (("rbxthumb://type=GameIcon&id=%*&w=50&h=50"):format(v12));
    end, 
    Place = function(v13)
        return (("rbxthumb://type=Asset&id=%*&w=150&h=150"):format(v13));
    end, 
    User = function(v14)
        return (("rbxthumb://type=AvatarHeadShot&id=%*&w=48&h=48"):format(v14));
    end, 
    Badge = function(v15)
        return (("rbxthumb://type=BadgeIcon&id=%*&w=150&h=150"):format(v15));
    end, 
    DeveloperProduct = function(_)
        return "";
    end, 
    GamePass = function(v17)
        return (("rbxthumb://type=GamePass&id=%*&w=150&h=150"):format(v17));
    end, 
    Group = function(v18)
        return (("rbxthumb://type=GroupIcon&id=%*&w=150&h=150"):format(v18));
    end
};
local v34 = {
    Universe = function(_, v21)
        return v5.createPath .. "dashboard/creations/experiences/" .. tostring(v21) .. "/overview";
    end, 
    Place = function(_, v23)
        return v5.wwwPath .. "games/" .. tostring(v23);
    end, 
    User = function(_, v25)
        return v5.wwwPath .. "users/" .. tostring(v25) .. "/profile";
    end, 
    Badge = function(_, v27)
        return v5.createPath .. "dashboard/creations/experiences/" .. tostring(v27) .. "/badges/" .. tostring(v27) .. "/overview";
    end, 
    DeveloperProduct = function(_, v29)
        return v5.createPath .. "dashboard/creations/experiences/" .. tostring(v29) .. "/developer-products/" .. tostring(v29) .. "/configure";
    end, 
    GamePass = function(_, v31)
        return v5.createPath .. "dashboard/creations/experiences/" .. tostring(v31) .. "/passes/" .. tostring(v31) .. "/configure";
    end, 
    Group = function(_, v33)
        return v5.wwwPath .. "groups/" .. tostring(v33);
    end
};
local function _(v35, v36)
    local v37 = tostring(v36);
    if not v19[v35] then
        return "";
    else
        return v19[v35](v37);
    end;
end;
local function _(v39)
    if v39 == "User" then
        return true;
    else
        return false;
    end;
end;
local function v68(v41)
    local v42 = l_Localization_0:use();
    local v43 = l_Analytics_0:use();
    local v44 = v1.useContext(v4);
    local v45, v46 = v1.useState(false);
    local v47 = true;
    if v41.Bubble.viewBasicSettingsLink == nil then
        v47 = v41.Bubble.viewOnRobloxLink ~= nil;
    end;
    local v49 = v1.useMemo(function()
        local v48 = {};
        if v41.Bubble.viewBasicSettingsLink then
            table.insert(v48, v42:getText("Bubble", "ViewOnCreatorDashboard"));
        end;
        if v41.Bubble.viewOnRobloxLink then
            table.insert(v48, v42:getText("Bubble", "ViewOnRoblox"));
        end;
        return v48;
    end, {
        v41.Bubble.viewBasicSettingsLink, 
        v41.Bubble.viewOnRobloxLink
    });
    local v51 = v1.useMemo(function()
        local v50 = {};
        if v41.Bubble.viewBasicSettingsLink then
            table.insert(v50, {
                type = "viewBasicSetting", 
                link = v41.Bubble.viewBasicSettingsLink
            });
        end;
        if v41.Bubble.viewOnRobloxLink then
            table.insert(v50, {
                type = "viewOnRoblox", 
                link = v41.Bubble.viewOnRobloxLink
            });
        end;
        return v50;
    end, {
        v41.Bubble.viewBasicSettingsLink, 
        v41.Bubble.viewOnRobloxLink
    });
    local function v54(_, v53)
        v46(false);
        if v51[v53] then
            v43:report("deeplink", v41.Bubble.eventType, v51[v53].type);
            v44.openBrowserLink(v51[v53].link);
        end;
    end;
    local function v55()
        v46(false);
    end;
    local function v56()
        v46(true);
    end;
    local v57 = v34[v41.Bubble.iconType];
    local v58 = nil;
    if not v57 then
        local l_createElement_0 = v1.createElement;
        local v60 = "ImageLabel";
        local v61 = {
            [v1.Tag] = not not (v41.Bubble.iconType == "User") and l_joinTags_0("RoundIcon") or l_joinTags_0("SquareIcon")
        };
        local l_iconType_0 = v41.Bubble.iconType;
        v61.Image = not v19[l_iconType_0] and "" or v19[l_iconType_0]((tostring(v41.Bubble.iconId)));
        v61.LayoutOrder = v11:getNextOrder();
        v58 = l_createElement_0(v60, v61);
    else
        local l_createElement_1 = v1.createElement;
        local v64 = "ImageButton";
        local v65 = {
            [v1.Tag] = not not (v41.Bubble.iconType == "User") and l_joinTags_0("RoundIcon") or l_joinTags_0("SquareIcon")
        };
        local l_iconType_1 = v41.Bubble.iconType;
        v65.Image = not v19[l_iconType_1] and "" or v19[l_iconType_1]((tostring(v41.Bubble.iconId)));
        v65.LayoutOrder = v11:getNextOrder();
        v65[v1.Event.Activated] = function()
            v43:report("deeplink", v41.Bubble.eventType, v41.Bubble.iconType);
            v44.openBrowserLink(v57(v41.Bubble.universeId, v41.Bubble.iconId));
        end;
        v58 = l_createElement_1(v64, v65);
    end;
    local function v67()
        v43:report("deeplink", v41.Bubble.eventType, "actorProfile");
        v44.openBrowserLink(v34.User(tostring(v41.Bubble.universeId), (tostring(v41.Bubble.actorId))));
    end;
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("Component-ActivityHistoryBubble", "X-Row")
    }, {
        Left = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("CX-Invisible"), 
            LayoutOrder = v11:getNextOrder()
        }, {
            Icon = v58
        }), 
        Right = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("X-Column", "CX-Invisible"), 
            LayoutOrder = v11:getNextOrder()
        }, {
            Top = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
                LayoutOrder = v11:getNextOrder()
            }, {
                Date = v1.createElement("TextLabel", {
                    LayoutOrder = v11:getNextOrder(), 
                    Text = v41.Bubble.date
                }), 
                DotDotDot = if v47 then v1.createElement("Frame", {
                    [v1.Tag] = l_joinTags_0("CX-Invisible"), 
                    LayoutOrder = v11:getNextOrder()
                }, {
                    Dropdown = v1.createElement(l_DropdownMenu_0, {
                        Items = v49, 
                        Hide = not v45, 
                        OnItemActivated = v54, 
                        OnFocusLost = v55, 
                        Width = 240
                    }), 
                    Button = v1.createElement("ImageButton", {
                        [v1.Tag] = l_joinTags_0("X-Fill"), 
                        LayoutOrder = v11:getNextOrder(), 
                        AutoButtonColor = true, 
                        [v1.Event.Activated] = v56
                    })
                }) else nil
            }), 
            Middle = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("CX-Invisible"), 
                LayoutOrder = v11:getNextOrder()
            }, {
                v1.createElement("TextLabel", {
                    [v1.Tag] = l_joinTags_0("X-Fill"), 
                    RichText = true, 
                    Text = v41.Bubble.translation
                })
            }), 
            MiddlePadding = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("CX-Invisible"), 
                LayoutOrder = v11:getNextOrder()
            }), 
            Bottom = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
                LayoutOrder = v11:getNextOrder()
            }, {
                Icon = v1.createElement("ImageButton", {
                    Image = not v19.User and "" or v19.User((tostring(v41.Bubble.actorId))), 
                    LayoutOrder = v11:getNextOrder(), 
                    [v1.Event.Activated] = v67
                }), 
                TargetName = v1.createElement("TextButton", {
                    LayoutOrder = v11:getNextOrder(), 
                    Text = "  " .. v41.Bubble.actorName, 
                    [v1.Event.Activated] = v67
                })
            })
        })
    });
end;
local v69 = v1.PureComponent:extend("ActivityHistoryBubble");
v69.render = function(v70)
    return v1.createElement(v68, v70.props);
end;
return v69;
