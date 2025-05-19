return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 20,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 31,
  properties = {
    ["light"] = true,
    ["music"] = "trapdoor"
  },
  tilesets = {
    {
      name = "mansion_stuff",
      firstgid = 1,
      filename = "../../../tilesets/mansion_stuff.tsx",
      exportfilename = "../../../tilesets/mansion_stuff.lua"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 2,
      name = "objects_bg",
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
          y = 800,
          width = 640,
          height = 794,
          rotation = 0,
          gid = 16,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 278,
          width = 194,
          height = 106,
          rotation = 0,
          gid = 5,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 6,
      name = "objects_bg2",
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
          x = 426,
          y = 376,
          width = 32,
          height = 64,
          rotation = 0,
          gid = 20,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 178,
          y = 376,
          width = 32,
          height = 64,
          rotation = 0,
          gid = 20,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 234,
          y = 418,
          width = 180,
          height = 132,
          rotation = 0,
          gid = 17,
          visible = true,
          properties = {}
        }
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
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 378,
          width = 80,
          height = 34,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 378,
          width = 80,
          height = 34,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 402,
          y = 456,
          width = 190,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 456,
          width = 190,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 412,
          width = 32,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 48,
          y = 412,
          width = 32,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 402,
          y = 482,
          width = 26,
          height = 318,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 212,
          y = 482,
          width = 26,
          height = 318,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 426,
          y = 312,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 178,
          y = 312,
          width = 32,
          height = 64,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 204,
          width = 78,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 562,
          y = 204,
          width = 78,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 78,
          y = 204,
          width = 144,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 418,
          y = 204,
          width = 144,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 212,
          y = 800,
          width = 216,
          height = 20,
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
          id = 20,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 222,
          y = 204,
          width = 196,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.fireplace",
            ["solid"] = true
          }
        },
        {
          id = 28,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 90,
          y = 218,
          width = 114,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bamboo"
          }
        },
        {
          id = 29,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 436,
          y = 218,
          width = 114,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bamboo"
          }
        },
        {
          id = 30,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 258,
          y = 288,
          width = 132,
          height = 90,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.kotatsu",
            ["solid"] = true
          }
        },
        {
          id = 22,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 262,
          width = 40,
          height = 116,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/hallway_east",
            ["marker"] = "left"
          }
        },
        {
          id = 23,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 262,
          width = 40,
          height = 116,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/hallway_west",
            ["marker"] = "right"
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
          id = 24,
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
          id = 25,
          name = "right",
          type = "",
          shape = "point",
          x = 560,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 520,
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
