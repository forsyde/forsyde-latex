---
layout: default
title: Examples
description: Example plot of ForSyDe signals
isExample: true
toc: false
raw: example-forsyde-plot
categories: plot
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# Example plot of ForSyDe signals

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


