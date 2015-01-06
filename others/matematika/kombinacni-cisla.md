---
layout: default_math
title: Kombinacni cisla
---

## {{page.title}}

<style>
td {
    height: 50px;
}
</style>

<table> <tr><td> ${0 \choose 0} = 1$</td><td>${1 \choose 0} = 1$</td><td>${2 \choose 0} = 1$</td><td>${3 \choose 0} = 1$</td><td>${4 \choose 0} = 1$</td><td>${5 \choose 0} = 1$</td><td>${6 \choose 0} = 1$</td><td>${7 \choose 0} = 1$</td><td>${8 \choose 0} = 1$</td><td>${9 \choose 0} = 1$</td><td>${10 \choose 0} = 1$ </td></tr> <tr><td> </td><td>${1 \choose 1} = 1$</td><td>${2 \choose 1} = 2$</td><td>${3 \choose 1} = 3$</td><td>${4 \choose 1} = 4$</td><td>${5 \choose 1} = 5$</td><td>${6 \choose 1} = 6$</td><td>${7 \choose 1} = 7$</td><td>${8 \choose 1} = 8$</td><td>${9 \choose 1} = 9$</td><td>${10 \choose 1} = 10$ </td></tr> <tr><td> </td><td></td><td>${2 \choose 2} = 1$</td><td>${3 \choose 2} = 3$</td><td>${4 \choose 2} = 6$</td><td>${5 \choose 2} = 10$</td><td>${6 \choose 2} = 15$</td><td>${7 \choose 2} = 21$</td><td>${8 \choose 2} = 28$</td><td>${9 \choose 2} = 36$</td><td>${10 \choose 2} = 45$ </td></tr> <tr><td> </td><td></td><td></td><td>${3 \choose 3} = 1$</td><td>${4 \choose 3} = 4$</td><td>${5 \choose 3} = 10$</td><td>${6 \choose 3} = 20$</td><td>${7 \choose 3} = 35$</td><td>${8 \choose 3} = 56$</td><td>${9 \choose 3} = 84$</td><td>${10 \choose 3} = 120$ </td></tr> <tr><td> </td><td></td><td></td><td></td><td>${4 \choose 4} = 1$</td><td>${5 \choose 4} = 5$</td><td>${6 \choose 4} = 15$</td><td>${7 \choose 4} = 35$</td><td>${8 \choose 4} = 70$</td><td>${9 \choose 4} = 126$</td><td>${10 \choose 4} = 210$ </td></tr> <tr><td> </td><td></td><td></td><td></td><td></td><td>${5 \choose 5} = 1$</td><td>${6 \choose 5} = 6$</td><td>${7 \choose 5} = 21$</td><td>${8 \choose 5} = 56$</td><td>${9 \choose 5} = 126$</td><td>${10 \choose 5} = 252$ </td></tr> <tr><td> </td><td></td><td></td><td></td><td></td><td></td><td>${6 \choose 6} = 1$</td><td>${7 \choose 6} = 7$</td><td>${8 \choose 6} = 28$</td><td>${9 \choose 6} = 84$</td><td>${10 \choose 6} = 210$ </td></tr> <tr><td> </td><td></td><td></td><td></td><td></td><td></td><td></td><td>${7 \choose 7} = 1$</td><td>${8 \choose 7} = 8$</td><td>${9 \choose 7} = 36$</td><td>${10 \choose 7} = 120$ </td></tr> <tr><td> </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>${8 \choose 8} = 1$</td><td>${9 \choose 8} = 9$</td><td>${10 \choose 8} = 45$ </td></tr> <tr><td> </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>${9 \choose 9} = 1$</td><td>${10 \choose 9} = 10$ </td></tr> <tr><td> </td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td>${10 \choose 10} = 1$ </td></tr> </table>


### Python generator

{% raw %}

    import itertools

    def comb(n, k):
        return len(list(itertools.combinations(range(n), k)))

    res = []
    for k in xrange(11):
        res2 = []
        for n in xrange(11):
            if n >= k:
                res2.append((n, k, comb(n, k)))
            else:
                res2.append(None)
        res.append(res2)

    print '<table>',
    for row in res:
        print '<tr><td>',
        print '</td><td>'.join(map(lambda x: '${%s \\choose %s} = %s$'% x if x else '', row)),
        print '</td></tr>',
    print '</table>'

{% endraw %}
