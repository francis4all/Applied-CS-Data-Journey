import dash
import dash_bootstrap_components as dbc
from dash import dcc, html, dash_table
from dash.dependencies import Input, Output
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
import os

# --- Configuración de la App ---
app = dash.Dash(__name__, external_stylesheets=[dbc.themes.LUX])
app.title = "Student Psychographics"
server = app.server

# --- Carga y Preparación de Datos ---
DATA_FILE = "students_clustering_result.csv"

if os.path.exists(DATA_FILE):
    data = pd.read_csv(DATA_FILE)
    
    # --- CORRECCIÓN CRÍTICA ---
    # Si las columnas vienen como texto (Strings), las convertimos a números 
    # para que el Radar Chart pueda calcular el promedio.
    
    # Mapa para Sleep Duration
    if data['Sleep Duration'].dtype == 'O': # 'O' significa Object/String
        sleep_map = {'Less than 5 hours': 1, '5-6 hours': 2, '7-8 hours': 3, 'More than 8 hours': 4}
        data['Sleep Duration'] = data['Sleep Duration'].map(sleep_map).fillna(0)

    # Mapa para Dietary Habits
    if data['Dietary Habits'].dtype == 'O':
        diet_map = {'Unhealthy': 1, 'Moderate': 2, 'Healthy': 3}
        data['Dietary Habits'] = data['Dietary Habits'].map(diet_map).fillna(0)
        
    # Nos aseguramos que las otras columnas numéricas sean float/int
    numeric_cols = ['Academic Pressure', 'Study Satisfaction', 'Financial Stress']
    for col in numeric_cols:
        data[col] = pd.to_numeric(data[col], errors='coerce').fillna(0)

else:
    print(f"WARNING: {DATA_FILE} not found. Using dummy data.")
    # Datos Dummy para pruebas
    data = pd.DataFrame({
        'Cluster': [1, 2, 3, 4]*10,
        'Age': [20]*40,
        'Academic Pressure': [3]*40,
        'Study Satisfaction': [3]*40,
        'Sleep Duration': [2]*40,
        'Dietary Habits': [2]*40,
        'Financial Stress': [3]*40,
        'Study Hours': [5]*40,
        'Have you ever had suicidal thoughts ?': ['No']*40,
        'Family History of Mental Illness': ['No']*40
    })

# Variables para el Radar Chart (Deben ser numéricas)
radar_vars = ['Academic Pressure', 'Study Satisfaction', 'Sleep Duration', 'Dietary Habits', 'Financial Stress']

# Variables para Gráficos de Barras (Pueden ser categóricas)
bar_vars = [
    'Age', 'Study Hours', 
    'Have you ever had suicidal thoughts ?', 'Family History of Mental Illness'
]

# --- Funciones de Visualización ---

def create_radar_chart(df):
    """Genera un Spider Plot comparando los clusters."""
    if df.empty: return go.Figure()

    # Calcular promedios por cluster
    # Ahora esto funcionará porque convertimos los textos a números arriba
    avg_data = df.groupby('Cluster')[radar_vars].mean().reset_index()
    
    fig = go.Figure()
    colors = ['#FF5733', '#FFC300', '#28B463', '#3498DB'] 
    
    for i, row in avg_data.iterrows():
        cluster_id = row['Cluster']
        r_values = row[radar_vars].values.tolist()
        r_values += r_values[:1] # Cerrar el ciclo del radar
        theta_values = radar_vars + [radar_vars[0]]
        
        fig.add_trace(go.Scatterpolar(
            r=r_values,
            theta=theta_values,
            fill='toself',
            name=f'Cluster {cluster_id}',
            line_color=colors[i % len(colors)],
            opacity=0.6
        ))

    fig.update_layout(
        polar=dict(radialaxis=dict(visible=True, range=[0, 4.5])), # Rango ajustado a las escalas 1-4/5
        showlegend=True,
        title="Average Profile Scores (Normalized)",
        margin=dict(l=40, r=40, t=40, b=40),
        height=400,
        template="plotly_white"
    )
    return fig

