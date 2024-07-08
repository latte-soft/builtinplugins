local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.ReactUtils);
local v4 = require(l_Packages_0.ReactSceneUnderstanding);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local v6 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v7 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local v8 = require(l_Parent_0.Core.Flags.getFFlagToolboxThrottleContextualRecommendationRequests);
local v9 = v2.Component:extend("ExternalServicesWrapper");
local l_game_FastInt_0 = game:GetFastInt("ToolboxSceneAnalysisPollingSeconds");
local l_game_FastInt_1 = game:GetFastInt("ToolboxSceneAnalysisViewportMaxScreenDivisions");
local l_game_FastInt_2 = game:GetFastInt("ToolboxSceneAnalysisViewportMaxDistance");
local l_game_FastInt_3 = game:GetFastInt("ToolboxSceneAnalysisRangeMaxDistance");
local l_game_FastInt_4 = game:GetFastInt("ToolboxSceneAnalysisAssetLimit");
v9.render = function(v15)
    local l_props_0 = v15.props;
    return v2.createElement(v3.ContextStack, {
        providers = {
            v2.createElement(v4.SceneAnalysisProvider, {
                pollingSeconds = if not v8() then l_game_FastInt_0 else nil, 
                rangeQueryOptions = {
                    limit = l_game_FastInt_4, 
                    maxDistance = l_game_FastInt_3
                }, 
                viewportQueryOptions = {
                    limit = l_game_FastInt_4, 
                    maxDistance = l_game_FastInt_2, 
                    maxScreenDivisions = l_game_FastInt_1
                }
            })
        }
    }, l_ContextServices_0.provide({
        v6.new(l_props_0.pluginGui), 
        v7.new(l_props_0.networkInterface)
    }, l_props_0[v2.Children]));
end;
return v9;
