local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_TreeTable_0 = require(l_Parent_0.Packages.Framework).UI.TreeTable;
local v2 = require(l_Parent_0.Packages.Dash);
local l_append_0 = v2.append;
local l_collectArray_0 = v2.collectArray;
local l_join_0 = v2.join;
local l_keys_0 = v2.keys;
local l_map_0 = v2.map;
local v8 = require(l_Parent_0.Src.Util.MenuHelpers);
local v9 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v10 = require(l_Parent_0.Src.Util.StyleSchema);
local v11 = require(l_Parent_0.Src.Util.Styling);
local v12 = require(l_Parent_0.Src.Util.TokenHelpers);
local v13 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local _ = require(l_Parent_0.Src.Types);
local v17 = {
    Columns = {
        {
            Name = "Name", 
            Key = "Name", 
            Width = UDim.new(0.5, 0)
        }, 
        {
            Name = "Value", 
            Key = "Value", 
            Width = UDim.new(0.5, 0)
        }
    }, 
    NAME_COLUMN_INDEX = 1, 
    VALUE_COLUMN_INDEX = 2, 
    getItemChildren = function(v15)
        return v15.Children or {};
    end, 
    getItemId = function(v16)
        return v16.Id;
    end
};
local v18 = l_TreeTable_0.EditTree.new({
    getChildren = v17.getItemChildren, 
    getId = v17.getItemId
});
v17.EditTree = v18;
v17._buildStyleRule = function(v19)
    local v20 = v13.createItemId(v19);
    return {
        Id = v20, 
        Name = {
            ErrorMessage = v19.SelectorError, 
            FullSpan = true, 
            Actions = v8.FullSpanMoreAction, 
            Schema = v10.SelectorSchema, 
            Value = v19.Selector
        }, 
        Instance = v19, 
        Children = l_append_0(v17._buildProperties(v20, v19), (l_map_0(v19:GetStyleRules(), function(v21)
            return v17._buildStyleRule(v21);
        end)))
    };
end;
v17._buildEmptyRow = function(v22, v23)
    return {
        Id = v13.createItemId(v22, "@Empty"), 
        Name = {
            Schema = l_join_0(v10.PropertyNameSchema, {
                StyleRuleInfo = v23
            }), 
            Value = ""
        }, 
        Value = {
            Actions = v8.MoreAction, 
            Schema = {
                Type = "Empty"
            }, 
            Value = ""
        }, 
        Children = {}
    };
end;
v17._buildProperties = function(v24, v25)
    local v26 = v9.findFirstClassSelector(v25);
    local l_v25_Properties_0 = v25:GetProperties();
    local v28 = l_keys_0(l_v25_Properties_0);
    local v29 = v11.getStyleInfo(v25);
    table.sort(v28);
    local v36 = l_collectArray_0(v28, function(_, v31)
        local v32 = l_v25_Properties_0[v31];
        local v33 = nil;
        local v34 = v12.parseAttributeName(v32) ~= nil;
        if v26 and v26 ~= "" then
            v33 = v10.getPropertySchema(v31, v26);
        else
            if not (not (v32 ~= nil) or v34) then
                v33 = v10.PropertySchemas[typeof(v32)];
            end;
            if not v33 then
                v33 = v10.getPropertySchema(v31, "");
            end;
        end;
        if not v33 then
            if v31 == "" then
                return nil;
            else
                v33 = v10.TextSchema;
            end;
        end;
        if v34 then
            v33 = l_join_0(v10.TokenReferenceSchema, {
                Instance = v25, 
                ExpectedTypes = v10.getPossiblePropertyTypes(v31)
            });
        end;
        local v35 = v13.createItemId(v25, v31);
        return {
            Id = v35, 
            Name = {
                Schema = l_join_0(v10.PropertyNameSchema, {
                    StyleRuleInfo = v29
                }), 
                Value = v31
            }, 
            Value = {
                Actions = v8.MoreAction, 
                Schema = v33, 
                Value = if not v33.Validate(v32) then v33.GetDefaultValue() else v32
            }, 
            Children = if not not v33.Validate(v32) and v33.GetChildren then v33.GetChildren(v32, v35) else {}
        };
    end);
    table.insert(v36, v17._buildEmptyRow(v24, v29));
    return v36;
end;
v17.buildItems = function(v37)
    return v18:updatePaths({
        (v17._buildStyleRule(v37))
    });
end;
v17.expandNewRows = function(v38, v39)
    if not v38 or #v38 == 0 then
        return ;
    else
        for _, v41 in ipairs(v38) do
            if not (not (v39[v41.Id] ~= false) or not v41.Name.FullSpan) then
                v39[v41.Id] = true;
            end;
            v17.expandNewRows(v41.Children, v39);
        end;
        return ;
    end;
end;
return v17;
