---
layout: default
title: Examples
description: SY/SDF signals plot
isExample: true
toc: false
raw: example-signal-sy
categories: plot
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# SY/SDF signals plot

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


