# 🛡️ Zero-Config DevSecOps Starter Kit

![Python](https://img.shields.io/badge/Python-3.10-blue?logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-0.100.0-009688?logo=fastapi&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Hardened-2496ED?logo=docker&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/CI%2FCD-GitHub_Actions-2088FF?logo=github-actions&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green.svg)

> **A beginner-friendly, ready-to-use DevSecOps pipeline for Python applications. Stop writing vulnerable code today.**

Starting a new project is exciting, but configuring security tools from scratch is tedious. This repository is a **Template** designed for developers of all levels. In one click, you get a modern Python API wrapped in a hardened Docker container, protected by an automated, enterprise-grade security pipeline.

---

## ✨ What's Included?

This template implements the "Shift-Left" security philosophy out-of-the-box:

* 🚀 **Minimalist Python API:** Built with FastAPI, ready to be expanded.
* 🐳 **Hardened Dockerfile:** Runs as a non-root user, uses a slim base image, and follows container security best practices.
* 🔒 **Automated Security Pipeline (GitHub Actions):**
    * **Secret Scanning (Gitleaks):** Prevents accidental commits of passwords and API keys.
    * **SAST (GitHub CodeQL):** Scans the source code for security flaws (e.g., injections) and reports them directly in the GitHub Security tab.
    * **SCA (Safety):** Checks your `requirements.txt` for dependencies with known vulnerabilities (CVEs).
    * **Container Scanning (Trivy):** Scans the built Docker image for OS-level vulnerabilities and blocks deployments if critical flaws are found.

---

## 🚀 How to Use This Template

You don't need to be a DevSecOps expert to use this. Just follow these steps:

1.  **Create your repository:** Click the green **[Use this template]** button at the top right of this page.
2.  **Clone your new repo:**
    ```bash
    git clone https://github.com/Skrt-Time/devsecops-starter-template.git
    cd YOUR-NEW-REPO-NAME
    ```
3.  **Run locally (Optional):**
    ```bash
    docker build -t my-secure-api .
    docker run -p 8000:8000 my-secure-api
    ```
    *Visit `http://localhost:8000/health` to check if it's running.*
4.  **Start coding:** Replace the code in `src/main.py` with your own application logic.
5.  **Push your code:** Every time you push to the `main` branch or open a Pull Request, the DevSecOps pipeline will automatically run and verify your code's security!

---

## 🛑 How the Pipeline Protects You

The GitHub Actions workflow (`.github/workflows/devsecops-pipeline.yml`) is divided into 3 strict phases. If one phase fails, the pipeline stops immediately to prevent vulnerable code from being deployed.

1.  **Phase 1:** Checks for leaked secrets.
2.  **Phase 2:** Scans Python code (CodeQL) and dependencies (Safety).
3.  **Phase 3:** Builds the Docker image and scans it for vulnerabilities (Trivy).

*Note: The `requirements.txt` currently contains an outdated version of `urllib3` by design, so you can see the pipeline catch a vulnerability on your very first run! Once you see it fail, update the version to fix it.*

---

## 🤝 Contributing

Contributions are welcome! If you have ideas to make this template even better or more secure for beginners, feel free to open an issue or submit a Pull Request.

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
