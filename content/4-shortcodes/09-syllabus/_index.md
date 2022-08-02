---
title: "Syllabus"
pre: "9. "
weight: 100
---

The `syllabus` shortcode can be used to include the default K-State syllabus statements that are embedded into the theme. The theme maintainer will update these statements each semester, so by using this shortcode and keeping your theme updated, your textbooks will always have the current statements.

The syllabus statements can be found in `/themes/hugo-theme-learn/static/files/syllabus/`. The text of nearly all of these statements can be found on the [Provost's Website](https://www.k-state.edu/provost/resources/teaching/course.html).

### Default Usage

```
{{</* syllabus */>}}
```

This will include all of the default syllabus statements on the page. Currently, the default syllabus statements are included in this order:

1. honesty
1. disabilities
1. conduct
1. respect
1. netiquette (this is a custom statement for K-State CS courses)
1. facecoverings
1. discrimination
1. freedom
1. safety
1. resources
1. creations
1. mentalhealth
1. absences
1. copyright

### Customizing

There are two ways to customize the syllabus statements:

###### Include

```
{{</* syllabus include="honesty disabilities conduct respect" */>}}
```

The `include` parameter is a space-delimited list of statements to include. They will be included in the order listed.

###### Exclude

```
{{</* syllabus exclude="copyright honesty" */>}}
```

The `exclude` parameter is a space-delimited list of statements to be excluded from the default list.