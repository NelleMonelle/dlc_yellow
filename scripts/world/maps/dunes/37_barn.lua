return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 16,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 10,
  nextobjectid = 25,
  properties = {
    ["dynmtype"] = 2,
    ["dynmusic"] = "the_wild_east",
    ["light"] = true,
    ["music"] = "the_wild_east",
    ["name"] = "Wild East - Barn"
  },
  tilesets = {
    {
      name = "wild_east_buildings",
      firstgid = 1,
      filename = "../../tilesets/wild_east_buildings.tsx",
      exportfilename = "../../tilesets/wild_east_buildings.lua"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
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
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 640,
          width = 570,
          height = 664,
          rotation = 0,
          gid = 1,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 8,
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
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 640,
          width = 570,
          height = 664,
          rotation = 0,
          gid = 2,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 9,
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
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 640,
          width = 570,
          height = 664,
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
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 404,
          y = 558,
          width = 146,
          height = 62,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 102,
          y = 558,
          width = 146,
          height = 62,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 102,
          y = 164,
          width = 448,
          height = 20,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 534,
          y = 184,
          width = 16,
          height = 374,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 102,
          y = 184,
          width = 16,
          height = 374,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 118,
          y = 264,
          width = 124,
          height = 294,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 410,
          y = 264,
          width = 124,
          height = 294,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 410,
          y = 184,
          width = 30,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 410,
          y = 246,
          width = 28,
          height = 18,
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
          id = 1,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 248,
          y = 590,
          width = 156,
          height = 30,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "dunes/37",
            ["marker"] = "barn"
          }
        },
        {
          id = 11,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 458,
          y = 184,
          width = 74,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* (There are no hay puns\nto be made here.)"
          }
        },
        {
          id = 14,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 410,
          y = 288,
          width = 10,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The gate is locked.)"
          }
        },
        {
          id = 15,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 410,
          y = 388,
          width = 10,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The gate is locked.)"
          }
        },
        {
          id = 16,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 410,
          y = 484,
          width = 10,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The gate is locked.)"
          }
        },
        {
          id = 17,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 232,
          y = 480,
          width = 10,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The gate is locked.)"
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 232,
          y = 384,
          width = 10,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The gate is locked.)"
          }
        },
        {
          id = 19,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 232,
          y = 288,
          width = 10,
          height = 52,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = "* (The gate is locked.)"
          }
        },
        {
          id = 12,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 118,
          y = 184,
          width = 60,
          height = 60,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* (The boxes seem to\nbe full of oats and\ncarrots.)",
            ["text2"] = "* (It all looks highly inedible.)"
          }
        },
        {
          id = 13,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 176,
          y = 158,
          width = 38,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = "* (The boxes seem to\nbe full of oats and\ncarrots.)",
            ["text2"] = "* (It all looks highly inedible.)"
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
          id = 20,
          name = "down",
          type = "",
          shape = "point",
          x = 326,
          y = 550,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "spawn",
          type = "",
          shape = "point",
          x = 326,
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
