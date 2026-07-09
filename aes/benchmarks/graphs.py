import os
import pandas as pd
import matplotlib.pyplot as plt

BASE = os.path.dirname(os.path.abspath(__file__))

def csv(rel):
    return pd.read_csv(os.path.join(BASE, rel))

aes128_c     = csv("../aes-128/benchmarks/results/results_manual_c.csv")
aes128_ocaml = csv("../aes-128/benchmarks/results/results_manual_ocaml.csv")
rij_c        = csv("../rijndael/benchmarks/results_final_opt/c_results.csv")
rij_ocaml    = csv("../rijndael/benchmarks/results_final_opt/ocaml_results.csv")
ni_c         = csv("../aes-ni/benchmarks/results/c_results.csv")
ni_ocaml     = csv("../aes-ni/benchmarks/results/ocaml_results.csv")
ni_oxcaml    = csv("../aes-ni/benchmarks/results/oxcaml_simd_results.csv")

# (label, df, sizes_col, enc_time_col, dec_time_col, enc_speed_col, dec_speed_col, marker, color)
SERIES = [
    ("AES-128 C",           aes128_c,     "size_mb",     "enc_time",    "dec_time",    "enc_speed",    "dec_speed",    "o", "#1f77b4"),
    ("AES-128 OCaml",       aes128_ocaml, "size_mb",     "enc_time",    "dec_time",    "enc_speed",    "dec_speed",    "s", "#aec7e8"),
    ("Rijndael C",          rij_c,        "InputSizeMB", "EncryptTime", "DecryptTime", "EncryptSpeed", "DecryptSpeed", "^", "#ff7f0e"),
    ("Rijndael OCaml (opt)",rij_ocaml,    "InputSizeMB", "EncryptTime", "DecryptTime", "EncryptSpeed", "DecryptSpeed", "D", "#ffbb78"),
    ("AES-NI C",            ni_c,         "InputSizeMB", "EncryptTime", "DecryptTime", "EncryptSpeed", "DecryptSpeed", "v", "#2ca02c"),
    ("AES-NI OCaml",        ni_ocaml,     "InputSizeMB", "EncryptTime", "DecryptTime", "EncryptSpeed", "DecryptSpeed", "P", "#98df8a"),
    ("AES-NI OxCaml SIMD (partial)", ni_oxcaml,   "InputSizeMB", "EncryptTime", "DecryptTime", "EncryptSpeed", "DecryptSpeed", "X", "#d62728"),
]

GRAPHS = [
    ("Encryption Time (s)",  "Encryption Time: AES-128 vs Rijndael vs AES-NI",       "encryption_time_comparison.png",  2),
    ("Decryption Time (s)",  "Decryption Time: AES-128 vs Rijndael vs AES-NI",       "decryption_time_comparison.png",  3),
    ("Throughput (MB/s)",    "Encryption Throughput: AES-128 vs Rijndael vs AES-NI", "encryption_speed_comparison.png", 4),
    ("Throughput (MB/s)",    "Decryption Throughput: AES-128 vs Rijndael vs AES-NI", "decryption_speed_comparison.png", 5),
]

SERIES_NO_AES128 = [s for s in SERIES if not s[0].startswith("AES-128")]

GRAPHS_NO_AES128 = [
    ("Encryption Time (s)",  "Encryption Time: Rijndael vs AES-NI",       "encryption_time_rijndael_vs_aes-ni.png",  2),
    ("Decryption Time (s)",  "Decryption Time: Rijndael vs AES-NI",       "decryption_time_rijndael_vs_aes-ni.png",  3),
    ("Throughput (MB/s)",    "Encryption Throughput: Rijndael vs AES-NI", "encryption_speed_rijndael_vs_aes-ni.png", 4),
    ("Throughput (MB/s)",    "Decryption Throughput: Rijndael vs AES-NI", "decryption_speed_rijndael_vs_aes-ni.png", 5),
]

def make_graphs(series, graphs):
    for ylabel, title, filename, col_idx in graphs:
        plt.figure(figsize=(11, 6))
        for label, df, sz, et, dt, es, ds, marker, color in series:
            col = (et, dt, es, ds)[col_idx - 2]
            plt.plot(df[sz], df[col], marker=marker, color=color, label=label, linewidth=1.8)
        plt.xlabel("Input Size (MB)")
        plt.ylabel(ylabel)
        plt.title(title)
        plt.legend()
        plt.grid(True)
        plt.tight_layout()
        plt.savefig(os.path.join(BASE, filename), dpi=150)
        plt.close()
        print(f"  {filename}")

print("All 3 variants:")
make_graphs(SERIES, GRAPHS)

print("Rijndael + AES-NI only (excluding AES-128):")
make_graphs(SERIES_NO_AES128, GRAPHS_NO_AES128)

print("Done — 8 graphs in", BASE)
