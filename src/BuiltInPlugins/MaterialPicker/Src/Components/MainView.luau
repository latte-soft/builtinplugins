local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local v1 = require(l_script_FirstAncestor_0.SharedPluginConstants);
local v2 = require(l_script_FirstAncestor_0.Src.Constants.BASE_MATERIALS);
local v3 = require(l_script_FirstAncestor_0.Src.Util.applyToSelection);
local v4 = require(l_script_FirstAncestor_0.Src.Util.isMaterialVariantByIdentifier);
local v5 = require(l_script_FirstAncestor_0.Src.Util.setCurrentMaterial);
local v6 = require(l_script_FirstAncestor_0.Src.Util.updateRecentlyUsedList);
local v7 = require(l_script_FirstAncestor_0.Packages.Dash);
local v8 = require(l_script_FirstAncestor_0.Packages.Framework);
local v9 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v10 = require(l_script_FirstAncestor_0.Packages.React);
local l_append_0 = v7.append;
local l_copy_0 = v7.copy;
local l_filter_0 = v7.filter;
local l_keys_0 = v7.keys;
local l_Stylizer_0 = v8.Style.Stylizer;
local l_ContextServices_0 = v8.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_StudioServices_0 = v9.Context.StudioServices;
local l_MaterialGrid_0 = v9.Components.MaterialGrid;
local l_levenshteinDistance_0 = v9.Util.levenshteinDistance;
local l_getSerializedMaterialIdentifier_0 = v9.Util.getSerializedMaterialIdentifier;
local l_ViewType_0 = v9.Enums.ViewType;
local l_createElement_0 = v10.createElement;
local l_useRef_0 = v10.useRef;
local l_useEffect_0 = v10.useEffect;
local l_useState_0 = v10.useState;
local l_UI_0 = v8.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_SearchBar_0 = l_UI_0.SearchBar;
local v33 = require(script.Parent.FilterChip);
local v34 = require(script.Parent.FilterChipGroup);
local v35 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagInsertPartWithMaterial);
local v36 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagEnableMaterialGenerator);
local v37 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixMaterialSearchCrash);
local v38 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDropdownIconCanOpenPlugin);
local v39 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialPickerRemoveToggles);
local v40 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialPickerSearchPreviewer);
local v41 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialPickerFilterChipGroup);
local v42 = {};
if v40() then
    for _, v44 in ipairs(v2) do
        v42[string.lower(v44.Name)] = v44;
    end;
