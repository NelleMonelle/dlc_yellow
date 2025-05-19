return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 29,
  height = 30,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 28,
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
          y = 1200,
          width = 1160,
          height = 1200,
          rotation = 0,
          gid = 3,
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
          x = 0,
          y = 974,
          width = 242,
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
          x = 0,
          y = 1088,
          width = 880,
          height = 28,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 880,
          y = 414,
          width = 28,
          height = 702,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 322,
          y = 974,
          width = 400,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 692,
          y = 414,
          width = 30,
          height = 560,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 556,
          y = 414,
          width = 136,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 590,
          y = 258,
          width = 20,
          height = 60,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 238,
          width = 18,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1018,
          y = 292,
          width = 24,
          height = 148,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 908,
          y = 414,
          width = 110,
          height = 26,
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
          id = 2,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 242,
          y = 974,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bedroomdoor",
            ["solid"] = true
          }
        },
        {
          id = 3,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 1014,
          width = 40,
          height = 74,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/entrance",
            ["marker"] = "right"
          }
        },
        {
          id = 8,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 556,
          y = 318,
          width = 40,
          height = 96,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/hallway_east",
            ["marker"] = "right"
          }
        },
        {
          id = 21,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 456,
          y = 996,
          width = 52,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.drawerEH",
            ["solid"] = true
          }
        },
        {
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 610,
          y = 238,
          width = 98,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.stove",
            ["solid"] = true
          }
        },
        {
          id = 24,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 708,
          y = 238,
          width = 56,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.dishes",
            ["solid"] = true
          }
        },
        {
          id = 25,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 924,
          y = 238,
          width = 76,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.fridge",
            ["solid"] = true
          }
        },
        {
          id = 26,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 844,
          y = 238,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.cuttingboard",
            ["solid"] = true
          }
        },
        {
          id = 27,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 764,
          y = 238,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.sink",
            ["solid"] = true
          }
        },
        {
          id = 22,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 60,
          y = 992,
          width = 112,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bamboo",
            ["solid"] = true
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
          id = 4,
          name = "left",
          type = "",
          shape = "point",
          x = 80,
          y = 1060,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "topleft",
          type = "",
          shape = "point",
          x = 636,
          y = 366,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "spawn",
          type = "",
          shape = "point",
          x = 200,
          y = 1060,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "bedroom",
          type = "",
          shape = "point",
          x = 280,
          y = 1050,
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
