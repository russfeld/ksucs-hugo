---
title: "Line Numbers"
pre: "3. "
weight: 100
linenumbers: true
---

Some code line numbering and highlighting can be enabled directly through the [Highlight]({{% relref "shortcodes/highlight" %}}) shortcode.

{{< highlight js "linenos=table,hl_lines=8 15-17,linenostart=142" >}}

function setAutoScroll(newValue) {
    if (newValue) {
        autoScrollSpeed = speedFactor * newValue;
    }
    if (autoScrollTimer) {
      clearInterval(autoScrollTimer);
    }
    autoScrollTimer = setInterval(function(){
        currentTime = Date.now();
        if (prevTime) {
            if (!isScrolling) {
                timeDiff = currentTime - prevTime;
                currentPos += autoScrollSpeed * timeDiff;
                if (Math.abs(currentPos - prevPos) >= minDelta) {
                    isScrolling = true;
                    elem = document.getElementById("body-inner");
                    elem.scrollTo(0, currentPos);
                    isScrolling = false;
                    prevPos = currentPos;
                    prevTime = currentTime;
                }
            }
        } else {
            prevTime = currentTime;
            isScrolling = false;
        }
    }, 1000 / fps);
}

{{< /highlight >}}