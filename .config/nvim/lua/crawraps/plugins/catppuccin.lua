require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {
      all = {
        rosewater = "#F2D5CF",
        flamingo = "#EEBEBE",
        pink = "#F4B8E4",
        mauve = "#cf96f7",
        red = "#E78284",
        maroon = "#EA999C",
        peach = "#faa65b",
        yellow = "#f7e593",
        green = "#94f5b7",
        teal = "#5bd0dc",
        sky = "#99D1DB",
        sapphire = "#85C1DC",
        blue = "#fc99cd",
        lavender = "#f9cfe2",

        text = "#F4CDE9",
        subtext1 = "#DEBAD4",
        subtext0 = "#C8A6BE",
        overlay2 = "#B293A8",
        overlay1 = "#9C7F92",
        overlay0 = "#866C7D",
        surface2 = "#866C7D",
        surface1 = "#5A4551",
        surface0 = "#44313B",

        base = "#352939",
        mantle = "#211924",
        crust = "#1a1016",
    },
  },
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        hop = true,
        notify = false,
        mini = false,
        indent_blankline = {
            enabled = true,
            colored_indent_levels = false,
        },
        native_lsp = {
            enabled = true,
            virtual_text = {
                errors = { "italic" },
                hints = { "italic" },
                warnings = { "italic" },
                information = { "italic" },
            },
            underlines = {
                errors = { "underline" },
                hints = { "underline" },
                warnings = { "underline" },
                information = { "underline" },
            },
        },
        navic = {
            enabled = true,
        },
    },
})

vim.cmd('colorscheme catppuccin')
