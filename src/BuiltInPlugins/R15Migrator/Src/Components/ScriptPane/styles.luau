local v0 = require(script:FindFirstAncestor("R15Migrator").Packages.Framework);
local l_createStyleRule_0 = v0.Styling.createStyleRule;
local l_SharedFlags_0 = v0.SharedFlags;
local v3 = l_SharedFlags_0.getFFlagDevFrameworkTreeTableCellPadding();
local l_getFFlagDevFrameworkFixTreeTableHoverScroll_0 = l_SharedFlags_0.getFFlagDevFrameworkFixTreeTableHoverScroll;
return l_createStyleRule_0(".Component-TreeTable", {}, {
    l_createStyleRule_0(">> .Component-CellComponent", {}, {
        l_createStyleRule_0("> .Left ::UIPadding", if not v3 then {
            Padding = {
                Top = 1, 
                Bottom = 1, 
                Left = 5, 
                Right = 5
            }
        } else {
            PaddingTop = UDim.new(0, 1), 
            PaddingBottom = UDim.new(0, 1), 
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5)
        }), 
        l_createStyleRule_0(">> .Arrow", if not l_getFFlagDevFrameworkFixTreeTableHoverScroll_0() then {
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/StudioSharedUI/arrowSpritesheet.png", 
            ImageColor3 = "$TextPrimary", 
            ImageRectSize = Vector2.new(12, 12), 
            ImageRectOffset = Vector2.new(12, 0), 
            Size = UDim2.fromOffset(12, 12)
        } else {
            BackgroundTransparency = 1, 
            Image = "$ArrowRightImage", 
            Size = UDim2.fromOffset(16, 16)
        }, {
            if not v3 then nil else l_createStyleRule_0(".Invisible", {
                ImageTransparency = 1
            })
        })
    })
}, {
    ArrowSize = not l_getFFlagDevFrameworkFixTreeTableHoverScroll_0() and 12 or 16, 
    CellPadding = 5, 
    Indent = 20
});
