---
layout: default
title: Examples
description: DE signals plot
isExample: true
toc: false
raw: example-signal-de
categories: plot
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# DE signals plot

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


