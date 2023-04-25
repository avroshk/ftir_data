import os
import pandas as pd
from pathlib import Path
import numpy as np
import matplotlib.pyplot as plt

walk_dir = 'Thesis-Pigment-Samples-FTIR-Data/CSV-files'

result = list()

count = 0
for root, dir, files in os.walk(walk_dir):
    if files:
        for file in files:
            csv_file = Path(root, file)
            df = pd.read_csv(csv_file, header=None)
            name = file.split(' ')[0]
            df.rename(columns = {1: name}, inplace = True)

            if count == 0:
                df.rename(columns = {0: 'frequency'}, inplace = True)
                result.append(df['frequency'])

            result.append(df[name])
            count += 1

    df_out = pd.concat(result, axis=1)
    df_out.to_csv('combined.csv', index=False)

    df_out.plot(x='frequency', figsize=(8,6), alpha=0.8)

    plt.legend(bbox_to_anchor=(0., 1.02, 1., .102), loc='lower left',
               ncol=2, mode="expand", borderaxespad=0., fontsize=6)

    plt.tight_layout()
    plt.grid(visible=True, which='both', axis='both',
             linestyle='--', linewidth=0.5)
    plt.xlim([df_out['frequency'].min(), df_out['frequency'].max()])
    plt.savefig('combined.pdf')


    # ###
    # x-axis: Wavelength (/cm)
    # y-axis: Absorbance (Normalized)
    # Title FTIR Comparison of binders
    # wheatstarch
    # potato-starch
    # Carrageenan
    # Gum Arabic
    # Gum Tragacanth
    # ###
