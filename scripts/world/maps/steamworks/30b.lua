return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 31,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 10,
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
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 31,
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
        0, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 617, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 617, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 311, 0, 0, 0, 0, 0, 345, 0, 0, 0, 0, 0, 311, 0, 0, 0, 0, 0, 311, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 651, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 3221226123, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 618, 0, 0, 0, 0, 0, 0,
        36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36, 36,
        104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104, 104,
        0, 0, 0, 239, 0, 0, 0, 0, 0, 239, 0, 0, 0, 0, 0, 239, 0, 0, 0, 0, 0, 239, 0, 0, 0, 0, 0, 239, 0, 0, 0,
        0, 0, 0, 273, 0, 0, 0, 0, 0, 273, 0, 0, 0, 0, 0, 273, 0, 0, 0, 0, 0, 273, 0, 0, 0, 0, 0, 273, 0, 0, 0,
        0, 0, 0, 307, 0, 0, 0, 0, 0, 307, 0, 0, 0, 0, 0, 307, 0, 0, 0, 0, 0, 307, 0, 0, 0, 0, 0, 307, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 31,
      height = 12,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        516, 516, 516, 517, 516, 516, 516, 516, 516, 516, 516, 516, 516, 516, 516, 516, 517, 516, 516, 516, 516, 516, 516, 516, 516, 516, 516, 516, 516, 517, 516,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138, 138,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          x = 0,
          y = 240,
          width = 1240,
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
          x = 0,
          y = 360,
          width = 1240,
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
          id = 4,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 1200,
          y = 280,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/30",
            ["marker"] = "left"
          }
        },
        {
          id = 5,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/31",
            ["marker"] = "right"
          }
        },
        {
          id = 9,
          name = "enemy",
          type = "",
          shape = "point",
          x = 500,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["actor"] = "tellyvis",
            ["lightencounter"] = "tellyvis"
          }
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
          id = 6,
          name = "right",
          type = "",
          shape = "point",
          x = 1160,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "left",
          type = "",
          shape = "point",
          x = 80,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "spawn",
          type = "",
          shape = "point",
          x = 1040,
          y = 320,
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
