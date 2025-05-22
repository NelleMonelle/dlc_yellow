return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
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
          y = 480,
          width = 640,
          height = 480,
          rotation = 0,
          gid = 18,
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
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 364,
          y = 388,
          width = 34,
          height = 92,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 242,
          y = 388,
          width = 34,
          height = 92,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 398,
          y = 388,
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
          x = 90,
          y = 388,
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
          x = 542,
          y = 362,
          width = 82,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 362,
          width = 82,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 16,
          y = 242,
          width = 20,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 604,
          y = 242,
          width = 20,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "polygon",
          x = 492,
          y = 388,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 50, y = 0 },
            { x = 50, y = -26 }
          },
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "polygon",
          x = 148,
          y = 388,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -50, y = 0 },
            { x = -50, y = -26 }
          },
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 358,
          y = 260,
          width = 38,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 30,
          name = "",
          type = "",
          shape = "polygon",
          x = 458,
          y = 200,
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
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 276,
          y = 440,
          width = 88,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/hallway_west_2",
            ["marker"] = "office"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 36,
          y = 242,
          width = 64,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.cabinet_l",
            ["solid"] = true
          }
        },
        {
          id = 19,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 540,
          y = 242,
          width = 64,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.cabinet_r",
            ["solid"] = true
          }
        },
        {
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 382,
          y = 182,
          width = 76,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.drawer",
            ["solid"] = true
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 258,
          y = 198,
          width = 124,
          height = 70,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.workstation",
            ["solid"] = true
          }
        },
        {
          id = 21,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 208,
          width = 82,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.box",
            ["solid"] = true
          }
        },
        {
          id = 22,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 100,
          y = 208,
          width = 76,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bookshelf_l",
            ["solid"] = true
          }
        },
        {
          id = 27,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 498,
          y = 208,
          width = 42,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bookshelf_r",
            ["solid"] = true
          }
        },
        {
          id = 28,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 458,
          y = 182,
          width = 42,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bookshelf_r"
          }
        },
        {
          id = 29,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 476,
          y = 198,
          width = 42,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.bookshelf_r"
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
          id = 3,
          name = "down",
          type = "",
          shape = "point",
          x = 320,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "spawn",
          type = "",
          shape = "point",
          x = 320,
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
