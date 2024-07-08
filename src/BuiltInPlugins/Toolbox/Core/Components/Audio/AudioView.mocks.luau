local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v2 = require(l_script_FirstAncestor_0.Core.Types.Category);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AudioTypes);
local v5 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v9 = {
    MOCK_CATEGORIES = {
        "Alarm", 
        "Explsion", 
        "Car", 
        "Horror", 
        "Guns", 
        "Animal", 
        "User Interface", 
        "Cartoon", 
        "Industrial", 
        "City", 
        "Birds"
    }, 
    MOCK_GENRES = {
        "Metal", 
        "Electronic", 
        "Beats", 
        "Ambient", 
        "Classical", 
        "Jazz", 
        "World", 
        "Holiday", 
        "Acoustic", 
        "Funk", 
        "Lofi"
    }, 
    MOCK_VIBES = {
        "Exciting", 
        "Chill", 
        "Suspenseful", 
        "Sad", 
        "Hopeful", 
        "Angry", 
        "Scary", 
        "Happy", 
        "Easy Listening", 
        "Dark", 
        "Trending", 
        "Essential"
    }, 
    createAudioInfo = function(v6)
        return {
            Asset = {
                Id = v6, 
                Name = "Audio " .. v6, 
                TypeId = 10, 
                IsEndorsed = false, 
                Description = "High hat with various percussion sounds. Loud crashes.", 
                Duration = "128", 
                HasScripts = false
            }, 
            AudioDetails = {
                Type = v2.SOUND_EFFECTS.name, 
                SoundEffectCategory = "Instrument", 
                SoundEffectSubcategory = "Drums"
            }, 
            Creator = {
                Id = 1, 
                Name = "Rolbox", 
                Type = "User"
            }
        };
    end, 
    createMockSubcategory = function(v7)
        local v8 = v7:gsub("%s+", "-"):lower();
        return {
            displayName = v7, 
            name = v8, 
            children = {}, 
            childCount = 0, 
            index = 0, 
            path = {
                v8
            }, 
            searchKeywords = v8, 
            queryParams = {}, 
            thumbnail = {
                assetId = -1, 
                backgroundColor = "#fff"
            }, 
            hidden = false
        };
    end
};
v9.createMockSwimlane = function(v10, v11)
    local v12 = v10:gsub("%s+", "-"):lower();
    local v13 = v9.createMockSubcategory("Genres");
    for _, v15 in v11, nil, nil do
        v13.children[v15] = v9.createMockSubcategory(v15);
    end;
    return {
        Section = {
            displayName = v10, 
            name = v12, 
            subcategory = v13
        }
    };
end;
v9.createMockList = function(v16)
    local v17 = v16:gsub("%s+", "-"):lower();
    local v18 = {};
    for v19 = 1, 10 do
        table.insert(v18, v9.createAudioInfo(v19));
    end;
    return {
        ResultsState = {
            assetIds = {}, 
            assetMap = {}, 
            assets = v18, 
            loading = false
        }, 
        Section = {
            displayName = v16, 
            name = v17
        }
    };
end;
v9.createMockContextualRecommendations = function()
    local v20 = {};
    for v21 = 1, 5 do
        table.insert(v20, v9.createAudioInfo(v21));
    end;
    return {
        ResultsState = {
            assetIds = {}, 
            assetMap = {}, 
            assets = v20, 
            loading = false
        }, 
        Section = {
            displayName = "Scene Suggestions", 
            name = v5.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME
        }
    };
end;
return v9;
