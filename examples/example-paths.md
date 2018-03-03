---
layout: default
title: Examples
description: Types of paths
isExample: true
toc: false
raw: example-paths
categories: tikz
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# Types of paths

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


