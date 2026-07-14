import pandas as pd
import matplotlib.pyplot as plt

c_scalar = pd.read_csv("c_scalar_results.csv")
ocaml    = pd.read_csv("ocaml_scalar_results.csv")
oxcaml   = pd.read_csv("oxcaml_results.csv")

sizes = c_scalar["InputSizeMB"]

LABELS = {
    "c":      "C (scalar)",
    "ocaml":  "OCaml (scalar)",
    "oxcaml": "OxCaml (int32#)",
}
MARKERS = {"c": "o", "ocaml": "s", "oxcaml": "^"}

def plot3(field, ylabel, title, outfile):
    plt.figure(figsize=(10, 5))
    plt.plot(sizes, c_scalar[field], marker=MARKERS["c"],      label=LABELS["c"])
    plt.plot(sizes, ocaml[field],    marker=MARKERS["ocaml"],  label=LABELS["ocaml"])
    plt.plot(sizes, oxcaml[field],   marker=MARKERS["oxcaml"], label=LABELS["oxcaml"])
    plt.xlabel("Input Size (MB)")
    plt.ylabel(ylabel)
    plt.title(title)
    plt.legend()
    plt.grid(True)
    plt.tight_layout()
    plt.savefig(outfile)
    plt.close()

plot3("HashSpeed", "Throughput (MB/s)",
      "SHA-256 Throughput: C scalar vs OCaml vs OxCaml int32#",
      "hash_speed_comparison.png")

plot3("HashTime", "Hash Time (s)",
      "SHA-256 Hash Time: C scalar vs OCaml vs OxCaml int32#",
      "hash_time_comparison.png")

print("Both graphs generated.")

# Summary at 100 MB
r_c  = c_scalar[c_scalar["InputSizeMB"] == 100].iloc[0]
r_oc = ocaml[ocaml["InputSizeMB"] == 100].iloc[0]
r_ox = oxcaml[oxcaml["InputSizeMB"] == 100].iloc[0]

print("\n100 MB throughput summary:")
print(f"  {'Implementation':<24} {'HashSpeed (MB/s)':>16} {'HashTime (s)':>12}")
print(f"  {'-'*54}")
for label, row in [
    (LABELS["c"],      r_c),
    (LABELS["ocaml"],  r_oc),
    (LABELS["oxcaml"], r_ox),
]:
    print(f"  {label:<24} {row['HashSpeed']:>16.1f} {row['HashTime']:>12.6f}")
