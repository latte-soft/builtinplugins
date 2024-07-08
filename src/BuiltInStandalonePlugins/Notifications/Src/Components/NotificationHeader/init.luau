local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_Localization_0 = require(l_Parent_0.Packages.Framework).ContextServices.Localization;
local v3 = require(l_Parent_0.Src.Contexts.TrayVisibleContext);
local v4 = require(l_Parent_0.Src.Contexts.MenuVisibleContext);
local v5 = require(script.Parent.NotificationMenu);
return function(v6)
    local v7 = l_Localization_0:use();
    local v8 = v1.useContext(v3);
    local v9 = v1.useContext(v4);
    local v10 = v1.useCallback(function()
        v9.setMenuVisible(not v9.menuVisible);
    end, {
        v9
    });
    local v14 = v1.useCallback(function(_, _, _)
        v9.setMenuVisible(false);
    end, {});
    v1.useEffect(function()
        if not v8.trayVisible then
            v9.setMenuVisible(false);
        end;
    end, {
        v8.trayVisible
    });
    return v1.createElement("Frame", {
        LayoutOrder = v6.LayoutOrder, 
        [v1.Tag] = "Component-NotificationHeader"
    }, {
        Title = v1.createElement("TextLabel", {
            Text = v7:getText("Plugin", "Name")
        }), 
        MoreOptionsFrame = v1.createElement("Frame", {}, {
            MoreOptionsButton = v1.createElement("ImageButton", {
                AutoButtonColor = false, 
                [v1.Event.MouseButton1Click] = v10, 
                [v1.Tag] = "Plugin-Icon-ThreeDots"
            })
        }), 
        DropdownMenu = if not v9.menuVisible then nil else v1.createElement(v5, {
            OnDropdownMenuFocusLost = v14
        })
    });
end;
