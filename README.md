# Sharing Code for Reproducible Research - files for course

These files are for the 'Sharing Code for Reproducible Research' short course. You can download these files to have a go at formatting and arranging code for reproducible research.

Some helpful things below:

## Sample comment headers

R:

```
#' ############################################################
#' Project:         [Project name]
#' File name:       [file name]
#' Description:     [Description]
#' ############################################################
#' Data:            [Data used in file]
#' Authors: 	    [Author name]
#' LAST UPDATE:     [Date as updated]
#' ############################################################
#' Packages to install:
#' `install.packages(...)` if any
#' ############################################################
```


Stata:
```
***************************************************************************************
* PROJECT:          [Project name]
* DO-FILE NAME:     [file name]
* DESCRIPTION:      [Description]
***************************************************************************************
* DATA:         	[Data used in file]
* AUTHORS: 	        [Author name]
* LAST UPDATE:      [Date as updated]
***************************************************************************************

***************************************************************************************
*Stata packages to install 
* [... if any]
***************************************************************************************
```

## Making data available - some ways forward

### Script to download data (from API/web)

This is a top option if possible, and can be achieved through lots of data providers. World Bank for example makes GDP per capita available for direct download (so you don't need to tell the reader what to do):

``` r
data_fetch <- jsonlite::read_json(
  glue::glue(
    "https://api.worldbank.org/v2/country/all/indicator/NY.GDP.PCAP.CD?date=1990:2023&format=json&per_page=9000"
  ),
  simplifyVector = TRUE
)

tibble::as_tibble(data_fetch[[2]]) 
#> # A tibble: 9,000 × 8
#>    indicator$id  country$id countryiso3code date  value unit  obs_status decimal
#>    <chr>         <chr>      <chr>           <chr> <dbl> <chr> <chr>        <int>
#>  1 NY.GDP.PCAP.… ZH         AFE             2023  1571. ""    ""               1
#>  2 NY.GDP.PCAP.… ZH         AFE             2022  1679. ""    ""               1
#>  3 NY.GDP.PCAP.… ZH         AFE             2021  1562. ""    ""               1
#>  4 NY.GDP.PCAP.… ZH         AFE             2020  1352. ""    ""               1
#>  5 NY.GDP.PCAP.… ZH         AFE             2019  1507. ""    ""               1
#>  6 NY.GDP.PCAP.… ZH         AFE             2018  1552. ""    ""               1
#>  7 NY.GDP.PCAP.… ZH         AFE             2017  1528. ""    ""               1
#>  8 NY.GDP.PCAP.… ZH         AFE             2016  1334. ""    ""               1
#>  9 NY.GDP.PCAP.… ZH         AFE             2015  1499. ""    ""               1
#> 10 NY.GDP.PCAP.… ZH         AFE             2014  1690. ""    ""               1
#> # ℹ 8,990 more rows
#> # ℹ 2 more variables: indicator$value <chr>, country$value <chr>
```

Other API providers include [Stat-Xplore](https://stat-xplore.dwp.gov.uk/webapi/online-help/Open-Data-API.html) for open government data and [ONS Statistics](https://www.api.gov.uk/ons/#office-for-national-statistics).

### Link archived data

If you're using secondary data that you downloaded from an online source **you are probably not allowed to re-share it**. Instead, give your reader the links and instructions to set it up in the project folder. e.g.:

* Download the data from xxx (use full citation if given)
* Place files xxx.csv and yyy.csv in the `data/` subfolder of this project

Then your scripts should access it as normal from there!

## Writing a `README.md` - markdown formatting

Markdown formatting is easy and intuitive. If you write a README.md file you can use these tools to format it. You can see more at the [GitHub formatting guide page](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) (from which these examples are taken).

### Headings

To create a heading, add one to six <kbd>#</kbd> symbols before your heading text. The number of <kbd>#</kbd> you use will determine the hierarchy level and typeface size of the heading.

```markdown
# A first-level heading
## A second-level heading
### A third-level heading
```

![Screenshot of rendered GitHub Markdown showing sample h1, h2, and h3 headers, which descend in type size and visual weight to show hierarchy level.](https://docs.github.com/assets/cb-11407/mw-1440/images/help/writing/headings-rendered.webp)


### Styling text

You can indicate emphasis with bold, italic, strikethrough, subscript, or superscript text in comment fields and `.md` files.

| Style                  | Syntax              | Keyboard shortcut                                                                     | Example                                  | Output                                 |                                                   |
| ---------------------- | ------------------- | ------------------------------------------------------------------------------------- | ---------------------------------------- | -------------------------------------- | ------------------------------------------------- |
| Bold                   | `** **` or `__ __`  | <kbd>Command</kbd>+<kbd>B</kbd> (Mac) or <kbd>Ctrl</kbd>+<kbd>B</kbd> (Windows/Linux) | `**This is bold text**`                  | **This is bold text**                  |                                                   |
| Italic                 | `* *` or `_ _`      | <kbd>Command</kbd>+<kbd>I</kbd> (Mac) or <kbd>Ctrl</kbd>+<kbd>I</kbd> (Windows/Linux) | `_This text is italicized_`              | *This text is italicized*              |                                                   |
| Strikethrough          | `~~ ~~` or `~ ~`    | None                                                                                  | `~~This was mistaken text~~`             | ~~This was mistaken text~~             |                                                   |
| Bold and nested italic | `** **` and `_ _`   | None                                                                                  | `**This text is _extremely_ important**` | **This text is *extremely* important** |                                                   |
| All bold and italic    | `*** ***`           | None                                                                                  | `***All this text is important***`       | ***All this text is important***       | <!-- markdownlint-disable-line emphasis-style --> |
| Subscript              | `<sub> </sub>`      | None                                                                                  | `This is a <sub>subscript</sub> text`    | This is a <sub>subscript</sub> text    |                                                   |
| Superscript            | `<sup> </sup>`      | None                                                                                  | `This is a <sup>superscript</sup> text`  | This is a <sup>superscript</sup> text  |                                                   |
| Underline              | `<ins> </ins>`      | None                                                                                  | `This is an <ins>underlined</ins> text`  | This is an <ins>underlined</ins> text  |                                                   |



### Quoting code

You can call out code or a command within a sentence with single backticks. The text within the backticks will not be formatted. You can also press the <kbd>Command</kbd>+<kbd>E</kbd> (Mac) or <kbd>Ctrl</kbd>+<kbd>E</kbd> (Windows/Linux) keyboard shortcut to insert the backticks for a code block within a line of Markdown.

```markdown
Use `git status` to list all new or modified files that haven't yet been committed.
```

### Links

You can create an inline link by wrapping link text in brackets `[ ]`, and then wrapping the URL in parentheses `( )`. You can also use the keyboard shortcut <kbd>Command</kbd>+<kbd>K</kbd> to create a link. When you have text selected, you can paste a URL from your clipboard to automatically create a link from the selection.

`This site was built using [GitHub Pages](https://pages.github.com/).`

### Images

You can display an image by adding <kbd>!</kbd> and wrapping the alt text in `[ ]`. Alt text is a short text equivalent of the information in the image. Then, wrap the link for the image in parentheses `()`.

`![Screenshot of a comment on a GitHub issue showing an image, added in the Markdown, of an Octocat smiling and raising a tentacle.](https://myoctocat.com/assets/images/base-octocat.svg)`

### Lists

You can make an unordered list by preceding one or more lines of text with <kbd>-</kbd>, <kbd>\*</kbd>, or <kbd>+</kbd>.

```markdown
- George Washington
* John Adams
+ Thomas Jefferson
```

To order your list, precede each line with a number.

```markdown
1. James Madison
2. James Monroe
3. John Quincy Adams
```
