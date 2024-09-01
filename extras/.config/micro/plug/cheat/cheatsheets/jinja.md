---
title: Jinja
category: Python
layout: 2017/sheet
---

{% raw %}
### Basic usage

```
- variable x has content: {{ x }}
- expression: {{ x + 1 }}
- escaped for HTML: {{ x | e }}
```

### Control structures

```
{% for x in range(5) %}
    {% if x % 2 == 0 %}
        {{ x }} is even!
    {% else %}
        {{ x }} is odd!
    {% endif %}
{% endfor %}
```

### Whitespace trimming

```
these are
{{ "three" }}
lines.

this is conc
{{- "at" -}}
enated.
```

### Special blocks

```
{% filter e %}{% endraw %}
{ {%- if 0 -%}{%- endif -%} % raw %}
{%- raw -%}
    This is a raw block where {{nothing is evaluated}}
    {% not even this %}
    and <html is escaped> too with "e" filter
{% endraw %}
{ {%- if 0 -%}{%- endif -%} % endraw %}{% raw %}
{% endfilter %}

{% macro myfunc(x) %}
    this is a reusable macro, with arguments: {{x}}
{% endmacro %}

{{ myfunc(42) }}

{#
this is a comment
#}
```


### Inheritance

#### shared.html

```
<html>
  <head>
    <title>{%block title %}{% endblock %}</title>
  </head>
  <body>
    <header><h1>{% block title %}{% endblock %}</h1></header>
    <main>{% block content %}{% endblock %}</main>
  </body>
</html>
```

#### home.html

```
{% extends "shared.html" %}
{% block title %}Welcome to my site{% endblock %}
{% block content %}
This is the body
{% endblock %}
```

## Library

### Basic usage

```python
from jinja2 import Template
template = Template('Hello {{ name }}!')
template.render(name='John Doe') == u'Hello John Doe!'
```

{% endraw %}

https://devhints.io/ cheatsheets - Copyright (c) 2021 Rico Sta. Cruz and contributors - MIT license
micro-cheat plugin Copyright 2022 Tero Karvinen https://TeroKarvinen.com/micro - MIT license
