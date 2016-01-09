---
layout: post
title: Tabs to Spaces in all files
categories: blog

lang: EN
---

This script converts all tabs to 4 spaces.

    find ./ -type f -exec sed -i 's/\t/    /g' {} \;

