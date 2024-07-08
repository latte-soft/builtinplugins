local l_Parent_0 = script.Parent.Parent.Parent;
local _ = game:GetService("HttpService");
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local _ = require(l_Parent_0.Core.Types.AssetQuotaTypes);
local v4 = game:getFastFlag("ToolboxRemoveApiProxy");
local v5 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddBuyerStatus);
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCForAllChecks);
local v7 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCUploadingDataSharing);
local _ = require(l_Parent_0.Core.Networking.__snapshots__.HomeAudioConfiguration);
local v9 = require(l_Parent_0.Core.Types.BuyerStatus);
local v10 = require(l_Parent_0.Core.Util.FiatUtil);
local v11 = require(l_Parent_0.Core.Types.PurchaseTransactionStatus);
local v12 = {};
v12.__index = v12;
v12.new = function(v13)
    return (setmetatable({
        assetCount = v13 or 10
    }, v12));
end;
local function v15(v14)
    return {
        asset = {
            id = v14, 
            name = "Observation Tower Mock" .. v14, 
            duration = 0, 
            typeId = 10, 
            isEndorsed = true, 
            description = "mocked asset item", 
            createdUtc = "2018-05-10T02:28:14.227Z", 
            updatedUtc = "2018-06-10T02:28:14.24Z", 
            assetGenres = {}
        }, 
        creator = {
            id = v14, 
            name = "JUSTforTEST", 
            type = 1
        }, 
        thumbnail = {
            final = true, 
            Url = "rbxasset://textures/StudioToolbox/Animation.png", 
            retryUrl = nil, 
            userId = 0, 
            endpointType = "Avatar"
        }, 
        voting = {
            showVotes = true, 
            upVotes = 4506, 
            downVotes = 581, 
            canVote = true, 
            userVote = "", 
            hasVoted = false, 
            reasonForNotVoteable = ""
        }
    };
end;
v12.fakeAssetFactory = function(_, v17)
    return (v15(v17));
end;
local function v19(v18)
    return {
        assetId = v18, 
        assetType = "Models", 
        created = "2019-08-09T21:41:51.97Z", 
        creatorType = "User", 
        name = "Dummy" .. v18, 
        creatorTargetId = 1010101, 
        status = "Free", 
        description = "mocked asset item", 
        updated = "2021-05-06T19:56:54.437Z", 
        priceConfiguration = {}
    };
end;
local function _(v20)
    return {
        id = v20, 
        itemType = "Asset"
    };
end;
v12.fakeToolboxItemFactory = function(_, v23)
    return {
        id = v23, 
        itemType = "Asset"
    };
end;
local function _(v24)
    return {
        assetId = v24, 
        name = "Dummy"
    };
end;
local function v33(v26, v27)
    for _, v29 in ipairs(game.CoreGui:GetChildren()) do
        if v29.Name == "CategoryVerification" then
            v29:Destroy();
        end;
    end;
    local v30 = Instance.new("StringValue", game.CoreGui);
    v30.Name = "CategoryVerification";
    local v31 = Instance.new("StringValue", game.CoreGui.CategoryVerification);
    v31.Value = v26;
    v31.Name = "Category";
    if v27 then
        local v32 = Instance.new("StringValue", game.CoreGui.CategoryVerification);
        v32.Value = v27;
        v32.Name = "Sort";
    end;
    return v30;
end;
v12.getAssets = function(v34, _)
    local v36 = {
        responseBody = {
            TotalResults = v34.assetCount
        }
    };
    local v37 = {};
    for v38 = 1, 10 do
        v37[v38] = v15(v38);
    end;
    v36.responseBody.Results = v37;
    return l_Promise_0.resolve(v36);
end;
v12.postAssetCheckPermissions = function(_, _, _)
    local v42 = {
        responseBody = {
            TotalResults = 11
        }
    };
    v42.responseBody.results = {
        {
            action = "Use", 
            assetId = 7327, 
            status = "HasPermission"
        }, 
        {
            action = "Edit", 
            assetId = 7327, 
            status = "HasPermission"
        }, 
        {
            action = "GrantAssetPermissions", 
            assetId = 7327, 
            status = "HasPermission"
        }, 
        {
            action = "Use", 
            assetId = 3127, 
            status = "HasPermission"
        }, 
        {
            action = "Edit", 
            assetId = 3127, 
            status = "HasPermission"
        }, 
        {
            action = "GrantAssetPermissions", 
            assetId = 3127, 
            status = "NoPermission"
        }, 
        {
            action = "GrantAssetPermissions", 
            assetId = 2134, 
            status = "AssetNotFound"
        }, 
        {
            action = "Edit", 
            assetId = 9765, 
            status = "UnknownError"
        }, 
        {
            action = "Use", 
            assetId = 7340, 
            status = "NoPermission"
        }, 
        {
            action = "Edit", 
            assetId = 7340, 
            status = "NoPermission"
        }, 
        {
            action = "GrantAssetPermissions", 
            assetId = 7340, 
            status = "NoPermission"
        }
    };
    return l_Promise_0.resolve(v42);
