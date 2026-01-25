
- This repo uses uv
- Do not prefix function names with `_`
- Run tests with `uv run pytest <path>`
- Run scripts with `uv run python <path>`
- Python code style:
    - Prefer declarative, clear, easy to read code
    - Do not use list comprehensions
    - Do not create small functions for a few lines that are used once. Just inline.
    - Try to avoid nesting unless it makes sense
- Do not use Any or linter comments that disable type checking, instead, if you unsure about the correct type do the following:
    - Look at the type the method or function returns and import it.
    - Look at the signature of the method or function, note the type and then import
    - (You should really looking at these anyway to understand the API properly. And in that vein, use `uv run ruff check <relative file path>` to check files. Note: Never `cd` before before running `uv run ruff check <relative file path>`, just run it.)
- When working with batches use the new batched syntax from itertools.
- Do not: create tiny functions that extract just a few lines of code and are only ever used once. This is unnecessary and not better than simply inlining. Encapsulation should be used when **all** of these criteria are met: 1. The place where the code to be encapsulated is becoming large, 2. The function will be used multiple times, 3. the function encapsulates difficulat logic and has a name which allows the reader to immediately understand what it does (i.e. it helps the reader).

- Do not use an asterix in function signatures
- Do not use the `@overload` decorator
