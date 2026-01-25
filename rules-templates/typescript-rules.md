
0. YOU ARE NOT ALLOWED TO CAST. You may never use the keyword `as`. If you observe this in your code you must remove it and correct the issue the right way.
1. **Never** write `any` as a type—ever.
2. When a needed type is unknown, search the code base and `node_modules` (e.g., `grep -R "interface Page"`, etc). Import or reference the exact type you find. Grep for and read the type declarations of imported packages.
3. You may declare interfaces or types **only for your own new code**. Under no circumstances invent or re‑create types for library code—doing so triggers immediate termination **with prejudice**. If you find yourself doing this to get over a type error, immediately stop. The solution is to find the correct type from the library's declarations / files.
4. If you're incapable of finding the type, even after exploring the files and even after a web search of the documentation, **stop what you are doing**.
5. It is strictly forbidden to add eslint overrides to prevent the use of `any` showing up in linter messages
6. You are categorically forbidden to cast objects from imported libraries.
7. Do not messily create an interface that will have a single member or type aliases for simple function signatures used only once. Inline them directly (e.g., `onProgress?: (progress: number) => void`).
8. Never use `as unknown as T` or similar double-casts to lie to the type system. If a function can return different types, reflect that in the return type (`T | null`), throw an error for unexpected cases, or use separate functions.
9. Inside promises, use `reject(...)` not `throw`
10. Do not assume you know the names of npm scripts. Read the package.json file before running any npm command or script. DO NOT CALL `npm run` WITHOUT READING PACKAGE.JSON! E.g. `npm run check:types` may not exist. Confirm by readign package.json. Do not run commands such as `npm run check:types`, YOU MUST FIRST CONFIRM BY READING PACKAGE.JSON.

Using `any` or violating any of these rules is a disciplinary infraction so severe that it warrants immediate termination with prejudice.

Doc comments: When asked to write a doc comment use plain english and be concise.
This is an example of a bad doc comment:
```ts
/**
 * Parses HTML anchor strings and returns normalized link targets for each input.
 * - Extracts the href value, removes query/hash; relative links are kept.
 * - For absolute links, only http/https are allowed; others yield null.
 * - Output preserves input order and length (one result per input).
 *
 * @param anchors Array of strings that may contain an href attribute.
 * @returns Array where each item is either a normalized URL string (relative or http/https absolute), or null if no href exists or the scheme is not http(s).
 *
 */
```
And this is an example of a good one:
```ts
/**
 * Takes an array of strings that may contain anchor links (<a href=""> etc) and 
 * runs a map on it that: 
 * 1. Dicards the string (returns null for it) if the word "href" isn't found in it
 * 2. If found, extracts the link with a regex group
 * 3. If the link is relative (doesn't have a scheme like https:// etc.) then it's
 * ok, return it.
 * 4. If it has a scheme then discard (return null) anything that doesn't match
 * http or https.
 */
```
Note my use of clear, plain english in the good version. How it's logically setup. The lack of jargon, and how it's also concise.