end;
v12.getToolboxItems = function(v43, v44)
    v33(v44.categoryName, v44.sortType);
    local v45 = {
        responseBody = {
            totalResults = v43.assetCount, 
            nextPageCursor = "nextPageCursor"
        }
    };
    local v46 = {};
    for v47 = 1, v43.assetCount do
        v46[v47] = {
            id = v47, 
            itemType = "Asset"
        };
    end;
    v45.responseBody.data = v46;
    return l_Promise_0.resolve(v45);
end;
v12.getItemDetails = function(_, v49)
    local v50 = {};
    for _, v52 in ipairs(v49) do
        table.insert(v50, (v15(v52.id)));
    end;
    return l_Promise_0.resolve({
        responseBody = {
            data = v50
        }
    });
end;
v12.getItemDetailsAssetIds = function(_, v54)
    local v55 = {};
    for _, v57 in ipairs(v54) do
        table.insert(v55, (v15(v57)));
    end;
    return l_Promise_0.resolve({
        responseBody = {
            data = v55
        }
    });
end;
v12.getDevelopAsset = function(v58, _)
    local v60 = {
        responseBody = {
            totalResults = v58.assetCount, 
            results = {}
        }
    };
    local v61 = {};
    for v62 = 1, v58.assetCount do
        v61[v62] = {
            id = v62, 
            itemType = "Asset"
        };
    end;
    v60.responseBody.results.data = v61;
    return l_Promise_0.resolve(v60);
end;
local function v66()
    local v63 = {
        responseBody = {}
    };
    local v64 = {};
    for v65 = 1, 10 do
        v64[v65] = {
            assetId = v65, 
            name = "Dummy"
        };
    end;
    v63.responseBody.data = v64;
    return l_Promise_0.resolve(v63);
end;
v12.getAssetCreations = function(_, _)
    return v66();
end;
v12.getAssetGroupCreations = function(_, _)
    return v66();
end;
v12.getAssetCreationDetails = function(_, v72)
    local v73 = {};
    for v74 = 1, #v72 do
        v73[v74] = v19(v74);
    end;
    return l_Promise_0.resolve({
        responseBody = v73
    });
end;
v12.getCreatorInfo = function(_, _, _)
    local _ = nil;
    return l_Promise_0.resolve(if not v4 then {
        responseBody = {
            AvatarFinal = false, 
            Id = "1010101", 
            IsOnline = false, 
            Username = "testAccount"
        }
    } else {
        responseBody = {
            id = "1010101", 
            name = "testAccount"
        }
    });
end;
v12.configureSales = function(_, _, _, _)
    return l_Promise_0.resolve({});
end;
v12.updateSales = function(_, _, _)
    return l_Promise_0.resolve({});
end;
v12.resolveAssets = function(_, v87, v88, v89)
    return l_Promise_0.resolve({
        responseBody = {
            TotalResults = v88 or #v87, 
            Results = v87, 
            nextPageCursor = v89
        }
    });
end;
v12.getVote = function(_, _, _)
    return l_Promise_0.resolve({
        userVote = true
    });
end;
v12.postVote = function(_, _)
    return l_Promise_0.resolve({
        model = {
            HasVoted = true, 
            CanVote = true, 
            upVotes = 4507, 
            UserVote = true, 
            DownVote = 581, 
            ShowVotes = true
        }, 
        success = true, 
        message = "This is a test message"
    });
end;
v12.postUnvote = function(_, _)
    return l_Promise_0.resolve({
        model = {
            HasVoted = false, 
            CanVote = true, 
            upVotes = 4506, 
            UserVote = "", 
            DownVote = 581, 
            ShowVotes = true
        }, 
        success = true, 
        message = "This is a test message"
    });
end;
v12.postFavorite = function(_, _, _)
    return l_Promise_0.resolve({});
end;
v12.deleteFavorite = function(_, _, _)
    return l_Promise_0.resolve({});
end;
v12.postInsertAsset = function(_, _)
    return true;
end;
v12.getManageableGroups = function(_)
    return l_Promise_0.resolve({
        responseBody = {
            data = {}
        }
    });
end;
v12.getUsers = function(_, _, _)
    return l_Promise_0.resolve({});
end;
v12.getHasEditPermissionForAsset = function(_, _, _)
    return l_Promise_0.resolve(true);
end;
v12.getRobuxBalance = function(_, _)
    return l_Promise_0.resolve({
        responseBody = {
            robux = "16"
        }
    });
end;
v12.getFavoriteCounts = function(_, _)
    return l_Promise_0.resolve({
        responseBody = "10"
    });
end;
v12.getFavorited = function(_, _)
    return l_Promise_0.resolve({
        responseBody = "null"
    });
end;
v12.getMetaData = function(_)
    return l_Promise_0.resolve({});
