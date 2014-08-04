The Markdown Syntax used in KOS_DOC
===================================

These are the basic simple markdown formattings used in the kOS documentation:

### Paragraphing

Like with HTML, if you make a line break it doesn't mean anything and gets ignored.
If you make an empty line with nothing on it, however, it will create a paragraph
break at that point.

### Font Faces

- *empahsis (Italics)* : To create italicised emphasis, surround the section with single asterisks or single underscores.
- **strong (Boldface)** : To create strong text (bold), surround the section with double asterisks or double underscores.

Examples: 


    - *These words* are in empahsis (italics) face, and _these words_ are also in empahsis (italics) face.
    - **These words** are in strong (bold) face, and __these words__ are also in strong (bold) face.


Examples Rendered:

- *These words* are in empahsis (italics) face, and _these words_ are also in empahsis (italics) face.
- **These words** are in strong (bold) face, and __these words__ are also in strong (bold) face.

### Headings

To make a header suitable for the top of a page, put a line of "----" under it or a line of "====" under it.

To make a smaller header suitable for the middle of a page, preceed it with three '###' in colum 1.

Examples:

    This is a header
    ================

    This is also a header
    ---------------------

    ### This is a smaller header.


For a heading to render correctly, it must be a separate paragraph (surrounded above and below
by blank lines).

Please note that the headers are also usable as HTML Anchors in URLS to jump to the middle of the
page.  Any spaces in the header become underscores in the HTML anchor.

### Code blocks (unparsed sections)

To make a block in which Markdown will not be parsed, for the purpose of literal code examples,
there are two ways to do it:

*Indented* : Indent the section 4 spaces to force it to be literal code.

*Surround with tilde lines* : Put a line of 4 tilde's above and below the section.

Examples:

    Here's an example indented 4 spaces to trigger a literal code block:
    
        example code
        lines here
    
    Here's an example surrounded by 4 tilde's above and below to trigger a literal code block:

    ~~~~

    example code
    lines here

    ~~~~

### Tables

To make a table , just make sure you put vertical bars in it to separate the cells:

Example:

    aaaa | bbbb
    cccc | dddd


aaaa | bbbb
cccc | dddd

To put a header on the first row, make a separator between it and the other rows consisting of "cells" of "===", like so:

Example:

    column 1 | column 2
    =========|==========
    aaaa | bbbb
    cccc | dddd


column 1 | column 2
=========|==========
aaaa | bbbb
cccc | dddd

### Links

To make a link with a URL, put square brackets around the visible text, followed by parentheses around the link URL, like this:

    Please [click here](www.google.com) to go to google.

### Image links

To embed an image file, make a link to it as above, but preceed it with an exclamation mark.  The text
in the square brackets is the alt text used by the browser for tooltips or visually impared users:

    Please see the image below for a screenshot:
    ![a screenshot of my kOS window](../images/myscreenshot.png)

### IMPORTANT NOTE ABOUT LINKS AND MiddleMan!

MiddleMan transforms all files called .md into directories with an index.html inside them.  For example, a directory structure like this in the source file:

    source/
      |
      +-- dir1/
      |     |
      |     +-- file1.md
      |     |
      |     +-- file2.md
      |
      `-- dir2/
            |
            `-- file3.md

Would turn into this in the build directory:

    build/
      |
      +-- dir1/
      |     |
      |     +-- file1/
      |     |     |
      |     |     `-- index.html
      |     |
      |     +-- file2/
      |     |     |
      |     |     `-- index.html
      |
      `-- dir2/
            |
            `-- file3/
                  |
                  `-- index.html

Therefore remember that all relative links need an extra ".." in them!!  If you want to link
to file2.md from file1.md in the example above, you'd need to link to ../file2/index.html even
though file1.md and file2.md are in the same directory.

### But why use index.html at all?

You might be thinking that linking to the index.html is a bad idea then, and we should just
link to the folder, letting the browser default to the index.html inside that folder.

The reason this is not done is that it makes it hard to view the file using a local
file:/// url, where a local browser will often not automatically look for an index.html given
just the directory name like a web server would.

