local v2 = {
    getSimpleAsset = function(v0, v1)
        return {
            Asset = {
                Id = v0, 
                Name = v1 or "Observation Tower", 
                Description = "asset description", 
                TypeId = 10, 
                IsEndorsed = true
            }, 
            Creator = {
                Id = v0, 
                Name = "Roblox", 
                Type = 1
            }, 
            Thumbnail = {
                Final = true, 
                Url = "rbxasset://textures/StudioToolbox/Animation.png", 
                RetryUrl = nil, 
                UserId = 0, 
                EndpointType = "Avatar"
            }, 
            Voting = {
                ShowVotes = true, 
                UpVotes = 4506, 
                DownVotes = 581, 
                CanVote = true, 
                UserVote = true, 
                HasVoted = true, 
                ReasonForNotVoteable = ""
            }
        };
    end
};
v2.getSimpleAudioAsset = function(v3, v4)
    local v5 = v2.getSimpleAsset(v3, v4);
    v5.AudioDetails = {
        Artist = "Artist", 
        MusicAlbum = "Album", 
        MusicGenre = "atmosphere", 
        SoundEffectCategory = "Instrument", 
        SoundEffectSubcategory = "Drums"
    };
    return v5;
end;
v2.getPreviewAsset = function(v6, v7)
    v7 = v7 or "Observation Tower";
    return {
        Asset = {
            Id = v6, 
            Name = "Observation Tower", 
            TypeId = 10, 
            IsEndorsed = true, 
            AssetGenres = "", 
            Description = "mocked asset item", 
            Created = "2019-05-01T00:37:18.59Z", 
            Updated = "2021-05-06T19:56:54.437Z"
        }, 
        Creator = {
            Id = v6, 
            Name = "Roblox", 
            Type = 1
        }, 
        Thumbnail = {
            Final = true, 
            Url = "rbxasset://textures/StudioToolbox/Animation.png", 
            RetryUrl = nil, 
            UserId = 0, 
            EndpointType = "Avatar"
        }, 
        Voting = {
            ShowVotes = true, 
            UpVotes = 4506, 
            DownVotes = 581, 
            CanVote = true, 
            UserVote = true, 
            HasVoted = true, 
            ReasonForNotVoteable = ""
        }
    };
end;
v2.getFontFamilyAsset = function(v8, v9)
    v9 = v9 or "Comic Sans";
    return {
        Asset = {
            AssetGenres = "", 
            Created = "2019-05-01T00:37:18.59Z", 
            Description = "mocked FontFamily Asset", 
            Id = v8, 
            IsEndorsed = true, 
            Name = "Comic Sans", 
            TypeId = 73, 
            Updated = "2021-05-06T19:56:54.437Z"
        }, 
        Creator = {
            Id = v8, 
            Name = "Roblox", 
            Type = 1
        }, 
        Thumbnail = {
            EndpointType = "Avatar", 
            Final = true, 
            RetryUrl = nil, 
            Url = "rbxasset://textures/StudioToolbox/Animation.png", 
            UserId = 0
        }, 
        Voting = {}
    };
end;
return v2;
