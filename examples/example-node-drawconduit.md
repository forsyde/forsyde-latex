---
layout: default
title: Examples
description: Example of permutation network
isExample: true
toc: false
raw: example-node-drawconduit
categories: tikz
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# Example of permutation network

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


