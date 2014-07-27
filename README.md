# Sublime DSL

Configuration of Sublime Text using Ruby DSLs.

## Motivation

The configuration of Sublime Text uses horrible PList files (TextMate legacy),
and verbose JSON files. I first used TextMate to develop grammars, but even there,
typing grammars or specifying themes was a pain.

So I had the idea to create a Ruby DSL for TextMate grammars, themes, etc.
Once you have it, you wonder how you could do without it: all DSL statements
are regular method calls, so you can use the power of Ruby instead of copy/paste,
defining and calling your own methods.

Refer to SYNTAX.md for more information on the DSLs.

## Installation

```
$ gem install sublime_dsl
```

## Synopsis

```
$ subdsl import Ruby
```

This converts the Ruby package (from your ST packages directory) to a set of DSL files
inside ./Ruby. You can then review and modify the files. Have a look at
test/DSL.custom/Ruby.tmLanguage.rb for an example of refactoring (here-docs).
Have a look at test/DSL.custom/SAS for a package created from
scratch directly with the DSLs.

```
$ subdsl export Ruby
```

This converts the Ruby package in ./Ruby and places the files in the
ST Ruby packages directory (the previous content as backed up into a
zip archive).

Type `subdsl help` for more info on the command.

## Import: Converting to DSL

When importing a ST package, some files are grouped into one DSL file:

- all macros (*.sublime-macro) are grouped into macros.rb
- all snippets (*.sublime-snippet, *.tmSnippet) are grouped into snippets.rb
- all commands (*.sublime-commands) are grouped into commands.rb
- all preferences (*.tmPreferences) are grouped into preferences.rb
- all settings (*.sublime-settings) are grouped into settings.rb

Other files generate one DSL file:

- *.tmLanguage => *.tmLanguage.rb
- *.sublime-menu => *.menu.rb
- *.sublime-keymap => *.keymap.rb
- *.sublime-mousemap => *.mousemap.rb

Finally, files with an extension not listed above (e.g., *.py) are copied "as is".
In particular, there is no DSL (yet?) for *.sublime-build and *.sublime-completions.

## Export: Converting from DSL

The export processes all *.rb files located in the DSL directory, and copies
other files "as is". Therefore, the organization of DSL files is free: a whole
package can be specified into one source file, or into several source files.

## Tests

I don't believe in unit tests. At least not at this stage, where I can change my mind
and rework the API extensively. I do believe into extensive integration tests, so the
tests are done as follows:

- test/Packages.original and test/Packages.textmate contain the packages coming
  from Sublime Text 2 and TextMate, respectively.

- They were converted into DSL equivalents in test/DSL.original and test/DSL.textmate.

- Then I tried to convert them back to PList/JSON packages into
  test/Packages.original-round-trip and test/Packages.textmate-round-trip.

- Everytime there was an error in the DSL (for instance because of illegal regular expressions),
  I created a fixed DSL file in test/DSL.original-fixes or test/DSL.textmate-fixes, that is read
  instead of the one in test/DSL.original or test/DSL.textmate, to allow round-tripping.

- I then compared the result of the round-trip to the original, and checked it was OK.

- I then fixed some warnings (FIXME comments in the grammar DSL files) and placed the result
  in test/DSL.modified, exported them in test/Packages.modified, and checked the result.

- I also created some tests using my French keyboard definition file, generating DSL in
  test/DSL.original.kb-fr, and exporting them to test/Packages.original.kb-fr-round-trip.

- Finally, I placed some custom DSL files in test/DSL.custom, with the export in
  test/Packages.custom.

So testing is simple and brute force: run `rake test`, and check that nothing changes,
or that the changes are expected.

## Contributing

I welcome (constructive) criticism and ideas. This was an experience for me to create Ruby DSLs,
and retrospectively, I'm even more impressed by Ruby. Many thanks to Matz for creating a language
that makes programming a pleasure.

The documentation is sparse, to say the least. Feel free to ask for clarifications:
a heavy use of `method_missing` does not create an easy to understand piece of software.

## License

(The MIT License)

Copyright (c) 2014 Thierry Lambert

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
