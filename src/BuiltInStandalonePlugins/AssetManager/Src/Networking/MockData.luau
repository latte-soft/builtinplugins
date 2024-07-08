local v0 = require(script:FindFirstAncestor("AssetManager").Src.Types);
local v7 = {
    generate = function(v1)
        math.randomseed(tick());
        local v2 = {};
        for v3 = 1, v1 do
            local v4 = math.random(100000, 100000000);
            local v5 = math.random(1, 5);
            local v6 = v0.getEnumAsList(v0.AssetType)[math.random(1, 5)];
            table.insert(v2, {
                AssetId = v4, 
                AssetType = v6, 
                DisplayName = ("Test %*"):format(v6), 
                VersionNumber = math.random(1, 10), 
                Created = DateTime.now(), 
                Modified = DateTime.now(), 
                ModerationStatus = v0.getEnumAsList(v0.ModerationStatus)[math.random(1, 3)], 
                Owner = {
                    Id = v5, 
                    Name = ("Owner %*"):format(v5), 
                    Scope = if v3 == 1 then v0.Scope.User else v0.Scope.Group
                }
            });
        end;
        return v2;
    end
};
local v8 = {
    {
        AssetId = 1234567890, 
        AssetType = v0.AssetType.Model, 
        DisplayName = "Test Model", 
        Description = "This is a test model", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567890, 
            Name = "TestUser", 
            Scope = v0.Scope.User
        }
    }, 
    {
        AssetId = 1234567891, 
        AssetType = v0.AssetType.Mesh, 
        DisplayName = "Test Mesh", 
        Description = "This is a test mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567892, 
            Name = "1234567892", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567892, 
        AssetType = v0.AssetType.Decal, 
        DisplayName = "Test Decal", 
        Description = "This is a test decal", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567893, 
            Name = "1234567893", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567893, 
        AssetType = v0.AssetType.Audio, 
        DisplayName = "Test Audio", 
        Description = "This is a test audio", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567894, 
            Name = "1234567894", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567894, 
        AssetType = v0.AssetType.Video, 
        DisplayName = "Test Video", 
        Description = "This is a test video", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567895, 
            Name = "1234567895", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567895, 
        AssetType = v0.AssetType.Image, 
        DisplayName = "Test Image", 
        Description = "This is a test image", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567896, 
            Name = "1234567896", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567896, 
        AssetType = v0.AssetType.Video, 
        DisplayName = "Test Video", 
        Description = "This is a test video", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567897, 
            Name = "1234567897", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567897, 
        AssetType = v0.AssetType.Animation, 
        DisplayName = "Test Animation", 
        Description = "This is a test animation", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567898, 
            Name = "1234567898", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567898, 
        AssetType = v0.AssetType.Model, 
        DisplayName = "Mock Model", 
        Description = "This is a mock model", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567899, 
            Name = "1234567899", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567899, 
        AssetType = v0.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567900, 
            Name = "1234567900", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567900, 
        AssetType = v0.AssetType.Decal, 
        DisplayName = "Mock Decal", 
        Description = "This is a mock decal", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567901, 
            Name = "1234567901", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567901, 
        AssetType = v0.AssetType.Audio, 
        DisplayName = "Mock Audio", 
        Description = "This is a mock audio", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567902, 
            Name = "1234567902", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567902, 
        AssetType = v0.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567903, 
            Name = "1234567903", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567903, 
        AssetType = v0.AssetType.Image, 
        DisplayName = "Mock Image", 
        Description = "This is a mock image", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567904, 
            Name = "1234567904", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567904, 
        AssetType = v0.AssetType.Video, 
        DisplayName = "Mock Video", 
        Description = "This is a mock video", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567905, 
            Name = "1234567905", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1234567905, 
        AssetType = v0.AssetType.Animation, 
        DisplayName = "Mock Animation", 
        Description = "This is a mock animation", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 1234567906, 
            Name = "1234567906", 
            Scope = v0.Scope.Group
        }
    }
};
local v9 = {
    {
        AssetId = 1234, 
        AssetType = v0.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1235, 
        AssetType = v0.AssetType.Decal, 
        DisplayName = "Mock Decal", 
        Description = "This is a mock decal", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1236, 
        AssetType = v0.AssetType.Audio, 
        DisplayName = "Mock Audio", 
        Description = "This is a mock audio", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1237, 
        AssetType = v0.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1238, 
        AssetType = v0.AssetType.Image, 
        DisplayName = "Mock Image", 
        Description = "This is a mock image", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 1239, 
        AssetType = v0.AssetType.Video, 
        DisplayName = "Mock Video", 
        Description = "This is a mock video", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 12310, 
        AssetType = v0.AssetType.Animation, 
        DisplayName = "Mock Animation", 
        Description = "This is a mock animation", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 987654321, 
            Name = "Group1", 
            Scope = v0.Scope.Group
        }
    }
};
local v10 = {
    {
        AssetId = 8976, 
        AssetType = v0.AssetType.Mesh, 
        DisplayName = "Mock Mesh", 
        Description = "This is a mock mesh", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 87654321, 
            Name = "Group with a really long name", 
            Scope = v0.Scope.Group
        }
    }, 
    {
        AssetId = 7890, 
        AssetType = v0.AssetType.Decal, 
        DisplayName = "Mock Decal", 
        Description = "This is a mock decal", 
        VersionNumber = 1, 
        Created = DateTime.now(), 
        Modified = DateTime.now(), 
        ModerationStatus = v0.ModerationStatus.Approved, 
        Owner = {
            Id = 87654321, 
            Name = "Group with a really long name", 
            Scope = v0.Scope.Group
        }
    }
};
v7.UserId = 100000;
v7.UserName = "TestUser";
v7.GroupId1 = 987654321;
v7.GroupId2 = 87654321;
v7.GroupId3 = 7654321;
v7.Assets = {};
v7.Assets[v7.UserId] = v8;
v7.Assets[v7.GroupId1] = v9;
v7.Assets[v7.GroupId2] = v10;
v7.Groups = {
    data = {
        {
            Id = v7.GroupId1, 
            Name = "Group1", 
            Scope = v0.Scope.Group
        }, 
        {
            Id = v7.GroupId2, 
            Name = "Group with a really long name", 
            Scope = v0.Scope.Group
        }, 
        {
            Id = v7.GroupId3, 
            Name = "NoAssets :(", 
            Scope = v0.Scope.Group
        }
    }
};
return v7;
