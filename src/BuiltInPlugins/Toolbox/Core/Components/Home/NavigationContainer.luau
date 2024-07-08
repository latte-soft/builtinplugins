local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxFixInventoryGridSearch);
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Cryo);
local v5 = require(l_Packages_0.Roact);
local v6 = require(l_Packages_0.RoactRodux);
local v7 = require(l_script_FirstAncestor_0.Packages.RoactNavigation);
local v8 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local _ = require(l_script_FirstAncestor_0.Core.Types.Category);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v12 = require(l_Packages_0.Dash);
local v13 = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local v14 = require(l_script_FirstAncestor_0.Core.Components.Categorization.HomeView);
local v15 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioViewWrapper);
local v16 = require(l_script_FirstAncestor_0.Core.Components.Font.FontView);
local v17 = require(l_script_FirstAncestor_0.Core.Components.Categorization.ResultsView);
local v18 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SubcategoriesView);
local v19 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SubcategoriesSwimlaneView);
local v20 = require(l_script_FirstAncestor_0.Core.ContextServices.NavigationContext);
local v21 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v22 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v23 = require(l_script_FirstAncestor_0.Core.Util.Analytics.AssetAnalyticsContextItem);
local v24 = require(l_script_FirstAncestor_0.Core.Thunks.GetPageInfoAnalyticsContextInfo);
local v25 = require(l_script_FirstAncestor_0.Core.Networking.Requests.UpdatePageInfoAndSendRequest);
local v26 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagAddMoreAudioSwimlaneAnalytics);
local v27 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagAddInsertionNavDataSeeAll);
local function _(v28)
    return function(v29)
        local v30 = v5.PureComponent:extend("NavWrapper");
        v30.init = function(v31, v32)
            v31.updatePageInfo = function(v33)
                v32.updatePageInfo(v32.Network.networkInterface, v32.Settings:get("Plugin"), v33);
            end;
            v31.logPageView = function(v34, v35)
                local l_NavigationContext_0 = v32.NavigationContext;
                local v37 = v32.AssetAnalytics:get();
                local l_getPageInfoAnalyticsContextInfo_0 = v32.getPageInfoAnalyticsContextInfo;
                if l_getPageInfoAnalyticsContextInfo_0 then
                    local v39 = l_getPageInfoAnalyticsContextInfo_0();
                    v37:logPageView(v39.searchId, v34, v35, l_NavigationContext_0:getBreadcrumbRoute(), v39.toolboxTab, v39.currentCategory);
                end;
            end;
            v31.navigateTo = function(v40, v41, v42, v43)
                if v43.QueryParams then
                    v31.updatePageInfo({
                        queryParams = v43.QueryParams
                    });
                end;
                local l_NavigationContext_1 = v32.NavigationContext;
                v31.logPageView(v41, v42);
                l_NavigationContext_1:push(v40, v42, v43);
            end;
            v31.navigateGoBack = function()
                local l_NavigationContext_2 = v32.NavigationContext;
                local v46 = v32.AssetAnalytics:get();
                local l_getPageInfoAnalyticsContextInfo_1 = v32.getPageInfoAnalyticsContextInfo;
                v31.updatePageInfo({
                    queryParams = v4.None
                });
                if l_getPageInfoAnalyticsContextInfo_1 then
                    local v48 = l_getPageInfoAnalyticsContextInfo_1();
                    local l_searchId_0 = v48.searchId;
                    local v50 = l_NavigationContext_2:getBreadcrumbRoute();
                    v46:logGoBack(l_searchId_0, v50[2], l_NavigationContext_2:getCurrentPath(), v50, v48.toolboxTab, v48.currentCategory);
                end;
                l_NavigationContext_2:popToTop();
            end;
        end;
        v30.render = function(v51)
            return v28((v12.join(v51.props.navigation.state.params, {
                focused = v51.props.navigation.isFocused(), 
                navigateTo = v51.navigateTo, 
                navigateGoBack = v51.navigateGoBack, 
                logPageView = v51.logPageView
            }, if not v29 then {} else v29, v12.join(v51.props.navigation.state, {
                key = v12.None, 
                routeName = v12.None
            }))));
        end;
        v30.didMount = function(v52)
            v52.props.NavigationContext:updateNavigation(v52.props.navigation);
        end;
        return v5.createElement(v6.connect(nil, function(v53)
            return {
                updatePageInfo = function(v54, v55, v56)
                    v53(v25(v54, v55, v56));
                end, 
                getPageInfoAnalyticsContextInfo = function()
                    return v53(v24());
                end
            };
        end)((v7.withNavigation((l_ContextServices_0.withContext({
            AssetAnalytics = v23, 
            NavigationContext = v20, 
            Network = v22, 
            Settings = v21
        })(v30))))), v29);
    end;
