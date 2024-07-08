local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Util.View);
local l_deepJoin_0 = require(l_Parent_0.Packages.Framework).Util.deepJoin;
return v2.createReducer({
    assetsTable = {
        assets = {}, 
        assetPreviewData = {}, 
        assetsModerationData = {}, 
        index = 0
    }, 
    bulkImporterRunning = false, 
    editingAssets = {}, 
    isFetchingAssets = false, 
    recentAssets = {}, 
    recentViewToggled = false, 
    searchTerm = "", 
    selectedAssets = {}, 
    selectionIndex = 0, 
    universeName = "", 
    view = v3.LIST
}, {
    SetAssets = function(v5, v6)
        return v1.Dictionary.join(v5, {
            assetsTable = v1.Dictionary.join(v5.assetsTable, v6.assetsTable)
        });
    end, 
    SetBulkImporterRunning = function(v7, v8)
        return v1.Dictionary.join(v7, {
            bulkImporterRunning = v8.bulkImporterRunning
        });
    end, 
    SetEditingAssets = function(v9, v10)
        return v1.Dictionary.join(v9, {
            editingAssets = v10.editingAssets
        });
    end, 
    SetIsFetchingAssets = function(v11, v12)
        return v1.Dictionary.join(v11, {
            isFetchingAssets = v12.isFetchingAssets
        });
    end, 
    SetRecentAssets = function(v13, v14)
        return v1.Dictionary.join(v13, {
            recentAssets = v14.recentAssets
        });
    end, 
    SetRecentViewToggled = function(v15, v16)
        return v1.Dictionary.join(v15, {
            recentViewToggled = v16.recentViewToggled
        });
    end, 
    SetSearchTerm = function(v17, v18)
        return v1.Dictionary.join(v17, {
            searchTerm = v18.searchTerm
        });
    end, 
    SetSelectedAssets = function(v19, v20)
        return v1.Dictionary.join(v19, {
            selectedAssets = v20.selectedAssets
        });
    end, 
    SetSelectionIndex = function(v21, v22)
        return v1.Dictionary.join(v21, {
            selectionIndex = v22.selectionIndex
        });
    end, 
    SetUniverseName = function(v23, v24)
        return v1.Dictionary.join(v23, {
            universeName = v24.universeName
        });
    end, 
    SetView = function(v25, v26)
        return v1.Dictionary.join(v25, {
            view = v26.view
        });
    end, 
    SetAssetPreviewData = function(v27, v28)
        return v1.Dictionary.join(v27, {
            assetsTable = v1.Dictionary.join(v27.assetsTable, {
                assetPreviewData = v1.Dictionary.join(v27.assetsTable.assetPreviewData, v28.assetPreviewData)
            })
        });
    end, 
    SetAssetOwnerName = function(v29, v30)
        return (l_deepJoin_0(v29, {
            assetsTable = {
                assetPreviewData = {
                    [v30.assetId] = {
                        Creator = {
                            Name = v30.username
                        }
                    }
                }
            }
        }));
    end, 
    SetRootTreeViewInstance = function(v31, v32)
        return (l_deepJoin_0(v31, {
            assetsTable = {
                assetPreviewData = {
                    [v32.assetId] = {
                        rootTreeViewInstance = v32.rootTreeViewInstance
                    }
                }
            }
        }));
    end, 
    SetAssetFavorited = function(v33, v34)
        return (l_deepJoin_0(v33, {
            assetsTable = {
                assetPreviewData = {
                    [v34.assetId] = {
                        favorited = v34.isAssetFavorited
                    }
                }
            }
        }));
    end, 
    SetAssetFavoriteCount = function(v35, v36)
        return (l_deepJoin_0(v35, {
            assetsTable = {
                assetPreviewData = {
                    [v36.assetId] = {
                        favoriteCount = v36.favoriteCount
                    }
                }
            }
        }));
    end, 
    IncrementAssetFavoriteCount = function(v37, v38)
        local v39 = v37.assetsTable.assetPreviewData[v38.assetId];
        local _ = nil;
        return (l_deepJoin_0(v37, {
            assetsTable = {
                assetPreviewData = if not v39 then {
                    [v38.assetId] = {
                        favoriteCount = v38.incrementCount
                    }
                } else {
                    [v38.assetId] = v1.Dictionary.join(v37.assetsTable.assetPreviewData[v38.assetId], {
                        favoriteCount = v39.favoriteCount + v38.incrementCount
                    })
                }
            }
        }));
    end, 
    SetAssetsModerationData = function(v41, v42)
        return v1.Dictionary.join(v41, {
            assetsTable = v1.Dictionary.join(v41.assetsTable, {
                assetsModerationData = v1.Dictionary.join(v41.assetsTable.assetsModerationData, v42.assetsModerationData)
            })
        });
    end, 
    ChangeAssetAlias = function(v43, v44)
        local v45 = {
            assetsTable = {
                assets = {
                    [v44.assetId] = {
                        name = v44.newAlias
                    }
                }
            }
        };
        if v43.recentAssets[v44.assetId] then
            v45.recentAssets = {
                [v44.assetId] = {
                    name = v44.newAlias
                }
            };
        end;
        return l_deepJoin_0(v43, v45);
    end
});
