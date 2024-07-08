local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Src.Components.FilterDropdown);
local v5 = require(l_Parent_0.Src.Resources.StyleTips);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Checkbox_0 = v2.UI.Checkbox;
local v8 = v2.Util.LayoutOrderIterator.new();
local l_joinTags_0 = v2.Styling.joinTags;
local function v11(v10)
    return {
        Experience = v10:getText("FilterMenu", "FilterForExperience"), 
        Localization = v10:getText("FilterMenu", "FilterForLocalization"), 
        Monetization = v10:getText("FilterMenu", "FilterForMonetization"), 
        Permissions = v10:getText("FilterMenu", "FilterForPermissions"), 
        Place = v10:getText("FilterMenu", "FilterForPlace"), 
        Publish = v10:getText("FilterMenu", "FilterForPublish")
    };
end;
local function v13(v12)
    return {
        v12:getText("FilterMenu", "FilterForAllEvents"), 
        v12:getText("FilterMenu", "FilterFor7days"), 
        v12:getText("FilterMenu", "FilterFor30days"), 
        v12:getText("FilterMenu", "FilterFor90days"), 
        v12:getText("FilterMenu", "FilterFor365days")
    };
end;
local v14 = {
    0, 
    7, 
    30, 
    90, 
    365
};
local v15 = {
    EndDate = "", 
    ExcludedEventCategories = {}, 
    ShowCollaborators = {}, 
    ShowEveryoneElse = true
};
local function v20(v16)
    local v17 = {};
    for v18, v19 in pairs(v16) do
        if not v19 then
            table.insert(v17, v18);
        end;
    end;
    return v17;
end;
local v65 = v1.forwardRef(function(v21, v22)
    local v23 = l_Localization_0:use();
    local v24 = {};
    for v25, _ in pairs(v21.rows) do
        v24[v25] = true;
    end;
    local v27, v28 = v1.useState(v24);
    v1.useImperativeHandle(v22, function()
        return {
            resetRows = function(v29)
                local v30 = {};
                for v31, _ in pairs(v29) do
                    v30[v31] = true;
                end;
                v28(v30);
            end
        };
    end);
    local v35 = v1.useMemo(function()
        for _, v34 in pairs(v27) do
            if not v34 then
                return false;
            end;
        end;
        return true;
    end, {
        v27
    });
    local v39 = v1.useCallback(function()
        local v36 = {};
        for v37, _ in pairs(v21.rows) do
            v36[v37] = not v35;
        end;
        v28(v36);
        v21.OnChange(v36);
    end, {
        v35
    });
    local v40 = v1.useMemo(function()
        if v21.ordering == nil then
            return v3.Dictionary.keys(v21.rows);
        else
            return v21.ordering;
        end;
    end, {
        v21.ordering, 
        v21.rows
    });
    local v41 = v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Row", "Component-FilterMenu-By"), 
        LayoutOrder = v8:getNextOrder()
    }, {
        Label = v1.createElement("TextLabel", {
            Text = v21.title, 
            LayoutOrder = v8:getNextOrder()
        }), 
        SelectAll = v1.createElement("TextButton", {
            [v1.Tag] = l_joinTags_0("Component-OptionButton"), 
            Text = not not v35 and v23:getText("FilterMenu", "UnselectAll") or v23:getText("FilterMenu", "SelectAll"), 
            LayoutOrder = v8:getNextOrder(), 
            [v1.Event.Activated] = v39
        })
    });
    local v42 = {};
    local v43 = 1;
    for _, v45 in ipairs(v40) do
        local v46 = v21.rows[v45];
        if v46 ~= nil then
            v43 = v43 + 1;
            local function v52()
                local l_join_0 = v3.Dictionary.join;
                local l_v27_0 = v27;
                local v49 = {};
                local l_v45_0 = v45;
                local v51 = true;
                if v27[v45] ~= nil then
                    v51 = v27[v45];
                end;
                v49[l_v45_0] = not v51;
                l_join_0 = l_join_0(l_v27_0, v49);
                v28(l_join_0);
                v21.OnChange(l_join_0);
            end;
            local l_createElement_0 = v1.createElement;
            local v54 = "Frame";
            local v55 = {
                [v1.Tag] = l_joinTags_0("X-Row", "Component-FilterMenu-CheckBoxes", "CX-Invisible"), 
                LayoutOrder = v8:getNextOrder()
            };
            local v56 = {};
            local l_createElement_1 = v1.createElement;
            local v58 = "Frame";
            local v59 = {
                [v1.Tag] = l_joinTags_0("CX-Invisible")
            };
            local v60 = {};
            local l_createElement_2 = v1.createElement;
            local l_l_Checkbox_0_0 = l_Checkbox_0;
            local v63 = {
                LayoutOrder = v8:getNextOrder()
            };
            local v64 = true;
            if v27[v45] ~= nil then
                v64 = v27[v45];
            end;
            v63.Checked = v64;
            v63.OnClick = v52;
            v60.Checkbox = l_createElement_2(l_l_Checkbox_0_0, v63);
            v56.CheckboxContainer = l_createElement_1(v58, v59, v60);
            v56.Text = v1.createElement("TextButton", {
                [v1.Tag] = l_joinTags_0("Component-CheckboxButton"), 
                Text = v46, 
                LayoutOrder = v8:getNextOrder(), 
                [v1.Event.Activated] = v52
            });
            v42[v43] = l_createElement_0(v54, v55, v56);
        end;
    end;
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("X-Column", "CX-Invisible"), 
        Size = UDim2.new(1, 0, 0, v5.checkBoxRowHeight * (v43 - 1) + v5.byHeight), 
        LayoutOrder = v21.LayoutOrder
    }, v3.Dictionary.join({
        v41
    }, v42));
