#import "../template.typ": *
#import "@preview/codelst:2.0.1": sourcecode, sourcefile

#show: project.with(
  week: 3,
  authors: (
    (
      name: sys.inputs.STUDENT_NAME,
      id: sys.inputs.STUDENT_ID,
      affiliation: "情報科学類2年"
    ),
  ),
  date: "2024 年 7 月 2 日",
)

// 行列をいい感じにする
#set math.mat(gap: 1em, delim: "[")

== 課題1
=== (1.1)

本課題は、与えられた $A$ に対して、LU 分解を行う Julia プログラムを作成し、結果を報告するというものである。

与えられた $A$ は以下の通り。

$
A = mat(
  4, 3, 2, 1;
  3, 4, 3, 2;
  2, 3, 4, 3;
  1, 2, 3, 4;
)
$

実装したコードを以下に示す。

#sourcefile(read("src/1.jl"), file:"src/1.jl")

また、実行結果として次の出力を得た。

#sourcecode[```
  L: [1.0 0.0 0.0 0.0; 0.75 1.0 0.0 0.0; 0.5 0.8571428571428571 1.0 0.0; 0.25 0.7142857142857143 0.8333333333333333 1.0]
  U: [4.0 3.0 2.0 1.0; 0.0 1.75 1.5 1.25; 0.0 0.0 1.7142857142857144 1.4285714285714286; 0.0 0.0 0.0 1.6666666666666667]
```]

すなわち、$L, U$ の値は以下の通り。

$
L = mat(
  1.0, 0.0, 0.0, 0.0;
  0.75, 1.0, 0.0, 0.0;
  0.5, 0.8571428571428571, 1.0, 0.0;
  0.25, 0.7142857142857143, 0.8333333333333333, 1.0;
)
$

$
U = mat(
  4.0, 3.0, 2.0, 1.0;
  0.0, 1.75, 1.5, 1.25;
  0.0, 0.0, 1.7142857142857144, 1.4285714285714286;
  0.0, 0.0, 0.0, 1.6666666666666667;
)
$

== 課題2

本課題は課題 1 の課題に対して、行列の積を繰り返すのではなく、ある行を別の行に加える操作を行うことで課題1と同様の消去をし LU 分解を行うというものである。

実装したコードを以下に示す。なお、対応する問題番号についてはコメントで示している。

#sourcefile(read("src/2.jl"), file:"src/2.jl")

=== (2.1)

$
A = mat(
  4, 3, 2, 1;
  0, 1.75, 1.5, 1.25;
  2, 3, 4, 3;
  1, 2, 3, 4;
)
$

プログラムの対応する出力を以下に示す。

#sourcecode[```
  (2.1): [4.0 3.0 2.0 1.0; 0.0 1.75 1.5 1.25; 2.0 3.0 4.0 3.0; 1.0 2.0 3.0 4.0]
```]

=== (2.2)

プログラム内の `makeU` 関数がそれにあたる。

`makeU(A)` によりこの関数を呼び出すと以下出力が得られた。

#sourcecode[```
  (2.2): [4.0 3.0 2.0 1.0; 0.0 1.75 1.5 1.25; 0.0 0.0 1.7142857142857144 1.4285714285714286; 0.0 0.0 0.0 1.6666666666666667]
```]

=== (2.3)

プログラム内の `makeLU` 関数がそれにあたる。

また、プログラム内に例として $L, U$ の値を出力しており、対応する出力は以下の通り。

#sourcecode[```
  (2.3)
    L: [1.0 0.0 0.0 0.0; 0.75 1.0 0.0 0.0; 0.5 0.8571428571428571 1.0 0.0; 0.25 0.7142857142857143 0.8333333333333333 1.0]
    U: [4.0 3.0 2.0 1.0; 0.0 1.75 1.5 1.25; 0.0 0.0 1.7142857142857144 1.4285714285714286; 0.0 0.0 0.0 1.6666666666666667]