end;
MainView = function(v45)
    local v46 = l_Stylizer_0:use();
    local v47 = l_Localization_0.use();
    local v48 = l_StudioServices_0.use();
    local v49 = l_Analytics_0:use();
    local v50 = v48:getService("Selection");
    local v51 = v48:getService("ChangeHistoryService");
    local l_MemStorageService_0 = game:GetService("MemStorageService");
    local v53 = v48:getServiceInstance("MaterialService");
    local l_Workspace_0 = game:GetService("Workspace");
    local v55, v56 = l_useState_0(l_MemStorageService_0:GetItem(v1.MATERIAL_GENERATOR_ENABLED) == "true");
    local v57, v58 = l_useState_0(l_MemStorageService_0:GetItem(v1.MATERIAL_MANAGER_ENABLED) == "true");
    local v59, v60 = l_useState_0("");
    local v61, v62 = l_useState_0(v45.savedFilterChips or {
        recents = false, 
        appliedInPlace = false, 
        customMaterials = false, 
        defaultMaterials = false
    });
    local function _()
        return l_filter_0(v53:GetDescendants(), function(v63)
            return v63:IsA("MaterialVariant");
        end);
    end;
    local function v73(v65)
        local v66 = {};
        for _, v68 in l_Workspace_0:GetDescendants() do
            if v68:IsA("BasePart") then
                v66[l_getSerializedMaterialIdentifier_0(v68)] = true;
            end;
        end;
        local v69 = l_keys_0(v66);
        local v70 = {};
        for _, v72 in v65, nil, nil do
            if table.find(v69, (l_getSerializedMaterialIdentifier_0(v72))) then
                table.insert(v70, v72);
            end;
        end;
        return v70;
    end;
    local function v85(v74)
        local v75 = v45.plugin:GetSetting("RecentlyUsed") or {
            "Plastic"
        };
        local v76 = {};
        for v77, v78 in v74, nil, nil do
            local v79 = table.find(v75, (l_getSerializedMaterialIdentifier_0(v78)));
            if v79 then
                table.insert(v76, {
                    indexInRecentlyUsedList = v79, 
                    indexInMaterialList = v77
                });
            end;
        end;
        table.sort(v76, function(v80, v81)
            return v81.indexInRecentlyUsedList < v80.indexInRecentlyUsedList;
        end);
        local v82 = {};
        for _, v84 in v76, nil, nil do
            table.insert(v82, v74[v84.indexInMaterialList]);
        end;
        return v82;
    end;
    local function v93()
        local v87 = l_filter_0(v53:GetDescendants(), function(v86)
            return v86:IsA("MaterialVariant");
        end);
        if not v61.customMaterials then
            l_append_0(v87, l_copy_0(v2));
        end;
        local l_v87_0 = v87;
        if v61.recents then
            l_v87_0 = v85(l_v87_0);
        end;
        if v61.appliedInPlace then
            l_v87_0 = v73(l_v87_0);
        end;
        if v59 and v59 ~= "" then
            v59 = string.lower(v59);
            l_v87_0 = l_filter_0(l_v87_0, function(v89)
                local v90 = string.lower(v89.Name);
                if not v37() then
                    return string.find(v90, v59) or l_levenshteinDistance_0(v90, v59) <= 1;
                else
                    return string.find(v90, v59, 1, true) or l_levenshteinDistance_0(v90, v59) <= 1;
                end;
            end);
        end;
        if not v61.recents then
            table.sort(l_v87_0, function(v91, v92)
                return v91.Name < v92.Name;
            end);
        end;
        return l_v87_0;
    end;
    local v94 = l_useRef_0(0);
    local v95 = l_useRef_0(false);
    local v96 = l_useRef_0({});
    local function _(v97)
        if not ((not v97 or not v97:IsA("BasePart")) or v96.current[v97]) then
            v96.current[v97] = {
                Material = v97.Material, 
                MaterialVariant = v97.MaterialVariant
            };
        end;
    end;
    local function v103()
        for _, v100 in v50:Get() do
            if not ((not v100 or not v100:IsA("BasePart")) or v96.current[v100]) then
                v96.current[v100] = {
                    Material = v100.Material, 
                    MaterialVariant = v100.MaterialVariant
                };
            end;
            if v100:IsA("Model") then
                for _, v102 in v100:GetDescendants() do
                    if not ((not v102 or not v102:IsA("BasePart")) or v96.current[v102]) then
                        v96.current[v102] = {
                            Material = v102.Material, 
                            MaterialVariant = v102.MaterialVariant
                        };
                    end;
                end;
            end;
        end;
    end;
    local function _()
        for v104, v105 in pairs(v96.current) do
            v104.Material = v105.Material;
            v104.MaterialVariant = v105.MaterialVariant;
        end;
    end;
    local function v114()
        local v107 = nil;
        for _, v109 in v50:Get() do
            if not v109:IsA("BasePart") then
                if v109:IsA("Model") then
                    for _, v111 in v109:GetDescendants() do
                        if v111:IsA("BasePart") then
                            local v112 = l_getSerializedMaterialIdentifier_0(v111);
                            if v107 and v107 ~= v112 then
                                return nil;
                            else
                                v107 = v112;
                            end;
                        end;
                    end;
                end;
            else
                local v113 = l_getSerializedMaterialIdentifier_0(v109);
                if v107 and v107 ~= v113 then
                    return nil;
                else
                    v107 = v113;
                end;
            end;
        end;
        return v107;
    end;
    local function v135()
        local v115 = nil;
        if not v41() then
            local v117 = l_filter_0(v53:GetDescendants(), function(v116)
                return v116:IsA("MaterialVariant");
            end);
            if not v61.customMaterials then
                l_append_0(v117, l_copy_0(v2));
            end;
            v115 = v117;
        elseif not v61.defaultMaterials then
            local v119 = l_filter_0(v53:GetDescendants(), function(v118)
                return v118:IsA("MaterialVariant");
            end);
            if not v61.customMaterials then
                l_append_0(v119, l_copy_0(v2));
            end;
            v115 = v119;
        else
            v115 = l_copy_0(v2);
        end;
        if v61.recents then
            v115 = v85(v115);
        end;
        if v61.appliedInPlace then
            v115 = v73(v115);
        end;
        if v59 and v59 ~= "" then
            v59 = string.lower(v59);
            v115 = l_filter_0(v115, function(v120)
                local v121 = string.lower(v120.Name);
                if not v37() then
                    return string.find(v121, v59) or l_levenshteinDistance_0(v121, v59) <= 1;
                else
                    return string.find(v121, v59, 1, true) or l_levenshteinDistance_0(v121, v59) <= 1;
                end;
            end);
            local v122 = v42[v59];
            if not v41() then
                if v122 then
                    for _, v125 in (l_filter_0(v53:GetDescendants(), function(v123)
                        return v123:IsA("MaterialVariant") and v123.BaseMaterial == v122;
                    end)), nil, nil do
                        if not table.find(v115, v125) then
                            table.insert(v115, v125);
                        end;
                    end;
                end;
            elseif not (not v122 or v61.defaultMaterials) then
                for _, v128 in (l_filter_0(v53:GetDescendants(), function(v126)
                    return v126:IsA("MaterialVariant") and v126.BaseMaterial == v122;
                end)), nil, nil do
                    if not table.find(v115, v128) then
                        table.insert(v115, v128);
                    end;
                end;
            end;
            if #v115 > 0 then
                table.sort(v115, function(v129, v130)
                    return v129.Name < v130.Name;
                end);
                table.sort(v115, function(v131, v132)
                    return (string.find(string.lower(v131.Name), v59, 1, true) or 999) * 1000 + l_levenshteinDistance_0(string.lower(v131.Name), v59) < (string.find(string.lower(v132.Name), v59, 1, true) or 999) * 1000 + l_levenshteinDistance_0(string.lower(v132.Name), v59);
                end);
                v103();
                v3(v115[1], v50);
                v95.current = true;
                return v115;
            end;
        elseif not v61.recents then
            table.sort(v115, function(v133, v134)
                return v133.Name < v134.Name;
            end);
        end;
        return v115;
    end;
    local function v139(v136)
        if v136 == v59 then
            return ;
        else
            for v137, v138 in pairs(v96.current) do
                v137.Material = v138.Material;
                v137.MaterialVariant = v138.MaterialVariant;
            end;
            v95.current = false;
            v94.current = 0;
            v60(v136);
            return ;
        end;
    end;
    local function v147(v140)
        local v141 = l_getSerializedMaterialIdentifier_0(v140);
        v96.current = {};
        v3(v140, v50);
        if v35() then
            v51:SetWaypoint((("Applied %* Material to Selection"):format(v141)));
        end;
        v6(v45.plugin, v140);
        if not v38() then
            v45.onMaterialSelected(v141);
        else
            v45.onMaterialSelected(v140);
        end;
        if not v35() then
            v51:SetWaypoint((("Applied %* Material to Selection"):format(v141)));
        else
            v5(v140, v53);
        end;
        local v142 = #v50:Get();
        if v142 > 0 then
            local v143 = not v4(v141) and "BaseMaterial" or "MaterialVariant";
            local v144 = {};
            for v145, v146 in pairs(v61) do
                if v146 then
                    table.insert(v144, v145);
                end;
            end;
            v49:report("MaterialApplied", "PopupDropdown", v142, v141, v143, {
                viewType = tostring(v45.viewType), 
                isSearchBarUsed = v59 ~= "", 
                filterChips = table.concat(v144, ", "), 
                filterChipsCount = #v144
            });
        end;
    end;
    l_useEffect_0(function()
        return function()
            for v148, v149 in pairs(v96.current) do
                v148.Material = v149.Material;
                v148.MaterialVariant = v149.MaterialVariant;
            end;
        end;
    end, {});
    local v150 = v45.viewType == l_ViewType_0.Grid;
    return l_createElement_0(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        l_createElement_0(l_Pane_0, {
            key = "PrimaryTools", 
            Size = v46.PrimaryTools.Size, 
            Spacing = v46.PrimaryTools.Spacing, 
            Padding = v46.PrimaryTools.Padding, 
            Layout = Enum.FillDirection.Horizontal
        }, {
            l_createElement_0(l_SearchBar_0, {
                key = "SearchBar", 
                PlaceholderText = v47:getText("SearchBar", "SearchMaterials"), 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                OnSearchRequested = if not v40() then v60 else v139, 
                OnTextChanged = if not v40() then v60 else v139, 
                OnTextBoxFocusLost = if not v40() then nil else function(v151)
                    if not (not v151 or not v95.current) then
                        v147(v135()[1]);
                        if v45.onClose then
                            v45.onClose();
                        end;
                    end;
                end, 
                Style = "Compact", 
                Size = v46.PrimaryTools.SearchBar.Size, 
                ShouldFocusOnMount = true
            }, {}), 
            l_createElement_0(l_IconButton_0, {
                key = "ViewToggle", 
                BackgroundStyle = "Box", 
                LeftIcon = if not v150 then v46.PrimaryTools.ViewToggle.LeftIconGrid else v46.PrimaryTools.ViewToggle.LeftIconList, 
                Size = v46.PrimaryTools.ViewToggle.Size, 
                TooltipText = if not v150 then v47:getText("ViewToggle", "GridView") else v47:getText("ViewToggle", "ListView"), 
                OnClick = function()
                    local v152 = if not v150 then l_ViewType_0.Grid else l_ViewType_0.List;
                    v45.setViewType(v152);
                    v49:report("ViewTypeToggled", (tostring(v152)));
                end
            }, {})
        }), 
        l_createElement_0(l_ScrollingFrame_0, {
            Size = v46.Filters.Size, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
            ScrollBarThickness = v46.MainView.ScrollBarThickness
        }, {
            l_createElement_0(l_Pane_0, {
                key = "Filters", 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Spacing = 4, 
                Padding = {
                    Left = 8, 
                    Top = 1
                }
            }, {
                l_createElement_0(v33, {
                    Text = v47:getText("Filters", "Recents"), 
                    OnClick = function()
                        local v153 = l_copy_0(v61);
                        v153.recents = not v61.recents;
                        v62(v153);
                        if v45.onFilterChipsUpdate then
                            v45.onFilterChipsUpdate(v153);
                        end;
                        v49:report("FilterChipToggled", "Recents", not v153.recents and "Off" or "On");
                    end, 
                    selected = v61.recents
                }), 
                l_createElement_0(v33, {
                    Text = v47:getText("Filters", "AppliedInPlace"), 
                    OnClick = function()
                        local v154 = l_copy_0(v61);
                        v154.appliedInPlace = not v61.appliedInPlace;
                        v62(v154);
                        if v45.onFilterChipsUpdate then
                            v45.onFilterChipsUpdate(v154);
                        end;
                        v49:report("FilterChipToggled", "AppliedInPlace", not v154.appliedInPlace and "Off" or "On");
                    end, 
                    selected = v61.appliedInPlace
                }), 
                if not v41() then l_createElement_0(v33, {
                    Text = v47:getText("Filters", "CustomMaterials"), 
                    OnClick = function()
                        local v155 = l_copy_0(v61);
                        v155.customMaterials = not v61.customMaterials;
                        v62(v155);
                        if v45.onFilterChipsUpdate then
                            v45.onFilterChipsUpdate(v155);
                        end;
                        v49:report("FilterChipToggled", "CustomMaterials", not v155.customMaterials and "Off" or "On");
                    end, 
                    selected = v61.customMaterials
                }) else l_createElement_0(v34, {
                    LeftText = v47:getText("Filters", "CustomMaterials"), 
                    RightText = v47:getText("Filters", "DefaultMaterials"), 
                    LeftSelected = v61.customMaterials, 
                    RightSelected = v61.defaultMaterials, 
                    OnClickLeft = function()
                        local v156 = l_copy_0(v61);
                        if v156.defaultMaterials then
                            v156.defaultMaterials = false;
                        end;
                        v156.customMaterials = not v61.customMaterials;
                        v62(v156);
                        if v45.onFilterChipsUpdate then
                            v45.onFilterChipsUpdate(v156);
                        end;
                        v49:report("FilterChipToggled", "CustomMaterials", not v156.customMaterials and "Off" or "On");
                    end, 
                    OnClickRight = function()
                        local v157 = l_copy_0(v61);
                        v157.defaultMaterials = not v61.defaultMaterials;
                        if v157.customMaterials then
                            v157.customMaterials = false;
                        end;
                        v62(v157);
                        if v45.onFilterChipsUpdate then
                            v45.onFilterChipsUpdate(v157);
                        end;
                        v49:report("FilterChipToggled", "DefaultMaterials", not v157.defaultMaterials and "Off" or "On");
                    end
                })
            })
        }), 
        l_createElement_0(l_MaterialGrid_0, {
            key = "MaterialGrid", 
            AppliedItemId = v114(), 
            ShouldCenterTooltip = true, 
            ContainerXBounds = v46.MaterialGrid.ContainerXBounds, 
            ContainerYBounds = v46.MaterialGrid.ContainerYBounds, 
            Size = v46.MaterialGrid.Size, 
            GridItemsPerRow = v46.MaterialGrid.GridItemsPerRow, 
            GridItemSize = v46.MaterialGrid.GridItemSize, 
            Items = if not v40() then v93() else v135(), 
            ShowGridLabels = false, 
            OnClick = not v40() and function(v158)
                local v159 = l_getSerializedMaterialIdentifier_0(v158.Material);
                v96.current = {};
                v3(v158.Material, v50);
                if v35() then
                    v51:SetWaypoint((("Applied %* Material to Selection"):format(v159)));
                end;
                v6(v45.plugin, v158.Material);
                if not v38() then
                    v45.onMaterialSelected(v159);
                else
                    v45.onMaterialSelected(v158.Material);
                end;
                if not v35() then
                    v51:SetWaypoint((("Applied %* Material to Selection"):format(v159)));
                else
                    v5(v158.Material, v53);
                end;
                local v160 = #v50:Get();
                if v160 > 0 then
                    local v161 = not v4(v159) and "BaseMaterial" or "MaterialVariant";
                    local v162 = {};
                    for v163, v164 in pairs(v61) do
                        if v164 then
                            table.insert(v162, v163);
                        end;
                    end;
                    v49:report("MaterialApplied", "PopupDropdown", v160, v159, v161, {
                        viewType = tostring(v45.viewType), 
                        isSearchBarUsed = v59 ~= "", 
                        filterChips = table.concat(v162, ", "), 
                        filterChipsCount = #v162
                    });
                end;
            end or function(v165)
                v147(v165.Material);
            end, 
            OnMouseEnter = function(v166)
                local l_v94_0 = v94;
                l_v94_0.current = l_v94_0.current + 1;
                if v40() then
                    v95.current = false;
                end;
                v103();
                v3(v166.Material, v50);
            end, 
            OnMouseLeave = function()
                local l_v94_1 = v94;
                l_v94_1.current = l_v94_1.current - 1;
                if v94.current == 0 then
                    for v169, v170 in pairs(v96.current) do
                        v169.Material = v170.Material;
                        v169.MaterialVariant = v170.MaterialVariant;
                    end;
                end;
            end, 
            ListPadding = v46.MaterialGrid.ListPadding, 
            OnScrollUpdate = v45.onScrollUpdate, 
            OnSnapshotTaken = v45.onSnapshotTaken, 
            ViewType = v45.viewType, 
            InitialGridCanvasPosition = v45.savedGridCanvasPosition, 
            InitialListCanvasPosition = v45.savedListCanvasPosition, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            SelectedItemId = v45.selectedMaterialIdentifier, 
            ShouldSyncScroll = true, 
            SnapshotSize = v46.MaterialGrid.SnapshotSize, 
            SnapshotBorderThickness = v46.MaterialGrid.SnapshotBorderThickness, 
            TooltipDelay = v46.MaterialGrid.TooltipDelay, 
            UseInstantTooltip = true
        }), 
        l_createElement_0(l_Pane_0, {
            key = "Footer", 
            Size = v46.Footer.Size, 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = v46.Footer.Padding, 
            Spacing = v46.Footer.Spacing
        }, {
            v36() and l_createElement_0(l_IconButton_0, {
                Text = v47:getText("MainView", "MaterialGeneratorButton"), 
                Size = v46.Footer.IconButton.MaterialGeneratorButton.Size, 
                LeftIcon = v46.Footer.IconButton.MaterialGeneratorButton.Icon, 
                IconSize = v46.Footer.IconButton.IconSize, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Spacing = v46.Footer.IconButton.Spacing, 
                Padding = v46.Footer.IconButton.Padding, 
                BackgroundColor = if not v39() then if v55 then v46.Footer.IconButton.ActiveBackgroundColor else v46.Footer.IconButton.BackgroundColor else v46.Footer.IconButton.BackgroundColor, 
                OnClick = function()
                    if not v39() then
                        if not v55 then
                            local v171 = nil;
                            do
                                local l_v171_0 = v171;
                                l_v171_0 = l_MemStorageService_0:Bind(v1.MATERIAL_GENERATOR_READY, function()
                                    l_v171_0:Disconnect();
                                    l_MemStorageService_0:Fire(v1.SHOW_MATERIAL_GENERATOR_PLUGIN_EVENT);
                                    v56(true);
                                    v49:report("MaterialGeneratorOpened");
                                end);
                                l_MemStorageService_0:Fire(v1.LOAD_MATERIAL_GENERATOR);
                            end;
                        else
                            l_MemStorageService_0:Fire(v1.DEPRECATED_HIDE_MATERIAL_GENERATOR_PLUGIN_EVENT);
                            v56(false);
                            return ;
                        end;
                    else
                        if not v55 then
                            local v173 = nil;
                            do
                                local l_v173_0 = v173;
                                l_v173_0 = l_MemStorageService_0:Bind(v1.MATERIAL_GENERATOR_READY, function()
                                    l_v173_0:Disconnect();
                                    l_MemStorageService_0:Fire(v1.SHOW_MATERIAL_GENERATOR_PLUGIN_EVENT);
                                    v56(true);
                                    v49:report("MaterialGeneratorOpened");
                                end);
                                l_MemStorageService_0:Fire(v1.LOAD_MATERIAL_GENERATOR);
                            end;
                        end;
                        if v45.onClose then
                            v45.onClose();
                            return ;
                        end;
                    end;
                end
            }), 
            l_createElement_0(l_IconButton_0, {
                Text = v47:getText("MainView", "MaterialManagerButton"), 
                Size = v46.Footer.IconButton.MaterialManagerButton.Size, 
                LeftIcon = v46.Footer.IconButton.MaterialManagerButton.Icon, 
                IconSize = v46.Footer.IconButton.IconSize, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Spacing = v46.Footer.IconButton.Spacing, 
                Padding = v46.Footer.IconButton.Padding, 
                BackgroundColor = if not v39() then if v57 then v46.Footer.IconButton.ActiveBackgroundColor else v46.Footer.IconButton.BackgroundColor else v46.Footer.IconButton.BackgroundColor, 
                OnClick = function()
                    if not v39() then
                        if not v57 then
                            l_MemStorageService_0:Fire(v1.SHOW_MATERIAL_MANAGER_PLUGIN_EVENT);
                            v58(true);
                            v49:report("MaterialManagerOpened");
                        else
                            l_MemStorageService_0:Fire(v1.DEPRECATED_HIDE_MATERIAL_MANAGER_PLUGIN_EVENT);
                            v58(false);
                            return ;
                        end;
                    else
                        if not v57 then
                            l_MemStorageService_0:Fire(v1.SHOW_MATERIAL_MANAGER_PLUGIN_EVENT);
                            v58(true);
                            v49:report("MaterialManagerOpened");
                        end;
                        if v45.onClose then
                            v45.onClose();
                            return ;
                        end;
                    end;
                end
            })
        })
    });
end;
return MainView;
