local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_deepEqual_0 = v4.Util.deepEqual;
local v6 = require(l_Packages_0.Dash);
local v7 = require(l_Packages_0.Cryo);
local l_Math_0 = v4.Util.Math;
local v9 = require(l_script_FirstAncestor_0.Core.Util.getUserId);
local _ = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v11 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local _ = require(l_script_FirstAncestor_0.Core.Networking.NetworkInterface);
local _ = require(l_script_FirstAncestor_0.Libs.Http.HttpResponse);
local v14 = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local v16 = require(l_script_FirstAncestor_0.Core.Actions.GetAssetsVotingData);
local v17 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagQualityFiltersInToolboxSearch);
local v18 = v2.PureComponent:extend("ResultsFetcher");
v18.init = function(v19, _)
    v19.loadingMutex = false;
    v19.fetchNextPage = function(v21)
        v19:fetchResults({
            pageSize = v21
        });
    end;
    v19.INITIAL_RESULTS_STATE = table.freeze({
        loading = false, 
        error = nil, 
        total = nil, 
        fetchNextPage = nil, 
        assets = {}, 
        assetMap = {}, 
        assetIds = {}, 
        nextPageCursor = nil
    });
    v19.state = v19.INITIAL_RESULTS_STATE;
end;
v18.didUpdate = function(v22, v23)
    local function v26(_, v25)
        return v25 ~= "render";
    end;
    if not l_deepEqual_0(v6.filter(v23, v26), (v6.filter(v22.props, v26))) then
        v22.canceled = v22.loadingMutex;
        v22.loadingMutex = false;
        v22:fetchResults({
            initialPage = true
        });
    end;