end;
if v6() then
    v12.getUploadPermissionStatus = function(_)
        return l_Promise_0.resolve({
            responseBody = {
                deniedReason = 0, 
                isAllowed = true
            }
        });
    end;
end;
v12.getTagsMetadata = function(_)
    return l_Promise_0.resolve({});
end;
v12.uploadCatalogItem = function(_, _, _)
    return l_Promise_0.resolve({});
end;
v12.uploadCatalogItemFormat = function(_, _, _, _, _, _, _, _)
    return l_Promise_0.resolve({});
end;
v12.getCreatorMarketplaceQuotas = function(_, _, _)
    return l_Promise_0.resolve({});
end;
v12.getPublishingRequirements = function(_)
    return l_Promise_0.resolve({});
end;
v12.getThumbnailStatus = function(_, _)
    return l_Promise_0.resolve({
        responseBody = {
            data = {
                [1] = {
                    imageUrl = "fake_image_url", 
                    state = "Completed", 
                    targetId = 12345
                }
            }
        }
    });
end;
v12.getIsVerifiedCreator = function(_)
    return l_Promise_0.resolve({
        responseBody = {
            isVerifiedCreator = true
        }
    });
end;
v12.getHomeConfiguration = function(_, v140)
    if v140 == Enum.AssetType.Audio then
        return l_Promise_0.resolve({
            responseBody = {
                topKeywords = {}, 
                sections = {
                    [1] = {
                        displayName = "Categories", 
                        name = "categories", 
                        subcategory = {
                            name = "audio", 
                            displayName = "Audio", 
                            hidden = false, 
                            searchKeywords = "audio", 
                            queryParams = {
                                keyword = "audio", 
                                assetSubTypes = nil, 
                                creatorTargetId = nil, 
                                creatorType = nil, 
                                excludeAssetSubTypes = nil
                            }, 
                            path = {
                                [1] = "audio"
                            }, 
                            index = 0, 
                            children = {
                                music = {
                                    name = "music", 
                                    displayName = "Music", 
                                    hidden = false, 
                                    searchKeywords = "music", 
                                    queryParams = {
                                        keyword = "music", 
                                        assetSubTypes = nil, 
                                        creatorTargetId = nil, 
                                        creatorType = nil, 
                                        excludeAssetSubTypes = nil
                                    }, 
                                    path = {
                                        [1] = "audio", 
                                        [2] = "music"
                                    }, 
                                    index = 0, 
                                    children = {}, 
                                    childCount = 0
                                }, 
                                ["sound-effect"] = {
                                    name = "sound-effect", 
                                    displayName = "Sound Effect", 
                                    hidden = false, 
                                    searchKeywords = "sound-effect", 
                                    queryParams = {
                                        keyword = "sound-effect", 
                                        assetSubTypes = nil, 
                                        creatorTargetId = nil, 
                                        creatorType = nil, 
                                        excludeAssetSubTypes = nil
                                    }, 
                                    path = {
                                        [1] = "audio", 
                                        [2] = "sound-effect"
                                    }, 
                                    index = 1, 
                                    children = {}, 
                                    childCount = 0
                                }
                            }, 
                            childCount = 2
                        }
                    }
                }
            }
        });
    else
        return l_Promise_0.resolve({
            responseBody = {
                topKeywords = {}, 
                sections = {}
            }
        });
    end;
end;
v12.getUniverseInfo = function(_, _)
    return l_Promise_0.resolve({
        responseBody = {
            name = "Universe", 
            rootPlaceId = 12345
        }
    });
end;
v12.purchaseAsset = function(_, v144, v145, _)
    if not v144 then
        return l_Promise_0.resolve({
            responseBody = {
                purchased = true
            }
        });
    else
        return l_Promise_0.resolve({
            actualPrice = v145.expectedPrice, 
            checkoutUrl = "http://create.roblox.com", 
            purchaseTransactionStatus = v11.Success
        });
    end;
end;
if v7() then
    v12.getDefaultCreateBundleDataSharing = function(_, _)
        return l_Promise_0.resolve({
            responseBody = {
                isEligible = true, 
                configurations = {
                    [1] = {
                        type = "AvatarBundles", 
                        isOptOut = false
                    }
                }
            }
        });
    end;
    v12.postCreateBundleDataSharing = function(_, _, _)
        return l_Promise_0.resolve({
            responseCode = 200
        });
    end;
end;
if v5() then
    v12.getPurchaserStatus = function(_)
        return l_Promise_0.resolve({
            responseBody = {
                purchaserStatus = v9.Allowed
            }
        });
    end;
end;
v12.getFiatProduct = function(_, _, _)
    return l_Promise_0.resolve({
        responseBody = v10.getDefaultFiatProduct()
    });
end;
v12.getIsOwnedByUser = function(_, _, _)
    return l_Promise_0.resolve({
        responseBody = false
    });
end;
v12.getIsAssetOpenForUse = function(_, _)
    return false;
end;
return v12;
