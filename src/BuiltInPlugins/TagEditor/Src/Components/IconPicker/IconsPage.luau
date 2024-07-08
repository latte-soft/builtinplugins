local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_withContext_0 = v2.ContextServices.withContext;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_Grid_0 = v2.UI.Grid;
local v6 = require(script.Parent.Parent.Parent.FamFamFam);
local v7 = require(l_Parent_0.Src.IconCategories);
local v8 = require(l_Parent_0.Src.TagManager);
local v9 = v1.PureComponent:extend("IconsPage");
v9.init = function(v10)
    v10._enteredButton = nil;
    v10.GetIconProps = function(v11, _, v13, v14)
        local v15 = v6.Lookup(v11);
        local l_props_0 = v10.props;
        return {
            ImageRectOffset = v15.ImageRectOffset, 
            ImageRectSize = v15.ImageRectSize, 
            Image = v15.Image, 
            Position = v13, 
            Size = v14, 
            BackgroundTransparency = 1, 
            ResampleMode = Enum.ResamplerMode.Pixelated, 
            [v1.Event.MouseEnter] = function(v17)
                v10._enteredButton = v17;
                l_props_0.onHoverFunc(v11);
            end, 
            [v1.Event.MouseLeave] = function(v18)
                if v10._enteredButton == v18 then
                    l_props_0.onHoverFunc(nil);
                    v10._enteredButton = nil;
                end;
            end, 
            [v1.Event.MouseButton1Click] = function()
                v8.Get():SetIcon(l_props_0.tagName, v11);
                l_props_0.closeFunc();
            end
        };
    end;
end;
v9.render = function(v19)
    local l_props_1 = v19.props;
    local l_IconsPage_0 = l_props_1.Stylizer.IconsPage;
    local v22 = {};
    local v23 = 1;
    for _, v25 in pairs(v7) do
        for _, v27 in pairs(v25) do
            if not (l_props_1.search and not v27:find(l_props_1.search)) then
                v22[v23] = v27;
                v23 = v23 + 1;
            end;
        end;
    end;
    return v1.createElement(l_Grid_0, {
        Size = l_props_1.Size, 
        LayoutOrder = l_props_1.LayoutOrder, 
        CellSize = l_IconsPage_0.GridCellSize, 
        CellPadding = l_IconsPage_0.GridCellPadding, 
        Cells = v22, 
        CellComponent = "ImageButton", 
        GetCellProps = v19.GetIconProps
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v9));
