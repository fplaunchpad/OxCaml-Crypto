"""
progress_graphs.py — OCaml and OxCaml optimization-progress graphs.

X-axis : Input size in MB  (1, 10, 30, 50, 75, 100)
Y-axis : Throughput (MB/s) or Time (seconds)
Lines  : one per optimization stage; reverted stages shown with dashed lines.
Output : 300 DPI PNG, publication quality.
"""

import pandas as pd
import matplotlib.pyplot as plt
import os

# ── Global style (matches graphs.py) ─────────────────────────────────────────
plt.rcParams.update({
    'font.family':      'sans-serif',
    'font.size':        11,
    'axes.titlesize':   12,
    'axes.labelsize':   11,
    'legend.fontsize':  9,
    'xtick.labelsize':  10,
    'ytick.labelsize':  10,
    'lines.linewidth':  2.0,
    'lines.markersize': 6,
    'axes.linewidth':   1.0,
    'grid.linestyle':   '--',
    'grid.alpha':       0.6,
})

DPI  = 300
BASE = os.path.dirname(os.path.abspath(__file__))


def csv(rel):
    return pd.read_csv(os.path.join(BASE, rel))


def save_fig(series, field, ylabel, title, fname,
             figsize=(11, 6), legend_ncol=1):
    fig, ax = plt.subplots(figsize=figsize)
    for s in series:
        ax.plot(s['df']['InputSizeMB'], s['df'][field],
                label=s['label'],
                color=s['color'],
                linestyle=s['ls'],
                marker=s['marker'],
                linewidth=2.0,
                markersize=6)
    ax.set_xlabel('Input Size (MB)')
    ax.set_ylabel(ylabel)
    ax.set_title(title)
    ax.legend(loc='best', ncol=legend_ncol, fontsize=9, framealpha=0.9)
    ax.grid(True)
    fig.tight_layout()
    path = os.path.join(BASE, fname)
    fig.savefig(path, dpi=DPI)
    plt.close(fig)
    print(f'  Saved: {path}')


# ══════════════════════════════════════════════════════════════════════════════
# OCaml scalar — C scalar ceiling + 8 OCaml stages (Opt05 reverted)
# ══════════════════════════════════════════════════════════════════════════════
#
#  Colour scheme
#  ─────────────
#  C scalar           : dashed blue  (reference ceiling)
#  OCaml kept stages  : solid greens, lightest → darkest
#  OCaml reverted     : dashed purple (visually distinct; dashed = reverted)

OCAML_SERIES = [
    dict(label='C (scalar)  [ceiling]',
         df=csv('c_scalar_results.csv'),
         color='#1f77b4', ls='dashed', marker='o'),

    dict(label='OCaml – Baseline',
         df=csv('ocaml_scalar/benchmarks/baseline.csv'),
         color='#c7e9c0', ls='solid', marker='s'),

    dict(label='OCaml – Opt01: Hoist Data',
         df=csv('ocaml_scalar/benchmarks/opt01_hoist_data.csv'),
         color='#a1d99b', ls='solid', marker='s'),

    dict(label='OCaml – Opt02: Unsafe Array',
         df=csv('ocaml_scalar/benchmarks/opt02_unsafe_array.csv'),
         color='#74c476', ls='solid', marker='s'),

    dict(label='OCaml – Opt03: Tail-rec',
         df=csv('ocaml_scalar/benchmarks/opt03_tailrec.csv'),
         color='#41ab5d', ls='solid', marker='s'),

    dict(label='OCaml – Opt04: Skip Blit',
         df=csv('ocaml_scalar/benchmarks/opt04_skip_blit.csv'),
         color='#238443', ls='solid', marker='s'),

    dict(label='OCaml – Opt05: Unroll  [reverted]',
         df=csv('ocaml_scalar/benchmarks/opt05_unroll.csv'),
         color='#9467bd', ls='dashed', marker='x'),

    dict(label='OCaml – Opt06: Unsafe Bytes',
         df=csv('ocaml_scalar/benchmarks/opt06_unsafe_bytes.csv'),
         color='#006d2c', ls='solid', marker='s'),

    dict(label='OCaml – Opt07: Sigma Mask  [final]',
         df=csv('ocaml_scalar/benchmarks/opt07_sigma_mask.csv'),
         color='#00441b', ls='solid', marker='s'),
]

# ══════════════════════════════════════════════════════════════════════════════
# OxCaml int32# — C scalar + OCaml Opt07 references + 4 OxCaml stages (all kept)
# ══════════════════════════════════════════════════════════════════════════════
#
#  Colour scheme
#  ─────────────
#  C scalar           : dashed blue   (upper reference ceiling)
#  OCaml Opt07        : dashed green  (lower reference)
#  OxCaml int32#      : solid warm gradient, lightest → darkest

OXCAML_SERIES = [
    dict(label='C (scalar)  [ceiling]',
         df=csv('c_scalar_results.csv'),
         color='#1f77b4', ls='dashed', marker='o'),

    dict(label='OCaml – Opt07: Sigma Mask  [reference]',
         df=csv('ocaml_scalar_results.csv'),
         color='#238443', ls='dashed', marker='s'),

    dict(label='int32# – Baseline',
         df=csv('oxcaml/benchmarks/baseline.csv'),
         color='#fdd0a2', ls='solid', marker='^'),

    dict(label='int32# – Ox01: Explicit Constants',
         df=csv('oxcaml/benchmarks/ox01_explicit_constants.csv'),
         color='#fdae6b', ls='solid', marker='^'),

    dict(label='int32# – Ox02: Schedule-64',
         df=csv('oxcaml/benchmarks/ox02_schedule_64.csv'),
         color='#f16913', ls='solid', marker='^'),

    dict(label='int32# – Ox03: Deferred KW  [final]',
         df=csv('oxcaml/benchmarks/ox03_deferred_kw.csv'),
         color='#8c2d04', ls='solid', marker='^'),
]

print('Generating OCaml optimization-progress graphs…')
save_fig(OCAML_SERIES, 'HashSpeed',
         'Hash Throughput (MB/s)',
         'SHA-256 OCaml Optimization Progress — Hash Throughput',
         'ocaml_hash_speed_progress.png',
         figsize=(11, 6), legend_ncol=1)

save_fig(OCAML_SERIES, 'HashTime',
         'Hash Time (s)',
         'SHA-256 OCaml Optimization Progress — Hash Time',
         'ocaml_hash_time_progress.png',
         figsize=(11, 6), legend_ncol=1)

print('Generating OxCaml optimization-progress graphs…')
save_fig(OXCAML_SERIES, 'HashSpeed',
         'Hash Throughput (MB/s)',
         'SHA-256 OxCaml int32# Optimization Progress — Hash Throughput',
         'oxcaml_hash_speed_progress.png',
         figsize=(10, 6), legend_ncol=1)

save_fig(OXCAML_SERIES, 'HashTime',
         'Hash Time (s)',
         'SHA-256 OxCaml int32# Optimization Progress — Hash Time',
         'oxcaml_hash_time_progress.png',
         figsize=(10, 6), legend_ncol=1)

print('\nDone. 4 progress graphs generated.')
