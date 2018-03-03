---
layout: default
title: Examples
description: Port labeling
isExample: true
toc: false
raw: example-utility-portinfo
categories: tikz
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# Port labeling

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


