local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Core.Util.MockWrapper);
local _ = require(l_script_FirstAncestor_0.Core.Types.AudioTypes);
local v4 = require(script.Parent.AudioView);
local v5 = require(script.Parent["AudioView.mocks"]);
return {
    story = function()
        return v1.createElement(v2, {}, {
            AudioView = v1.createElement(v4, {
                Sections = {
                    v5.createMockSwimlane("Categories", v5.MOCK_CATEGORIES), 
                    v5.createMockContextualRecommendations(), 
                    v5.createMockList("Trending"), 
                    v5.createMockList("Essentials")
                }, 
                PageSize = 10, 
                AssetLogicWrapperProps = {
                    CanInsertAsset = function()
                        return true;
                    end, 
                    LogAssetImpression = function()
                        return nil;
                    end, 
                    OnAssetPreviewButtonClicked = function()
                        return nil;
                    end, 
                    TryInsert = function()
                        return nil;
                    end, 
                    TryOpenAssetConfig = function()
                        return nil;
                    end
                }
            })
        });
    end
};
