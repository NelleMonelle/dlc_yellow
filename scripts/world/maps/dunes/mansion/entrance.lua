return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 20,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 25,
  properties = {
    ["light"] = true,
    ["music"] = "trapdoor",
    ["name"] = "Estate"
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
          gid = 4,
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
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 416,
          y = 480,
          width = 20,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 204,
          y = 480,
          width = 20,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 432,
          width = 44,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 52,
          y = 432,
          width = 44,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 436,
          y = 480,
          width = 152,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 52,
          y = 480,
          width = 152,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 52,
          y = 206,
          width = 536,
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
          id = 2,
          name = "savepoint",
          type = "",
          shape = "point",
          x = 322,
          y = 327,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 760,
          width = 192,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/30c",
            ["marker"] = "entrance"
          }
        },
        {
          id = 12,
          name = "mansion_door",
          type = "",
          shape = "rectangle",
          x = 544,
          y = 142,
          width = 24,
          height = 344,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/hallway_east_2",
            ["marker"] = "left"
          }
        },
        {
          id = 13,
          name = "mansion_door",
          type = "",
          shape = "rectangle",
          x = 72,
          y = 142,
          width = 24,
          height = 344,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/hallway_west_2",
            ["marker"] = "right"
          }
        },
        {
          id = 16,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 218,
          y = 206,
          width = 204,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.lockeddoor"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 464,
          y = 246,
          width = 70,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bamboo",
            ["solid"] = true
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 104,
          y = 246,
          width = 70,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bamboo",
            ["solid"] = true
          }
        },
        {
          id = 23,
          name = "lightarea",
          type = "",
          shape = "rectangle",
          x = 130,
          y = 430,
          width = 66,
          height = 50,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "lightarea",
          type = "",
          shape = "rectangle",
          x = 444,
          y = 430,
          width = 66,
          height = 50,
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
          id = 3,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
          y = 380,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "left",
          type = "",
          shape = "point",
          x = 136,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "right",
          type = "",
          shape = "point",
          x = 504,
          y = 360,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "down",
          type = "",
          shape = "point",
          x = 320,
          y = 720,
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
      id = 6,
      name = "objects_light",
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
          name = "",
          type = "",
          shape = "rectangle",
          x = 444,
          y = 476,
          width = 66,
          height = 72,
          rotation = 0,
          gid = 21,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 130,
          y = 476,
          width = 66,
          height = 72,
          rotation = 0,
          gid = 21,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 224,
          y = 800,
          width = 192,
          height = 74,
          rotation = 0,
          gid = 23,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
