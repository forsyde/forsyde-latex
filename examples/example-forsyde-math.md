---
layout: default
title: Examples
description: Math notation of a FFT system
isExample: true
toc: false
raw: example-forsyde-math
categories: math
---
{% capture filePath %}raw/{{page.raw}}.tex{% endcapture %}

# Math notation of a FFT system

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


