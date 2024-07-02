#import "../template.typ": *
#import "@preview/codelst:2.0.1": sourcecode, sourcefile

#show: project.with(
  week: 1,
  authors: (
    (
      name: sys.inputs.STUDENT_NAME,
      id: sys.inputs.STUDENT_ID,
      affiliation: "情報科学類2年"
    ),
  ),
  date: "2024 年 5 月 20 日",
)

== 課題1
=== (1.1)

作成した関数のソースコードは以下の通り：

#sourcefile(read("src/1-1.jl"), file:"src/1-1.jl")

=== (1.2)

#figure(
  image("fig/fig1.svg", width: 60%),
  caption: "n の値と差の絶対値の関係のグラフ"
)

コードは以下のようになった：

#sourcefile(read("src/1-2.jl"), file:"src/1-2.jl")

== 課題2
=== (2.1)

/ 残差:
  - $x_1$: $-2.2365583777356202 times 10^(-13)$
  - $x_2$: $0.0$
/ 絶対誤差:
  - $x_1$: $1.8041124150158794 times 10^(-15)$
  - $x_2$: $0.0$
/ 相対誤差:
  - $x_1$: $2.2369538922194248 times 10^(-13)$
  - $x_2$: $0.0$

以下のようなコードを用いて計算をした

#sourcefile(read("src/2-1.jl"), file:"src/2-1.jl")

=== (2.2)

/ 残差:
  - $x_1$: $1.360267150654626 times 10^(-16)$
  - $x_2$: $0.0$
/ 絶対誤差:
  - $x_1$: $0.0$
  - $x_2$: $0.0$
/ 相対誤差:
  - $x_1$: $0.0$
  - $x_2$: $0.0$

以下のようなコードを用いて計算した

#sourcefile(read("src/2-2.jl"), file:"src/2-2.jl")

=== (2.3)

$a, b$ の値と $b$ の値の差が大きいときほど解の公式で求めた結果が悪くなると考えられる。
