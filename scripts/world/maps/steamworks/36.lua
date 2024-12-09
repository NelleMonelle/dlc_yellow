return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 38,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 14,
  properties = {
    ["light"] = true,
    ["name"] = "A Road Ahead"
  },
  tilesets = {
    {
      name = "steamworks",
      firstgid = 1,
      filename = "../../tilesets/steamworks.tsx",
      exportfilename = "../../tilesets/steamworks.lua"
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 38,
      height = 12,
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
        0, 0, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 929, 0, 0, 0, 929, 0, 0, 0, 929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 929, 0, 0, 0, 929, 0, 0, 0, 929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 895, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        960, 960, 960, 960, 961, 929, 959, 960, 961, 929, 959, 960, 961, 929, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        886, 886, 886, 886, 923, 960, 922, 886, 923, 960, 922, 886, 923, 960, 960, 960, 960, 960, 961, 893, 891, 891, 891, 891, 892, 891, 891, 891, 892, 891, 891, 891, 0, 0, 0, 0, 0, 0,
        920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 920, 921, 927, 925, 926, 925, 925, 925, 926, 925, 925, 925, 925, 925, 925, 925, 0, 0, 0, 0, 0,
        963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 964, 0, 929, 0, 0, 929, 0, 0, 929, 0, 0, 929, 0, 0, 929, 0, 0, 0, 0, 0,
        963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 963, 964, 0, 895, 0, 0, 895, 0, 0, 895, 0, 0, 895, 0, 0, 895, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 240,
          width = 560,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 400,
          width = 1520,
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
          x = 520,
          y = 280,
          width = 1000,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 7,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/37",
            ["marker"] = "right"
          }
        },
        {
          id = 10,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 1440,
          y = 320,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/35",
            ["marker"] = "left"
          }
        },
        {
          id = 13,
          name = "savepoint",
          type = "",
          shape = "point",
          x = 460,
          y = 301,
          width = 0,
          height = 0,
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
          id = 8,
          name = "left",
          type = "",
          shape = "point",
          x = 80,
          y = 340,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "spawn",
          type = "",
          shape = "point",
          x = 460,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "right",
          type = "",
          shape = "point",
          x = 1400,
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
