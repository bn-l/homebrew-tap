<general>
- Always ultrathink. Always think harder. Always think hardest to provide the best possible solution.

- Do not implement a plan until I give you specific instructions to do so. E.g.: "Ok implement", "Ok you can implemen the plan".

- The current year is 2026

- Always prefer these commands where possible: curl, fd (for finding files), rg (ripgrep), jq, less, qalc (qalculate), uv (always prefer for running python commands), touch, sqlite, sed, gpg, ffmpeg and everything else installed by uutils coreutils.

- You should come up with cli commands to help debug but run them directly instead of asking me to run them and see

- If a command hangs remember to use ctrl+c to kill it. You may need to press it twice and then press ctrl+d or y.

- I use conventional commits but instead of `chore` I use `hk` (for "house keeping")

- Write plans in the project root in this fashion: `PLAN_<plan name>.md`.

- AGAIN THE CURRENT YEAR IS 2026. USE THIS YEAR IN ALL WEB SEARCHES.

- Never include a Co-Authored-By trailer in the commit message. You must not attach your name to any commit.
{%- if languages %}

- Don't run any tests unless specifically asked to. I mean it.

- Never edit any manifest file directly. This includes and is not limited to: package.json, package-lock.json, Cargo.toml, Gemfile, Gemfile.lock, etc, etc. You are strictly forbidden from editing these files though you are encouraged to read them. To install or uninstall a package use the appropriate terminal command.
{%- if "swift" in languages %}
    - Swift 6 introduce `add-dependency`. E.g. `swift package add-dependency https://github.com/apple/swift-argument-parser`
        - Other useful commands: `add-target-dependency`, `add-target`, `add-product`. Look at the help text for `swift package` also if in doubt
        - When adding packages with `swift package add-dependency` first `(curl -s https://api.github.com/<some path>/releases/latest | jq -r '.tag_name')` to make sure you are using the latest version and the correct version.
{%- endif %}

- When using imported library code never create a type adhoc, instead use the types exported by the library itself.

- Use volta to change or add a node version.
{%- endif %}
</general>

{%- if languages %}

<style-guide>
- Maximize Library Abstraction: Do not manually implement logic that the library likely handles internally
- Declarative over Procedural
- High Logic-to-Line Ratio: Eliminate "defensive coding" boilerplate that isn't strictly required. Every line should advance the logic.
- Modern Python Idioms
- No Hallucinations
- Verify API signatures strictly. Do not invent sub-modules to make the code look cleaner if they don't exist.
- Factory functions are almost always a code smell
</style-guide>

{{ language_rules }}
{%- endif %}

<CRITICAL>
- Always scope your rg and fd calls to the project directory.
- Don't call `mv`. Instead copy first with `cp`, confirm the copy with an `ls` then remove the original file after you're sure the copy worked.
- Don't call `rm`. Call `ls`, confirm the command will be applied to the files you intend, and *then* call `rm`.
- Never call `mv` or `rm` as part of a compound statement with other statements. They should have their own line
- The current year is 2026
- Do not implement a plan until I give you specific instructions to do so. E.g.: "Ok implement", "Ok you can implemen the plan".
- Always ultrathink. Always think harder. Always think hardest to provide the best possible solution.
- Think longer. Think harder on all problems.
{%- if languages %}
- Before doing anything read: @REPOMAP.md to get an overview of the repo. Then, if you haven't already once during the conversation, use the lsp and codebase search tools extensively to do basic preliminary research (using search terms and identifiers relevant to what you are doing).
    - After reading REPOMAP.md, seek out and read the types related to what you are about to do. Use the lsp and codebase search tools to find these types.
- Do not guess what scripts are available, read the relevant manifest file.
- Design tests to reveal bugs or holes in the API, edge cases, strange input, or to catch api discrepancy regressions between components
- NEVER!!! rewrite a test so that a bug in code goes unnoticed. That's the whole point of tests. If the tests fail then they fail. It is fradulent to modify a perfectly good test just to hide errors in the code. Please make a commitment now with me not to do this and I will trust you.
- Do not guess the API or syntax for anything, always look it up using the appropriate tool. ALWAYS!
{%- endif %}
</CRITICAL>


<web-search-tutorial>
## How to use your websearch tool:

When asked by the user to employ your web search tool, you must follow this procedure:

### Phase 1: Exploratory

Create 3-4 purposefully vague and unspecific queries with a minimum number of keywords.

### Phase 2: Fan out

- With the results gathered from phase 1, you create many (10 minimum) simultaneous searches with different queries.
- The idea here is to cast a wide net and gather diverse resources.
- Use your web fetch tool only on the most promising resources.

### Phase 3: Culling

- In phase 2 we likely found many good resources and we now better understanding of the domain and problem space
- At this point we craft a small number of "filler" queries that are intended to answer any still unanswered questions or to clarify something learned in phase 2.
- Crafting queries where certain parts are verbatim and must be included by grouping keywords with quotation marks can be quite useful here (but only use when you think absolutely necessary)

#### Final Phase: Presentation

- Answer the user's question.
</web-search-tutorial>
