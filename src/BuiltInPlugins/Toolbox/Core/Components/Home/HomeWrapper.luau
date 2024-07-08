local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Parent_0.Core.Networking.Requests.GetHomeConfigurationRequest);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v9 = require(l_Parent_0.Core.Types.Category);
local _ = require(l_Parent_0.Core.Types.HomeTypes);
local v11 = require(l_Parent_0.Core.Types.Sort);
local v12 = require(l_Parent_0.Core.Components.Home.NavigationContainer);
local l_deepEqual_0 = require(l_Packages_0.Framework).Util.deepEqual;
local v14 = v2.Component:extend("HomeWrapper");
v14.defaultProps = {
    CategoryName = v9.FREE_MODELS.name, 
    SortName = v11.getDefaultSortNameForCategory(v9.FREE_MODELS.name)
};
v14.shouldUpdate = function(v15, v16, _)
    local l_props_0 = v15.props;
    local l_AssetType_0 = l_props_0.AssetType;
    local l_homeConfiguration_0 = l_props_0.homeConfiguration;
    local v21 = true;
    if l_AssetType_0 == v16.AssetType then
        v21 = not l_deepEqual_0(l_homeConfiguration_0, v16.homeConfiguration);
    end;
    return v21;
end;
v14.render = function(v22)
    local l_props_1 = v22.props;
    local l_AssetType_1 = l_props_1.AssetType;
    local l_CategoryName_0 = l_props_1.CategoryName;
    local v26 = l_props_1.homeConfiguration[l_AssetType_1.Name];
    local l_SortName_0 = l_props_1.SortName;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_TryOpenAssetConfig_0 = l_props_1.TryOpenAssetConfig;
    if v26 == nil then
        return nil;
    else
        local v30 = {};
        local v31 = {};
        if v26 then
            for _, v33 in pairs(v26.sections) do
                if v33.name == "categories" and v33.subcategory ~= nil then
                    v31 = v33.subcategory.children;
                else
                    table.insert(v30, v33);
                end;
            end;
        end;
        return v2.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            BorderSizePixel = 0, 
            Position = l_props_1.Position, 
            Size = l_props_1.Size
        }, {
            Navigation = v2.createElement(v12, {
                AssetType = l_AssetType_1, 
                CategoryName = l_CategoryName_0, 
                Config = v26, 
                MaxWidth = l_props_1.MaxWidth, 
                SortName = l_SortName_0, 
                AssetSections = v30, 
                SubcategoryDict = v31, 
                TopKeywords = v26.topKeywords, 
                TryOpenAssetConfig = l_TryOpenAssetConfig_0
            })
        });
    end;
end;
v14.didMount = function(v34)
    for _, v36 in ipairs(v34.props.EnabledAssetTypes) do
        if v34.props.homeConfiguration[v36.Name] == nil then
            v34.props.getHomeConfigurationRequest(v34.props.Network.networkInterface, v36, v34.props.Locale);
        end;
    end;
end;
return v3.connect(function(v37, _)
    return {
        homeConfiguration = (v37 or {}).homeConfiguration or {}
    };
end, function(v39)
    return {
        getHomeConfigurationRequest = function(v40, v41, v42)
            v39(v5(v40, v41, v42));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Network = v8
})(v14)));
