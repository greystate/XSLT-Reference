# XSLT Reference

This is a quick reference/cheatsheet for XSLT 1.0 elements and their attributes.

I'm building it for two main purposes:

1. For use with [Dash][DASH] on OS X - it's the perfect app for all sorts of API/reference lookups
2. To serve as a [reference section][XSLTREF] on [Pimp My XSLT][PIMP] so I can easily point people to a
   URL that explains a specific element

It's primarily meant to be used whenever you can't remember all the attributes of, say, the [`<xsl:number>`][EX1]
instruction - after a quick look at this, you're back in business (<q>_Of **course** – it has to be `level="multiple"` #facepalm_</q>).

I hope to be able to add some concise examples for all the elements (when they'd make sense).

## Glaring errors, omissions or falsy information?

Feel free to use the [issue tracker][ISSUES] or perhaps even fork the repo and submit pull requests for discussion,
if you see anything that's missing.

## Dev notes

Although I use LESS, I use [-prefix-free][PREFIXFREE] so I can write as much real CSS as possible.
I use  [CodeKit][] for preprocessing the LESS file, and a simple bash script to transform the XML file with
the list of elements into a single HTML file. Yay, XSLT!

*Chriztian Steinmeier, 2013*

[DASH]: http://kapeli.com/dash/
[XSLTREF]: http://pimpmyxslt.com/reference/
[PIMP]: http://pimpmyxslt.com/
[CodeKit]: http://incident57.com/codekit/
[EX1]: http://pimpmyxslt.com/reference/#number
[ISSUES]: https://github.com/greystate/XSLT-Reference/issues
[PREFIXFREE]: https://github.com/leaverou/prefixfree#README