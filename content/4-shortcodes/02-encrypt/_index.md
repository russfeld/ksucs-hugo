---
title: "Encrypt"
pre: "2. "
weight: 40
date: 2018-08-24T10:53:26-05:00
---

A shortcode was created to enable the encryption and decryption of pages. This allows secured content to be posted on the web, with the password shared elsewhere, such as in an LMS. A person with the password can use it to decrypt the page and see the content.

Of course, care must be taken not to commit the secured content in its raw form to a public Git repository. To aid in editing, we recommend including a version of the original content in the encrypted content.

See `sjcl.js` and `ecnrypt.js` for details. 