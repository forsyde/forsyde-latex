---
layout: default
title: Examples
description: The layered model of ForSyDe-Atom
isExample: true
toc: false
raw: example-pictures-layered
categories: misc
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# The layered model of ForSyDe-Atom

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


