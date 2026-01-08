import pandas as pd
import numpy as np
import statsmodels.api as sm
from statsmodels.stats.diagnostic import het_breuschpagan, lilliefors
from statsmodels.stats.stattools import durbin_watson
import scipy.stats as stats

def run_full_analysis():
    # 1. Carga de datos
    try:
        df = pd.read_csv("../data/pokemon_final.csv")
        df['generation'] = df['generation'].astype(str)
    except FileNotFoundError:
        print("Error: Coloca el CSV en la carpeta 'data/'")
        return

    # 2. Segmentación 
    m1 = df[df['generation'].isin(['1', '2', '3', '4'])]
    
    # 3. Modelo de Regresión Lineal (OLS)
    # Attack = B0 + B1*HP
    X = sm.add_constant(m1['hp'])
    y = m1['attack']
    model = sm.OLS(y, X).fit()

    # 4. Pruebas de Diagnóstico
    residuos = model.resid
    _, p_lillie = lilliefors(residuos)
    dw_stat = durbin_watson(residuos)
    _, p_bp, _, _ = het_breuschpagan(residuos, model.model.exog)

    # 5. Guardar Reporte Técnico
    with open("../docs/python_stats_report.txt", "w") as f:
        f.write("=== REPORTE ESTADÍSTICO (PYTHON) ===\n")
        f.write(model.summary().as_text())
        f.write("\n\n--- PRUEBAS DE SUPUESTOS ---\n")
        f.write(f"Normalidad (Lilliefors) p-val: {p_lillie:.4e}\n")
        f.write(f"Homocedasticidad (Breusch-Pagan) p-val: {p_bp:.4e}\n")
        f.write(f"Independencia (Durbin-Watson): {dw_stat:.2f}\n")

if __name__ == "__main__":
    run_full_analysis()