# Spark + Delta Lake + MLflow (Bitnami Spark)

This project provides a local sandbox environment that mimics Azure Databricks using:
- **Bitnami Spark 3.5.1** base image
- **Delta Lake 3.2.0**
- **JupyterLab**
- **MLflow**

## 🚀 Getting Started

```bash
docker compose build --no-cache
docker compose up
```

### Access
- JupyterLab → http://localhost:8888  
- Spark UI → http://localhost:4040  
- MLflow UI → http://localhost:5000  

### Test
Open `work/DeltaTest.ipynb` in JupyterLab and run all cells.

## Architecture

```text
                ┌───────────────────────┐
                │       JupyterLab       │
                └───────────┬───────────┘
                            │
                            ▼
                ┌───────────────────────┐
                │   Bitnami Spark 3.5.1  │
                └───────┬───────────────┘
                        │
     ┌──────────────────┼──────────────────┐
     ▼                  ▼                  ▼
┌──────────────┐  ┌──────────────┐  ┌────────────────┐
│  Delta Lake  │  │   Spark UI   │  │     MLflow     │
└──────────────┘  └──────────────┘  └────────────────┘
```
