local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Core.Components.SearchBar.SearchBar);
local v3 = require(l_Parent_0.Core.Components.SearchOptions.LiveSearchDropdown);
local v4 = v1.PureComponent:extend("LiveSearchBar");
local v5 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
v4.init = function(v6, v7)
    v6.state = {
        currentText = v7.searchTerm or "", 
        showDropdown = false, 
        extraDetails = {}
    };
    v6.frameRef = v1.createRef();
    v6.onTextChanged = function(v8, v9)
        if v8 ~= v6.state.currentText then
            v6:setState({
                currentText = v8, 
                showDropdown = true, 
                extraDetails = v9 or v1.None
            });
            v6.props.updateSearch(v8, v6.state.extraDetails);
        end;
    end;
    v6.onDropdownClicked = function(v10)
        v6.onTextChanged(v10.Name, v10);
        v6:setState({
            extraDetails = v10
        });
        if v6.props.OnSelectItem then
            v6.props.OnSelectItem(v10);
        end;
    end;
    v6.onDeleteTag = function()
        v6:setState({
            currentText = ""
        });
    end;
    v6.closeDropdown = function()
        v6:setState({
            showDropdown = false
        });
    end;
    v6.resetSearchBar = not v5() and function()
    end or function()
        v6:setState(function(v11)
            if (not (v11.currentText == "") or v11.showDropdown) or next(v11.extraDetails) ~= nil then
                return {
                    currentText = "", 
                    extraDetails = {}, 
                    showDropdown = false
                };
            else
                return nil;
            end;
        end);
    end;
end;
v4.didUpdate = function(v12)
    if v5() and v12.props.searchTerm == "" then
        v12.resetSearchBar();
    end;
    local l_currentText_0 = v12.state.currentText;
    if v12.props.searchTerm ~= l_currentText_0 then
        v12.props.updateSearch(l_currentText_0, v12.state.extraDetails);
    end;
end;
v4.render = function(v14)
    local l_width_0 = v14.props.width;
    local l_searchTerm_0 = v14.props.searchTerm;
    local l_LayoutOrder_0 = v14.props.LayoutOrder;
    local l_currentText_1 = v14.state.currentText;
    local l_showDropdown_0 = v14.state.showDropdown;
    local l_results_0 = v14.props.results;
    local l_defaultTextKey_0 = v14.props.defaultTextKey;
    local l_GetKey_0 = v14.props.GetKey;
    local v23 = v14.frameRef and v14.frameRef.current;
    local v24 = nil;
    v24 = if not v23 then UDim2.new() else UDim2.new(0, v23.AbsolutePosition.X, 0, v23.AbsolutePosition.Y + 26);
    local l_l_showDropdown_0_0 = l_showDropdown_0;
    if l_l_showDropdown_0_0 then
        l_l_showDropdown_0_0 = false;
        if l_searchTerm_0 == l_currentText_1 then
            l_l_showDropdown_0_0 = #l_currentText_1 >= 3;
        end;
    end;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 25), 
        [v1.Ref] = v14.frameRef
    }, {
        SearchBar = v1.createElement(v2, {
            width = l_width_0, 
            onTextChanged = v14.onTextChanged, 
            onSearchRequested = v14.onTextChanged, 
            defaultTextKey = l_defaultTextKey_0, 
            searchTerm = l_currentText_1, 
            onDeleteTag = v14.onDeleteTag, 
            IsLive = true
        }), 
        Dropdown = l_l_showDropdown_0_0 and v1.createElement(v3, {
            Size = UDim2.new(0, l_width_0, 0, 0), 
            Position = v24, 
            Items = l_results_0, 
            GetKey = l_GetKey_0, 
            SearchTerm = l_currentText_1, 
            onItemClicked = v14.onDropdownClicked, 
            closeDropdown = v14.closeDropdown
        })
    });
end;
return v4;
