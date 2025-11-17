-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

vim.keymap.set('n', '<Leader>L',
    '<Cmd>lua require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/lua/snippets/"})<CR>')

-- Elixir regex snippet
ls.add_snippets("elixir",
    {
        s(
            {
                trig = "re",
                desc = "Elixir regex literal",
            },
            {
                t("~r/"),
                i(1, "pattern"),
                t("/"),
                i(2, "opts"),
            }
        ),
        s(
            {
                trig = "st",
                desc = "Elixir struct with @enforce_keys",
            },
            fmt([[
        defmodule {} do
          @enforce_keys [{}]
          defstruct [
            {}
          ]
        end
        ]], {
                i(1, "ModuleName"),
                i(2, ":required1, :required2"),
                i(3, "optional1: nil, optional2: nil"),
            })
        ),
        s(
            {
                trig = "stf",
                desc = "Struct that duplicates field list for enforce_keys + defstruct",
            },
            fmt([[
  defmodule {} do
    @enforce_keys [{}]
    defstruct [{}]
  end
  ]], {
                i(1, "ModuleName"),
                i(2, ":field1, :field2"),
                d(3, function(args)
                    return ls.snippet_node(nil, i(1, args[1][1]))
                end, { 2 }),
            })
        )
    }, {
        key = "elixir_snippets",
    })

ls.add_snippets("elixir", {
    s(
        {
            trig = "aoc(%d%d)",
            regTrig = true,
            desc = "AOC year/day module from trigger (e.g. aoc11)",
        },
        fmt([[
        defmodule Aoc{}.Day{} do
          defp input do
            String.trim(File.read!("priv/inputs/day{}.txt"))
          end

          def part1(), do: part1(input())

          def part1(input) do
          end

          def part2(), do: part2(input())

          def part2(input) do
          end
        end
        ]], {
            i(1, "2016"),       -- Year
            f(function(_, snip) -- Day from trigger
                return snip.captures[1]
            end, {}),
            f(function(_, snip) -- Filename day
                return snip.captures[1]
            end, {}),
        })
    ),
}, {
    key = "aoc_day_triggered",
})
