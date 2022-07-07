---
title: "Reveal.js Example"
pre: "2. "
weight: 20
---

### Resources

[Slides]({{< relref "02-reveal-example-slides" >}})

### Info

This theme includes a special template for developing presentations using [Reveal.js](https://revealjs.com/).

To do this, there are a few steps:

1. Create an html file with the `.html` file extension
2. Use the following frontmatter:

```yaml
---
type: "reveal"
hidden: true
---
```

In that file, write the contents of the Reveal.js presentation. Each slide should be contained in a `<section>` tag.

The contents of each slide is simply HTML, and pretty much any standard HTML tag can be used. Custom CSS can also be added via the `style` attribute on individual elements.

When editing the slides, it is recommended to manually update the highlighting used by your preferred editor to HTML. This is relatively simple to do in Atom or Notepad++.

## Examples

Below are some example slides to show the formatting that can be done in this presentation. Each slide is present in the [Slides]({{< relref "02-reveal-example-slides" >}}) page.

### Simple Title Slide

```html
<section>
	<h2>Welcome to the</h2>
	<img class="plain stretch" src="/images/core-logo-on-white.svg">
	<h2>trial course!</h2>
</section>
```

The image uses the `stretch` class, which is detailed below.

### Slide with Bulleted List

```html
<section>
	<h2>Undergrad Certificate</h2>
	<ul style="font-size: 65px">
		<li><i><b>CC 110</b> - Introduction to Computing (Coming Soon)</i></li>
		<li><b>CC 210</b> - Fundamental Computer Programming Concepts</li>
		<li><b>CC 310</b> - Data Structures & Algorithms I</li>
		<li><b>CC 315</b> - Data Structures & Algorithms II</li>
		<li><b>CC 410</b> - Advanced Programming</li>
	</ul>
</section>
```

This slide uses a custom style applied to the `ul` element, to reduce the text size of all list items a bit

### Images with Sources

```html
<section>
	<h2>Programming</h2>
	<img class="plain" style="height: 40%;" src="/images/java_logo_wiki.svg">
	<img class="plain stretch" src="/images/python_logo_wiki.svg">
	<p class="imagecredit">Image Credit: <a href="https://commons.wikimedia.org/w/index.php?title=File:Python_logo_and_wordmark.svg&oldid=164598673">Wikimedia</a> <a href="https://en.wikipedia.org/w/index.php?title=File:Java_programming_language_logo.svg&oldid=872323259">Commons</a></p>
</section>
```

The `stretch` class applied to the image will stretch that image to fill all available space in the slide. **Only one image may have the `stretch` class applied on any given slide.** So, in this case, the height of one image is set manually to `40%`, and the other is allowed to stretch and fill the remaining part of the slide.

The `plain` class simply removes any adornment (borders, shading, etc.) from the image. I prefer them that way.

There is a custom `imagecredit` class defined in the CSS that can be used to give credit for images in a way that is unobtrusive to the presentation.

### Math (via MathJax)

```html
<section>
	<div style="font-size: 2em">
	$$x^2 + 2x + 5 = 0$$
	</div>
</section>
```

Slides can also include inline LaTeX math, using MathJax.

### Tables

```html
<section>
	<table class="reveal">
		<tr>
			<th>A</th>
			<th>B</th>
			<th>A &#8897; B</th>
		</tr>
		<tr>
			<td>F</td>
			<td>F</td>
			<td>F</td>
		</tr>
		<tr>
			<td>F</td>
			<td>T</td>
			<td>T</td>
		</tr>
		<tr>
			<td>T</td>
			<td>F</td>
			<td>T</td>
		</tr>
		<tr>
			<td>T</td>
			<td>T</td>
			<td>T</td>
		</tr>
  </table>
</section>
```

Tables should use the special `reveal` class for formatting.

### Code

Code can be included in slides using the `<pre>` and `<code>` tags. Code highlighting is controlled by the class attached to the `<code>` tag (or inferred from context), while the size of the text is best controlled by the style in the `<pre>` tag. The `stretch` class can also be used to ensure a code block fills the available space, avoiding the need for scrollbars.

#### Java

```html
<section>
  <pre class="stretch" style="font-size: 0.5em;"><code class="java">// Load required classes
import java.util.Scanner;
import java.io.File;

public class Conditionals{
  public static void main(String[] args) throws Exception{
    // Scanner variable
    Scanner reader;

    // If an argument is present, we are reading from a file
    // specified in args[0]
    if(args.length > 0){
      reader = new Scanner(new File(args[0]));
    // If no argument, read from System.in
    }else{
      reader = new Scanner(System.in);
    }

    int x = reader.nextInt();
    System.out.println(x);
  }
}</code></pre>
</section>
```

#### Python

```html
<section>
  <pre class="stretch" style="font-size: 0.7em;"><code class="python"># Load required modules
import sys

# If an argument is present,
# we are reading from a file
# specified in sys.argv[1]
if len(sys.argv) > 1:
  reader = open(sys.argv[1])
# If no argument, read from stdin
else:
  reader = sys.stdin

x = int(reader.readline())
print(x)</code></pre>
</section>
```

### Multiple Divs

The slides can also include multiple `<div>` tags to separate content.

```html
<section>
  <div style="float: right; width: 70%">
    <pre class="stretch" style="font-size: .37em"><code class="java">// Load required classes
import java.util.Scanner;
import java.io.File;

public class Example{
  public static void main(String[] args){
    // Scanner variable
    <mark>Scanner reader;</mark>

    // If an argument is present,
    // we are reading from a file
    // specified in args[0]
    <mark>if(args.length > 0){
      reader = new Scanner(new File(args[0]));</mark>
    // If no argument, read from System.in
    <mark>}else{
      reader = new Scanner(System.in);
    }</mark>

    /* -=-=-=-=- MORE CODE GOES HERE -=-=-=-=- */
  }
}</code></pre>
  </div>
  <div style="width: 30%">
  <p style="font-size: .7em">Write a program that accepts a positive integer that represents a year...</p>
  </div>
</section>
```

The example below includes a `<div>` of text that is shown to the left, and a `<div>` of code shown to the right. We use the attribute `style="float: right; width: 70%"` applied to the first div to move it to the right and give it a fixed width. The second div should also have a fixed width attached to it.

Note that the `stretch` class applied to the code in the rightmost div only stretches the code within that div. Pretty handy!

### Marking Text

We can mark (highlight) text in our slides using the `<mark>` tag:

```html
<section>
  <div style="float: right; width: 70%">
    <pre class="stretch" style="font-size: .5em"><code class="java">
    </code></pre>
  </div>
  <div style="width: 30%">
  <p style="font-size: .7em">Write a program that accepts a positive <mark>integer that represents a year</mark>...</p>
  </div>
</section>

<section>
  <div style="float: right; width: 70%">
    <pre class="stretch" style="font-size: .5em"><code class="java"><mark>int year = reader.nextInt();</mark>
    </code></pre>
  </div>
  <div style="width: 30%">
  <p style="font-size: .7em">Write a program that accepts a positive <mark>integer that represents a year</mark>...</p>
  </div>
</section>

<section>
  <div style="float: right; width: 70%">
    <pre class="stretch" style="font-size: .5em"><code class="java">int year = reader.nextInt();
    </code></pre>
  </div>
  <div style="width: 30%">
  <p style="font-size: .7em">Write a program that accepts a <mark>positive integer</mark> that represents a year...</p>
  </div>
</section>
```

The three slides listed above each mark a different part of the text and code. This allows us to incrementally build a program by marking parts of the code as we discuss them.