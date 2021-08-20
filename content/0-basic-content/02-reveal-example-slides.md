---
type: "reveal"
hidden: true
---
<section>
	<h2>Welcome to the</h2>
	<img class="plain stretch" src="/images/core-logo-on-white.svg">
	<h2>trial course!</h2>
</section>

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

<section>
	<h2>Programming</h2>
	<img class="plain" style="height: 40%;" src="/images/java_logo_wiki.svg">
	<img class="plain stretch" src="/images/python_logo_wiki.svg">
	<p class="imagecredit">Image Credit: <a href="https://commons.wikimedia.org/w/index.php?title=File:Python_logo_and_wordmark.svg&oldid=164598673">Wikimedia</a> <a href="https://en.wikipedia.org/w/index.php?title=File:Java_programming_language_logo.svg&oldid=872323259">Commons</a></p>
</section>

<section>
	<div style="font-size: 2em">
	$$x^2 + 2x + 5 = 0$$
	</div>
</section>

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
