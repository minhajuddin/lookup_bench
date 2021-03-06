# LookupBench

Lookup benchmark for ets vs map based lookup in elixir

## Steps to run this benchmark

  1. Download the worldcitiespop data from: https://www.maxmind.com/en/free-world-cities-database
  2. Extract it and change the encoding to UTF8

        iconv worldcitiespop.txt -f ISO-8859-2 -t UTF8 > worldcitiespop-utf8.txt
        mv worldcitiespop.txt worldcitiespop.txt.bak
        mv worldcitiespop-utf8.txt worldcitiespop.txt

  3. Tweak the variables in `LookupBench` if you want and run the following:

        mix run -e LookupBench.perform

## Log (Full log in ./log)

    15:05:09.922 [debug] starting benchmark

    15:05:09.922 [debug] loading data
    Erlang/OTP 19 [erts-8.2] [source-fbd2db2] [64-bit] [smp:8:8] [async-threads:10] [hipe] [kernel-poll:false]
    Elixir 1.4.0
    Benchmark suite executing with the following configuration:
    warmup: 2.0s
    time: 5.0s
    parallel: 1
    inputs: none specified
    Estimated total run time: 14.0s

    Benchmarking ets_100_100...
    Benchmarking map_100_100...

    Name                  ips        average  deviation         median
    map_100_100      100.55 K        9.95 μs    ±44.35%       10.00 μs
    ets_100_100       52.12 K       19.19 μs    ±57.85%       17.00 μs

    Comparison:
    map_100_100      100.55 K
    ets_100_100       52.12 K - 1.93x slower

    - - -

    Benchmarking ets_100_1000...
    Benchmarking map_100_1000...

    Name                   ips        average  deviation         median
    map_100_1000       99.89 K       10.01 μs    ±42.19%       10.00 μs
    ets_100_1000       52.50 K       19.05 μs    ±55.80%       17.00 μs

    Comparison:
    map_100_1000       99.89 K
    ets_100_1000       52.50 K - 1.90x slower

    - - -

    Benchmarking ets_100_10000...
    Benchmarking map_100_10000...

    Name                    ips        average  deviation         median
    map_100_10000      100.04 K       10.00 μs    ±40.33%       10.00 μs
    ets_100_10000       52.72 K       18.97 μs    ±56.81%       17.00 μs

    Comparison:
    map_100_10000      100.04 K
    ets_100_10000       52.72 K - 1.90x slower

    - - -

    Benchmarking ets_1000_100...
    Benchmarking map_1000_100...

    Name                   ips        average  deviation         median
    map_1000_100       85.03 K       11.76 μs    ±51.86%       11.00 μs
    ets_1000_100       45.03 K       22.21 μs    ±44.35%       20.00 μs

    Comparison:
    map_1000_100       85.03 K
    ets_1000_100       45.03 K - 1.89x slower

    - - -

    Benchmarking ets_1000_1000...
    Benchmarking map_1000_1000...

    Name                    ips        average  deviation         median
    map_1000_1000        8.58 K      116.58 μs    ±12.33%      110.00 μs
    ets_1000_1000        3.93 K      254.60 μs    ±14.07%      247.00 μs

    Comparison:
    map_1000_1000        8.58 K
    ets_1000_1000        3.93 K - 2.18x slower

    - - -

    Benchmarking ets_1000_10000...
    Benchmarking map_1000_10000...

    Name                     ips        average  deviation         median
    map_1000_10000        8.74 K      114.38 μs    ±11.29%      108.00 μs
    ets_1000_10000        3.94 K      253.52 μs    ±14.61%      247.00 μs

    Comparison:
    map_1000_10000        8.74 K
    ets_1000_10000        3.94 K - 2.22x slower

    - - -

    Benchmarking ets_10000_100...
    Benchmarking map_10000_100...

    Name                    ips        average  deviation         median
    map_10000_100       72.80 K       13.74 μs   ±102.80%       13.00 μs
    ets_10000_100       41.67 K       24.00 μs    ±39.73%       22.00 μs

    Comparison:
    map_10000_100       72.80 K
    ets_10000_100       41.67 K - 1.75x slower

    - - -

    Benchmarking ets_10000_1000...
    Benchmarking map_10000_1000...

    Name                     ips        average  deviation         median
    map_10000_1000        5.89 K      169.64 μs    ±31.67%      151.00 μs
    ets_10000_1000        3.04 K      329.03 μs    ±14.20%      322.00 μs

    Comparison:
    map_10000_1000        5.89 K
    ets_10000_1000        3.04 K - 1.94x slower

    - - -

    Benchmarking ets_10000_10000...
    Benchmarking map_10000_10000...

    Name                      ips        average  deviation         median
    map_10000_10000        583.12        1.71 ms    ±26.31%        1.48 ms
    ets_10000_10000        269.62        3.71 ms    ±33.27%        3.04 ms

    Comparison:
    map_10000_10000        583.12
    ets_10000_10000        269.62 - 2.16x slower

    - - -

    Benchmarking ets_100000_100...
    Benchmarking map_100000_100...

    Name                     ips        average  deviation         median
    map_100000_100       43.00 K       23.26 μs  ±1400.38%       14.00 μs
    ets_100000_100       42.37 K       23.60 μs    ±39.66%       21.00 μs

    Comparison:
    map_100000_100       43.00 K
    ets_100000_100       42.37 K - 1.01x slower

    - - -

    Benchmarking ets_100000_1000...
    Benchmarking map_100000_1000...

    Name                      ips        average  deviation         median
    map_100000_1000        3.01 K      332.13 μs   ±323.60%      210.00 μs
    ets_100000_1000        2.75 K      363.27 μs    ±15.39%      355.00 μs

    Comparison:
    map_100000_1000        3.01 K
    ets_100000_1000        2.75 K - 1.09x slower

    - - -

    Benchmarking ets_100000_10000...
    Benchmarking map_100000_10000...

    Name                       ips        average  deviation         median
    map_100000_10000        232.37        4.30 ms    ±66.78%        3.48 ms
    ets_100000_10000        149.05        6.71 ms    ±33.43%        5.88 ms

    Comparison:
    map_100000_10000        232.37
    ets_100000_10000        149.05 - 1.56x slower

    - - -

    Benchmarking ets_1000000_100...
    Benchmarking map_1000000_100...

    Name                      ips        average  deviation         median
    map_1000000_100       39.71 K       25.18 μs  ±4145.59%       15.00 μs
    ets_1000000_100       36.51 K       27.39 μs   ±107.98%       23.00 μs

    Comparison:
    map_1000000_100       39.71 K
    ets_1000000_100       36.51 K - 1.09x slower

    - - -

    Benchmarking ets_1000000_1000...
    Benchmarking map_1000000_1000...

    Name                       ips        average  deviation         median
    map_1000000_1000        2.88 K      347.20 μs   ±953.55%      251.00 μs
    ets_1000000_1000        2.42 K      413.69 μs    ±21.88%      401.00 μs

    Comparison:
    map_1000000_1000        2.88 K
    ets_1000000_1000        2.42 K - 1.19x slower

    - - -

    Benchmarking ets_1000000_10000...
    Benchmarking map_1000000_10000...

    Name                        ips        average  deviation         median
    map_1000000_10000        181.11        5.52 ms   ±218.75%        4.46 ms
    ets_1000000_10000        138.43        7.22 ms    ±12.59%        7.09 ms

    Comparison:
    map_1000000_10000        181.11
    ets_1000000_10000        138.43 - 1.31x slower