def create_bar_chart(df, variable):
    """Genera barras simples."""
    if df.empty: return px.bar()
    
    count_data = df[variable].value_counts().reset_index()
    count_data.columns = [variable, 'Count']
    
    fig = px.bar(
        count_data, x=variable, y='Count', 
        color='Count', color_continuous_scale='Teal'
    )
    fig.update_layout(
        xaxis_title=None, yaxis_title=None,
        margin=dict(l=10, r=10, t=30, b=10),
        height=250, coloraxis_showscale=False,
        plot_bgcolor='rgba(0,0,0,0)'
    )
    return fig

# --- Layout y Componentes ---

sidebar = dbc.Card([
    dbc.CardBody([
        html.H4("Control Panel", className="card-title"),
        html.Hr(),
        html.P("Filter by Profile:", className="card-text"),
        
        dcc.Dropdown(
            id='cluster-dropdown',
            options=[{'label': f'Cluster {i}', 'value': i} for i in sorted(data['Cluster'].unique())],
            value=None, 
            placeholder="Select Cluster...",
            className="mb-3"
        ),
        
        dbc.Alert(
            id="cluster-insight",
            color="info",
            className="mt-3 small"
        )
    ])
], className="h-100 shadow-sm")

main_content = dbc.Tabs([
    dbc.Tab(label="Visual Analytics", tab_id="tab-1", children=[
        dbc.Row([
            dbc.Col(dcc.Graph(id='radar-chart'), width=12, lg=6),
            dbc.Col([
                html.H5("Demographics", className="mt-3 text-center text-muted"),
                dbc.Row([
                    dbc.Col(dcc.Graph(id=f'bar-{v}'), width=6) for v in bar_vars[:4]
                ])
            ], width=12, lg=6)
        ], className="py-3")
    ]),
    
    dbc.Tab(label="Raw Data", tab_id="tab-2", children=[
        html.Div([
            dash_table.DataTable(
                data=data.to_dict('records'),
                columns=[{'name': i, 'id': i} for i in data.columns],
                page_size=10,
                style_table={'overflowX': 'auto'},
                style_header={'backgroundColor': '#2c3e50', 'color': 'white'},
                style_data={'whiteSpace': 'normal', 'height': 'auto'}
            )
        ], className="py-3")
    ])
])

app.layout = dbc.Container([
    dbc.NavbarSimple(
        brand="Student Mental Health Profiler",
        brand_href="#",
        color="primary",
        dark=True,
        className="mb-4 shadow"
    ),

    dbc.Row([
        dbc.Col(sidebar, width=12, md=3),
        dbc.Col(main_content, width=12, md=9)
    ])
], fluid=True)

# --- Callbacks ---
@app.callback(
    [Output('radar-chart', 'figure')] + 
    [Output(f'bar-{v}', 'figure') for v in bar_vars[:4]] +
    [Output('cluster-insight', 'children'), Output('cluster-insight', 'color')],
    [Input('cluster-dropdown', 'value')]
)
def update_dashboard(selected_cluster):
    # Filtrado
    if selected_cluster is not None:
        filtered_df = data[data['Cluster'] == selected_cluster]
        insight_text = f"Analyzing Cluster {selected_cluster}: {len(filtered_df)} students found."
        alert_color = "success"
    else:
        filtered_df = data
        insight_text = "Global Overview: Displaying data for all students."
        alert_color = "info"

    # Generación de gráficos
    # El Radar siempre muestra la comparación global de promedios
    radar_fig = create_radar_chart(data) 
    
    # Las barras muestran la distribución filtrada
    bar_figs = [create_bar_chart(filtered_df, v) for v in bar_vars[:4]]
    
    return [radar_fig] + bar_figs + [insight_text, alert_color]

if __name__ == "__main__":
    app.run(debug=True, port=8050)