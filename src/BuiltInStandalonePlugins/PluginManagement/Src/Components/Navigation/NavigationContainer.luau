local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactNavigation);
local v3 = require(l_Parent_0.Src.Components.Navigation.NavigatableView);
local v4 = require(l_Parent_0.Src.Components.ManagementMainView);
local v5 = require(l_Parent_0.Src.Components.PluginDetails.PluginDetailsView);
local v6 = require(l_Parent_0.Src.Util.Constants);
local _ = function(v7)
    return function(_)
        return v2.withNavigation(function(v9, v10)
            return v1.createElement(v3, {
                navigation = v9
            }, v7(v9, v10));
        end);
    end;
end;
local v12 = {};
local l_Main_0 = v6.APP_PAGE.Main;
local function v16(v14, _)
    return v1.createElement(v4, {
        navigation = v14
    });
end;
local l_v16_0 = v16 --[[ copy: 11 -> 12 ]];
v12[l_Main_0] = function(_)
    return v2.withNavigation(function(v19, v20)
        return v1.createElement(v3, {
            navigation = v19
        }, l_v16_0(v19, v20));
    end);
end;
l_Main_0 = v6.APP_PAGE.Detail;
v16 = function(v21, _)
    return v1.createElement(v5, {
        assetId = v21.getParam("assetId"), 
        navigation = v21, 
        Size = UDim2.new(1, 0, 1, 0)
    });
end;
v12[l_Main_0] = function(_)
    return v2.withNavigation(function(v24, v25)
        return v1.createElement(v3, {
            navigation = v24
        }, v16(v24, v25));
    end);
end;
return v2.createAppContainer((v2.createStackNavigator({
    routes = v12, 
    initialRouteName = v6.APP_PAGE.Main
})));
