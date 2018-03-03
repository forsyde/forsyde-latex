---
layout: default
title: Examples
description: Example ForSyDe process network
isExample: true
toc: false
raw: example-forsyde-tikz
categories: tikz
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# Example ForSyDe process network

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


