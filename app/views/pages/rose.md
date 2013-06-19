By any other name
=================

![rose](origami/rose.png)

I was fixing a bug in *redacted module* when I came across this gem:

```php
<?php redacted_module::emit_horrible_css(); ?>
```

Two things. First, I am not a fan of functions that "emit" code. I'd rather
include horrible.css, but that's a personal preference. Second, this function
does exactly what it says it does. I can't go into too many details, but behind
the scenes, it decides how to style the page based on the current environment.
The appearance differs between production and development, which is intentional
since the page contains controls that can alter user experience. We want
engineers to have a visual queue that says *"this is production,"* in order to
prevent accidents.


