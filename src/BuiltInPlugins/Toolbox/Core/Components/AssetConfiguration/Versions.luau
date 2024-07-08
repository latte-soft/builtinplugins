local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Cryo);
local v5 = require(l_Packages_0.Framework);
local _ = v5.Util.deepCopy;
local l_deepEqual_0 = v5.Util.deepEqual;
local v8 = require(l_script_FirstAncestor_0.Core.Components.AssetConfiguration.VersionItem);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v10 = require(l_Util_0.Constants);
local _ = v5.Dash.slice;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v14 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v15 = require(l_script_FirstAncestor_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local l_Requests_0 = l_script_FirstAncestor_0.Core.Networking.Requests;
local v17 = require(l_Requests_0.GetVersionsHistoryRequest);
local v18 = require(l_Requests_0.MakeChangeRequest);
local v19 = require(script.Parent.VersionsTableCell);
local l_UI_0 = v5.UI;
local l_PaginatedTable_0 = l_UI_0.PaginatedTable;
local l_Container_0 = l_UI_0.Container;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v25 = require(l_Util_0.AssetConfigConstants);
local v26 = require(l_script_FirstAncestor_0.Core.Actions.SetFieldError);
local v27 = v2.PureComponent:extend("Versions");
local v28 = require(l_script_FirstAncestor_0.Core.Flags.getFFlagToolboxAddPackageVersionDescriptions);
local function v31(v29, v30)
    v29.IsCurrent = v30;
    v29.DividerAnchorPoint = Vector2.new(0.5, 1);
    if not v30 then
        v29.DividerPosition = UDim2.new(0.5, 40, 1, 0);
        v29.DividerSize = UDim2.new(1, -120, 0, 1);
    else
        v29.DividerPosition = UDim2.new(0.5, 0, 1, 0);
        v29.DividerSize = UDim2.new(1, -30, 0, 1);
    end;
    return v2.createElement(v8, v29);
end;
local function v33(v32)
    return v31(v32, true);
end;
local function v35(v34)
    return v31(v34, false);
end;
v27.init = function(v36, v37)
    local v38 = 0;
    if not (not v37.changeTable or not v37.changeTable.VersionItemSelect) then
        v38 = if not v28() then v37.changeTable.VersionItemSelect else v37.changeTable.VersionItemSelect[1];
    end;
    if not v28() then
        v36.state = {
            currentItem = {}, 
            selectVersion = v38
        };
    else
        v36.state = {
            selectVersion = v38, 
            creatorIdsToUsernames = {}, 
            loadingDescriptions = true
        };
    end;
    v36.OnItemClicked = function(v39)
        local l_selectVersion_0 = v36.state.selectVersion;
        local v41 = nil;
        if not v28() then
            v41 = v39.assetVersionNumber;
            if l_selectVersion_0 == v39.assetVersionNumber then
                v41 = nil;
            end;
        else
            v41 = v39;
            if l_selectVersion_0 == v39 then
                v41 = nil;
            end;
        end;
        if not v41 then
            if not v28() then
                v36.props.makeChangeRequest("VersionItemSelect", v41, v41);
            else
                v36.props.makeChangeRequest("VersionItemSelect", {
                    v41, 
                    v36.props.currentItem.assetVersionNumber
                }, {
                    v41, 
                    v36.props.currentItem.assetVersionNumber
                });
            end;
            v36:setState({
                selectVersion = 0
            });
            return ;
        else
            if not v28() then
                v36.props.makeChangeRequest("VersionItemSelect", l_selectVersion_0, v41);
            else
                v36.props.makeChangeRequest("VersionItemSelect", {
                    l_selectVersion_0, 
                    v36.props.currentItem.assetVersionNumber
                }, {
                    v41, 
                    v36.props.currentItem.assetVersionNumber
                });
            end;
            v36:setState({
                selectVersion = v41
            });
            return ;
        end;
    end;
    v36.GetRowHeight = function(v42, v43)
        if v42.versionColumn == v36.props.openInputKey then
            return v10.VERSIONS_INPUT_ROW_HEIGHT;
        elseif not v42.descriptionColumn.versionDescription then
            return v43;
        else
            local v44 = math.ceil(string.len(v42.descriptionColumn.versionDescription) / v10.VERSIONS_CHARS_PER_LINE) - 1;
            if v44 > 0 then
                return v43 + v44 * v10.VERSIONS_LINE_HEIGHT;
            else
                return v43;
            end;
        end;
    end;
    v36.OnPageChange = function(v45)
        v36.props.onPageChange(v45, v10.VERSIONS_ROWS_PER_PAGE);
    end;
end;
v27.didMount = function(v46)
    if not (v28() or not v46.props.assetId) then
        v46.props.getVersionsHistory(v46.props.Network.networkInterface, v46.props.assetId);
    end;
    if v28() then
        local v47 = {};
        if v46.props.versionHistory then
            local _ = {};
            for _, v50 in ipairs(v46.props.versionHistory) do
                local v51 = nil;
                if v47[v50.creatorTargetId] then
                    v51 = v47[v50.creatorTargetId];
                else
                    local l_owner_0 = v46.props.owner;
                    if (l_owner_0 and l_owner_0.targetId == v50.creatorTargetId) and Enum.CreatorType[l_owner_0.type] == Enum.CreatorType.User then
                        v51 = l_owner_0.username;
                    elseif not (not ((l_owner_0 and l_owner_0.targetId == v50.creatorTargetId) and Enum.CreatorType[l_owner_0.type] == Enum.CreatorType.Group) or not v46.props.assetGroupData) then
                        v51 = v46.props.assetGroupData.Name;
                    end;
                    if not (((v51 or not v46.props.permissions[v15.UserSubjectKey]) or not v46.props.permissions[v15.UserSubjectKey][tostring(v50.creatorTargetId)]) or not v46.props.permissions[v15.UserSubjectKey][tostring(v50.creatorTargetId)][v15.SubjectNameKey]) then
                        v51 = v46.props.permissions[v15.UserSubjectKey][tostring(v50.creatorTargetId)][v15.SubjectNameKey];
                    end;
                    v47[v50.creatorTargetId] = v51;
                end;
            end;
            v46:setState({
                creatorIdsToUsernames = v47
            });
        end;
    end;
end;
local function v54(v53)
    if v28() then
        return ;
    else
        return v4.Dictionary.join({}, v53[1] or {});
    end;
end;
local function _(v55, v56)
    for v57 = #v56 + 2, #v55 do
        v56[v57 - 1] = v55[v57];
    end;
end;
v27.createVersionsContent = function(v59, v60, v61)
    local l_props_0 = v59.props;
    local l_state_0 = v59.state;
    local l_versions_0 = v59.props.Stylizer.versions;
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20)
        }), 
        Title = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v10.VERSIONS_TITLE_HEIGHT), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 1
        }, {
            VersionsLabel = v2.createElement("TextLabel", {
                Position = UDim2.new(0, 15, 0, 15), 
                Size = UDim2.new(0, 50, 0, v10.VERSIONS_TITLE_HEIGHT), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_props_0.Localization:getText("AssetConfigVersions", "VersionHistory"), 
                TextColor3 = l_versions_0.textColor, 
                Font = v10.FONT_BOLD, 
                TextSize = v10.FONT_SIZE_TITLE, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        PreviousVersion = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, v10.VERSIONS_TITLE_HEIGHT), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            VersionsLabel = v2.createElement("TextLabel", {
                Position = UDim2.new(0, 15, 0, -10), 
                Size = UDim2.new(0, 50, 0, v10.VERSIONS_TITLE_HEIGHT), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = l_props_0.Localization:getText("AssetConfigVersions", "AddANote"), 
                TextColor3 = l_versions_0.dimmedTextColor, 
                Font = v10.FONT, 
                TextSize = v10.FONT_SIZE_LARGE, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        ItemsTable = l_props_0.versionHistory and v2.createElement("Frame", {
            Size = UDim2.new(0.9, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 4
        }, {
            VersionsTable = if not not l_state_0.loadingDescriptions and v28() then v2.createElement(l_Container_0, {
                Size = UDim2.new(1, 0, 0.5, 0)
            }, {
                LoadingIndicator = v2.createElement(l_LoadingIndicator_0, {
                    Size = UDim2.new(0, 40, 0, 40), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            }) else v2.createElement(l_PaginatedTable_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.new(0, 15, 0, -20), 
                Columns = v61, 
                Rows = l_props_0.pageRootItems, 
                CellComponent = v19.Component, 
                CellProps = {
                    Theme = l_versions_0, 
                    CurrentVersion = v60.assetVersionNumber, 
                    SelectVersion = l_state_0.selectVersion, 
                    OnClickItem = v59.OnItemClicked, 
                    IdsToUsernames = l_state_0.creatorIdsToUsernames, 
                    OpenInputKey = l_props_0.openInputKey, 
                    OnClickDesc = l_props_0.onDescClicked, 
                    PreviousInput = l_props_0.previousInput, 
                    SetPreviousInput = l_props_0.setPreviousInput, 
                    CloseInput = l_props_0.closeInput, 
                    SetVersionError = l_props_0.setVersionError, 
                    ErrorCallback = function(v65)
                        v59.props.setFieldError(v25.FIELD_NAMES.Title, v65);
                    end
                }, 
                RowHeight = v10.VERSIONS_ROW_HEIGHT, 
                GetRowHeight = v59.GetRowHeight, 
                PageSize = v10.VERSIONS_ROWS_PER_PAGE, 
                PageIndex = l_props_0.pageIndex, 
                PageCount = math.ceil(#l_props_0.rootItems / v10.VERSIONS_ROWS_PER_PAGE), 
                OnPageChange = v59.OnPageChange, 
                Footer = true
            })
        })
    });
end;
v27.didUpdate = function(v66, v67, v68)
    if not v28() then
        local l_currentItem_0 = v68.currentItem;
        local l_versionHistory_0 = v66.props.versionHistory;
        if not (next(l_currentItem_0) or not l_versionHistory_0) then
            v66:setState({
                currentItem = v54(l_versionHistory_0)
            });
        end;
    end;
    if v28() then
        local l_packageDescriptions_0 = v66.props.packageDescriptions;
        local l_packageDescriptions_1 = v67.packageDescriptions;
        if not ((not l_packageDescriptions_0 or not v66.props.rootItems) or l_deepEqual_0(l_packageDescriptions_1, v66.props.packageDescriptions) and (not v66.props.rootItems[1] or v66.props.rootItems[1].descriptionColumn.versionDescription)) then
            local l_rootItems_0 = v66.props.rootItems;
            for v74, v75 in pairs(l_packageDescriptions_0) do
                if l_rootItems_0[v74] then
                    l_rootItems_0[v74].descriptionColumn.versionDescription = v75;
                end;
            end;
            v66.props.setStates(l_rootItems_0);
        end;
        v66:setState({
            loadingDescriptions = false
        });
    end;
end;
local function v81(v76)
    local v77 = {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 20)
        })
    };
    local l_ItemListInfo_0 = v76.ItemListInfo;
    for v79 = 2, #l_ItemListInfo_0 do
        local v80 = l_ItemListInfo_0[v79];
        v77[v80.assetVersionNumber] = v2.createElement(v35, {
            ItemInfo = v80, 
            Size = v76.ItemSize, 
            SelectVersion = v76.SelectVersion, 
            ItemClickCallBack = v76.ItemClickCallBack, 
            LayoutOrder = v79 - 1
        });
    end;
    return v2.createElement("Frame", {
        Size = v76.Size, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = v76.LayoutOrder
    }, v77);
end;
v27.render = function(v82)
    local l_props_1 = v82.props;
    local l_state_1 = v82.state;
    local l_versions_1 = l_props_1.Stylizer.versions;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Size_0 = l_props_1.Size;
    local l_versionHistory_1 = l_props_1.versionHistory;
    local v89 = nil;
    v89 = if not v28() then l_state_1.currentItem else l_props_1.currentItem;
    local l_selectVersion_1 = l_state_1.selectVersion;
    local v91 = {
        [1] = "versionColumn", 
        [2] = "descriptionColumn", 
        [3] = "restoreColumn"
    };
    local v92 = {
        UDim.new(0.14, 0), 
        UDim.new(0.76, 0), 
        UDim.new(0.1, 0)
    };
    local v93 = {
        {
            Name = l_props_1.Localization:getText("AssetConfigVersions", "Version"), 
            Key = v91[1], 
            Width = v92[1]
        }, 
        {
            Name = l_props_1.Localization:getText("AssetConfigVersions", "Notes"), 
            Key = v91[2], 
            Width = v92[2]
        }, 
        {
            Name = l_props_1.Localization:getText("AssetConfigVersions", "RestoreLabel"), 
            Key = v91[3], 
            Width = v92[3]
        }
    };
    if not v28() then
        return v2.createElement("ScrollingFrame", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            CanvasSize = not not l_versionHistory_1 and UDim2.new(0, 0, 1, #l_versionHistory_1 * v10.VERSIONS_ITEM_HEIGHT) or nil, 
            LayoutOrder = l_LayoutOrder_0, 
            ScrollBarImageColor3 = l_versions_1.textColor, 
            Size = l_Size_0
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 20)
            }), 
            Title = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v10.VERSIONS_TITLE_HEIGHT), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                VersionsLabel = v2.createElement("TextLabel", {
                    Position = UDim2.new(0, 10, 0, 0), 
                    Size = UDim2.new(0, 50, 0, v10.VERSIONS_TITLE_HEIGHT), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = l_props_1.Localization:getText("AssetConfigVersions", "Current"), 
                    TextColor3 = l_versions_1.textColor, 
                    Font = v10.FONT_BOLD, 
                    TextSize = v10.FONT_SIZE_TITLE, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            CurrentItem = next(v89) and v2.createElement(v33, {
                Size = UDim2.new(1, 0, 0, v10.VERSIONS_ITEM_HEIGHT), 
                ItemInfo = v89, 
                LayoutOrder = 2
            }), 
            PreviousVersion = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, v10.VERSIONS_TITLE_HEIGHT), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 3
            }, {
                VersionsLabel = v2.createElement("TextLabel", {
                    Position = UDim2.new(0, 10, 0, 0), 
                    Size = UDim2.new(0, 50, 0, v10.VERSIONS_TITLE_HEIGHT), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Text = l_props_1.Localization:getText("AssetConfigVersions", "Restore"), 
                    TextColor3 = l_versions_1.textColor, 
                    Font = v10.FONT_BOLD, 
                    TextSize = v10.FONT_SIZE_TITLE, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            }), 
            ItemList = l_versionHistory_1 and v2.createElement(v81, {
                Size = UDim2.new(1, 0, 1, -v10.VERSIONS_TITLE_HEIGHT * 2 - v10.VERSIONS_ITEM_HEIGHT), 
                SelectVersion = l_selectVersion_1, 
                ItemSize = UDim2.new(1, 0, 0, v10.VERSIONS_ITEM_HEIGHT), 
                ItemListInfo = l_versionHistory_1, 
                ItemClickCallBack = v82.OnItemClicked, 
                LayoutOrder = 4
            })
        });
    else
        return v2.createElement(l_ScrollingFrame_0, {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = l_LayoutOrder_0, 
            ScrollBarImageColor3 = l_versions_1.dimmedTextColor, 
            Size = l_Size_0
        }, {
            VersionsContent = if l_props_1.openInputKey ~= -1 then v2.createElement("ImageButton", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                [v2.Event.Activated] = function()
                    l_props_1.closeInput(false);
                end
            }, {
                Content = v82:createVersionsContent(v89, v93)
            }) else v82:createVersionsContent(v89, v93)
        });
    end;
end;
return v3.connect(function(v94, v95)
    v94 = v94 or {};
    local l_versionHistory_2 = v94.versionHistory;
    local l_packageDescriptions_2 = v94.packageDescriptions;
    local l_changed_0 = v94.changed;
    local v99 = v94.collaborators or {};
    local v100 = not not v94.assetConfigData and v94.assetConfigData.Creator or v95.Owner;
    local v101 = (v100 and v94[v100.targetId]) and v94[v100.targetId].groupMetadata;
    if not v28() then
        return {
            versionHistory = l_versionHistory_2, 
            changeTable = l_changed_0
        };
    else
        return {
            packageDescriptions = l_packageDescriptions_2, 
            changeTable = l_changed_0, 
            permissions = v99, 
            owner = v100, 
            assetGroupData = v101
        };
    end;
end, function(v102)
    return {
        getVersionsHistory = function(v103, v104)
            v102(v17(v103, v104));
        end, 
        makeChangeRequest = function(v105, v106, v107)
            v102(v18(v105, v106, v107));
        end, 
        setFieldError = function(v108, v109)
            v102(v26(v25.SIDE_TABS.Versions, v108, v109));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v14
})(v27)));
