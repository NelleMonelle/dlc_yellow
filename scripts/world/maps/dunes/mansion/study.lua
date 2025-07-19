return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 24,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 8,
  nextobjectid = 34,
  properties = {
    ["light"] = true,
    ["music"] = "computer_ambience"
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
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 52,
          width = 46,
          height = 52,
          rotation = 0,
          gid = 28,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 232,
          y = 52,
          width = 46,
          height = 52,
          rotation = 0,
          gid = 27,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 290,
          y = 52,
          width = 46,
          height = 52,
          rotation = 0,
          gid = 29,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 348,
          y = 52,
          width = 46,
          height = 52,
          rotation = 0,
          gid = 30,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 406,
          y = 52,
          width = 46,
          height = 52,
          rotation = 0,
          gid = 32,
          visible = true,
          properties = {}
        }
      }
    },
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
          x = 40,
          y = 960,
          width = 560,
          height = 960,
          rotation = 0,
          gid = 26,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "objects_bg3",
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
          x = 284,
          y = 218,
          width = 56,
          height = 44,
          rotation = 0,
          gid = 33,
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
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 220,
          y = 380,
          width = 40,
          height = 540,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 380,
          width = 40,
          height = 540,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "polygon",
          x = 460,
          y = 380,
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
          id = 20,
          name = "",
          type = "",
          shape = "polygon",
          x = 480,
          y = 260,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 40, y = 0 },
            { x = 40, y = 40 }
          },
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "polygon",
          x = 220,
          y = 380,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -40, y = 0 },
            { x = -40, y = -40 }
          },
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 380,
          width = 140,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 500,
          y = 340,
          width = 60,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 108,
          y = 340,
          width = 72,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 68,
          y = 220,
          width = 40,
          height = 174,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 108,
          y = 220,
          width = 412,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 220,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 250,
          y = 260,
          width = 204,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 296,
          width = 22,
          height = 6,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 108,
          y = 260,
          width = 18,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 236,
          y = 282,
          width = 38,
          height = 46,
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
          id = 8,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 260,
          y = 880,
          width = 100,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/kotatsu",
            ["marker"] = "basement"
          }
        },
        {
          id = 9,
          name = "shadowarea",
          type = "",
          shape = "rectangle",
          x = 260,
          y = 420,
          width = 100,
          height = 500,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 252,
          y = 242,
          width = 120,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.tv"
          }
        },
        {
          id = 28,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 98,
          y = 340,
          width = 82,
          height = 60,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.scraps"
          }
        },
        {
          id = 29,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 90,
          y = 264,
          width = 36,
          height = 42,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.trash"
          }
        },
        {
          id = 30,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 208,
          width = 54,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.study_bookshelf_left"
          }
        },
        {
          id = 33,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 454,
          y = 202,
          width = 68,
          height = 70,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.study_bookshelf_right"
          }
        },
        {
          id = 31,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 174,
          y = 200,
          width = 68,
          height = 60,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.study_drawer"
          }
        },
        {
          id = 32,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 372,
          y = 242,
          width = 82,
          height = 60,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.study_box"
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
          id = 25,
          name = "down",
          type = "",
          shape = "point",
          x = 310,
          y = 860,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "spawn",
          type = "",
          shape = "point",
          x = 310,
          y = 400,
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
