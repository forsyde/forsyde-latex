---
layout: default
title: Examples
description: The 'transition' node
isExample: true
toc: false
raw: example-node-trans
categories: tikz
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# The 'transition' node

<p align="center">
<img src="../assets/svg/{{page.raw}}.svg">
</p>

<p align="center">
<a href="{{filePath}}">RAW</a>
|
<a href="../assets/pdf/{{page.raw}}.pdf">PDF</a>
</p>

{% highlight latex %}
{% include_relative {{ filePath }} %}
{% endhighlight %}


