local ls = require"luasnip"
local extras = require"luasnip.extras"
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local partial = extras.partial

local test = s("trigger", t("Wow! Text!"))
local test2 = s("testt", t("php test"))

local dd = s(
    "d",
    fmt("dd(${});", {
        i(1, "var"),
    })
)

local function copy(args)
	return args[1]
end

local fn = s("pf", {
    t("public function "),
    -- Placeholder/Insert.
    i(1),
    t("("),
    -- Placeholder with initial text.
    i(2, "int $foo"),
    -- Linebreak
    t({ ")", "{", "\t" }),
    -- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
    i(0),
    t({ "", "}" }),
})

local php = {
    dd,
    s("dd", fmt([[
    dd({});
    ]], {i(1)})),
    fn,
    s("trig", {
        i(1),
        f(function(args, snip, user_arg_1) return args[1][1] .. user_arg_1 end,
        {1},
        "Will be appended to text from i(0)"),
        i(0)
    }),
    s("/*", {
        t({"/**", ""}),
        t("* "),
        i(1),
        t({"", ""}),
        t({"*", ""}),
        t({"*", ""}),
        t({"*", ""}),
        t("*/")
    }),
    s("class",
        fmt([[
        <?php

        namespace App\{};

        class {}
        {{
            {}
        }}
        ]], { partial(vim.fn.expand, "%:h:t"), partial(vim.fn.expand, "%:t:r"), i(1)}
        )

    ),
    s("con", fmt([[
    public function __construct({})
    {{}}
    ]], {i(0)})),
    s("map", fmt([[
    ${} = array_map(function($e){{
        {}
    }}, {});
    ]], {i(1), i(3), i(2)})),
    s("filter", fmt([[
    ${} = array_values(array_filter(${}, function($e){{
        {}
    }}));
    ]], {i(1), i(2), i(3)})),
    s("r", fmt([[
    #[Route('/{}', name: '{}')]
    public function {}()
    {{
        {}
    }}
    ]], {i(1, 'test'), i(2), i(3), i(4)}))

}

local elm = {
    s("log", {
        t('let _ = Debug.log "'),
        i(1),
        t('" '),
        t('"'),
        i(2),
        t({'"', ""}),
        t("in")
    })
}

local eruby = {
    s("o", {
        t("<%= "),
        i(1);
        t(" %>")
    })
}

local elixir = {
    s("o", {
        t("<%= "),
        i(1);
        t(" %>")
    })
}

ls.add_snippets("php", php)
ls.add_snippets('elm', elm)
ls.add_snippets('eruby', eruby)
ls.add_snippets('heex', elixir)
ls.add_snippets('eelixir', elixir)
ls.add_snippets('elixir', elixir)
ls.add_snippets('vue', {
    s("im", fmt('import {{{}}} from \'{}\'', {i(2), i(1)})),
    s("c", fmt([[
        <template>

        </template>

        <script>
        import {{ ref }} from 'vue'

        export default {{
            {}
        }}

        </script>

        <style></style>
        ]], {i(1)})
     ),
     s("csl", fmt('console.log({})', {i(1)})),

})
ls.add_snippets("html", {
    s("o", {
        t("<%= "),
        i(1);
        t(" %>")
    })
})

ls.add_snippets("typescript", {
    s("csl", fmt('console.log({})', {i(1)})),
    s("im", fmt('import {{{}}} from \'{}\'', {i(2), i(1)}))
})

ls.add_snippets("go", {
    s("p", fmt('fmt.Println("{}")', {i(1)})),
    s("pf", fmt('fmt.Printf("{}=%v\\n", {})', {i(1), i(2)})),
    s("e", fmt([[
    if err != nil {{
        {}
    }}
    ]], {i(1)})),
    s("append", fmt([[
    {} = append({}, {})
    ]], {i(1),extras.rep(1), i(2)}))
})
