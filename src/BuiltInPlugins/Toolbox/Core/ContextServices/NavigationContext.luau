local l_Parent_0 = script.Parent.Parent.Parent;
local l_ContextItem_0 = require(l_Parent_0.Packages.Framework).ContextServices.ContextItem;
local v2 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagFixSwimlaneAnalytics);
local v3 = l_ContextItem_0:extend("NavigationContext");
v3.new = function(v4)
    local v5 = {
        navigation = {
            push = function()
            end, 
            pop = function()
            end, 
            popToTop = function()
            end
        }, 
        observedNavStack = {
            v4
        }, 
        observedRouteStack = {
            v4
        }, 
        rootRoute = v4
    };
    setmetatable(v5, v3);
    return v5;
end;
v3.updateNavigation = function(v6, v7)
    v6.navigation = v7;
end;
v3.get = function(v8)
    return v8;
end;
v3.push = function(v9, v10, v11, v12)
    table.insert(v9.observedNavStack, v11);
    if v2() then
        table.insert(v9.observedRouteStack, v10);
    end;
    v9.navigation.push(v10, v12);
end;
v3.pop = function(v13)
    table.remove(v13.observedNavStack, #v13.observedNavStack);
    if #v13.observedNavStack <= 0 then
        v13.observedNavStack = {
            v13.rootRoute
        };
    end;
    if v2() then
        table.remove(v13.observedRouteStack, #v13.observedRouteStack);
        if #v13.observedRouteStack <= 0 then
            v13.observedRouteStack = {
                v13.rootRoute
            };
        end;
    end;
    v13.navigation.pop();
end;
v3.popToTop = function(v14)
    v14.observedNavStack = {
        v14.rootRoute
    };
    if v2() then
        v14.observedRouteStack = {
            v14.rootRoute
        };
    end;
    v14.navigation.popToTop();
end;
v3.getBreadcrumbRoute = function(v15)
    return v15.observedNavStack;
end;
v3.getNavigationRoute = function(v16)
    return v16.observedRouteStack;
end;
v3.getCurrentPath = function(v17)
    return v17.observedNavStack[#v17.observedNavStack];
end;
return v3;
