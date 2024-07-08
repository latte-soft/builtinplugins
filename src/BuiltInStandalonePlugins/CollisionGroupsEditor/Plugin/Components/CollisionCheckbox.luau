local v0 = require(script.Parent.Parent.Parent.Packages.Roact);
local v1 = require(script.Parent.Parent.Constants);
CollisonCheckbox = function(v2)
    local l_Style_0 = v2.Style;
    local l_CollisionCheckbox_0 = v2.Style.CollisionCheckbox;
    local l_Group_0 = v2.Group;
    local l_OtherGroup_0 = v2.OtherGroup;
    local v7 = l_Group_0.GetCollidesWith(l_OtherGroup_0);
    local v8 = if v2.RowIndex % 2 == 1 then l_CollisionCheckbox_0.BackgroundOdd else l_CollisionCheckbox_0.BackgroundEven;
    if not l_Group_0.Selected then
        if v2.RowHovered == l_Group_0.Name then
            v8 = l_Style_0.TableEntryHover;
        end;
    else
        v8 = l_Style_0.TableEntrySelected;
    end;
    local _ = nil;
    return v0.createElement("Frame", {
        LayoutOrder = v2.LayoutOrder, 
        Size = v1.GridCellSize, 
        BorderSizePixel = 1, 
        BorderColor3 = l_CollisionCheckbox_0.Border, 
        BackgroundColor3 = v8, 
        [v0.Event.MouseEnter] = function(v10, _)
            v2.OnColHovered(v10, l_OtherGroup_0.Name, true);
            v2.OnRowHovered(v10, l_Group_0.Name, true);
        end, 
        [v0.Event.MouseLeave] = function(v12, _)
            v2.OnColHovered(v12, l_OtherGroup_0.Name, false);
            v2.OnRowHovered(v12, l_Group_0.Name, false);
        end
    }, if not v2.ShouldShowCheckbox then {
        Dash = v0.createElement("Frame", {
            Size = UDim2.new(0.25, 0, 0, 2), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_CollisionCheckbox_0.NoCheckboxPanelColor, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        })
    } else {
        Padding = v0.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8), 
            PaddingLeft = UDim.new(0, 8), 
            PaddingRight = UDim.new(0, 8)
        }), 
        Button = v0.createElement("ImageButton", {
            Image = if not v7 then l_CollisionCheckbox_0.CheckboxUncheckedImage else l_CollisionCheckbox_0.CheckboxCheckedImage, 
            Size = UDim2.new(1, 0, 1, 0), 
            SizeConstraint = Enum.SizeConstraint.RelativeYY, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            BackgroundTransparency = 1, 
            [v0.Event.Activated] = function(_)
                l_Group_0.ToggleCollidesWith(l_OtherGroup_0);
            end
        })
    });
end;
return CollisonCheckbox;