end;
local function v60(v58)
    local v59 = v58.params or v58;
    return {
        CanInsertAsset = v59.CanInsertAsset, 
        LogAssetImpression = v59.LogAssetImpression, 
        OnAssetPreviewButtonClicked = v59.OnAssetPreviewButtonClicked, 
        OnSearchByCreator = if not v1() then nil else v59.OnSearchByCreator, 
        TryInsert = v59.TryInsert, 
        TryOpenAssetConfig = v59.TryOpenAssetConfig
    };
end;
local v61 = {};
local v62 = {};
local l_HOME_0 = v8.NAVIGATION.HOME;
local function v79(v64)
    local _ = nil;
    return v5.createElement(if v64.AssetType == Enum.AssetType.Audio then v15 else if v64.AssetType == Enum.AssetType.FontFamily then v16 else v14, v12.join(v60(v64), {
        AssetSections = v64.AssetSections, 
        CategoryName = v64.CategoryName, 
        OnClickSubcategory = function(v66, v67, v68, v69, v70)
            if v67.childCount == 0 then
                v64.navigateTo(v8.NAVIGATION.RESULTS, v8.HOMEVIEW_SEARCH_CATEGORY, v66, v12.join(v64, v60(v64), {
                    CategoryName = v68, 
                    SortName = v69, 
                    SearchSource = v8.SEARCH_SOURCE.CATEGORY, 
                    QueryParams = v70, 
                    SwimlaneName = if not v26() then nil else v66
                }));
                return ;
            else
                v64.navigateTo(v8.NAVIGATION.SUBCATEGORY, v8.HOMEVIEW_SEARCH_CATEGORY, v66, v12.join(v64, v60(v64), {
                    CategoryName = v68, 
                    SortName = v69, 
                    SubcategoryPath = {
                        v66
                    }, 
                    SubcategoryDict = v67.children, 
                    TopKeywords = v64.TopKeywords, 
                    QueryParams = v70
                }));
                return ;
            end;
        end, 
        OnClickSeeAllSubcategories = function(v71, v72, v73)
            v64.navigateTo(v8.NAVIGATION.ALL_SUBCATEGORIES, v8.HOMEVIEW_SEARCH_CATEGORY, v8.NAVIGATION.ALL_SUBCATEGORIES, v12.join(v64, v60(v64), {
                CategoryName = v72, 
                SortName = v73, 
                SubcategoryDict = v71
            }));
        end, 
        OnClickSeeAllAssets = function(v74, v75, v76, v77, v78)
            v64.navigateTo(v8.NAVIGATION.RESULTS, v74, v74, v12.join(v64, v60(v64), {
                CategoryName = v75, 
                SearchTerm = v77, 
                SectionName = v74, 
                SortName = v76, 
                QueryParams = v78, 
                SwimlaneName = if not v27() then nil else v74
            }));
        end, 
        SubcategoryDict = v64.SubcategoryDict, 
        SortName = v64.SortName, 
        Size = UDim2.new(1, 0, 1, 0), 
        TopKeywords = v64.TopKeywords, 
        MaxWidth = v64.MaxWidth, 
        LogPageView = v64.logPageView
    }));
