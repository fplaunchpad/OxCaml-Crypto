"""
progress_graphs.py — Scalar and SIMD optimization-progress graphs.

X-axis : Input size in MB  (1, 10, 30, 50, 75, 100)
Y-axis : Throughput (MB/s) or Time (seconds)
Lines  : one per optimization stage, including all reverted stages.
         Reverted stages shown with dashed lines.
Output : 300 DPI PNG, publication quality.
"""

import pandas as pd
import matplotlib.pyplot as plt
import os

# ── Global style (matches existing comparison graphs) ─────────────────────────
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
    """
    series : list of dicts
        label   str
        df      pd.DataFrame with InputSizeMB and metric columns
        color   matplotlib colour
        ls      linestyle ('solid' or 'dashed')
        marker  str
    """
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
    ax.legend(loc='best', ncol=legend_ncol, fontsize=9,
              framealpha=0.9)
    ax.grid(True)
    fig.tight_layout()
    path = os.path.join(BASE, fname)
    fig.savefig(path, dpi=DPI)
    plt.close(fig)
    print(f'  Saved: {path}')


# ══════════════════════════════════════════════════════════════════════════════
# SCALAR — C (scalar, 1 version) + OCaml (5 stages: 3 kept + 2 reverted)
# ══════════════════════════════════════════════════════════════════════════════
#
#  Colour scheme
#  ─────────────
#  C scalar           : solid blue  (matches comparison graph C0)
#  OCaml kept stages  : solid greens, lightest → darkest  (matches comparison C2 family)
#  OCaml reverted     : dashed purples (visually distinct; dashed = reverted)

SCALAR_SERIES = [
    # ── C reference ────────────────────────────────────────────────────────────
    dict(label='C (scalar)',
         df=csv('c_results.csv'),
         color='#1f77b4', ls='solid',  marker='o'),

    # ── OCaml kept stages ──────────────────────────────────────────────────────
    dict(label='OCaml – Baseline',
         df=csv('ocaml_scalar/benchmarks/baseline.csv'),
         color='#74c476', ls='solid',  marker='s'),

    dict(label='OCaml – Opt01: local state',
         df=csv('ocaml_scalar/benchmarks/opt01_local_state.csv'),
         color='#238443', ls='solid',  marker='s'),

    dict(label='OCaml – Opt02: rotate+mask  [final]',
         df=csv('ocaml_scalar/benchmarks/opt02_rotate_mask.csv'),
         color='#005a32', ls='solid',  marker='s'),

    # ── OCaml reverted stages ─────────────────────────────────────────────────
    dict(label='OCaml – Opt03: mask hoist  [reverted]',
         df=csv('ocaml_scalar/benchmarks/opt03_mask_hoist.csv'),
         color='#9467bd', ls='dashed', marker='x'),

    dict(label='OCaml – Opt04: Array.unsafe_get  [reverted]',
         df=csv('ocaml_scalar/benchmarks/opt04_unsafe_get.csv'),
         color='#c5b0d5', ls='dashed', marker='x'),
]

print('Generating scalar optimization-progress graphs…')
for field, ylabel, tag, fname in [
    ('EncryptSpeed', 'Encryption Throughput (MB/s)',
     'Encryption Throughput', 'scalar_encrypt_speed_progress.png'),
    ('DecryptSpeed', 'Decryption Throughput (MB/s)',
     'Decryption Throughput', 'scalar_decrypt_speed_progress.png'),
    ('EncryptTime',  'Encryption Time (seconds)',
     'Encryption Time',       'scalar_encrypt_time_progress.png'),
    ('DecryptTime',  'Decryption Time (seconds)',
     'Decryption Time',       'scalar_decrypt_time_progress.png'),
]:
    save_fig(SCALAR_SERIES, field, ylabel,
             f'ChaCha20 Scalar Optimization Progress — {tag}',
             fname, figsize=(11, 6), legend_ncol=1)


# ══════════════════════════════════════════════════════════════════════════════
# SIMD — C SIMD (3 stages) + OxCaml SIMD (7 stages, all kept)
# ══════════════════════════════════════════════════════════════════════════════
#
#  Colour scheme
#  ─────────────
#  C SIMD    : solid blues,  light → dark  (matches comparison graph C1 orange family
#              but uses blues to distinguish from OxCaml warm tones)
#  OxCaml    : solid warm gradient (light orange → deep red), lightest = baseline,
#              darkest = Opt06 final  (matches comparison graph C3 red family)

SIMD_SERIES = [
    # ── C SIMD ─────────────────────────────────────────────────────────────────
    dict(label='C SIMD – Baseline',
         df=csv('c_simd/benchmarks/baseline.csv'),
         color='#9ecae1', ls='solid', marker='o'),

    dict(label='C SIMD – Opt01: SIMD XOR',
         df=csv('c_simd/benchmarks/opt01_simd_xor.csv'),
         color='#3182bd', ls='solid', marker='o'),

    dict(label='C SIMD – Opt02: unroll  [final]',
         df=csv('c_simd/benchmarks/opt02_unroll.csv'),
         color='#08519c', ls='solid', marker='o'),

    # ── OxCaml SIMD ────────────────────────────────────────────────────────────
    dict(label='OxCaml SIMD – Baseline',
         df=csv('oxcaml_simd/benchmarks/baseline.csv'),
         color='#fdd0a2', ls='solid', marker='^'),

    dict(label='OxCaml SIMD – Opt01: masks',
         df=csv('oxcaml_simd/benchmarks/opt01_masks.csv'),
         color='#fdae6b', ls='solid', marker='^'),

    dict(label='OxCaml SIMD – Opt02: inline',
         df=csv('oxcaml_simd/benchmarks/opt02_inline.csv'),
         color='#f16913', ls='solid', marker='^'),

    dict(label='OxCaml SIMD – Opt03: unroll',
         df=csv('oxcaml_simd/benchmarks/opt03_unroll.csv'),
         color='#d94801', ls='solid', marker='^'),

    dict(label='OxCaml SIMD – Opt04: prealloc',
         df=csv('oxcaml_simd/benchmarks/opt04_prealloc.csv'),
         color='#a63603', ls='solid', marker='^'),

    dict(label='OxCaml SIMD – Opt05: unsafe_chr',
         df=csv('oxcaml_simd/benchmarks/opt05_unsafe_chr.csv'),
         color='#7f2704', ls='solid', marker='^'),

    dict(label='OxCaml SIMD – Opt06: hoist constants  [final]',
         df=csv('oxcaml_simd/benchmarks/opt06_hoist_constants.csv'),
         color='#4a0d03', ls='solid', marker='^'),
]

print('Generating SIMD optimization-progress graphs…')
for field, ylabel, tag, fname in [
    ('EncryptSpeed', 'Encryption Throughput (MB/s)',
     'Encryption Throughput', 'simd_encrypt_speed_progress.png'),
    ('DecryptSpeed', 'Decryption Throughput (MB/s)',
     'Decryption Throughput', 'simd_decrypt_speed_progress.png'),
    ('EncryptTime',  'Encryption Time (seconds)',
     'Encryption Time',       'simd_encrypt_time_progress.png'),
    ('DecryptTime',  'Decryption Time (seconds)',
     'Decryption Time',       'simd_decrypt_time_progress.png'),
]:
    save_fig(SIMD_SERIES, field, ylabel,
             f'ChaCha20 SIMD Optimization Progress — {tag}',
             fname, figsize=(12, 6), legend_ncol=2)

print('\nDone. All 8 progress graphs generated.')
