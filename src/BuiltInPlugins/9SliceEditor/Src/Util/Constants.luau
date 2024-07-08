local v0 = {
    WIDGET_SIZE = Vector2.new(330, 255), 
    BUTTON_FROMEDGE_PADDING = 20, 
    BUTTON_FROMCENTER_PADDING = 5, 
    BACKGROUND_SIZE = 180, 
    IMAGE_SIZE = 150, 
    BACKGROUND_FROMEDGE_PADDING = 40, 
    BACKGROUND_TILE_SIZE = 20, 
    PIXEL_TOP_PADDING = 5
};
v0.PIXEL_YPOSITION = v0.BACKGROUND_SIZE + v0.PIXEL_TOP_PADDING;
v0.IMAGE_PREVIEW_WINDOW_PADDING = 18;
v0.DRAGGER_WIDTH = 9;
v0.DRAGGER_HEIGHT = 180;
v0.DRAGGER_WIDTH_V2 = 8;
v0.DRAGGER_CLICK_WINDOW_WIDTH = 16;
v0.DRAGGER_CENTER_INSETPX = 1;
v0.DRAGGER_HANDLE_SIZE = 16;
v0.IMAGES = {
    BACKGROUND_GRID = "rbxasset://textures/9SliceEditor/" .. "GridPattern.png", 
    HORIZONTAL_DRAGGER = "rbxasset://textures/9SliceEditor/" .. "HorizontalDragger.png", 
    VERTICAL_DRAGGER = "rbxasset://textures/9SliceEditor/" .. "VerticalDragger.png", 
    DRAGGER_V2 = {
        LEFT = {
            NORMAL = "rbxasset://textures/9SliceEditor/" .. "Dragger2Left.png", 
            OUTLINED = "rbxasset://textures/9SliceEditor/" .. "Dragger2OutlinedLeft.png"
        }, 
        RIGHT = {
            NORMAL = "rbxasset://textures/9SliceEditor/" .. "Dragger2Right.png", 
            OUTLINED = "rbxasset://textures/9SliceEditor/" .. "Dragger2OutlinedRight.png"
        }, 
        TOP = {
            NORMAL = "rbxasset://textures/9SliceEditor/" .. "Dragger2Top.png", 
            OUTLINED = "rbxasset://textures/9SliceEditor/" .. "Dragger2OutlinedTop.png"
        }, 
        BOTTOM = {
            NORMAL = "rbxasset://textures/9SliceEditor/" .. "Dragger2Bottom.png", 
            OUTLINED = "rbxasset://textures/9SliceEditor/" .. "Dragger2OutlinedBottom.png"
        }
    }
};
v0.MOUSE_CURSORS = {
    EW = "rbxasset://SystemCursors/SizeEW", 
    NS = "rbxasset://SystemCursors/SizeNS", 
    NONE = ""
};
v0.TEXTIMAGE_PADDING = 70;
v0.TEXTEDITOR_YOFFSET = 116;
v0.TEXTEDITOR_XOFFSET = (v0.BACKGROUND_SIZE + v0.BACKGROUND_FROMEDGE_PADDING) + v0.TEXTIMAGE_PADDING;
v0.TEXTEDITOR_XSIZE = 110;
v0.TEXTEDITOR_YSIZE = 140;
v0.TEXTSIZE = 18;
v0.TEXTINPUT_PADDING = 8;
v0.LEFTINPUT_YPOSITION = 24;
v0.RIGHTINPUT_YPOSITION = (v0.LEFTINPUT_YPOSITION + 20) + v0.TEXTINPUT_PADDING;
v0.TOPINPUT_YPOSITION = (v0.RIGHTINPUT_YPOSITION + 20) + v0.TEXTINPUT_PADDING;
v0.BOTTOMINPUT_YPOSITION = (v0.TOPINPUT_YPOSITION + 20) + v0.TEXTINPUT_PADDING;
v0.TEXTLABEL_PADDING = 2;
v0.LEFTLABEL_YPOSITION = v0.LEFTINPUT_YPOSITION + v0.TEXTLABEL_PADDING;
v0.RIGHTLABEL_YPOSITION = v0.RIGHTINPUT_YPOSITION + v0.TEXTLABEL_PADDING;
v0.TOPLABEL_YPOSITION = v0.TOPINPUT_YPOSITION + v0.TEXTLABEL_PADDING;
v0.BOTTOMLABEL_YPOSITION = v0.BOTTOMINPUT_YPOSITION + v0.TEXTLABEL_PADDING;
return v0;