end;
local l_v79_0 = v79 --[[ copy: 34 -> 38 ]];
v62[l_HOME_0] = function(v81)
    local v82 = v5.PureComponent:extend("NavWrapper");
    v82.init = function(v83, v84)
        v83.updatePageInfo = function(v85)
            v84.updatePageInfo(v84.Network.networkInterface, v84.Settings:get("Plugin"), v85);
        end;
        v83.logPageView = function(v86, v87)
            local l_NavigationContext_3 = v84.NavigationContext;
            local v89 = v84.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_2 = v84.getPageInfoAnalyticsContextInfo;
            if l_getPageInfoAnalyticsContextInfo_2 then
                local v91 = l_getPageInfoAnalyticsContextInfo_2();
                v89:logPageView(v91.searchId, v86, v87, l_NavigationContext_3:getBreadcrumbRoute(), v91.toolboxTab, v91.currentCategory);
            end;
        end;
        v83.navigateTo = function(v92, v93, v94, v95)
            if v95.QueryParams then
                v83.updatePageInfo({
                    queryParams = v95.QueryParams
                });
            end;
            local l_NavigationContext_4 = v84.NavigationContext;
            v83.logPageView(v93, v94);
            l_NavigationContext_4:push(v92, v94, v95);
        end;
        v83.navigateGoBack = function()
            local l_NavigationContext_5 = v84.NavigationContext;
            local v98 = v84.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_3 = v84.getPageInfoAnalyticsContextInfo;
            v83.updatePageInfo({
                queryParams = v4.None
            });
            if l_getPageInfoAnalyticsContextInfo_3 then
                local v100 = l_getPageInfoAnalyticsContextInfo_3();
                local l_searchId_1 = v100.searchId;
                local v102 = l_NavigationContext_5:getBreadcrumbRoute();
                v98:logGoBack(l_searchId_1, v102[2], l_NavigationContext_5:getCurrentPath(), v102, v100.toolboxTab, v100.currentCategory);
            end;
            l_NavigationContext_5:popToTop();
        end;
    end;
    v82.render = function(v103)
        return l_v79_0((v12.join(v103.props.navigation.state.params, {
            focused = v103.props.navigation.isFocused(), 
            navigateTo = v103.navigateTo, 
            navigateGoBack = v103.navigateGoBack, 
            logPageView = v103.logPageView
        }, if not v81 then {} else v81, v12.join(v103.props.navigation.state, {
            key = v12.None, 
            routeName = v12.None
        }))));
    end;
    v82.didMount = function(v104)
        v104.props.NavigationContext:updateNavigation(v104.props.navigation);
    end;
    return v5.createElement(v6.connect(nil, function(v105)
        return {
            updatePageInfo = function(v106, v107, v108)
                v105(v25(v106, v107, v108));
            end, 
            getPageInfoAnalyticsContextInfo = function()
                return v105(v24());
            end
        };
    end)((v7.withNavigation((l_ContextServices_0.withContext({
        AssetAnalytics = v23, 
        NavigationContext = v20, 
        Network = v22, 
        Settings = v21
    })(v82))))), v81);
end;
l_HOME_0 = {};
local l_ALL_SUBCATEGORIES_0 = v8.NAVIGATION.ALL_SUBCATEGORIES;
local function v123(v110)
    local l_params_0 = v110.params;
    return v5.createElement(v18, v12.join(v60(v110), {
        CategoryName = l_params_0 and l_params_0.CategoryName, 
        OnClickBack = function()
            v110:navigateGoBack();
        end, 
        OnClickSubcategory = function(v112, v113, v114, v115, v116)
            v110.navigateTo(v8.NAVIGATION.SUBCATEGORY, v8.HOMEVIEW_SEARCH_CATEGORY, v112[#v112], v12.join(v110, v60(v110), {
                CategoryName = v114, 
                SortName = v115, 
                SubcategoryPath = v112, 
                SubcategoryDict = v113, 
                QueryParams = v116
            }));
        end, 
        OnClickSeeAllAssets = function(v117, v118, v119, _, v121, v122)
            v110.navigateTo(v8.NAVIGATION.RESULTS, v8.HOMEVIEW_SEARCH_CATEGORY, v117, v12.join(v110, v60(v110), {
                CategoryName = v118, 
                SectionName = v117, 
                SortName = v119, 
                SearchSource = v8.SEARCH_SOURCE.CATEGORY, 
                QueryParams = v121, 
                SwimlaneName = v122
            }));
        end, 
        SortName = l_params_0 and l_params_0.SortName, 
        Size = UDim2.new(1, 0, 1, 0), 
        SubcategoryDict = l_params_0 and l_params_0.SubcategoryDict
    }));
