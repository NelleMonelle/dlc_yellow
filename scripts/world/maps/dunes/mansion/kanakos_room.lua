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
  nextlayerid = 7,
  nextobjectid = 18,
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
          gid = 15,
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
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 478,
          y = 378,
          width = 98,
          height = 26,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 360,
          width = 22,
          height = 18,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 58,
          y = 452,
          width = 518,
          height = 28,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 576,
          y = 208,
          width = 24,
          height = 272,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 58,
          y = 208,
          width = 518,
          height = 36,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 38,
          y = 208,
          width = 20,
          height = 272,
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
          id = 3,
          name = "kanako_room_light",
          type = "",
          shape = "rectangle",
          x = 218,
          y = 96,
          width = 198,
          height = 248,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 480,
          y = 404,
          width = 96,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/mansion/hallway_west_2",
            ["marker"] = "top"
          }
        },
        {
          id = 13,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 244,
          width = 88,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.kanakobed",
            ["solid"] = true
          }
        },
        {
          id = 15,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 64,
          y = 388,
          width = 42,
          height = 48,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.toys",
            ["solid"] = true
          }
        },
        {
          id = 16,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 58,
          y = 244,
          width = 32,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.books",
            ["solid"] = true
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 90,
          y = 244,
          width = 100,
          height = 32,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.dresser",
            ["solid"] = true
          }
        },
        {
          id = 14,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 470,
          y = 244,
          width = 106,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "mansion.gameconsole",
            ["solid"] = true
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
          id = 11,
          name = "spawn",
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
          id = 12,
          name = "down",
          type = "",
          shape = "point",
          x = 440,
          y = 430,
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
