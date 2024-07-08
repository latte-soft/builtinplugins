local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.Util.MockWrapper);
local v3 = require(script.Parent.AudioSort);
local v4 = require(script.Parent["AudioView.mocks"]);
local function v5()
    return true;
end;
return {
    controls = {
        isLoading = false, 
        isSceneSuggestions = false, 
        noResults = false
    }, 
    story = function(v6)
        local v7 = if not v6.controls.isSceneSuggestions then v4.createMockList("Sample") else v4.createMockContextualRecommendations();
        if v7.ResultsState then
            if v6.controls.isLoading then
                v7.ResultsState.loading = true;
            end;
            if v6.controls.noResults then
                v7.ResultsState.assets = {};
            end;
        end;
        return v1.createElement(v2, {}, {
            AudioSort = v1.createElement(v3, {
                AudioSection = v7, 
                AssetLogicWrapperProps = {
                    CanInsertAsset = v5, 
                    LogAssetImpression = v5, 
                    OnAssetPreviewButtonClicked = v5, 
                    TryInsert = v5, 
                    TryOpenAssetConfig = v5
                }
            })
        });
    end
};