end;
v18.fetchResults = function(v27, v28)
    local l_props_0 = v27.props;
    local l_networkInterface_0 = l_props_0.networkInterface;
    local v31 = not not v28 and v28.pageSize or l_props_0.initialPageSize;
    local v32 = if not v28.initialPage then v27.state.nextPageCursor else nil;
    if not v28.initialPage and (not (v32 ~= nil) or v32 == v7.None) then
        return ;
    elseif not v27.loadingMutex then
        v27.loadingMutex = true;
        v27:setState(function()
            local v33 = if not v28.initialPage then {} else v6.join(v27.INITIAL_RESULTS_STATE);
            v33.loading = true;
            v33.error = v2.None;
            v33.fetchNextPage = v2.None;
            return v33;
        end);
        local function v59()
            local l_includeUnverifiedCreators_0 = v27.props.includeUnverifiedCreators;
            local v35 = nil;
            local v37 = l_networkInterface_0:getToolboxItems({
                categoryName = l_props_0.categoryName, 
                sectionName = l_props_0.sectionName, 
                keyword = l_props_0.searchTerm, 
                ownerId = v9(), 
                sortType = l_props_0.sortName, 
                tags = l_props_0.tags, 
                cursor = v32, 
                limit = v31, 
                includeOnlyVerifiedCreators = not l_includeUnverifiedCreators_0, 
                queryParams = l_props_0.queryParams, 
                searchSource = l_props_0.searchSource, 
                assetsInCameraViewport = l_props_0.assetsInCameraViewport, 
                assetsInCameraVicinity = l_props_0.assetsInCameraVicinity, 
                qualityFilterData = if not v17() then nil else l_props_0.qualityFilterData
            }):catch(function(v36)
                v35 = true;
                v27.loadingMutex = false;
                v27:setState(function()
                    return {
                        loading = false, 
                        error = {
                            error = v36
                        }
                    };
                end);
            end):await();
            if not v35 then
                local l_responseBody_0 = v37.responseBody;
                local v39 = {};
                local v40 = {};
                for _, v42 in ipairs(l_responseBody_0.data) do
                    table.insert(v39, v42.id);
                    if v42.id then
                        v40[v42.id] = {
                            searchResultSource = v42.searchResultSource
                        };
                    end;
                end;
                local v44 = l_networkInterface_0:getItemDetailsAssetIds(v39):catch(function(v43)
                    v35 = true;
                    v27.loadingMutex = false;
                    v27:setState(function()
                        return {
                            loading = false, 
                            error = {
                                error = v43
                            }
                        };
                    end);
                end):await();
                if not v35 then
                    local l_responseBody_1 = v44.responseBody;
                    local v46 = {};
                    for _, v48 in pairs(l_responseBody_1.data) do
                        local v49 = v14.fromItemDetailsRequest(v48);
                        if not (not v48.Asset or not v48.Asset.id) then
                            v49 = v14.AddContextToItemDetails(v49, v40[v48.Asset.id]);
                        end;
                        if v49.Asset then
                            v46[v49.Asset.Id] = v49;
                        end;
                    end;
                    v27.loadingMutex = false;
                    if not v27.canceled then
                        v27:setState(function(v50)
                            local v51 = {
                                assetIds = v6.append({}, v50.assetIds, v39), 
                                assetMap = v6.join(v50.assetMap, v46)
                            };
                            local v52 = #v50.assets;
                            local v53 = {};
                            for v54, v55 in ipairs(v39) do
                                local v56 = v46[v55];
                                local v57 = v52 + v54;
                                local v58 = l_Math_0.round(v52 / v31) + 1;
                                if not v56 then
                                    if v11.shouldDebugWarnings() then
                                        warn((("asset with ID %* not found in asset map"):format(v55)));
                                    end;
                                else
                                    v56.Context = {
                                        page = v58, 
                                        pagePosition = v54, 
                                        position = v57, 
                                        searchResultSource = if not v40[v55] then nil else v40[v55].searchResultSource
                                    };
                                    v53[v54] = v56;
                                end;
                            end;
                            v51.assets = v6.append({}, v50.assets, v53);
                            v51.loading = false;
                            v51.error = v2.None;
                            v51.total = not not v28.initialPage and v37.responseBody.totalResults or nil;
                            v51.nextPageCursor = v37.responseBody.nextPageCursor;
                            v51.fetchNextPage = v27.fetchNextPage;
                            if v51.nextPageCursor == nil then
                                v51.nextPageCursor = v7.None;
                            end;
                            if v27.props.dispatchGetAssetsVotingData then
                                v27.props.dispatchGetAssetsVotingData(v51.assets);
                            end;
                            return v51;
                        end);
                        return ;
                    else
                        v27.canceled = false;
                        return ;
                    end;
                else
                    return ;
                end;
            else
                return ;
            end;
        end;
        task.spawn(function()
            local l_status_0, l_result_0 = pcall(v59);
            if not l_status_0 then
                v27.loadingMutex = false;
                v27:setState(function()
                    return {
                        loading = false, 
                        error = {
                            message = tostring(l_result_0)
                        }
                    };
                end);
            end;
        end);
        return ;
    else
        return ;
    end;
end;
v18.render = function(v62)
    return v62.props.render(v62.state);
end;
v18.didMount = function(v63)
    v63:fetchResults({
        initialPage = true
    });
end;
local v64 = v2.PureComponent:extend("ResultsFetcherRoduxWrapper");
v64.render = function(v65)
    return v2.createElement(v18, v65.props);
end;
local function v68(v66)
    return {
        dispatchGetAssetsVotingData = function(v67)
            v66(v16(v67));
        end
    };
end;
TypedResultsFetcher = function(v69, v70)
    return v2.createElement(v64, v69, v70);
end;
NoRoduxTypedResultsFetcher = function(v71, v72)
    return v2.createElement(v18, v71, v72);
end;
v64 = v3.connect(nil, v68)(v64);
return {
    Component = v18, 
    Generator = TypedResultsFetcher, 
    NoRoduxGenerator = NoRoduxTypedResultsFetcher
};