end);
return function(v66)
    local v67, v68 = v1.useState(v15);
    local v69 = l_Localization_0:use();
    local v70 = v1.useRef(nil);
    local v71 = v1.useRef(nil);
    local v75 = v1.useMemo(function()
        local v72 = {};
        for v73, v74 in pairs(v66.collaborators) do
            v72[v73] = v74;
        end;
        v72[-1] = v69:getText("FilterMenu", "EveryoneElse");
        return v72;
    end, {
        v66.collaborators
    });
    return v1.createElement("Frame", {
        [v1.Tag] = l_joinTags_0("Component-FilterMenu", "X-Column", "X-Fill")
    }, {
        Header = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("X-Row", "CX-Invisible"), 
            LayoutOrder = v8:getNextOrder()
        }, {
            Text = v1.createElement("TextLabel", {
                Text = v69:getText("FilterMenu", "FilterEvents"), 
                LayoutOrder = v8:getNextOrder()
            }), 
            Clear = v1.createElement("TextButton", {
                [v1.Tag] = l_joinTags_0("Component-OptionButton"), 
                Text = v69:getText("FilterMenu", "Clear"), 
                LayoutOrder = v8:getNextOrder(), 
                [v1.Event.Activated] = function()
                    if v70.current then
                        v70.current.resetRows((v11(v69)));
                    end;
                    if v71.current then
                        v71.current.resetRows(v75);
                    end;
                    if v66.OnClear then
                        v66.OnClear();
                    end;
                end
            }), 
            Apply = v1.createElement("TextButton", {
                [v1.Tag] = l_joinTags_0("Component-OptionButton"), 
                Text = v69:getText("FilterMenu", "Apply"), 
                LayoutOrder = v8:getNextOrder(), 
                [v1.Event.Activated] = function()
                    if v66.OnApply then
                        v66.OnApply(v67);
                    end;
                end
            })
        }), 
        Divider = v1.createElement("Frame", {
            [v1.Tag] = l_joinTags_0("CX-Divider"), 
            LayoutOrder = v8:getNextOrder()
        }), 
        Contents = v1.createElement("ScrollingFrame", {
            [v1.Tag] = l_joinTags_0("CX-Invisible"), 
            LayoutOrder = v8:getNextOrder(), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            CanvasSize = UDim2.new(0, 0, 0, 0), 
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
        }, {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ByDateRange = v1.createElement("Frame", {
                [v1.Tag] = "Component-FilterMenu-By", 
                LayoutOrder = v8:getNextOrder()
            }, {
                Label = v1.createElement("TextLabel", {
                    Text = v69:getText("FilterMenu", "ByDate")
                })
            }), 
            TinySpacer = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("Component-SpacerSmall"), 
                LayoutOrder = v8:getNextOrder()
            }), 
            ByDateRangeFilter = v1.createElement(v4, {
                LayoutOrder = v8:getNextOrder(), 
                OnChanged = function(v76)
                    v68(v3.Dictionary.join(v67, {
                        EndDate = v14[v76]
                    }));
                end, 
                items = v13(v69)
            }), 
            Spacer1 = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("Component-Spacer"), 
                LayoutOrder = v8:getNextOrder()
            }), 
            ByTypeCheckBoxes = v1.createElement(v65, {
                ref = v70, 
                rows = v11(v69), 
                title = v69:getText("FilterMenu", "ByType"), 
                LayoutOrder = v8:getNextOrder(), 
                OnChange = function(v77)
                    v68(v3.Dictionary.join(v67, {
                        ExcludedEventCategories = v20(v77)
                    }));
                end
            }), 
            Spacer2 = v1.createElement("Frame", {
                [v1.Tag] = l_joinTags_0("Component-Spacer"), 
                LayoutOrder = v8:getNextOrder()
            }), 
            ByCollaboratorCheckBoxes = v1.createElement(v65, {
                ref = v71, 
                rows = v75, 
                title = v69:getText("FilterMenu", "ByUser"), 
                LayoutOrder = v8:getNextOrder(), 
                OnChange = function(v78)
                    local v79 = {};
                    for v80, _ in pairs(v66.collaborators) do
                        v79[v80] = true;
                    end;
                    local v82 = v20(v78);
                    v82[-1] = nil;
                    for _, v84 in pairs(v82) do
                        if v84 then
                            v79[v84] = false;
                        end;
                    end;
                    v68(v3.Dictionary.join(v67, {
                        ShowCollaborators = v79, 
                        ShowEveryoneElse = not v78[-1]
                    }));
                end
            })
        })
    });
end;
