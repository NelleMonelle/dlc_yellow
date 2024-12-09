return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 17,
  height = 15,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 8,
  nextobjectid = 15,
  properties = {
    ["light"] = true,
    ["music"] = "steamworks_overworld"
  },
  tilesets = {
    {
      name = "steamworks",
      firstgid = 1,
      filename = "../../tilesets/steamworks.tsx",
      exportfilename = "../../tilesets/steamworks.lua"
    },
    {
      name = "steamworks_objects",
      firstgid = 1497,
      filename = "../../tilesets/steamworks_objects.tsx",
      exportfilename = "../../tilesets/steamworks_objects.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 17,
      height = 15,
      id = 1,
      name = "Tile Layer 1",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51,
        51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51,
        51, 51, 20, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 85, 21, 51, 51,
        51, 51, 53, 154, 153, 154, 154, 153, 154, 154, 119, 119, 120, 154, 50, 51, 51,
        51, 51, 53, 120, 154, 154, 154, 154, 119, 154, 154, 153, 154, 119, 50, 51, 51,
        51, 51, 53, 187, 187, 187, 187, 187, 187, 187, 187, 187, 187, 187, 84, 85, 85,
        51, 51, 53, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 118, 119, 119,
        51, 51, 53, 22, 22, 56, 22, 22, 22, 22, 22, 22, 22, 22, 152, 153, 153,
        51, 51, 53, 22, 22, 22, 22, 22, 22, 22, 22, 22, 23, 22, 22, 187, 187,
        51, 51, 53, 56, 22, 22, 22, 22, 22, 22, 22, 22, 57, 22, 22, 56, 22,
        51, 51, 53, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22,
        51, 51, 53, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 22, 17, 17,
        51, 51, 54, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 17, 55, 51, 51,
        51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51,
        51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51, 51
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 17,
      height = 15,
      id = 2,
      name = "Tile Layer 2",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 258, 259, 260, 261, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 327, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 186, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 465, 466, 467, 469, 470, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 499, 500, 501, 503, 504, 0, 0, 0, 0, 0, 443, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 228,
          y = 236,
          width = 66,
          height = 200,
          rotation = 0,
          gid = 1526,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 480,
          width = 520,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 200,
          width = 520,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 320,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 440,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 240,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 240,
          width = 40,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "polygon",
          x = 600,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = -40, y = -40 }
          },
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "polygon",
          x = 560,
          y = 480,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 40, y = 0 },
            { x = 40, y = -40 }
          },
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 286,
          y = 410,
          width = 40,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 160,
          y = 400,
          width = 120,
          height = 66,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "objects_party",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 3,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 360,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/05",
            ["marker"] = "left"
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "right",
          type = "",
          shape = "point",
          x = 600,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "spawn",
          type = "",
          shape = "point",
          x = 340,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}