local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Flags.getFFlagToolboxAddNewUGCAssetTypes);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local _ = require(l_Parent_0.Core.Actions.NetworkError);
local v4 = require(l_Parent_0.Core.Actions.SetAllowedAssetTypes);
local v5 = require(l_Parent_0.Core.Actions.SetAllowedBundleTypes);
local v6 = require(l_Parent_0.Core.Actions.SetTagsMetadata);
local _ = require(l_Parent_0.Core.Util.DebugFlags);
local v8 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAvatarTagDataIntoMock);
local v9 = {
    allowedPriceRange = {
        minRobux = 50, 
        maxRobux = 5000
    }, 
    marketplaceFeesPercentage = 70, 
    premiumPricing = {
        allowedDiscountPercentages = {
            25, 
            50, 
            75
        }, 
        allowedPriceRange = {
            minRobux = 50, 
            maxRobux = 5000
        }
    }
};
getDebugUgcBundleMetadata = function()
    return {
        Body = {
            allowedAssetTypeSettings = {
                DynamicHead = {
                    minimumQuantity = 1, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                LeftArm = {
                    minimumQuantity = 1, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                LeftLeg = {
                    minimumQuantity = 1, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                RightArm = {
                    minimumQuantity = 1, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                RightLeg = {
                    minimumQuantity = 1, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                Torso = {
                    minimumQuantity = 1, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                EyebrowAccessory = {
                    minimumQuantity = 0, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                EyelashAccessory = {
                    minimumQuantity = 0, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                HairAccessory = {
                    minimumQuantity = 0, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                MoodAnimation = {
                    minimumQuantity = 0, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = false, 
                    allowedFileExtensions = nil
                }
            }, 
            marketplaceFeePercentage = 30, 
            allowedPriceRange = {
                minimumPrice = 0, 
                maximumPrice = 5000
            }
        }, 
        DynamicHead = {
            allowedAssetTypeSettings = {
                DynamicHead = {
                    minimumQuantity = 1, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                EyebrowAccessory = {
                    minimumQuantity = 0, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }, 
                EyelashAccessory = {
                    minimumQuantity = 0, 
                    maximumQuantity = 1, 
                    isEligibleForUpload = true, 
                    allowedFileExtensions = {
                        ".rbxm"
                    }
                }
            }, 
            marketplaceFeePercentage = 30, 
            allowedPriceRange = {
                minimumPrice = 0, 
                maximumPrice = 10000
            }
        }
    };
end;
return function(_)
    return function(v11)
        local v12 = {
            Image = {
                allowedFileExtensions = {
                    ".jpg", 
                    ".png", 
                    ".bmp"
                }
            }, 
            Mesh = {
                allowedFileExtensions = {
                    ".mesh"
                }
            }, 
            Hat = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            HairAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            FaceAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            NeckAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            ShoulderAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            FrontAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            BackAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            WaistAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            TShirtAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            ShirtAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            PantsAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            JacketAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            SweaterAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            ShortsAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            LeftShoeAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            RightShoeAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            DressSkirtAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }, 
            Plugin = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            }
        };
        if v1() then
            v12.Torso = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            };
            v12.RightArm = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            };
            v12.LeftArm = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            };
            v12.LeftLeg = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            };
            v12.RightLeg = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            };
            v12.DynamicHead = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            };
            v12.EyebrowAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            };
            v12.EyelashAccessory = {
                allowedFileExtensions = {
                    ".rbxm"
                }
            };
        end;
        local v13 = {
            Hat = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            HairAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            FaceAccessory = {
                allowedPriceRange = {
                    minRobux = 15, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 15, 
                        maxRobux = 5000
                    }
                }
            }, 
            NeckAccessory = {
                allowedPriceRange = {
                    minRobux = 20, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 20, 
                        maxRobux = 5000
                    }
                }
            }, 
            ShoulderAccessory = {
                allowedPriceRange = {
                    minRobux = 15, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 15, 
                        maxRobux = 5000
                    }
                }
            }, 
            FrontAccessory = {
                allowedPriceRange = {
                    minRobux = 20, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 20, 
                        maxRobux = 5000
                    }
                }
            }, 
            BackAccessory = {
                allowedPriceRange = {
                    minRobux = 100, 
                    maxRobux = 10000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 100, 
                        maxRobux = 10000
                    }
                }
            }, 
            WaistAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            Shirt = {
                allowedPriceRange = {
                    minRobux = 5, 
                    maxRobux = 999999999
                }, 
                marketplaceFeesPercentage = 30
            }, 
            Pants = {
                allowedPriceRange = {
                    minRobux = 5, 
                    maxRobux = 999999999
                }, 
                marketplaceFeesPercentage = 30
            }, 
            TShirt = {
                allowedPriceRange = {
                    minRobux = 2, 
                    maxRobux = 999999999
                }, 
                marketplaceFeesPercentage = 30
            }, 
            TShirtAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            ShirtAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            PantsAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            JacketAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            SweaterAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            ShortsAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            LeftShoeAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            RightShoeAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }, 
            DressSkirtAccessory = {
                allowedPriceRange = {
                    minRobux = 50, 
                    maxRobux = 5000
                }, 
                marketplaceFeesPercentage = 70, 
                premiumPricing = {
                    allowedDiscountPercentages = {
                        25, 
                        50, 
                        75
                    }, 
                    allowedPriceRange = {
                        minRobux = 50, 
                        maxRobux = 5000
                    }
                }
            }
        };
        if v1() then
            v13.Torso = v9;
            v13.RightArm = v9;
            v13.LeftArm = v9;
            v13.LeftLeg = v9;
            v13.RightLeg = v9;
            v13.DynamicHead = v9;
            v13.EyebrowAccessory = v9;
            v13.EyelashAccessory = v9;
        end;
        v11:dispatch(v4(v13, v12, {}));
        if v8() then
            local v14 = {
                isItemTagsFeatureEnabled = true, 
                enabledAssetTypes = {
                    "Hat", 
                    "HairAccessory", 
                    "FaceAccessory", 
                    "NeckAccessory", 
                    "ShoulderAccessory", 
                    "BackAccessory", 
                    "FrontAccessory", 
                    "WaistAccessory", 
                    "TShirtAccessory", 
                    "ShirtAccessory", 
                    "PantsAccessory", 
                    "JacketAccessory", 
                    "SweaterAccessory", 
                    "ShortsAccessory", 
                    "LeftShoeAccessory", 
                    "RightShoeAccessory", 
                    "DressSkirtAccessory", 
                    "Shirt", 
                    "TShirt", 
                    "Pants"
                }, 
                maximumItemTagsPerItem = 5
            };
            v11:dispatch(v6(v14.isItemTagsFeatureEnabled, v14.enabledAssetTypes, v14.maximumItemTagsPerItem));
        end;
        v11:dispatch(v5(getDebugUgcBundleMetadata()));
        return l_Promise_0.resolve({});
    end;
end;
