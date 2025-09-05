# Spark + Delta Lake + MLflow Local Environment

This project provides a local sandbox environment that mimics Azure Databricks using:
- **Apache Spark 3.5.0**
- **Delta Lake 3.2.0**
- **JupyterLab** for interactive notebooks
- **MLflow** for experiment tracking with a local UI

---

## 📂 Project Structure
```
spark-delta-env/
│── Dockerfile              # Builds image with Spark + Delta + MLflow
│── docker-compose.yml      # Runs the container with Jupyter + MLflow
│── work/                   # Mounted volume for notebooks, data, MLflow runs
│   └── DeltaTest.ipynb     # Starter notebook (Delta + MLflow demo)
```

---

## 🚀 Getting Started

### 1. Build and Run
From inside the `DockerSparkDeltaEnv` folder:

```bash
docker compose build --no-cache
docker compose up
```

### 2. Access Services
- **JupyterLab** → http://localhost:8888  
- **Spark UI** → http://localhost:4040  
- **MLflow UI** → http://localhost:5000  

### 3. Run the Test Notebook
1. Open JupyterLab (http://localhost:8888).  
2. Navigate to `work/DeltaTest.ipynb`.  
3. Run all cells to:
   - Start Spark with Delta Lake support
   - Write and read a Delta table
   - Log a simple MLflow experiment

---

## 🛠 Troubleshooting

- If you see errors about **missing Delta jars**:
  Make sure the Delta JAR is inside `/usr/local/spark/jars/` (this is handled in the Dockerfile).
- If ports are already in use, update `docker-compose.yml` and map to different host ports.

---

## 📌 Notes
- Data and notebooks are persisted in the local `work/` folder.  
- MLflow runs are logged under `work/mlruns/` and viewable in the MLflow UI.  
- This setup is for local development and learning; for production use, consider managed Databricks or a full Spark cluster.

---

## 🔎 Architecture Overview
The local stack components and how they interact:

```text
                ┌───────────────────────┐
                │       JupyterLab       │
                │  (Notebooks, Python)   │
                └───────────┬───────────┘
                            │
                            ▼
                ┌───────────────────────┐
                │        Spark 3.5       │
                │  (Cluster, SQL, ETL)   │
                └───────┬───────────────┘
                        │
     ┌──────────────────┼──────────────────┐
     ▼                  ▼                  ▼
┌──────────────┐  ┌──────────────┐  ┌────────────────┐
│  Delta Lake  │  │   Spark UI   │  │     MLflow     │
│ (ACID Tables │  │  (4040 port) │  │ Experiments UI │
│   on Disk)   │  │              │  │ (5000 port)    │
└──────────────┘  └──────────────┘  └────────────────┘
``` 