end;
local l_v123_0 = v123 --[[ copy: 35 -> 39 ]];
l_HOME_0[l_ALL_SUBCATEGORIES_0] = function(v125)
    local v126 = v5.PureComponent:extend("NavWrapper");
    v126.init = function(v127, v128)
        v127.updatePageInfo = function(v129)
            v128.updatePageInfo(v128.Network.networkInterface, v128.Settings:get("Plugin"), v129);
        end;
        v127.logPageView = function(v130, v131)
            local l_NavigationContext_6 = v128.NavigationContext;
            local v133 = v128.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_4 = v128.getPageInfoAnalyticsContextInfo;
            if l_getPageInfoAnalyticsContextInfo_4 then
                local v135 = l_getPageInfoAnalyticsContextInfo_4();
                v133:logPageView(v135.searchId, v130, v131, l_NavigationContext_6:getBreadcrumbRoute(), v135.toolboxTab, v135.currentCategory);
            end;
        end;
        v127.navigateTo = function(v136, v137, v138, v139)
            if v139.QueryParams then
                v127.updatePageInfo({
                    queryParams = v139.QueryParams
                });
            end;
            local l_NavigationContext_7 = v128.NavigationContext;
            v127.logPageView(v137, v138);
            l_NavigationContext_7:push(v136, v138, v139);
        end;
        v127.navigateGoBack = function()
            local l_NavigationContext_8 = v128.NavigationContext;
            local v142 = v128.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_5 = v128.getPageInfoAnalyticsContextInfo;
            v127.updatePageInfo({
                queryParams = v4.None
            });
            if l_getPageInfoAnalyticsContextInfo_5 then
                local v144 = l_getPageInfoAnalyticsContextInfo_5();
                local l_searchId_2 = v144.searchId;
                local v146 = l_NavigationContext_8:getBreadcrumbRoute();
                v142:logGoBack(l_searchId_2, v146[2], l_NavigationContext_8:getCurrentPath(), v146, v144.toolboxTab, v144.currentCategory);
            end;
            l_NavigationContext_8:popToTop();
        end;
    end;
    v126.render = function(v147)
        return l_v123_0((v12.join(v147.props.navigation.state.params, {
            focused = v147.props.navigation.isFocused(), 
            navigateTo = v147.navigateTo, 
            navigateGoBack = v147.navigateGoBack, 
            logPageView = v147.logPageView
        }, if not v125 then {} else v125, v12.join(v147.props.navigation.state, {
            key = v12.None, 
            routeName = v12.None
        }))));
    end;
    v126.didMount = function(v148)
        v148.props.NavigationContext:updateNavigation(v148.props.navigation);
    end;
    return v5.createElement(v6.connect(nil, function(v149)
        return {
            updatePageInfo = function(v150, v151, v152)
                v149(v25(v150, v151, v152));
            end, 
            getPageInfoAnalyticsContextInfo = function()
                return v149(v24());
            end
        };
    end)((v7.withNavigation((l_ContextServices_0.withContext({
        AssetAnalytics = v23, 
        NavigationContext = v20, 
        Network = v22, 
        Settings = v21
    })(v126))))), v125);
