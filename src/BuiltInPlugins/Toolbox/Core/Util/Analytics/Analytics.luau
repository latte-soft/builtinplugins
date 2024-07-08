local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.Analytics.Senders);
local _ = require(l_Parent_0.Core.Types.AnalyticsTypes);
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v4 = require(l_Parent_0.Core.Util.getUserId);
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local v6 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxListviewAnalytics);
local v7 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddAutocorrect);
local v8 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local v9 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxAddCreationsFilterToListView);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagEnableUGCUploadFlowAnalytics);
local v11 = require(l_Parent_0.Core.Flags.getFFlagEnableUGCIndividualAssetUploadAnalytics);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v13 = require(l_Parent_0.Core.Util.getPlaceId);
local function v15()
    local v14 = nil;
    pcall(function()
        v14 = l_RbxAnalyticsService_0:GetSessionId();
    end);
    return v14;
end;
local function v17()
    local v16 = nil;
    pcall(function()
        v16 = l_RbxAnalyticsService_0:GetClientId();
    end);
    return v16;
end;
local function v18()
    return 0;
end;
local v19 = {};
local v20 = game:GetService("RunService"):IsEdit();
v19.getIsEditMode = function()
    return v20;
end;
v19.getPlaceId = v13;
v19.getPlatformId = v18;
v19.getClientId = v17;
v19.getStudioSessionId = v15;
if v10() then
    v19.Status = {
        Start = "Start", 
        Success = "Success", 
        Failure = "Failure"
    };
