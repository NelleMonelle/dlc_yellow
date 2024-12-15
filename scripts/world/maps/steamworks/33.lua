return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 29,
  height = 20,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 8,
  nextobjectid = 20,
  properties = {
    ["light"] = true,
    ["music"] = "treading_lightly"
  },
  tilesets = {
    {
      name = "steamworks_objects_big",
      firstgid = 1,
      filename = "../../tilesets/steamworks_objects_big.tsx",
      exportfilename = "../../tilesets/steamworks_objects_big.lua"
    },
    {
      name = "steamworks_objects",
      firstgid = 43,
      filename = "../../tilesets/steamworks_objects.tsx",
      exportfilename = "../../tilesets/steamworks_objects.lua"
    }
  },
  layers = {
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
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
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = -20,
          y = 800,
          width = 1200,
          height = 800,
          rotation = 0,
          gid = 42,
          visible = true,
          properties = {}
        },
        {
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 442,
          width = 360,
          height = 84,
          rotation = 0,
          gid = 162,
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
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 440,
          width = 390,
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
          x = 0,
          y = 320,
          width = 390,
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
          x = 770,
          y = 440,
          width = 390,
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
          x = 770,
          y = 320,
          width = 390,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "polygon",
          x = 384,
          y = 446,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 80 },
            { x = 80, y = 80 }
          },
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "polygon",
          x = 384,
          y = 352,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -80 },
            { x = 80, y = -80 }
          },
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "polygon",
          x = 776,
          y = 446,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = 80 },
            { x = -80, y = 80 }
          },
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "polygon",
          x = 776,
          y = 352,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 0, y = -80 },
            { x = -80, y = -80 }
          },
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 442,
          y = 512,
          width = 276,
          height = 24,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 450,
          y = 264,
          width = 262,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 674,
          y = 260,
          width = 22,
          height = 58,
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
          id = 13,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 1120,
          y = 360,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/32",
            ["marker"] = "left"
          }
        },
        {
          id = 14,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 360,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "steamworks/34",
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
          id = 15,
          name = "left",
          type = "",
          shape = "point",
          x = 80,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "right",
          type = "",
          shape = "point",
          x = 1080,
          y = 400,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "spawn",
          type = "",
          shape = "point",
          x = 580,
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