end;
l_ALL_SUBCATEGORIES_0 = {};
v79 = v8.NAVIGATION.SUBCATEGORY;
local function v160(v153)
    local l_params_1 = v153.params;
    return v5.createElement(v19, v12.join(v60(v153), {
        CategoryName = l_params_1 and l_params_1.CategoryName, 
        MaxWidth = v153.MaxWidth, 
        OnClickBack = function()
            v153:navigateGoBack();
        end, 
        OnClickSeeAllAssets = function(v155, v156, v157, v158, v159)
            v153.navigateTo(v8.NAVIGATION.RESULTS, v8.HOMEVIEW_SEARCH_CATEGORY, v155, v12.join(v153, v60(v153), {
                CategoryName = v156, 
                SearchTerm = v158, 
                SortName = v157, 
                SearchSource = v8.SEARCH_SOURCE.CATEGORY, 
                QueryParams = v159
            }));
        end, 
        Size = UDim2.new(1, 0, 1, 0), 
        SortName = l_params_1 and l_params_1.SortName, 
        SubcategoryDict = l_params_1 and l_params_1.SubcategoryDict, 
        SubcategoryPath = l_params_1 and l_params_1.SubcategoryPath
    }));
end;
l_ALL_SUBCATEGORIES_0[v79] = function(v161)
    local v162 = v5.PureComponent:extend("NavWrapper");
    v162.init = function(v163, v164)
        v163.updatePageInfo = function(v165)
            v164.updatePageInfo(v164.Network.networkInterface, v164.Settings:get("Plugin"), v165);
        end;
        v163.logPageView = function(v166, v167)
            local l_NavigationContext_9 = v164.NavigationContext;
            local v169 = v164.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_6 = v164.getPageInfoAnalyticsContextInfo;
            if l_getPageInfoAnalyticsContextInfo_6 then
                local v171 = l_getPageInfoAnalyticsContextInfo_6();
                v169:logPageView(v171.searchId, v166, v167, l_NavigationContext_9:getBreadcrumbRoute(), v171.toolboxTab, v171.currentCategory);
            end;
        end;
        v163.navigateTo = function(v172, v173, v174, v175)
            if v175.QueryParams then
                v163.updatePageInfo({
                    queryParams = v175.QueryParams
                });
            end;
            local l_NavigationContext_10 = v164.NavigationContext;
            v163.logPageView(v173, v174);
            l_NavigationContext_10:push(v172, v174, v175);
        end;
        v163.navigateGoBack = function()
            local l_NavigationContext_11 = v164.NavigationContext;
            local v178 = v164.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_7 = v164.getPageInfoAnalyticsContextInfo;
            v163.updatePageInfo({
                queryParams = v4.None
            });
            if l_getPageInfoAnalyticsContextInfo_7 then
                local v180 = l_getPageInfoAnalyticsContextInfo_7();
                local l_searchId_3 = v180.searchId;
                local v182 = l_NavigationContext_11:getBreadcrumbRoute();
                v178:logGoBack(l_searchId_3, v182[2], l_NavigationContext_11:getCurrentPath(), v182, v180.toolboxTab, v180.currentCategory);
            end;
            l_NavigationContext_11:popToTop();
        end;
    end;
    v162.render = function(v183)
        return v160((v12.join(v183.props.navigation.state.params, {
            focused = v183.props.navigation.isFocused(), 
            navigateTo = v183.navigateTo, 
            navigateGoBack = v183.navigateGoBack, 
            logPageView = v183.logPageView
        }, if not v161 then {} else v161, v12.join(v183.props.navigation.state, {
            key = v12.None, 
            routeName = v12.None
        }))));
    end;
    v162.didMount = function(v184)
        v184.props.NavigationContext:updateNavigation(v184.props.navigation);
    end;
    return v5.createElement(v6.connect(nil, function(v185)
        return {
            updatePageInfo = function(v186, v187, v188)
                v185(v25(v186, v187, v188));
            end, 
            getPageInfoAnalyticsContextInfo = function()
                return v185(v24());
            end
        };
    end)((v7.withNavigation((l_ContextServices_0.withContext({
        AssetAnalytics = v23, 
        NavigationContext = v20, 
        Network = v22, 
        Settings = v21
    })(v162))))), v161);