```]

=== (2.4)

行列 $A$ について、$i$ 列の $i + 1$ 行目以降を削除するために掛ける行列を $M^(\(i\))$ とすると、これは $P_(i, j)(alpha)$ を用いて表すことができる。
ここで、$P_(i, j)(alpha) = I + alpha bold(e_i e_j)^"T"$ であるから、
$P_(i, j)(alpha) = P_(i, j)(-alpha) = I - alpha bold(e_i e_j)^T$

よって、$M^(\(1\))M^(\(2\)) dots.h.c M^(\(i\)) A = U$ であるから、
$A = (P^(\(k\))(alpha^(\(k\))) dots.h.c P^(\(1\))(alpha^(\(1\))))^(-1) U = L U$
すなわち、$L = (P^(\(k\))(alpha^(\(k\))) dots.h.c P^(\(1\))(alpha^(\(1\))))^(-1) = P^(\(k\))(alpha^(\(k\)))^(-1) dots.h.c P^(\(1\))(alpha^(\(1\)))^(-1)$ である。

これは、$U$ の計算中に順に列ごとに計算をすればよく、また $alpha$ の値を使いまわすことができるため、$U$ を求める過程の値を用いて実装ができる。

// 説明が下手すぎる、カス
// 理解はしてはいるがどうやって表現したらよいのかわからなすぎて終わり……
// 適当にそれっぽい日本語を錬成したが、自信がない

=== (2.5)

本課題は、実際に LU 分解を行うときは課題 1 と課題 2 のどちらの実装が良いかを考察するというものである。

課題 1 でのコードでは、U と L を求めるために、ループの中で毎回行列の積を計算している。
そのため、$N times N$ の大きさの行列に対しては 1 列のある要素を削除消去するたびに $Omicron (N^3)$ かかり、全体として $Omicron (N^5)$ の計算量がかかる。
一方、課題 2 のコードでは全体として $Omicron (N*3)$ の計算量で済んでいる。

そのため、計算量の観点から課題 2 の実装の方が優れていると考えられる。

== 課題3

=== (3.1), (3.2)
本課題は前問で実装した LU 分解によって得られた $L$ と $U$ を用いて連立一次方程式 $A bold(x) = bold(b)$ を解き、解 $bold(x)$ と残差を報告するというものである。

作成したプログラムを以下に示す。

#sourcefile(read("src/3.jl"), file:"src/3.jl")

また、実行結果として以下の出力を得た。

#sourcecode[```
  ans: [0.2, -2.7755575615628914e-17, 0.0, 0.2]
  error: [0.0, 0.0, 0.0, 0.0]
```]

すなわち、解として

$
bold(x) = mat(
  0.2;
  -2.7755575615628914 times 10^(-17);
  0.0;
  0.2;
)
$

を、$bold(x)$ の残差として

$
mat(
  0.0;
  0.0;
  0.0;
  0.0;
)
$

を得た。

== 課題4
=== (4.1)

コードを以下に示す。
`newtonMethod_p` 関数が目的を達成する関数である。

#sourcefile(read("src/4-1.jl"), file:"src/4-1.jl")

=== (4.2)

要件に従い、プロットするために以下に示すコードを実装した。

#sourcefile(read("src/4-2.jl"), file:"src/4-2.jl")

実行すると、以下に示す図 1 が得られた。

#figure(
  image("fig/fig1.svg"),
  caption: [課題 (4.2) のプログラムの出力結果]
)

=== (4.3)

要件に従い、プロットするために以下に示すコードを実装した。

#sourcefile(read("src/4-3.jl"), file:"src/4-3.jl")

実行すると、以下に示す図 2 が得られた。

#figure(
  image("fig/fig2.svg"),
  caption: [課題 (4.3) のプログラムの出力結果]
)

== 課題5

コードを以下に示す。

#sourcefile(read("src/5.jl"), file:"src/5.jl")

=== (5.1)

`findClosestIndex` が近似解に最も近い真の解のインデックスを返す関数である。

`findClosestIndex(newtonMethod_p(2.0 + 2.0im), roots(Polynomial([-1, 0, 0, 1])))` を実行すると、出力として 3 が得られた。

=== (5.2)

$m = 300$ でプロットした結果を以下に示す。

#figure(
  image("fig/fig3.png"),
  caption: [$m = 300$ でプロットした結果]
)
