local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Urls);
local v5 = require(l_script_FirstAncestor_0.Core.Util.LayoutOrderIterator);
local v6 = require(l_script_FirstAncestor_0.Core.Components.Categorization.Swimlane);
local v7 = require(l_script_FirstAncestor_0.Core.Components.Categorization.IconTile);
local v8 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SectionHeader);
local v9 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioScrollerWrapper);
local v10 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioSort);
local _ = require(l_script_FirstAncestor_0.Core.Types.HomeTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AudioTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local v14 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagAddMoreAudioSwimlaneAnalytics);
local l_Pane_0 = v2.UI.Pane;
local l_ScrollingFrame_0 = v2.UI.ScrollingFrame;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0 = v3.ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE;
local v19 = UDim2.fromOffset(100, 100);
return function(v20)
    local v21 = l_Stylizer_0:use();
    local v22 = v5.new();
    local v24 = v1.useCallback(function(v23)
        if v20.OnSeeAllActivated then
            v20.OnSeeAllActivated(v23);
        end;
    end, {
        v20.OnSeeAllActivated
    });
    local v25 = v1.useMemo(function()
        return v20.Sections[#v20.Sections];
    end, {
        v20.Sections
    });
    local v26 = v1.useMemo(function()
        return v25.Section.subcategory == nil;
    end, {
        v25
    });
    local v31 = v1.useCallback(function(v27, v28)
        local v29 = nil;
        local v30 = nil;
        if v27.thumbnail then
            if v27.thumbnail.assetId then
                v29 = v4.constructAssetThumbnailUrl(v27.thumbnail.assetId, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0, l_ASSET_THUMBNAIL_REQUESTED_IMAGE_SIZE_0);
            end;
            if v27.thumbnail.backgroundColor then
                pcall(function()
                    v30 = Color3.fromHex(v27.thumbnail.backgroundColor);
                end);
            end;
        end;
        return v1.createElement(v7, {
            BackgroundColor = v30, 
            Image = v29, 
            Key = v27.name, 
            LayoutOrder = v27.index, 
            OnClick = function()
                if v20.OnSwimlaneTileActivated then
                    v20.OnSwimlaneTileActivated(v27, v28);
                end;
            end, 
            Size = v19, 
            Title = v27.displayName
        });
    end, {
        v20.OnSwimlaneTileActivated
    });
    local v43 = v1.useMemo(function()
        local v32 = {};
        for _, v34 in v20.Sections, nil, nil do
            local l_subcategory_0 = v34.Section.subcategory;
            if v34.ResultsState then
                local _ = v34.ResultsState.loading;
            end;
            local v37 = nil;
            if not (v34 == v25 and v26) then
                if not l_subcategory_0 or l_subcategory_0.hidden then
                    v37 = v1.createElement(v10, {
                        AssetLogicWrapperProps = v20.AssetLogicWrapperProps, 
                        AudioSection = v34, 
                        LayoutOrder = v22:getNextOrder(), 
                        OnSeeAllActivated = function()
                            v24(v34);
                        end
                    });
                else
                    local v38 = {};
                    for _, v40 in l_subcategory_0.children, nil, nil do
                        table.insert(v38, v40);
                    end;
                    v37 = v1.createElement(v6, {
                        Data = v38, 
                        IsLoading = false, 
                        LayoutOrder = v22:getNextOrder(), 
                        OnRenderItem = function(_, v42)
                            return v31(v42, v34);
                        end, 
                        OnClickSeeAll = function()
                            v24(v34);
                        end, 
                        Title = v34.Section.displayName
                    });
                end;
                v32[v34.Section.displayName] = v37;
            end;
        end;
        if v26 then
            v32.LastSortHeader = v1.createElement(v8, {
                LayoutOrder = v22:getNextOrder(), 
                ShowSeeAllText = false, 
                Title = v25.Section.displayName
            });
        end;
        return v32;
    end, {
        v20.Sections, 
        v20.AssetLogicWrapperProps, 
        v25, 
        v26, 
        v31, 
        v24
    });
    local v44 = v1.useCallback(function()
        return v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Layout = Enum.FillDirection.Vertical, 
            Spacing = UDim.new(0, v21.spacingUnit)
        }, v43);
    end, {
        v43
    });
    if not v26 then
        return v1.createElement(l_Pane_0, {
            BackgroundColor = v21.homeView.backgroundColor
        }, {
            ScrollingFrame = v1.createElement(l_ScrollingFrame_0, {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.fromScale(1, 0), 
                Layout = Enum.FillDirection.Vertical, 
                Padding = v3.SCROLLING_FRAME_VIEW_PADDING, 
                Spacing = UDim.new(0, v21.spacingUnit)
            }, v43)
        });
    elseif not v25.ResultsState then
        return nil;
    else
        return v1.createElement(v9, {
            AssetLogicWrapperProps = v20.AssetLogicWrapperProps, 
            PageSize = v20.PageSize, 
            RenderTopContent = v44, 
            ResultsState = v25.ResultsState, 
            SwimlaneName = if not v14() then nil else v25.Section.name
        });
    end;
end;
