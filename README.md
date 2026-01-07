# ML Infrastructure Platform (GCP)

## Problem Statement
Training and serving ML models reliably requires more than model code. It requires **repeatable infrastructure**, **clear execution boundaries**, and **controlled interfaces** between training, inference, and cloud resources.

This project explores how to design a minimal ML infrastructure platform on GCP that makes **deployment, scaling, and isolation explicit**, rather than implicit.

---

## Architecture Overview

**Control Plane**
- Terraform-managed infrastructure
- Declarative resource provisioning
- Environment-level separation (dev / prod)

**Data Plane**
- Containerized workloads
- GPU-enabled execution
- Explicit runtime configuration

The separation ensures infrastructure decisions do not leak into model logic.

---

## Key Design Decisions

- **Terraform over manual provisioning**  
  Chosen for reproducibility and auditability.

- **Container-first execution model**  
  Forces clear runtime boundaries and prevents environment drift.

- **Minimal abstraction layer**  
  Avoids overengineering while keeping extension points visible.

Each decision trades convenience for **predictability and debuggability**.

---

## What This Demonstrates

- ML infrastructure design thinking
- Control plane vs data plane separation
- Infrastructure-as-code for ML systems
- Cloud-native execution models
- Reproducible ML environments

This project is intentionally infrastructure-focused rather than model-focused.

---

## Failure Modes & Limitations

- Not optimized for multi-tenant workloads
- No built-in autoscaling policies
- No scheduler-level fairness guarantees
- Assumes trusted users and workloads

These are deliberate omissions to keep system boundaries explicit.

---

## How to Run (High Level)

1. Provision infrastructure via Terraform
2. Build container images
3. Deploy workloads to provisioned resources

Exact commands are intentionally omitted to emphasize architecture over tooling.

---

## Future Work

- Add inference vs training resource isolation
- Introduce workload scheduling constraints
- Benchmark cold-start and deployment latency
- Extend to multi-region deployments