end;
v79 = {};
v123 = v8.NAVIGATION.RESULTS;
local function v191(v189)
    local l_params_2 = v189.params;
    return v5.createElement(v17, v12.join(v60(v189), {
        CategoryName = l_params_2 and l_params_2.CategoryName, 
        OnClickBack = function()
            v189:navigateGoBack();
        end, 
        SearchTerm = l_params_2 and l_params_2.SearchTerm, 
        SectionName = l_params_2 and l_params_2.SectionName, 
        Size = UDim2.new(1, 0, 1, 0), 
        SortName = l_params_2 and l_params_2.SortName, 
        SearchSource = l_params_2 and l_params_2.SearchSource, 
        QueryParams = if not l_params_2 then nil else l_params_2.QueryParams, 
        SwimlaneName = if not l_params_2 then nil else l_params_2.SwimlaneName
    }));
end;
v79[v123] = function(v192)
    local v193 = v5.PureComponent:extend("NavWrapper");
    v193.init = function(v194, v195)
        v194.updatePageInfo = function(v196)
            v195.updatePageInfo(v195.Network.networkInterface, v195.Settings:get("Plugin"), v196);
        end;
        v194.logPageView = function(v197, v198)
            local l_NavigationContext_12 = v195.NavigationContext;
            local v200 = v195.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_8 = v195.getPageInfoAnalyticsContextInfo;
            if l_getPageInfoAnalyticsContextInfo_8 then
                local v202 = l_getPageInfoAnalyticsContextInfo_8();
                v200:logPageView(v202.searchId, v197, v198, l_NavigationContext_12:getBreadcrumbRoute(), v202.toolboxTab, v202.currentCategory);
            end;
        end;
        v194.navigateTo = function(v203, v204, v205, v206)
            if v206.QueryParams then
                v194.updatePageInfo({
                    queryParams = v206.QueryParams
                });
            end;
            local l_NavigationContext_13 = v195.NavigationContext;
            v194.logPageView(v204, v205);
            l_NavigationContext_13:push(v203, v205, v206);
        end;
        v194.navigateGoBack = function()
            local l_NavigationContext_14 = v195.NavigationContext;
            local v209 = v195.AssetAnalytics:get();
            local l_getPageInfoAnalyticsContextInfo_9 = v195.getPageInfoAnalyticsContextInfo;
            v194.updatePageInfo({
                queryParams = v4.None
            });
            if l_getPageInfoAnalyticsContextInfo_9 then
                local v211 = l_getPageInfoAnalyticsContextInfo_9();
                local l_searchId_4 = v211.searchId;
                local v213 = l_NavigationContext_14:getBreadcrumbRoute();
                v209:logGoBack(l_searchId_4, v213[2], l_NavigationContext_14:getCurrentPath(), v213, v211.toolboxTab, v211.currentCategory);
            end;
            l_NavigationContext_14:popToTop();
        end;
    end;
    v193.render = function(v214)
        return v191((v12.join(v214.props.navigation.state.params, {
            focused = v214.props.navigation.isFocused(), 
            navigateTo = v214.navigateTo, 
            navigateGoBack = v214.navigateGoBack, 
            logPageView = v214.logPageView
        }, if not v192 then {} else v192, v12.join(v214.props.navigation.state, {
            key = v12.None, 
            routeName = v12.None
        }))));
    end;
    v193.didMount = function(v215)
        v215.props.NavigationContext:updateNavigation(v215.props.navigation);
    end;
    return v5.createElement(v6.connect(nil, function(v216)
        return {
            updatePageInfo = function(v217, v218, v219)
                v216(v25(v217, v218, v219));
            end, 
            getPageInfoAnalyticsContextInfo = function()
                return v216(v24());
            end
        };
    end)((v7.withNavigation((l_ContextServices_0.withContext({
        AssetAnalytics = v23, 
        NavigationContext = v20, 
        Network = v22, 
        Settings = v21
    })(v193))))), v192);
end;
setlist { ['R030[1 to 4]'] = 'R031 to R034' };
v62 = v5.PureComponent:extend("NavigationContainer");
v62.render = function(v220)
    local l_props_0 = v220.props;
    local l_HOME_1 = v8.NAVIGATION.HOME;
    return l_ContextServices_0.provide({
        v20.new(l_HOME_1)
    }, v5.createElement(v7.createAppContainer((v7.createRobloxStackNavigator(v61, {
        initialRouteName = l_HOME_1, 
        initialRouteParams = l_props_0
    })))));
end;
return v13(v62);
