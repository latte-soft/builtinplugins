local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Core.Types.Category);
local v3 = require(script.Parent.AudioTable);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local v5 = require(l_script_FirstAncestor_0.Stories.ToolboxStoryWrapper);
local v6 = v1.PureComponent:extend("AudioRowWrapper");
createAudioInfo = function(v7)
    return {
        Asset = {
            Id = v7, 
            Name = "Cascaded Drumming", 
            AssetGenres = nil, 
            TypeId = 10, 
            IsEndorsed = false, 
            Description = "High hat with various percussion sounds. Loud crashes.", 
            Duration = "128", 
            HasScripts = false
        }, 
        AudioDetails = {
            Artist = "OnlyTwentyCharacters", 
            Type = v2.SOUND_EFFECTS.name, 
            SoundEffectCategory = "instruments", 
            SoundEffectSubcategory = "Drum"
        }, 
        Creator = {
            Id = 1, 
            Name = "Rolbox", 
            Type = "User"
        }
    };
end;
local v8 = {};
for v9 = 1, 10 do
    table.insert(v8, createAudioInfo(v9));
end;
v6.render = function(v10)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, -10, 0, 260), 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0)
    }, {
        AudioTable = v3.Generator({
            Assets = v8, 
            AudioType = v10.props.AudioType, 
            CanInsertAsset = function()
                return true;
            end, 
            InsertAsset = function()
                print("Insert Asset");
            end, 
            TryInsert = function()
                print("Try Insert");
            end, 
            TryOpenAssetConfig = function()
                print("try open asset config");
            end, 
            OnAssetPreviewButtonClicked = function()
                print("OnAssetPreviewButtonClicked");
            end, 
            SwimlaneName = "test"
        })
    });
end;
return {
    summary = "Audio Table", 
    stories = {
        {
            name = "Soundeffect", 
            story = function()
                return v1.createElement(v5, {}, {
                    AudioTableWrapper = v1.createElement(v6, {
                        AudioType = v2.SOUND_EFFECTS.name
                    })
                });
            end
        }, 
        {
            name = "Music", 
            story = function()
                return v1.createElement(v5, {}, {
                    AudioTableWrapper = v1.createElement(v6, {
                        AudioType = v2.MUSIC.name
                    })
                });
            end
        }, 
        {
            name = "Uncategorized", 
            story = function()
                return v1.createElement(v5, {}, {
                    AudioTableWrapper = v1.createElement(v6)
                });
            end
        }
    }
};