end;
v19.onTermSearchedWithoutInsertion = function(v21, v22)
    local l_sendEventImmediately_0 = v1.sendEventImmediately;
    local v24 = "studio";
    local v25 = "toolbox";
    local v26 = "termSearchedWithoutInsertion";
    local v27 = {
        categoryName = v21, 
        searchTerm = v22
    };
    local v28 = nil;
    local v29;
    do
        local l_v28_0 = v28;
        pcall(function()
            l_v28_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v29 = l_v28_0;
    end;
    v27.studioSid = v29;
    v28 = nil;
    do
        local l_v28_1 = v28;
        pcall(function()
            l_v28_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v29 = l_v28_1;
    end;
    v27.clientId = v29;
    v27.userId = v4();
    v27.isEditMode = v20;
    l_sendEventImmediately_0(v24, v25, v26, v27);
end;
v19.onCreatorSearched = function(v32, v33, v34)
    local l_sendEventImmediately_1 = v1.sendEventImmediately;
    local v36 = "studio";
    local v37 = "toolbox";
    local v38 = "creatorSearched";
    local v39 = {
        searchTerm = v32, 
        creatorId = v33
    };
    local v40 = nil;
    local v41;
    do
        local l_v40_0 = v40;
        pcall(function()
            l_v40_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v41 = l_v40_0;
    end;
    v39.studioSid = v41;
    v40 = nil;
    do
        local l_v40_1 = v40;
        pcall(function()
            l_v40_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v41 = l_v40_1;
    end;
    v39.clientId = v41;
    v39.userId = v4();
    v39.type = if not v8() then nil else v34;
    v39.isEditMode = v20;
    l_sendEventImmediately_1(v36, v37, v38, v39);
end;
v19.onTryAsset = function(v44)
    local l_sendEventImmediately_2 = v1.sendEventImmediately;
    local v46 = "studio";
    local v47 = "toolbox";
    local v48 = "tryAsset";
    local v49 = {
        assetId = v44
    };
    local v50 = nil;
    local v51;
    do
        local l_v50_0 = v50;
        pcall(function()
            l_v50_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v51 = l_v50_0;
    end;
    v49.studioSid = v51;
    v50 = nil;
    do
        local l_v50_1 = v50;
        pcall(function()
            l_v50_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v51 = l_v50_1;
    end;
    v49.clientId = v51;
    v49.userId = v4();
    v49.isEditMode = v20;
    l_sendEventImmediately_2(v46, v47, v48, v49);
end;
v19.onTryAssetFailure = function(v54)
    local l_sendEventImmediately_3 = v1.sendEventImmediately;
    local v56 = "studio";
    local v57 = "toolbox";
    local v58 = "tryAssetFailure";
    local v59 = {
        assetId = v54
    };
    local v60 = nil;
    local v61;
    do
        local l_v60_0 = v60;
        pcall(function()
            l_v60_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v61 = l_v60_0;
    end;
    v59.studioSid = v61;
    v60 = nil;
    do
        local l_v60_1 = v60;
        pcall(function()
            l_v60_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v61 = l_v60_1;
    end;
    v59.clientId = v61;
    v59.userId = v4();
    v59.isEditMode = v20;
    l_sendEventImmediately_3(v56, v57, v58, v59);
end;
v19.onSearchOptionsOpened = function()
    local l_sendEventImmediately_4 = v1.sendEventImmediately;
    local v65 = "studio";
    local v66 = "toolbox";
    local v67 = "searchOptionsOpened";
    local v68 = {};
    local v69 = nil;
    local v70;
    do
        local l_v69_0 = v69;
        pcall(function()
            l_v69_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v70 = l_v69_0;
    end;
    v68.studioSid = v70;
    v69 = nil;
    do
        local l_v69_1 = v69;
        pcall(function()
            l_v69_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v70 = l_v69_1;
    end;
    v68.clientId = v70;
    v68.userId = v4();
    v68.isEditMode = v20;
    l_sendEventImmediately_4(v65, v66, v67, v68);
end;
v19.onCategorySelected = function(v73, v74)
    local l_sendEventImmediately_5 = v1.sendEventImmediately;
    local v76 = "studio";
    local v77 = "click";
    local v78 = "toolboxCategorySelection";
    local v79 = {
        oldCategory = v73, 
        newCategory = v74
    };
    local v80 = nil;
    local v81;
    do
        local l_v80_0 = v80;
        pcall(function()
            l_v80_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v81 = l_v80_0;
    end;
    v79.studioSid = v81;
    v80 = nil;
    do
        local l_v80_1 = v80;
        pcall(function()
            l_v80_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v81 = l_v80_1;
    end;
    v79.clientId = v81;
    v79.isEditMode = v20;
    l_sendEventImmediately_5(v76, v77, v78, v79);
end;
v19.onAssetInserted = function(v84, v85, v86, v87, v88)
    local v89 = {
        assetId = v84, 
        searchText = v85, 
        assetIndex = v86, 
        currentCategory = v87
    };
    local v90 = nil;
    local v91;
    do
        local l_v90_0 = v90;
        pcall(function()
            l_v90_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v91 = l_v90_0;
    end;
    v89.studioSid = v91;
    v90 = nil;
    do
        local l_v90_1 = v90;
        pcall(function()
            l_v90_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v91 = l_v90_1;
    end;
    v89.clientId = v91;
    v89.placeId = v13();
    v89.userId = v4();
    v89.isEditMode = v20;
    if v6() then
        v89.layoutMode = v88;
    end;
    v1.sendEventImmediately("studio", "click", "toolboxInsert", v89);
end;
v19.onAssetDragInserted = function(v94, v95, v96, v97)
    local l_sendEventImmediately_6 = v1.sendEventImmediately;
    local v99 = "studio";
    local v100 = "drag";
    local v101 = "toolboxInsert";
    local v102 = {
        assetId = v94, 
        searchText = v95, 
        assetIndex = v96, 
        currentCategory = v97
    };
    local v103 = nil;
    local v104;
    do
        local l_v103_0 = v103;
        pcall(function()
            l_v103_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v104 = l_v103_0;
    end;
    v102.studioSid = v104;
    v103 = nil;
    do
        local l_v103_1 = v103;
        pcall(function()
            l_v103_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v104 = l_v103_1;
    end;
    v102.clientId = v104;
    v102.placeId = v13();
    v102.userId = v4();
    v102.isEditMode = v20;
    l_sendEventImmediately_6(v99, v100, v101, v102);
end;
v19.reportDragInsertFinished = function(v107, v108)
    local l_sendEventImmediately_7 = v1.sendEventImmediately;
    local v110 = "studio";
    local v111 = "Marketplace";
    local v112 = "DragInsertFinished";
    local v113 = {
        assetId = v107, 
        assetTypeId = v108
    };
    local v114 = nil;
    local v115;
    do
        local l_v114_0 = v114;
        pcall(function()
            l_v114_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v115 = l_v114_0;
    end;
    v113.studioSid = v115;
    v114 = nil;
    do
        local l_v114_1 = v114;
        pcall(function()
            l_v114_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v115 = l_v114_1;
    end;
    v113.clientId = v115;
    v113.placeId = v13();
    v113.userId = v4();
    v113.isEditMode = v20;
    l_sendEventImmediately_7(v110, v111, v112, v113);
end;
v19.onPackageNoteCreated = function(v118, v119, v120)
    local l_sendEventImmediately_8 = v1.sendEventImmediately;
    local v122 = "studio";
    local v123 = "AssetConfig";
    local v124 = "PackageNoteCreated";
    local v125 = {
        assetId = v118, 
        assetVersionNumber = v119, 
        message = v120
    };
    local v126 = nil;
    local v127;
    do
        local l_v126_0 = v126;
        pcall(function()
            l_v126_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v127 = l_v126_0;
    end;
    v125.studioSid = v127;
    v126 = nil;
    do
        local l_v126_1 = v126;
        pcall(function()
            l_v126_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v127 = l_v126_1;
    end;
    v125.clientId = v127;
    v125.placeId = v13();
    v125.userId = v4();
    l_sendEventImmediately_8(v122, v123, v124, v125);
end;
v19.onPackageNoteDiscarded = function(v130, v131, v132)
    local l_sendEventImmediately_9 = v1.sendEventImmediately;
    local v134 = "studio";
    local v135 = "AssetConfig";
    local v136 = "PackageNoteDiscarded";
    local v137 = {
        assetId = v130, 
        assetVersionNumber = v131, 
        message = v132
    };
    local v138 = nil;
    local v139;
    do
        local l_v138_0 = v138;
        pcall(function()
            l_v138_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v139 = l_v138_0;
    end;
    v137.studioSid = v139;
    v138 = nil;
    do
        local l_v138_1 = v138;
        pcall(function()
            l_v138_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v139 = l_v138_1;
    end;
    v137.clientId = v139;
    v137.placeId = v13();
    v137.userId = v4();
    l_sendEventImmediately_9(v134, v135, v136, v137);
end;
v19.onPackageNoteCanceled = function(v142)
    local l_sendEventImmediately_10 = v1.sendEventImmediately;
    local v144 = "studio";
    local v145 = "AssetConfig";
    local v146 = "PackageNoteCanceled";
    local v147 = {
        assetId = v142
    };
    local v148 = nil;
    local v149;
    do
        local l_v148_0 = v148;
        pcall(function()
            l_v148_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v149 = l_v148_0;
    end;
    v147.studioSid = v149;
    v148 = nil;
    do
        local l_v148_1 = v148;
        pcall(function()
            l_v148_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v149 = l_v148_1;
    end;
    v147.clientId = v149;
    v147.placeId = v13();
    v147.userId = v4();
    l_sendEventImmediately_10(v144, v145, v146, v147);
end;
v19.incrementToolboxInsertCounter = function(v152)
    v1.reportCounter(("Studio.ToolboxInsert.%s"):format((tostring(v152))));
end;
v19.incrementToolboxCategoryInsertCounter = function(v153)
    v1.reportCounter(("Studio.ToolboxCategoryInsert.%s"):format((tostring(v153))));
end;
v19.incrementWorkspaceInsertCounter = function()
    v1.reportCounter("StudioWorkspaceInsertCounter");
end;
v19.incrementUploadAssetSuccess = function(v154)
    v1.reportCounter(("Studio.Upload.%s.Success"):format((tostring(v154))));
end;
v19.incrementUploadAssetFailure = function(v155)
    v1.reportCounter(("Studio.Upload.%s.Failure"):format((tostring(v155))));
end;
v19.onSoundPlayedCounter = function()
    v1.reportCounter("Studio.ToolboxAudio.Played");
end;
v19.onSoundPausedCounter = function()
    v1.reportCounter("Studio.ToolboxAudio.Paused");
end;
v19.sendResultToKibana = function(v156)
    assert(l_NewPackageAnalyticsWithRefactor2_0);
    v1.sendResultToKibana(v156);
end;
v19.incrementAssetImpressionCounter = function()
    v1.reportCounter("Studio.ToolboxAsset.Impression");
end;
v19.onAssetPreviewSelected = function(v157)
    local l_sendEventDeferred_0 = v1.sendEventDeferred;
    local v159 = "studio";
    local v160 = "toolbox";
    local v161 = "assetPreviewOpen";
    local v162 = {
        assetId = v157
    };
    local v163 = nil;
    local v164;
    do
        local l_v163_0 = v163;
        pcall(function()
            l_v163_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v164 = l_v163_0;
    end;
    v162.clientId = v164;
    v162.userId = v4();
    v162.platformId = 0;
    v162.isEditMode = v20;
    l_sendEventDeferred_0(v159, v160, v161, v162);
end;
v19.onAssetPreviewEnded = function(v166, v167)
    local l_sendEventDeferred_1 = v1.sendEventDeferred;
    local v169 = "studio";
    local v170 = "toolbox";
    local v171 = "modelPreviewInteractionDuration";
    local v172 = {
        assetId = v166, 
        time = v167
    };
    local v173 = nil;
    local v174;
    do
        local l_v173_0 = v173;
        pcall(function()
            l_v173_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v174 = l_v173_0;
    end;
    v172.clientId = v174;
    v172.userId = v4();
    v172.platformId = 0;
    v172.isEditMode = v20;
    l_sendEventDeferred_1(v169, v170, v171, v172);
end;
v19.onAssetInsertedFromAssetPreview = function(v176)
    local l_sendEventDeferred_2 = v1.sendEventDeferred;
    local v178 = "studio";
    local v179 = "toolbox";
    local v180 = "previewInsertion";
    local v181 = {
        assetId = v176
    };
    local v182 = nil;
    local v183;
    do
        local l_v182_0 = v182;
        pcall(function()
            l_v182_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v183 = l_v182_0;
    end;
    v181.clientId = v183;
    v181.userId = v4();
    v181.platformId = 0;
    v181.isEditMode = v20;
    l_sendEventDeferred_2(v178, v179, v180, v181);
end;
v19.onPluginButtonClickOpen = function()
    v1.sendEventDeferred("studio", "toolbox", "MarketplaceOpen", {
        userId = v4(), 
        placeId = v13(), 
        isEditMode = v20
    });
end;
v19.onPluginButtonClickClose = function()
    v1.sendEventDeferred("studio", "toolbox", "MarketplaceClosed", {
        userId = v4(), 
        placeId = v13(), 
        isEditMode = v20
    });
end;
v19.onToolboxDisplayed = function()
    v1.sendEventDeferred("studio", "toolbox", "MarketplaceImpression", {
        userId = v4(), 
        placeId = v13(), 
        isEditMode = v20
    });
end;
v19.onToolboxHidden = function()
    v1.sendEventDeferred("studio", "Marketplace", "MarketplaceHidden", {
        userId = v4(), 
        placeId = v13(), 
        isEditMode = v20
    });
end;
v19.onContextMenuClicked = function(v185, v186, v187, v188)
    local l_sendEventImmediately_11 = v1.sendEventImmediately;
    local v190 = "studio";
    local v191 = "Marketplace";
    local l_v185_0 = v185;
    local v193 = {
        assetId = v186, 
        assetTypeId = v187
    };
    local v194 = nil;
    local v195;
    do
        local l_v194_0 = v194;
        pcall(function()
            l_v194_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v195 = l_v194_0;
    end;
    v193.clientId = v195;
    v193.userId = v4();
    v193.platformId = 0;
    v194 = nil;
    do
        local l_v194_1 = v194;
        pcall(function()
            l_v194_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v195 = l_v194_1;
    end;
    v193.studioSid = v195;
    v193.isEditMode = v20;
    v193.currentCategory = v188;
    l_sendEventImmediately_11(v190, v191, l_v185_0, v193);
end;
v19.openedFromPluginManagement = function()
    local l_sendEventImmediately_12 = v1.sendEventImmediately;
    local v199 = "studio";
    local v200 = "Marketplace";
    local v201 = "OpenedFromPluginManagement";
    local v202 = {};
    local v203 = nil;
    local v204;
    do
        local l_v203_0 = v203;
        pcall(function()
            l_v203_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v204 = l_v203_0;
    end;
    v202.studioSid = v204;
    v203 = nil;
    do
        local l_v203_1 = v203;
        pcall(function()
            l_v203_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v204 = l_v203_1;
    end;
    v202.clientId = v204;
    v202.isEditMode = v20;
    l_sendEventImmediately_12(v199, v200, v201, v202);
end;
v19.openedExternallyByAssetType = function(v207)
    local l_sendEventImmediately_13 = v1.sendEventImmediately;
    local v209 = "studio";
    local v210 = "Marketplace";
    local v211 = "OpenedExternallyByAssetType";
    local v212 = {
        assetTypeName = v207
    };
    local v213 = nil;
    local v214;
    do
        local l_v213_0 = v213;
        pcall(function()
            l_v213_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v214 = l_v213_0;
    end;
    v212.clientId = v214;
    v212.isEditMode = v20;
    v213 = nil;
    do
        local l_v213_1 = v213;
        pcall(function()
            l_v213_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v214 = l_v213_1;
    end;
    v212.studioSid = v214;
    l_sendEventImmediately_13(v209, v210, v211, v212);
end;
v19.reportAssetClicked = function(v217, v218)
    local l_sendEventImmediately_14 = v1.sendEventImmediately;
    local v220 = "studio";
    local v221 = "Marketplace";
    local v222 = "ReportAssetClicked";
    local v223 = {};
    local v224 = nil;
    local v225;
    do
        local l_v224_0 = v224;
        pcall(function()
            l_v224_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v225 = l_v224_0;
    end;
    v223.studioSid = v225;
    v224 = nil;
    do
        local l_v224_1 = v224;
        pcall(function()
            l_v224_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v225 = l_v224_1;
    end;
    v223.clientId = v225;
    v223.isEditMode = v20;
    v223.assetId = v217;
    v223.assetTypeId = v218;
    l_sendEventImmediately_14(v220, v221, v222, v223);
end;
v19.reportMeshPartFiltered = function(v228)
    local l_sendEventImmediately_15 = v1.sendEventImmediately;
    local v230 = "studio";
    local v231 = "Marketplace";
    local v232 = "MeshPartFiltered";
    local v233 = {};
    local v234 = nil;
    local v235;
    do
        local l_v234_0 = v234;
        pcall(function()
            l_v234_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v235 = l_v234_0;
    end;
    v233.studioSid = v235;
    v234 = nil;
    do
        local l_v234_1 = v234;
        pcall(function()
            l_v234_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v235 = l_v234_1;
    end;
    v233.clientId = v235;
    v233.isEditMode = v20;
    v233.placeId = v13();
    v233.assetId = v228;
    l_sendEventImmediately_15(v230, v231, v232, v233);
end;
v19.onIdVerificationIconClicked = function(v238)
    local l_sendEventImmediately_16 = v1.sendEventImmediately;
    local v240 = "studio";
    local v241 = "Marketplace";
    local v242 = "IdVerificationIconClicked";
    local v243 = {
        assetId = v238
    };
    local v244 = nil;
    local v245;
    do
        local l_v244_0 = v244;
        pcall(function()
            l_v244_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v245 = l_v244_0;
    end;
    v243.clientId = v245;
    v243.userId = v4();
    v243.platformId = 0;
    v244 = nil;
    do
        local l_v244_1 = v244;
        pcall(function()
            l_v244_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v245 = l_v244_1;
    end;
    v243.studioSid = v245;
    v243.isEditMode = v20;
    l_sendEventImmediately_16(v240, v241, v242, v243);
end;
v19.marketplaceSearch = function(v248, v249, v250)
    local v251 = {};
    local v252 = nil;
    local v253;
    do
        local l_v252_0 = v252;
        pcall(function()
            l_v252_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v253 = l_v252_0;
    end;
    v251.studioSid = v253;
    v252 = nil;
    do
        local l_v252_1 = v252;
        pcall(function()
            l_v252_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v253 = l_v252_1;
    end;
    v251.clientID = v253;
    v251.creatorIDs = if not v9() then nil else v250.creatorIDs;
    v251.excludeGroupCreations = if not v9() then nil else v250.excludeGroupCreations;
    v251.groupIDs = if not v9() then nil else v250.groupIDs;
    v251.isEditMode = v20;
    v251.userID = v4();
    v251.ptid = 0;
    v251.placeID = v13();
    v251.searchKeyword = v248;
    v251.isTopKeyword = v249;
    v251.categoryName = v250.categoryName;
    v251.includeOnlyVerifiedCreators = v250.includeOnlyVerifiedCreators;
    v251.assetType = v250.assetType;
    v251.searchByCreatorID = if not v9() then v250.creatorID else nil;
    v251.searchID = v250.searchId;
    v251.sort = v250.sort;
    v251.toolboxTab = v250.toolboxTab;
    if v250.qualityFilterTags and v250.qualityFilterTags ~= "" then
        v251.qualityFilterTags = v250.qualityFilterTags;
    end;
    if v7() then
        v251.previousSearchId = v250.previousSearchId;
        v251.querySource = v250.querySource;
        v251.originalUserQuery = v250.originalUserQuery;
        v251.originalCorrection = v250.originalCorrection;
    end;
    v1.sendEventImmediately("studio", "Marketplace", "MarketplaceSearch", v251);
end;
v19.marketplaceAutocompleteSearch = function(v256, v257, v258, v259, v260, v261)
    local l_sendEventImmediately_17 = v1.sendEventImmediately;
    local v263 = "studio";
    local v264 = "Marketplace";
    local v265 = "MarketplaceAutocompleteSearch";
    local v266 = {};
    local v267 = nil;
    local v268;
    do
        local l_v267_0 = v267;
        pcall(function()
            l_v267_0 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v268 = l_v267_0;
    end;
    v266.studioSid = v268;
    v267 = nil;
    do
        local l_v267_1 = v267;
        pcall(function()
            l_v267_1 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v268 = l_v267_1;
    end;
    v266.clientID = v268;
    v266.isEditMode = v20;
    v266.userID = v4();
    v266.ptid = 0;
    v266.placeID = v13();
    v266.searchKeyword = v256;
    v266.autocompletePrefix = v257;
    v266.autocompleteKeyCount = v258;
    v266.autocompleteDeleteCount = v259;
    v266.autocompleteShown = v260;
    v266.assetType = v261.assetType;
    v266.searchByCreatorID = v261.creatorID;
    v266.searchID = v261.searchId;
    v266.sort = v261.sort;
    v266.toolboxTab = v261.toolboxTab;
    l_sendEventImmediately_17(v263, v264, v265, v266);
end;
v19.onToolboxWidgetInteraction = function(v271)
    local l_sendEventImmediately_18 = v1.sendEventImmediately;
    local v273 = "studio";
    local v274 = "Marketplace";
    local v275 = "ToolboxWidgetInteraction";
    local v276 = {};
    local v277 = nil;
    local v278;
    do
        local l_v277_0 = v277;
        pcall(function()
            l_v277_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v278 = l_v277_0;
    end;
    v276.clientId = v278;
    v276.userId = v4();
    v276.platformId = 0;
    v277 = nil;
    do
        local l_v277_1 = v277;
        pcall(function()
            l_v277_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v278 = l_v277_1;
    end;
    v276.studioSid = v278;
    v276.isEditMode = v20;
    v276.widgetWidth = v271.X;
    v276.widgetHeight = v271.Y;
    l_sendEventImmediately_18(v273, v274, v275, v276);
end;
v19.AnnouncementViewed = function(v281, v282, v283, v284, v285, v286)
    local v287 = {
        announcementButtonKey = v281, 
        announcementDateKey = v282, 
        announcementDescriptionKey = v283, 
        announcementHeaderKey = v284, 
        announcementLinkKey = v285, 
        announcementLinkLocation = v286
    };
    local v288 = nil;
    local v289;
    do
        local l_v288_0 = v288;
        pcall(function()
            l_v288_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v289 = l_v288_0;
    end;
    v287.clientId = v289;
    v287.platformId = 0;
    v288 = nil;
    do
        local l_v288_1 = v288;
        pcall(function()
            l_v288_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v289 = l_v288_1;
    end;
    v287.studioSid = v289;
    v287.userId = v4();
    v1.sendEventImmediately("studio", "Marketplace", "AnnouncementViewed", v287);
end;
v19.AnnouncementLinkClicked = function(v292, v293, v294, v295, v296, v297)
    local v298 = {
        announcementButtonKey = v292, 
        announcementDateKey = v293, 
        announcementDescriptionKey = v294, 
        announcementHeaderKey = v295, 
        announcementLinkKey = v296, 
        announcementLinkLocation = v297
    };
    local v299 = nil;
    local v300;
    do
        local l_v299_0 = v299;
        pcall(function()
            l_v299_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v300 = l_v299_0;
    end;
    v298.clientId = v300;
    v298.platformId = 0;
    v299 = nil;
    do
        local l_v299_1 = v299;
        pcall(function()
            l_v299_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v300 = l_v299_1;
    end;
    v298.studioSid = v300;
    v298.userId = v4();
    v1.sendEventImmediately("studio", "Marketplace", "AnnouncementLinkClicked", v298);
end;
v19.AnnouncementClosed = function(v303, v304, v305, v306, v307, v308, v309)
    local v310 = {
        announcementButtonKey = v303, 
        announcementDateKey = v304, 
        announcementDescriptionKey = v305, 
        announcementHeaderKey = v306, 
        announcementLinkKey = v307, 
        announcementLinkLocation = v308, 
        durationBeforeClosed = v309
    };
    local v311 = nil;
    local v312;
    do
        local l_v311_0 = v311;
        pcall(function()
            l_v311_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v312 = l_v311_0;
    end;
    v310.clientId = v312;
    v310.platformId = 0;
    v311 = nil;
    do
        local l_v311_1 = v311;
        pcall(function()
            l_v311_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v312 = l_v311_1;
    end;
    v310.studioSid = v312;
    v310.userId = v4();
    v1.sendEventImmediately("studio", "Marketplace", "AnnouncementClosed", v310);
end;
v19.AnnouncementAcknowledged = function(v315, v316, v317, v318, v319, v320, v321)
    local v322 = {
        announcementButtonKey = v315, 
        announcementDateKey = v316, 
        announcementDescriptionKey = v317, 
        announcementHeaderKey = v318, 
        announcementLinkKey = v319, 
        announcementLinkLocation = v320, 
        durationBeforeClosed = v321
    };
    local v323 = nil;
    local v324;
    do
        local l_v323_0 = v323;
        pcall(function()
            l_v323_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v324 = l_v323_0;
    end;
    v322.clientId = v324;
    v322.platformId = 0;
    v323 = nil;
    do
        local l_v323_1 = v323;
        pcall(function()
            l_v323_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v324 = l_v323_1;
    end;
    v322.studioSid = v324;
    v322.userId = v4();
    v1.sendEventImmediately("studio", "Marketplace", "AnnouncementAcknowledged", v322);
end;
v19.AssetMediaItemsUpdated = function(v327, v328, v329)
    local l_sendEventDeferred_3 = v1.sendEventDeferred;
    local v331 = "studio";
    local v332 = "Marketplace";
    local v333 = "AssetMediaItemsUpdated";
    local v334 = {
        assetId = v327, 
        assetMediaIds = table.concat(v329, ","), 
        assetTypeId = v328
    };
    local v335 = nil;
    local v336;
    do
        local l_v335_0 = v335;
        pcall(function()
            l_v335_0 = l_RbxAnalyticsService_0:GetClientId();
        end);
        v336 = l_v335_0;
    end;
    v334.clientId = v336;
    v334.platformId = 0;
    v335 = nil;
    do
        local l_v335_1 = v335;
        pcall(function()
            l_v335_1 = l_RbxAnalyticsService_0:GetSessionId();
        end);
        v336 = l_v335_1;
    end;
    v334.studioSid = v336;
    v334.userId = v4();
    l_sendEventDeferred_3(v331, v332, v333, v334);
end;
if v6() then
    v19.MarketplaceListViewToggleClicked = function(v339, v340)
        local l_sendEventDeferred_4 = v1.sendEventDeferred;
        local v342 = "studio";
        local v343 = "Marketplace";
        local v344 = "MarketplaceListViewToggleClicked";
        local v345 = {
            assetType = v340.assetType, 
            layoutMode = v339, 
            searchId = v340.searchId
        };
        local v346 = nil;
        local v347;
        do
            local l_v346_0 = v346;
            pcall(function()
                l_v346_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v347 = l_v346_0;
        end;
        v345.clientId = v347;
        v345.userId = v4();
        l_sendEventDeferred_4(v342, v343, v344, v345);
    end;
end;
if v6() then
    v19.MarketplaceAssetRowExpanded = function(v349, v350, v351, v352)
        local l_sendEventDeferred_5 = v1.sendEventDeferred;
        local v354 = "studio";
        local v355 = "Marketplace";
        local v356 = "MarketplaceAssetRowExpanded";
        local v357 = {
            assetId = v349, 
            assetType = v352.assetType, 
            pageNumber = v350, 
            pagePosition = v351, 
            searchId = v352.searchId
        };
        local v358 = nil;
        local v359;
        do
            local l_v358_0 = v358;
            pcall(function()
                l_v358_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v359 = l_v358_0;
        end;
        v357.clientId = v359;
        v357.platformId = 0;
        v357.userId = v4();
        l_sendEventDeferred_5(v354, v355, v356, v357);
    end;
end;
if v6() then
    v19.MarketplaceRecentSearchClicked = function(v361)
        local l_sendEventDeferred_6 = v1.sendEventDeferred;
        local v363 = "studio";
        local v364 = "Marketplace";
        local v365 = "MarketplaceRecentSearchClicked";
        local v366 = {
            keyword = v361
        };
        local v367 = nil;
        local v368;
        do
            local l_v367_0 = v367;
            pcall(function()
                l_v367_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v368 = l_v367_0;
        end;
        v366.clientId = v368;
        v366.userId = v4();
        l_sendEventDeferred_6(v363, v364, v365, v366);
    end;
end;
if v6() then
    v19.MarketplaceSearchFilterOpened = function(v370, v371)
        local l_sendEventDeferred_7 = v1.sendEventDeferred;
        local v373 = "studio";
        local v374 = "Marketplace";
        local v375 = "MarketplaceSearchFilterOpened";
        local v376 = {
            assetTypeId = if not v370 then nil else v370.Value
        };
        local v377 = nil;
        local v378;
        do
            local l_v377_0 = v377;
            pcall(function()
                l_v377_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v378 = l_v377_0;
        end;
        v376.clientId = v378;
        v376.toolboxTab = v371;
        v376.userId = v4();
        l_sendEventDeferred_7(v373, v374, v375, v376);
    end;
end;
if v10() then
    v19.UGCBundleValidationEvent = function(v380, v381, v382)
        local l_sendEventDeferred_8 = v1.sendEventDeferred;
        local v384 = "studio";
        local v385 = "UGCUploadFlow";
        local v386 = "UGCBundleValidationEvent";
        local v387 = {};
        local v388 = nil;
        local v389;
        do
            local l_v388_0 = v388;
            pcall(function()
                l_v388_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v389 = l_v388_0;
        end;
        v387.clientId = v389;
        v387.status = v380;
        v387.bundleType = v381;
        v387.errors = v382;
        l_sendEventDeferred_8(v384, v385, v386, v387);
    end;
    v19.UGCUploadRequestOperationIdEvent = function(v391, v392, v393, v394)
        local l_sendEventDeferred_9 = v1.sendEventDeferred;
        local v396 = "studio";
        local v397 = "UGCUploadFlow";
        local v398 = "UGCUploadRequestOperationIdEvent";
        local v399 = {};
        local v400 = nil;
        local v401;
        do
            local l_v400_0 = v400;
            pcall(function()
                l_v400_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v401 = l_v400_0;
        end;
        v399.clientId = v401;
        v399.status = v391;
        v399.bundleType = v392;
        v399.operationId = v393;
        v399.errors = v394;
        l_sendEventDeferred_9(v396, v397, v398, v399);
    end;
    v19.UGCUploadAssetsEvent = function(v403, v404, v405, v406, v407)
        local l_sendEventDeferred_10 = v1.sendEventDeferred;
        local v409 = "studio";
        local v410 = "UGCUploadFlow";
        local v411 = "UGCUploadAssetsEvent";
        local v412 = {};
        local v413 = nil;
        local v414;
        do
            local l_v413_0 = v413;
            pcall(function()
                l_v413_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v414 = l_v413_0;
        end;
        v412.clientId = v414;
        v412.status = v403;
        v412.bundleType = v404;
        v412.operationId = v405;
        v412.assetIds = v406;
        v412.errors = v407;
        l_sendEventDeferred_10(v409, v410, v411, v412);
    end;
    v19.UGCIndividualAssetUploadEvent = function(v416, v417)
        assert(v11(), "not enabled yet");
        local l_sendEventDeferred_11 = v1.sendEventDeferred;
        local v419 = "studio";
        local v420 = "UGCUploadFlow";
        local v421 = "UGCIndividualAssetUploadEvent";
        local v422 = {
            placeId = v13()
        };
        local v423 = nil;
        local v424;
        do
            local l_v423_0 = v423;
            pcall(function()
                l_v423_0 = l_RbxAnalyticsService_0:GetSessionId();
            end);
            v424 = l_v423_0;
        end;
        v422.studioSid = v424;
        v423 = nil;
        do
            local l_v423_1 = v423;
            pcall(function()
                l_v423_1 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v424 = l_v423_1;
        end;
        v422.clientId = v424;
        v422.assetId = v416;
        v422.underlyingAssetIds = v417;
        l_sendEventDeferred_11(v419, v420, v421, v422);
    end;
    v19.UGCUploadRequestBundleCreationStatusEvent = function(v427, v428, v429, v430, v431, v432)
        local l_sendEventDeferred_12 = v1.sendEventDeferred;
        local v434 = "studio";
        local v435 = "UGCUploadFlow";
        local v436 = "UGCUploadRequestBundleCreationStatusEvent";
        local v437 = {};
        local v438 = nil;
        local v439;
        do
            local l_v438_0 = v438;
            pcall(function()
                l_v438_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v439 = l_v438_0;
        end;
        v437.clientId = v439;
        v437.status = v427;
        v437.bundleType = v428;
        v437.operationId = v429;
        v437.assetIds = v430;
        v437.creationStatusId = v431;
        v437.errors = v432;
        l_sendEventDeferred_12(v434, v435, v436, v437);
    end;
    v19.UGCUploadGetBundleCreationStatusEvent = function(v441, v442, v443, v444, v445, v446, v447)
        local l_sendEventDeferred_13 = v1.sendEventDeferred;
        local v449 = "studio";
        local v450 = "UGCUploadFlow";
        local v451 = "UGCUploadGetBundleCreationStatusEvent";
        local v452 = {};
        local v453 = nil;
        local v454;
        do
            local l_v453_0 = v453;
            pcall(function()
                l_v453_0 = l_RbxAnalyticsService_0:GetClientId();
            end);
            v454 = l_v453_0;
        end;
        v452.clientId = v454;
        v452.status = v441;
        v452.bundleType = v442;
        v452.operationId = v443;
        v452.assetIds = v444;
        v452.creationStatusId = v445;
        v452.bundleId = v446;
        v452.errors = v447;
        l_sendEventDeferred_13(v449, v450, v451, v452);
    end;
end;
if l_game_EngineFeature_0 then
    v19.onAudioAssetGrantedToUserInventoryEvent = function(v456)
        local l_sendEventDeferred_14 = v1.sendEventDeferred;
        local v458 = "studio";
        local v459 = "toolboxInsert";
        local v460 = "AudioGrantedToUserInventory";
        local v461 = {
            assetId = v456, 
            placeid = v13()
        };
        local v462 = nil;
        local v463;
        do
            local l_v462_0 = v462;
            pcall(function()
                l_v462_0 = l_RbxAnalyticsService_0:GetSessionId();
            end);
            v463 = l_v462_0;
        end;
        v461.sessionid = v463;
        l_sendEventDeferred_14(v458, v459, v460, v461);
    end;
end;
return v19;
