return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 70,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 28,
  properties = {
    ["light"] = true
  },
  tilesets = {
    {
      name = "steamworks_objects_big",
      firstgid = 1,
      filename = "../../../tilesets/steamworks_objects_big.tsx",
      exportfilename = "../../../tilesets/steamworks_objects_big.lua"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 480,
          width = 2800,
          height = 480,
          rotation = 0,
          gid = 11,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "stw_room35embers",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 40,
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
      id = 3,
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
          id = 2,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 2032,
          y = 264,
          width = 40,
          height = 78,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/34",
            ["marker"] = "left"
          }
        },
        {
          id = 3,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 728,
          y = 264,
          width = 40,
          height = 78,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/36",
            ["marker"] = "right"
          }
        },
        {
          id = 22,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 1540,
          y = 244,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "furnace.axis"
          }
        },
        {
          id = 25,
          name = "script",
          type = "",
          shape = "rectangle",
          x = 1720,
          y = 264,
          width = 40,
          height = 78,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "furnace.backtrack_blocker",
            ["once"] = false
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "controllers",
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
          id = 26,
          name = "toggle",
          type = "",
          shape = "point",
          x = 1680,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["flag"] = "axis_geno_done",
            ["target"] = { id = 25 }
          }
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
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1584,
          y = 342,
          width = 488,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 728,
          y = 342,
          width = 488,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1290,
          y = 436,
          width = 220,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1266,
          y = 156,
          width = 268,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 728,
          y = 224,
          width = 488,
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
          x = 1584,
          y = 224,
          width = 488,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "polygon",
          x = 1216,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 40 },
            { x = 40, y = 40 }
          },
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "polygon",
          x = 1256,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 40 },
            { x = 40, y = 40 }
          },
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "polygon",
          x = 1544,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 40 },
            { x = -40, y = 40 }
          },
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "polygon",
          x = 1584,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 40 },
            { x = -40, y = 40 }
          },
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "polygon",
          x = 1584,
          y = 248,
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
          id = 17,
          name = "",
          type = "",
          shape = "polygon",
          x = 1544,
          y = 208,
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
          id = 18,
          name = "",
          type = "",
          shape = "polygon",
          x = 1216,
          y = 248,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = 40, y = -40 }
          },
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "polygon",
          x = 1256,
          y = 208,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -40 },
            { x = 40, y = -40 }
          },
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
          id = 4,
          name = "right",
          type = "",
          shape = "point",
          x = 2010,
          y = 302,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "spawn",
          type = "",
          shape = "point",
          x = 1920,
          y = 302,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "left",
          type = "",
          shape = "point",
          x = 800,
          y = 302,
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
