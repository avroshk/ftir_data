import click
import os
import numpy as np
import pandas as pd
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt

plt.rcParams['font.family'] = 'DejaVu serif'
plt.rcParams['font.serif'] = ['Times New Roman']

def min_max_scaler(column):
    return (column - column.min()) / (column.max() - column.min())

def normalize_columns(df, filter_cols):
    count = 0.0
    for col in df.columns:
        if col in filter_cols:
            df[col] = min_max_scaler(df[col])+count
            count += 1.0
    return df



@click.command()
@click.option('--in-data-csv')
@click.option('--out-file')
@click.option('--out-dir')
@click.option('--title')
@click.option('--columns', multiple=True)
@click.option('--labels', multiple=True)
def plot(in_data_csv, out_file, out_dir, title, columns, labels):
    # import pdb; pdb.set_trace()
    df = pd.read_csv(in_data_csv)
    # print(df.columns)

    df = df[['frequency', *columns]]
    df = df.sort_values('frequency', ascending=False)
    df = normalize_columns(df, columns)

    df.plot(x='frequency', figsize=(8,6), alpha=0.8, legend=None)

    plt.xlabel("Wavelength (cm⁻\N{SUPERSCRIPT ONE})", fontsize=14)
    plt.ylabel("Absorbance (Normalized)", fontsize=14)

    plt.yticks([])

    major_ticks = np.arange(500, df['frequency'].max(), 500)
    minor_ticks = np.arange(100, df['frequency'].max(), 100)
    plt.xticks(major_ticks, fontsize=14)
    plt.xticks(minor_ticks, minor=True)
    
    plt.title(title, fontsize=16)
    plt.tight_layout()
    plt.grid(visible=True, which='major', axis='both',
             linestyle='--', linewidth=0.5, alpha=0.8)
    plt.grid(visible=True, which='minor', axis='both',
            linestyle=':', linewidth=0.5, alpha=0.5)
    plt.xlim([df['frequency'].max(), df['frequency'].min()])

    # Labels
    y_pos = 0.5
    for label in labels:
        plt.text(3975, y_pos, label, fontsize=12)
        y_pos += 1.0

    plt.savefig(f"{out_dir}/{out_file}.pdf")
    plt.savefig(f"{out_dir}/{out_file}.svg", transparent=True)

if __name__ == "__main__":
    plot()