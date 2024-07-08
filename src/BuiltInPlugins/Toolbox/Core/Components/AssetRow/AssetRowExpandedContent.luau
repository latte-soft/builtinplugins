local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Packages_0.Dash);
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Pane_0 = v4.UI.Pane;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local v9 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v13 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v14 = require(l_script_FirstAncestor_0.Core.Components.AssetTable.GetAssetTableSizes);
local v15 = require(l_script_FirstAncestor_0.Core.Components.ItemRow.ItemRowMetadata);
local v16 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
if require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows)() then
    local v18 = v2.PureComponent:extend("AssetRowExpandedContent");
    v18.defaultProps = {
        Size = UDim2.new(1, 0, 0, 26)
    };
    v18.init = function(v19)
        v19.getDescriptionWidth = function()
            local l_props_0 = v19.props;
            local v21 = not l_props_0.AbsoluteSize and 0 or l_props_0.AbsoluteSize.X;
            local v22, v23 = v14(v21);
            local v24 = {
                v9.ASSET_ROW_COLUMNS.ICON, 
                v9.ASSET_ROW_COLUMNS.NAME, 
                v9.ASSET_ROW_COLUMNS.CREATOR
            };
            if v23 <= v21 then
                table.insert(v24, v9.ASSET_ROW_COLUMNS.DATE_UPDATED);
            end;
            local v25 = 0;
            local v26 = 0;
            for _, v28 in pairs(v24) do
                if v22[v28] then
                    v25 = v25 + v22[v28].X.Scale;
                    v26 = v26 + v22[v28].X.Offset;
                end;
            end;
            return v25, v26;
        end;
    end;
    v18.render = function(v29)
        local l_props_1 = v29.props;
        local l_Localization_0 = l_props_1.Localization;
        local v32 = l_LayoutOrderIterator_0.new();
        local l_Asset_0 = l_props_1.AssetInfo.Asset;
        local l_AssetGenres_0 = l_Asset_0.AssetGenres;
        local v35 = l_Asset_0.Description or "---";
        local v36 = if not not l_AssetGenres_0 and #l_AssetGenres_0 > 0 then table.concat(l_AssetGenres_0, ",") else "---";
        local v37, _ = v14(not l_props_1.AbsoluteSize and 0 or l_props_1.AbsoluteSize.X);
        local v39, v40 = v29.getDescriptionWidth();
        local v41 = v37[v9.ASSET_ROW_COLUMNS.DATE_UPDATED];
        return v2.createElement(l_Pane_0, v5.join({
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_props_1.LayoutOrder, 
            Padding = 10, 
            Size = l_props_1.Size
        }, l_props_1.WrapperProps), {
            DescriptionContainer = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v32:getNextOrder(), 
                Spacing = 10, 
                Size = UDim2.new(1, 0, 0, 0)
            }, {
                Description = v2.createElement(v15, {
                    LayoutOrder = v32:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("General", "Description"):upper(), 
                    MaxLinesOfText = 2, 
                    Size = UDim2.new(v39, v40, 0, 0), 
                    Text = v35
                }), 
                Category = v2.createElement(v15, {
                    LayoutOrder = v32:getNextOrder(), 
                    HeaderText = l_Localization_0:getText("General", "Genre"):upper(), 
                    MaxLinesOfText = nil, 
                    Padding = {
                        Left = v9.ITEM_ROW.LEFT_RIGHT_PADDING
                    }, 
                    Size = UDim2.new(v41.X.Scale, v41.X.Offset, v41.Y.Scale, v41.Y.Offset), 
                    Text = v36
                })
            })
        });
    end;
    return l_withAbsoluteSize_0((v3.connect(nil, function(v42)
        return {
            searchWithOptions = function(v43, v44, v45)
                v42(v16(v43, v44, v45));
            end
        };
    end)((l_withContext_0({
        Localization = l_ContextServices_0.Localization, 
        Network = v12, 
        Settings = v13, 
        Stylizer = l_ContextServices_0.Stylizer
    })(v18)))));
else
    return {};
end;
